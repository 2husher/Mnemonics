//
//  AIZNumberDetailsViewController+UIConstraints.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberDetailsViewController+UIConstraints.h"

@implementation AIZNumberDetailsViewController (UIConstraints)

- (void)addNumberLettersWordLabelsConstraints
{
    self.numberLabel.translatesAutoresizingMaskIntoConstraints  = NO;
    self.lettersLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.wordLabel.translatesAutoresizingMaskIntoConstraints    = NO;

    NSDictionary *nameMap = @{ @"topGuide" : self.topLayoutGuide,
                               @"numberLabel" : self.numberLabel,
                               @"lettersLabel" : self.lettersLabel,
                               @"wordLabel" : self.wordLabel };

    NSArray *horizontalNumberLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[numberLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalNumberLabelConstraints];

    NSArray *horizontalLetterLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[lettersLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalLetterLabelConstraints];

    NSArray *horizontalWordLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[wordLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalWordLabelConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-[numberLabel]-[lettersLabel]-[wordLabel]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalConstraints];
}

@end
