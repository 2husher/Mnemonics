//
//  AIZNumber2WordViewController+UIConstraints.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumber2WordViewController+UIConstraints.h"

@implementation AIZNumber2WordViewController (UIConstraints)

- (void)addToolBarConstraints
{
    self.toolBar.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"bottomGuide" : self.bottomLayoutGuide,
                               @"toolBar" : self.toolBar };

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[toolBar]|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[toolBar(==44)]-[bottomGuide]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];
}

@end
