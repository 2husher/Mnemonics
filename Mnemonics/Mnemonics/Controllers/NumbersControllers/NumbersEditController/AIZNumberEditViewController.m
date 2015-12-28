//
//  AIZNumberEditViewController.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberEditViewController.h"
#import "AIZNumberEditViewController+UIControls.h"
#import "AIZNumberEditViewController+UIConstraints.h"
#import "AIZDigitsStore.h"

@interface AIZNumberEditViewController ()

@property (nonatomic, copy) NSString *letters;

@end

@implementation AIZNumberEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Edit", @"Edit");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self addNavItems];

    [self addNumberLabel];
    [self addNumberLabelConstraints];

    [self addLetterLabelSegmentedControl];
    [self addLetterLabelSegmentedControlConstraints];

    [self addWordLabelAndTextField];
    [self addWordLabelAndTextFieldConstraints];

    [self configureView];
}

- (void)configureView
{
    if (self.editedItem)
    {
        self.numberLabel.text = [[self.editedItem valueForKey:@"value"]
                                 description];
        
        [self.lettersSegmentedControl removeAllSegments];

        NSArray *letters = [[AIZDigitsStore sharedStore]
                            getLettersForDigits:self.numberLabel.text];
        NSUInteger len = [letters count];
        for (NSUInteger i = 0; i < len; i++)
        {
            NSString *title = [letters[i] componentsJoinedByString:@""];
            [self.lettersSegmentedControl insertSegmentWithTitle:title
                                                         atIndex:i
                                                        animated:NO];
        }
    }
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
    [self.editedItem setValue:self.letters
                       forKey:@"letters"];
    [self.editedItem setValue:[self.wordTextField.text uppercaseString]
                       forKey:@"word"];
    [self.delegate updateView];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)toggleControls:(UISegmentedControl *)sender
{
    self.letters = [sender titleForSegmentAtIndex:self.lettersSegmentedControl.selectedSegmentIndex];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if ([[AIZDigitsStore sharedStore] checkWord:textField.text
                                     forLetters:self.letters] == NO)
    {
        NSString *message = [NSString stringWithFormat:@"Вы ввели неправильное слово %@", textField.text];
        UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:@"Ошибка!"
                                            message:message
                                     preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *action =
        [UIAlertAction actionWithTitle:@"Да, сейчас введу новые."
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   [textField becomeFirstResponder];
                               }];

        [alert addAction:action];

        [self presentViewController:alert animated:YES completion:nil];
    }
    return YES;
}

@end
















