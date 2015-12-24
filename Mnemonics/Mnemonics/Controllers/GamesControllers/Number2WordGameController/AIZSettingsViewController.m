//
//  AIZSettingsViewController.m
//  Mnemonics
//
//  Created by X on 24/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSettingsViewController.h"

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

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
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

- (void)addSegmentedControlConstraints
{
    self.gettingType.translatesAutoresizingMaskIntoConstraints = NO;

    id topGuide = self.topLayoutGuide;
    NSDictionary *nameMap = @{ @"topGuide" : topGuide,
                               @"segmentedControl" : self.gettingType };

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

- (void)addFromValueLabelAndTextFieldConstraints
{
    self.fromValueLabel.translatesAutoresizingMaskIntoConstraints     = NO;
    self.fromValueTextField.translatesAutoresizingMaskIntoConstraints = NO;

    [self.fromValueLabel setContentHuggingPriority:300.0f forAxis:UILayoutConstraintAxisHorizontal];

    NSDictionary *nameMap = @{ @"segmentedControl" : self.gettingType,
                               @"fromValueLabel" : self.fromValueLabel,
                               @"fromValueTextField" : self.fromValueTextField };

    NSArray *verticalInputLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[segmentedControl]-50-[fromValueLabel]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalInputLabelConstraints];

    NSLayoutConstraint *verticalInputTextFieldConstraints =
    [NSLayoutConstraint constraintWithItem:self.fromValueTextField
                                 attribute:NSLayoutAttributeBaseline
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.fromValueLabel
                                 attribute:NSLayoutAttributeBaseline
                                multiplier:1.0f
                                  constant:0.0f];
    [self.view addConstraints:@[verticalInputTextFieldConstraints]];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[fromValueLabel]-[fromValueTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalConstraints];
}

- (void)addToValueLabelAndTextFieldConstraints
{
    self.toValueLabel.translatesAutoresizingMaskIntoConstraints     = NO;
    self.toValueTextField.translatesAutoresizingMaskIntoConstraints = NO;

    [self.toValueLabel setContentHuggingPriority:300.0f forAxis:UILayoutConstraintAxisHorizontal];

    NSDictionary *nameMap = @{ @"fromValueLabel" : self.fromValueLabel,
                               @"fromValueTextField" : self.fromValueTextField,
                               @"toValueLabel" : self.toValueLabel,
                               @"toValueTextField" : self.toValueTextField };

    NSArray *verticalOutputLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[fromValueTextField]-[toValueTextField]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalOutputLabelConstraints];

    NSLayoutConstraint *verticalOutputTextFieldConstraints =
    [NSLayoutConstraint constraintWithItem:self.toValueTextField
                                 attribute:NSLayoutAttributeBaseline
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.toValueLabel
                                 attribute:NSLayoutAttributeBaseline
                                multiplier:1.0f
                                  constant:0.0f];
    [self.view addConstraints:@[verticalOutputTextFieldConstraints]];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[toValueLabel]-[toValueTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalConstraints];

    NSLayoutConstraint *horizontalOutputLabelConstraints =
    [NSLayoutConstraint constraintWithItem:self.toValueLabel
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.fromValueLabel
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0f
                                  constant:0.0f];
    [self.view addConstraints:@[horizontalOutputLabelConstraints]];
}

@end
