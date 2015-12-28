//
//  AIZNumberEditViewController+UIConstraints.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberEditViewController+UIConstraints.h"

@implementation AIZNumberEditViewController (UIConstraints)

- (void)addNumberLabelConstraints
{
    self.numberLabel.translatesAutoresizingMaskIntoConstraints  = NO;

    NSDictionary *nameMap = @{ @"topGuide" : self.topLayoutGuide,
                               @"numberLabel" : self.numberLabel };

    NSArray *horizontalNumberLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[numberLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalNumberLabelConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-[numberLabel]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalConstraints];
}

- (void)addLetterLabelSegmentedControlConstraints
{
    self.lettersLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.lettersSegmentedControl.translatesAutoresizingMaskIntoConstraints  = NO;

    NSDictionary *nameMap = @{ @"numberLabel" : self.numberLabel,
                               @"segmentedControl" : self.lettersSegmentedControl,
                               @"lettersLabel" : self.lettersLabel };

    NSArray *horizontallettersLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[lettersLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontallettersLabelConstraints];

    NSArray *horizontallettersSegmentedControlConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[segmentedControl]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontallettersSegmentedControlConstraints];


    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[numberLabel]-[lettersLabel]-[segmentedControl]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalConstraints];
}

- (void)addWordLabelAndTextFieldConstraints
{
    self.wordLabel.translatesAutoresizingMaskIntoConstraints     = NO;
    self.wordTextField.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"segmentedControl" : self.lettersSegmentedControl,
                               @"wordLabel" : self.wordLabel,
                               @"wordTextField" : self.wordTextField };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[segmentedControl]-50-[wordLabel]-[wordTextField]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalConstraints];

    NSArray *horizontalWordLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[wordLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalWordLabelConstraints];

    NSArray *horizontalWordTextFieldConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[wordTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalWordTextFieldConstraints];
}

@end
