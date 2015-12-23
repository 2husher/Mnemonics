//
//  AIZNumberViewController+UIConstraints.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberViewController+UIConstraints.h"

@implementation AIZNumberViewController (UIConstraints)

- (void)addNumberLabelConstraints
{
    self.numberLabel.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *centerXconstraint =
    [NSLayoutConstraint constraintWithItem:self.numberLabel
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f
                                  constant:0.0f];

    NSLayoutConstraint *centerYconstraint =
    [NSLayoutConstraint constraintWithItem:self.numberLabel
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[centerXconstraint, centerYconstraint]];
}

@end
