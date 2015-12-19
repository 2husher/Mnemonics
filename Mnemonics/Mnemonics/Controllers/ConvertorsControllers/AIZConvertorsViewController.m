//
//  AIZWord2NumbersViewController.m
//  Mnemonics
//
//  Created by X on 18/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZConvertorsViewController.h"
#import "AIZNumbersStore.h"

@interface AIZConvertorsViewController () <UITextFieldDelegate>

@property (nonatomic, strong) NSArray *digits;
@property (nonatomic, strong) NSArray *firstLetters;
@property (nonatomic, strong) NSArray *secondLetters;

@end

@implementation AIZConvertorsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Convertors", @"Convertors");

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addDigitsAndLetters];

    [self addSegmentedControl];
    [self addSegmentedControlConstraints];

    [self addInputLabelAndTextField];
    [self addInputLabelAndTextFieldConstraints];
    [self addOutputLabelAndTextField];
    [self addOutputLabelAndTextFieldConstraints];

}

- (void)addDigitsAndLetters
{
    self.numbersLabelsArray = [[NSMutableArray alloc] init];

    self.digits        = @[@"0", @"1", @"2", @"3", @"4",
                           @"5", @"6", @"7", @"8", @"9"
                           ];
    self.firstLetters  = @[@"Н", @"Г", @"Д", @"К", @"Ч",
                           @"П", @"Ш", @"С", @"В", @"Р"
                           ];
    self.secondLetters = @[@"М", @"Ж", @"Т", @"Х", @"Щ",
                           @"Б", @"Л", @"З", @"Ф", @"Ц"
                           ];
    for (NSUInteger i = 0; i < 10; i++)
    {
        NSDictionary *mnemDigit = @{ @"number" : self.digits[i],
                                     @"firstLetter" : self.firstLetters[i],
                                     @"secondLetter" : self.secondLetters[i] };
        self.numbersLabelsArray[i] = mnemDigit;
    }
}

- (void)addSegmentedControl
{
    self.segmentedControl = [[UISegmentedControl alloc]
                             initWithItems:@[@"Word2Numbers", @"Number2Words"]];
    [self.segmentedControl addTarget:self
                              action:@selector(toggleControls:)
                    forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:self.segmentedControl];
}

- (void)toggleControls:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        [self.inputTextField resignFirstResponder];
        self.inputLabel.text = @"Word:";
        self.inputTextField.placeholder = @"Type in a word...";
        self.inputTextField.keyboardType = UIKeyboardTypeAlphabet;
        self.outputLabel.text = @"Number:";
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        [self.inputTextField resignFirstResponder];
        self.inputLabel.text = @"Number:";
        self.inputTextField.placeholder = @"Type in a number...";
        self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.outputLabel.text = @"Word:";
    }
}

- (void)addSegmentedControlConstraints
{
    self.segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;

    id topGuide = self.topLayoutGuide;
    NSDictionary *nameMap = @{ @"topGuide" : topGuide,
                               @"segmentedControl" : self.segmentedControl };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-50-[segmentedControl]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalConstraints];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[segmentedControl]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalConstraints];
}

- (void)addInputLabelAndTextField
{
    self.inputLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //self.inputLabel.backgroundColor = [UIColor grayColor];
    self.inputLabel.text = @"Word:";
    [self.inputLabel sizeToFit];
    [self.view addSubview:self.inputLabel];

    self.inputTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputTextField.returnKeyType = UIReturnKeyDone;
    self.inputTextField.placeholder = @"Type in a word...";
    self.inputTextField.delegate = self;
    [self.view addSubview:self.inputTextField];
}

- (void)addOutputLabelAndTextField
{
    self.outputLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //self.outputLabel.backgroundColor = [UIColor grayColor];
    self.outputLabel.text = @"Number:";
    [self.outputLabel sizeToFit];
    [self.view addSubview:self.outputLabel];

    self.outputTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.outputTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.outputTextField.enabled = NO;
    [self.view addSubview:self.outputTextField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (self.segmentedControl.selectedSegmentIndex == 0)
    {
        [self convert2Number:textField.text];
    }
    else if (self.segmentedControl.selectedSegmentIndex == 1)
    {
        [self convert2Word:textField.text];
    }
    return YES;
}

-(void)convert2Number:(NSString *)text
{
    NSArray *letters = [[AIZNumbersStore sharedStore]
                        getDigitsForLetters:text];
    self.outputTextField.text = [letters componentsJoinedByString:@""];
}

-(void)convert2Word:(NSString *)text
{

}


- (void)addInputLabelAndTextFieldConstraints
{
    self.inputLabel.translatesAutoresizingMaskIntoConstraints     = NO;
    self.inputTextField.translatesAutoresizingMaskIntoConstraints = NO;

    [self.inputLabel setContentHuggingPriority:300.0f forAxis:UILayoutConstraintAxisHorizontal];

    NSDictionary *nameMap = @{ @"segmentedControl" : self.segmentedControl,
                               @"inputLabel" : self.inputLabel,
                               @"inputTextField" : self.inputTextField };

    NSArray *verticalInputLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[segmentedControl]-50-[inputLabel]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalInputLabelConstraints];

    NSLayoutConstraint *verticalInputTextFieldConstraints =
    [NSLayoutConstraint constraintWithItem:self.inputTextField
                                 attribute:NSLayoutAttributeBaseline
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.inputLabel
                                 attribute:NSLayoutAttributeBaseline
                                multiplier:1.0f
                                  constant:0.0f];
    [self.view addConstraints:@[verticalInputTextFieldConstraints]];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[inputLabel]-[inputTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalConstraints];
}

- (void)addOutputLabelAndTextFieldConstraints
{
    self.outputLabel.translatesAutoresizingMaskIntoConstraints     = NO;
    self.outputTextField.translatesAutoresizingMaskIntoConstraints = NO;

    [self.outputLabel setContentHuggingPriority:300.0f forAxis:UILayoutConstraintAxisHorizontal];

    NSDictionary *nameMap = @{ @"inputLabel" : self.inputLabel,
                               @"inputTextField" : self.inputTextField,
                               @"outputLabel" : self.outputLabel,
                               @"outputTextField" : self.outputTextField };

    NSArray *verticalOutputLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[inputTextField]-[outputTextField]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalOutputLabelConstraints];

    NSLayoutConstraint *verticalOutputTextFieldConstraints =
    [NSLayoutConstraint constraintWithItem:self.outputTextField
                                 attribute:NSLayoutAttributeBaseline
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.outputLabel
                                 attribute:NSLayoutAttributeBaseline
                                multiplier:1.0f
                                  constant:0.0f];
    [self.view addConstraints:@[verticalOutputTextFieldConstraints]];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[outputLabel]-[outputTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalConstraints];

    NSLayoutConstraint *horizontalOutputLabelConstraints =
    [NSLayoutConstraint constraintWithItem:self.outputLabel
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.inputLabel
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0f
                                  constant:0.0f];
    [self.view addConstraints:@[horizontalOutputLabelConstraints]];
}

@end























