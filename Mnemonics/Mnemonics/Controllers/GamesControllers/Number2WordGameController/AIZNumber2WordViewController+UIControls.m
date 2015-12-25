//
//  AIZNumber2WordViewController+UIControls.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumber2WordViewController+UIControls.h"

@implementation AIZNumber2WordViewController (UIControls)

- (void)addNavItem
{
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                            initWithTitle:@"Options"
                            style:UIBarButtonItemStylePlain
                            target:self
                            action:@selector(changeGameSettings)];
    self.navigationItem.rightBarButtonItem = bbi;
}

@end
