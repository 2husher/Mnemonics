//
//  AIZAllGamesViewController.h
//  Mnemonics
//
//  Created by X on 22/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIZAllGamesViewController : UIViewController

@property (strong, nonatomic) UIButton *number2WordGameButton;
@property (strong, nonatomic) UIButton *word2NumberGameButton;

- (void)runNumber2WordGame;
- (void)runWord2NumberGame;

@end
