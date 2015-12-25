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
}


- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
}

@end
