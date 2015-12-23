//
//  AIZWordViewController+UIControls.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZWordViewController+UIControls.h"

@implementation AIZWordViewController (UIControls)

- (void)addWordLabel
{
    self.wordLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.wordLabel.text = @"ШАР";
    self.wordLabel.textAlignment = NSTextAlignmentCenter;
    self.wordLabel.font = [UIFont systemFontOfSize:100.0f];
    [self.wordLabel sizeToFit];
    [self.view addSubview:self.wordLabel];
}

@end
