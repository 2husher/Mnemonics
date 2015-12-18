//
//  AIZWord2NumbersViewController.m
//  Mnemonics
//
//  Created by X on 18/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZConvertorsViewController.h"

@interface AIZConvertorsViewController () <UITextFieldDelegate>

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
    [self addOutputLabelAndTextField];
}

- (void)addDigitsAndLetters
{
    self.numbersLabelsArray = [[NSMutableArray alloc] init];

    NSArray *digits        = @[@"0", @"1", @"2", @"3", @"4",
                               @"5", @"6", @"7", @"8", @"9"];

    NSArray *firstLetters  = @[@"Н", @"Г", @"Д", @"К", @"Ч",
                               @"П", @"Ш", @"С", @"В", @"Р"];

    NSArray *secondLetters = @[@"М", @"Ж", @"Т", @"Х", @"Щ",
                               @"Б", @"Л", @"З", @"Ф", @"Ц"];

    for (NSUInteger i = 0; i < 10; i++)
    {
        NSDictionary *mnemDigit = @{ @"number" : digits[i],
                                     @"firstLetter" : firstLetters[i],
                                     @"secondLetter" : secondLetters[i] };

        self.numbersLabelsArray[i] = mnemDigit;
    }
}

- (void)addSegmentedControl
{
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Word2Numbers", @"Number2Words"]];

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
        self.firstLabel.text = @"Word:";
        self.textField.placeholder = @"Type in a word";
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        self.firstLabel.text = @"Number:";
        self.textField.placeholder = @"Type in a number";
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
    self.inputLabel.backgroundColor = [UIColor grayColor];
    [self.inputLabel sizeToFit];

    [self.view addSubview:self.firstLabel];
}

- (void)addOutputLabelAndTextField
{

}

- (void)addLabelsAndTextField
{
    self.firstLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.firstLabel.backgroundColor = [UIColor grayColor];
    [self.firstLabel sizeToFit];

    [self.view addSubview:self.firstLabel];

    self.secondLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.secondLabel.backgroundColor = [UIColor grayColor];
    [self.secondLabel sizeToFit];

    [self.view addSubview:self.secondLabel];

    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.resultLabel.backgroundColor = [UIColor yellowColor];
    [self.resultLabel sizeToFit];

    [self.view addSubview:self.resultLabel];

    self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.returnKeyType = UIReturnKeyDone;

    self.textField.delegate = self;

    [self.view addSubview:self.textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self convert];
    return YES;
}

-(void)convert
{

}

- (void)addLabelsConstraints
{
    self.firstLabel.translatesAutoresizingMaskIntoConstraints  = NO;
    self.secondLabel.translatesAutoresizingMaskIntoConstraints = NO;

//    [self.nameLabel setContentHuggingPriority:300.0f forAxis:UILayoutConstraintAxisHorizontal];
//    [self.numberLabel setContentHuggingPriority:300.0f forAxis:UILayoutConstraintAxisHorizontal];

    NSDictionary *nameMap = @{ @"segmentedControl" : self.segmentedControl,
                               @"firstLabel" : self.firstLabel,
                               @"secondLabel" : self.secondLabel,
                               @"resultLabel" : self.resultLabel };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[segmentedControl]-50-[firstLabel]-[secondLabel]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];

//    NSArray *horizontalNameLabelConstraints =
//    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[numberLabel]"
//                                            options:0
//                                            metrics:nil
//                                              views:nameMap];
//
//    [self.view addConstraints:horizontalNameLabelConstraints];

    NSLayoutConstraint *horizontalFirstLabelConstraints =
    [NSLayoutConstraint constraintWithItem:self.firstLabel
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.segmentedControl
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[horizontalNumberLabelConstraints]];
}

@end
