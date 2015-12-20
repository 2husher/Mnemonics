//
//  AIZConvertorsViewController+UIConstraints.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZConvertorsViewController+UIConstraints.h"

@implementation AIZConvertorsViewController (UIConstraints)

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
