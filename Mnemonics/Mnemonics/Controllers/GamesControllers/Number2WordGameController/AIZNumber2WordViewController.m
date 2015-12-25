//
//  AIZNumber2WordViewController.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumber2WordViewController.h"
#import "AIZNumber2WordViewController+UIControls.h"
#import "AIZNumber2WordViewController+UIConstraints.h"
#import "AIZNumber2WordViewController+SwitchViews.h"
#import "AIZGameStore.h"
//#import "AIZSampleNumbersStore.h"

@interface AIZNumber2WordViewController ()

@property (nonatomic, strong) NSMutableDictionary *settingItem;
@property (nonatomic, strong) UITapGestureRecognizer *tapGR;

@end

@implementation AIZNumber2WordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Number2Word", @"Number2Word");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addTapGR];
    [self addNavItem];

    self.settingItem = [@{ @"FromValue" : @"0",
                           @"ToValue" : @"5",
                           @"Order" : @"Ascending" } mutableCopy];

    [self loadGame];
}

- (void)addTapGR
{
    self.tapGR = [[UITapGestureRecognizer alloc]
                  initWithTarget:self
                  action:@selector(switchViews)];
    self.tapGR.numberOfTouchesRequired = 1;
    self.tapGR.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:self.tapGR];
}

- (void)loadGame
{
    if (self.numberVC)
    {
        [self.numberVC willMoveToParentViewController:nil];
        [self.numberVC.view removeFromSuperview];
        [self.numberVC removeFromParentViewController];
        self.numberVC = nil;
    }

    if (self.wordVC)
    {
        [self.wordVC willMoveToParentViewController:nil];
        [self.wordVC.view removeFromSuperview];
        [self.wordVC removeFromParentViewController];
        self.wordVC = nil;
    }

    [[AIZGameStore sharedStore] updateSettingsFromValue:self.settingItem[@"FromValue"]
                                                toValue:self.settingItem[@"ToValue"]
                                              withOrder:self.settingItem[@"Order"]];
    self.number = [[AIZGameStore sharedStore] nextObject];

    self.numberVC = [[AIZNumberViewController alloc] initWithNumber:self.number];
    [self switchViewsFromController:nil
                       toController:self.numberVC];
}

- (void)saveSettings:(AIZSettingsViewController *)sender
{
    [self loadGame];
}

- (void)changeGameSettings
{
    AIZSettingsViewController *settingsVC = [[AIZSettingsViewController alloc] init];
    settingsVC.settingsItem = self.settingItem;
    settingsVC.delegate = self;

    UINavigationController *nc = [[UINavigationController alloc]
                                  initWithRootViewController:settingsVC];

    [self presentViewController:nc animated:YES completion:nil];
}

@end
