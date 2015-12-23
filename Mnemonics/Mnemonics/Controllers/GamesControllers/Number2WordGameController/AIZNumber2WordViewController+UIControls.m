//
//  AIZNumber2WordViewController+UIControls.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumber2WordViewController+UIControls.h"

@implementation AIZNumber2WordViewController (UIControls)

- (void)addToolBar
{
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectZero];
    self.toolBar.opaque = NO;

    UIBarButtonItem *switchViews =
    [[UIBarButtonItem alloc] initWithTitle:@"Switch Views"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(switchViews)];

    self.toolBar.items = @[switchViews];

    [self.view addSubview:self.toolBar];
}

- (void)addNavItem
{
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                            target:self
                            action:@selector(switchViews)];
    self.navigationItem.rightBarButtonItem = bbi;
}

@end
