//
//  AIZSettingsViewController+SwitchViews.h
//  Mnemonics
//
//  Created by X on 25/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumber2WordViewController.h"

@interface AIZNumber2WordViewController (SwitchViews)

- (void)switchViews;
- (void)switchViewsFromController:(UIViewController *)fromVC
                     toController:(UIViewController *)toVC;

@end
