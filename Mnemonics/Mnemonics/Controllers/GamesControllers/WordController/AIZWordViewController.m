//
//  AIZWordViewController.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZWordViewController.h"
#import "AIZWordViewController+UIControls.h"
#import "AIZWordViewController+UIConstraints.h"

@interface AIZWordViewController ()

@end

@implementation AIZWordViewController

- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor blueColor];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addWordLabel];
    [self addWordLabelConstraints];
}

@end
