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

@interface AIZNumberEditViewController ()

@end

@implementation AIZNumberEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addNavItems];

    [self addNumberLabel];
    [self addNumberLabelConstraints];

    [self addLetterLabelSegmentedControl];
    [self addLetterLabelSegmentedControlConstraints];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
}

- (void)toggleControls:(UISegmentedControl *)sender
{
}

@end
















