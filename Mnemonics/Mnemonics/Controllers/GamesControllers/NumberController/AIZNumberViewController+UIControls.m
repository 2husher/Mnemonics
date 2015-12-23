//
//  AIZNumberViewController+UIControls.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberViewController+UIControls.h"

@implementation AIZNumberViewController (UIControls)

- (void)addNumberLabel
{
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.numberLabel.text = @"69";
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.font = [UIFont systemFontOfSize:100.0f];
    [self.numberLabel sizeToFit];
    [self.view addSubview:self.numberLabel];
}

@end
