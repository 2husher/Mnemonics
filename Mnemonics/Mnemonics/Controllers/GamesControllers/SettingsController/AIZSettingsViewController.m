//
//  AIZSettingsViewController.m
//  Mnemonics
//
//  Created by X on 24/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSettingsViewController.h"
#import "AIZSettingsViewController+UIControls.h"
#import "AIZSettingsViewController+UIConstraints.h"

@interface AIZSettingsViewController () <UITextFieldDelegate>

@end

@implementation AIZSettingsViewController

- (void)setSettingsItem:(id)newSettingsItem
{
    if (_settingsItem != newSettingsItem)
    {
        _settingsItem = newSettingsItem;

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.settingsItem)
    {
        NSMutableString *text = [[NSMutableString alloc] initWithString:
                                 @"Текущие настройки игры:\n"];
        [text appendString:@"\nFrom: "];
        [text appendString:self.settingsItem[@"FromValue"]];
        [text appendString:@"\nTo: "];
        [text appendString:self.settingsItem[@"ToValue"]];
        [text appendString:@"\nOrder: "];
        [text appendString:self.settingsItem[@"Order"]];
        self.currentSettingTextView.text = text;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addNavItems];

    [self addSegmentedControl];
    [self addSegmentedControlConstraints];

    [self addFromValueLabelAndTextField];
    [self addFromValueLabelAndTextFieldConstraints];

    [self addToValueLabelAndTextField];
    [self addToValueLabelAndTextFieldConstraints];

    [self addCurrentSettingsTextView];
    [self addCurrentSettingsTextViewConstraints];

    [self configureView];
}


- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
    if (self.settingsItem)
    {
        self.settingsItem[@"FromValue"] = self.fromValueTextField.text;
        self.settingsItem[@"ToValue"] = self.toValueTextField.text;
        
        switch (self.gettingType.selectedSegmentIndex)
        {
            case 0:
                self.settingsItem[@"Order"] = @"Ascending";
                break;
            case 1:
                self.settingsItem[@"Order"] = @"Descending";
                break;
            case 2:
                self.settingsItem[@"Order"] = @"Random";
                break;
        }

        [self.delegate saveSettings:self];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
