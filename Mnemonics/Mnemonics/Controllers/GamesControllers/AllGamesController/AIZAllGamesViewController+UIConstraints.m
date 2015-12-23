//
//  AIZAllGamesViewController+UIConstraints.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAllGamesViewController+UIConstraints.h"

@implementation AIZAllGamesViewController (UIConstraints)

- (void)addGamesNumbersConstraints
{
    self.number2WordGameButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.word2NumberGameButton.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"number" : self.number2WordGameButton,
                               @"word" : self.word2NumberGameButton };

    NSArray *horizontalNumberLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[number]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalNumberLabelConstraints];

    NSArray *horizontalLetterLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[word]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalLetterLabelConstraints];

    NSLayoutConstraint *verticalWordConstraints =
    [NSLayoutConstraint constraintWithItem:self.word2NumberGameButton
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0f
                                  constant:0.0f];
    [self.view addConstraints:@[verticalWordConstraints]];

    NSArray *verticalNumberConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[number]-[word]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalNumberConstraints];
}

@end
