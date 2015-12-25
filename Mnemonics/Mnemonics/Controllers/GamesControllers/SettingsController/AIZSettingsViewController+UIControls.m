//
//  AIZSettingsViewController+UIControls.m
//  Mnemonics
//
//  Created by X on 25/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSettingsViewController+UIControls.h"

@implementation AIZSettingsViewController (UIControls)

- (void)addNavItems
{
    self.navigationItem.title = @"Settings";

    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                  target:self
                                  action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cancelBtn;

    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                target:self
                                action:@selector(save)];
    self.navigationItem.rightBarButtonItem = saveBtn;
}

- (void)addSegmentedControl
{
    self.gettingType = [[UISegmentedControl alloc]
                        initWithItems:@[@"Ascending",
                                        @"Descending",
                                        @"Random"]];
    [self.gettingType addTarget:self
                         action:@selector(toggleControls:)
               forControlEvents:UIControlEventValueChanged];
    self.gettingType.selectedSegmentIndex = 0;
    [self.view addSubview:self.gettingType];
}

- (void)addFromValueLabelAndTextField
{
    self.fromValueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //self.inputLabel.backgroundColor = [UIColor grayColor];
    self.fromValueLabel.text = @"From Value:";
    [self.fromValueLabel sizeToFit];
    [self.view addSubview:self.fromValueLabel];

    self.fromValueTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.fromValueTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.fromValueTextField.returnKeyType = UIReturnKeyDone;
    self.fromValueTextField.placeholder = @"Type in a from value...";
    self.fromValueTextField.delegate = self;
    [self.view addSubview:self.fromValueTextField];
}

- (void)addToValueLabelAndTextField
{
    self.toValueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //self.outputLabel.backgroundColor = [UIColor grayColor];
    self.toValueLabel.text = @"Number:";
    [self.toValueLabel sizeToFit];
    [self.view addSubview:self.toValueLabel];

    self.toValueTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.toValueTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.toValueTextField.placeholder = @"Type in a to value...";
    self.toValueTextField.delegate = self;
    [self.view addSubview:self.toValueTextField];
}

- (void) addCurrentSettingsTextView
{
    self.currentSettingTextView = [[UITextView alloc] initWithFrame:CGRectZero];
    self.currentSettingTextView.editable = NO;
    self.currentSettingTextView.font = [UIFont systemFontOfSize:20.0f];
    self.currentSettingTextView.text = @"";

    [self.view addSubview:self.currentSettingTextView];
}


@end
