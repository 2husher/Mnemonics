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

@interface AIZNumber2WordViewController ()

@property (nonatomic, strong) AIZNumberViewController *numberVC;
@property (nonatomic, strong) AIZWordViewController *wordVC;

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

//    [self addToolBar];
//    [self addToolBarConstraints];

    [self addNavItem];

    self.numberVC = [[AIZNumberViewController alloc] init];
    [self switchViewsFromController:nil
                       toController:self.numberVC];
}

- (void)switchViews
{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];

    if (self.numberVC.view.superview)
    {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                               forView:self.view
                                 cache:NO];

        self.wordVC = [[AIZWordViewController alloc] init];

        [self switchViewsFromController:self.numberVC
                           toController:self.wordVC];

        self.numberVC = nil;
    }
    else
    {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                               forView:self.view
                                 cache:NO];

        self.numberVC = [[AIZNumberViewController alloc] init];

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

@end
