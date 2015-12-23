//
//  AIZNumberViewController.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberViewController.h"
#import "AIZNumberViewController+UIControls.h"
#import "AIZNumberViewController+UIConstraints.h"

@interface AIZNumberViewController ()

@end

@implementation AIZNumberViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor yellowColor];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addNumberLabel];
    [self addNumberLabelConstraints];
}

@end
