//
//  AIZAllGamesViewController.m
//  Mnemonics
//
//  Created by X on 22/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAllGamesViewController.h"

@interface AIZAllGamesViewController ()

@end

@implementation AIZAllGamesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"All Games", @"All Games");

    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
