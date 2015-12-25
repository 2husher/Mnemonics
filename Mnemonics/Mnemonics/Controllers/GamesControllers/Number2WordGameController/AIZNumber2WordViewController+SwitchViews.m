//
//  AIZSettingsViewController+SwitchViews.m
//  Mnemonics
//
//  Created by X on 25/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumber2WordViewController+SwitchViews.h"
#import "AIZGameStore.h"

@implementation AIZNumber2WordViewController (SwitchViews)

- (void)switchViews
{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:4];
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

        self.number = [[AIZGameStore sharedStore] nextObject];

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

@end
