//
//  AIZWordViewController+UIConstraints.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZWordViewController+UIConstraints.h"

@implementation AIZWordViewController (UIConstraints)

- (void)addWordLabelConstraints
{
    self.wordLabel.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *centerXconstraint =
    [NSLayoutConstraint constraintWithItem:self.wordLabel
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f
                                  constant:0.0f];

    NSLayoutConstraint *centerYconstraint =
    [NSLayoutConstraint constraintWithItem:self.wordLabel
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[centerXconstraint, centerYconstraint]];
}

@end
