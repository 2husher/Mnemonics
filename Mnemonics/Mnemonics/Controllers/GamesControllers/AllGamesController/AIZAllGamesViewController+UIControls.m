//
//  AIZAllGamesViewController+UIControls.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAllGamesViewController+UIControls.h"

@implementation AIZAllGamesViewController (UIControls)

- (void)addGamesButtons
{
    self.number2WordGameButton = [UIButton
                                  buttonWithType:UIButtonTypeSystem];
    self.number2WordGameButton.frame = CGRectZero;
    [self.number2WordGameButton setTitle:@"Что за слово?"
                                forState:UIControlStateNormal];
    self.number2WordGameButton.titleLabel.font = [UIFont
                                                  systemFontOfSize:30.0f];
    [self.number2WordGameButton sizeToFit];
    [self.view addSubview:self.number2WordGameButton];
    [self.number2WordGameButton addTarget:self
                                   action:@selector(runNumber2WordGame)
                         forControlEvents:UIControlEventTouchUpInside];

    self.word2NumberGameButton = [UIButton
                                  buttonWithType:UIButtonTypeSystem];
    self.word2NumberGameButton.frame = CGRectZero;
    [self.word2NumberGameButton setTitle:@"Что за число?"
                                forState:UIControlStateNormal];
    self.word2NumberGameButton.titleLabel.font = [UIFont
                                                  systemFontOfSize:30.0f];
    [self.word2NumberGameButton sizeToFit];
    [self.view addSubview:self.word2NumberGameButton];
    [self.word2NumberGameButton addTarget:self
                                   action:@selector(runWord2NumberGame)
                         forControlEvents:UIControlEventTouchUpInside];
}

@end
