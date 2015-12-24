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
#import "AIZNumberViewController.h"
#import "AIZWordViewController.h"
#import "AIZGameStore.h"
#import "AIZSettingsViewController.h"
#import "AIZSampleNumbersStore.h"

@interface AIZNumber2WordViewController ()

@property (nonatomic, strong) AIZNumberViewController *numberVC;
@property (nonatomic, strong) AIZWordViewController *wordVC;

@property (nonatomic, strong) UITapGestureRecognizer *tapGR;

@end

@implementation AIZNumber2WordViewController

+ (void)initialize
{
}

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

    [self initGame];

    self.number = [self nextNumber];

    self.numberVC = [[AIZNumberViewController alloc] initWithNumber:self.number];
    [self switchViewsFromController:nil
                       toController:self.numberVC];
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

//    if (self.device)
//    {
//        self.nameTextField.text    = [self.device valueForKey:@"name"];
//        self.versionTextField.text = [self.device valueForKey:@"version"];
//        self.companyTextField.text = [self.device valueForKey:@"company"];
//    }
}

- (void)initGame
{
    NSUInteger from = [[AIZSampleNumbersStore sharedStore] indexByValue:@"0"];
    NSUInteger to = [[AIZSampleNumbersStore sharedStore] indexByValue:@"5"];
    [[AIZGameStore sharedStore] updateSettingsFromValue:from
                                                toValue:to
                                              withOrder:@"Ascending"];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    [[AIZGameStore sharedStore]
//     getItemsFrom:[defaults stringForKey:AIZFromValue]
//     to:[defaults stringForKey:AIZToValue]
//     withType:[defaults integerForKey:AIZGettingType]];
//
//    NSLog(@"defaults = %@", [defaults dictionaryRepresentation]);
}

- (void)setGameOptions
{
    AIZSettingsViewController *settingsVC = [[AIZSettingsViewController alloc] init];

    UINavigationController *nc = [[UINavigationController alloc]
                                  initWithRootViewController:settingsVC];

    [self presentViewController:nc animated:YES completion:nil];
}

- (void)switchViews
{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];

#warning "Label jumps when view rotates"
    if (self.numberVC.view.superview)
    {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                               forView:self.view
                                 cache:NO];

        self.wordVC = [[AIZWordViewController alloc]
                       initWithNumber:self.number];

        [self switchViewsFromController:self.numberVC
                           toController:self.wordVC];

        self.numberVC = nil;
    }
    else
    {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                               forView:self.view
                                 cache:NO];

        self.number = [self nextNumber];
        self.numberVC = [[AIZNumberViewController alloc]
                         initWithNumber:self.number];

        [self switchViewsFromController:self.wordVC
                           toController:self.numberVC];

        self.wordVC = nil;
    }

    [UIView commitAnimations];
}

- (void)switchViewsFromController:(UIViewController *)fromVC
                     toController:(UIViewController *)toVC
{
    if (fromVC)
    {
        [fromVC willMoveToParentViewController:nil];
        [fromVC.view removeFromSuperview];
        [fromVC removeFromParentViewController];
    }

    if (toVC)
    {
        [self addChildViewController:toVC];
        [self.view insertSubview:toVC.view atIndex:0];
        [toVC didMoveToParentViewController:self];
    }
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
