//
//  AIZSettingsViewController+UIConstraints.m
//  Mnemonics
//
//  Created by X on 25/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSettingsViewController+UIConstraints.h"

@implementation AIZSettingsViewController (UIConstraints)

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

- (void)addCurrentSettingsTextViewConstraints
{
    self.currentSettingTextView.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"textField" : self.toValueTextField,
                               @"textView" : self.currentSettingTextView,
                               @"bottomGuide" :self.bottomLayoutGuide };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat: @"V:[textField]-20-[textView]-20-[bottomGuide]"
                                            options: 0
                                            metrics: nil
                                              views: nameMap];
    [self.view addConstraints:verticalConstraints];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-[textView]-|"
                                            options: 0
                                            metrics: nil
                                              views: nameMap];
    [self.view addConstraints:horizontalConstraints];
}

@end
