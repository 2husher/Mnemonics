//
//  AIZNumber2WordViewController.h
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIZSettingsViewController.h"
#import "AIZNumberViewController.h"
#import "AIZWordViewController.h"

@interface AIZNumber2WordViewController : UIViewController <NSFetchedResultsControllerDelegate, AIZSettingsDelegate>

@property (nonatomic, strong) id number;

@property (nonatomic, strong) AIZNumberViewController *numberVC;
@property (nonatomic, strong) AIZWordViewController *wordVC;

- (void)changeGameSettings;

@end
