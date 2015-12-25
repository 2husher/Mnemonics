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
#import "AIZSampleNumbersStore.h"

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

- (NSManagedObject *)nextNumber
{
    NSNumber *numberIndex = [[AIZGameStore sharedStore] nextItem];
    NSManagedObjectContext *context = [self managedObjectContext];

    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescr =[NSEntityDescription
                                       entityForName:@"Number"
                                       inManagedObjectContext:context];
    request.entity = entityDescr;

    NSPredicate *pred = [NSPredicate
                         predicateWithFormat:@"(index = %@)", numberIndex];
    request.predicate = pred;

    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    if (objects == nil)
    {
        // handle error
    }
    return [objects lastObject];
}

- (void)loadGame
{
    if (self.numberVC)
    {
        [self.numberVC willMoveToParentViewController:nil];
        [self.numberVC.view removeFromSuperview];
        [self.numberVC removeFromParentViewController];
    }
    self.numberVC = nil;
    if (self.wordVC)
    {
        [self.wordVC willMoveToParentViewController:nil];
        [self.wordVC.view removeFromSuperview];
        [self.wordVC removeFromParentViewController];
    }
    self.wordVC   = nil;

    NSUInteger from = [[AIZSampleNumbersStore sharedStore] indexByValue:self.settingItem[@"FromValue"]];
    NSUInteger to = [[AIZSampleNumbersStore sharedStore] indexByValue:self.settingItem[@"ToValue"]];
    [[AIZGameStore sharedStore] updateSettingsFromValue:from
                                                toValue:to
                                              withOrder:self.settingItem[@"Order"]];
    self.number = [self nextNumber];

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

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

@end
