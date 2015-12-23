//
//  AIZAllGamesViewController.m
//  Mnemonics
//
//  Created by X on 22/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAllGamesViewController.h"
#import "AIZAllGamesViewController+UIControls.h"
#import "AIZAllGamesViewController+UIConstraints.h"
#import "AIZNumber2WordViewController.h"

@interface AIZAllGamesViewController ()

@property (nonatomic, strong) AIZNumber2WordViewController *number2WordVC;

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

    [self addGamesButtons];
    [self addGamesNumbersConstraints];
}

- (void)runNumber2WordGame
{
    self.number2WordVC = [[AIZNumber2WordViewController alloc] init];
    [self.navigationController pushViewController:self.number2WordVC
                                         animated:YES];
}

- (void)runWord2NumberGame
{
    
}

@end
















