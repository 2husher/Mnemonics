//
//  AIZNumberDetailsViewController+UIControls.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberDetailsViewController+UIControls.h"

@implementation AIZNumberDetailsViewController (UIControls)

- (void)addNumberLettersWordLabels
{
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.font = [UIFont systemFontOfSize:100.0f];
    [self.numberLabel sizeToFit];
    [self.view addSubview:self.numberLabel];

    self.lettersLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.lettersLabel.textAlignment = NSTextAlignmentCenter;
    self.lettersLabel.font = [UIFont systemFontOfSize:30.0f];
    [self.lettersLabel sizeToFit];
    [self.view addSubview:self.lettersLabel];

    self.wordLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.wordLabel.textAlignment = NSTextAlignmentCenter;
    self.wordLabel.font = [UIFont systemFontOfSize:50.0f];
    [self.wordLabel sizeToFit];
    [self.view addSubview:self.wordLabel];
}

- (void)addNavItem
{
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                            target:self
                            action:@selector(editNumber)];
    self.navigationItem.rightBarButtonItem = bbi;
}

@end
