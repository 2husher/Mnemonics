//
//  AIZWord2NumbersViewController.m
//  Mnemonics
//
//  Created by X on 18/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZConvertorsViewController.h"
#import "AIZDigitsStore.h"
#import "AIZConvertorsViewController+UIControls.h"
#import "AIZConvertorsViewController+UIConstraints.h"

@interface AIZConvertorsViewController ()

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
    NSArray *letters = [[AIZDigitsStore sharedStore]
                        getDigitsForLetters:text];
    self.outputTextField.text = [letters componentsJoinedByString:@""];
}

-(void)convert2Word:(NSString *)text
{

}

@end























