//
//  AIZMainViewController+UI.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIZInfoViewController+UIControls.h"

@implementation AIZInfoViewController (UIControls)

- (void)addDigitLettersLabels
{
    self.numbersLabelsArray = [[NSMutableArray alloc] init];

    NSArray *digits        = @[@"0", @"1", @"2", @"3", @"4",
                               @"5", @"6", @"7", @"8", @"9"];

    NSArray *firstLetters  = @[@"Н", @"Г", @"Д", @"К", @"Ч",
                               @"П", @"Ш", @"С", @"В", @"Р"];

    NSArray *secondLetters = @[@"М", @"Ж", @"Т", @"Х", @"Щ",
                               @"Б", @"Л", @"З", @"Ф", @"Ц"];

    for (NSUInteger i = 0; i < 10; i++)
    {
        UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        numLabel.text = digits[i];
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.layer.borderWidth = 1.0;
        [numLabel sizeToFit];
        [self.view addSubview:numLabel];

        UILabel *fstLetLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        fstLetLabel.text = firstLetters[i];
        fstLetLabel.textAlignment = NSTextAlignmentCenter;
        fstLetLabel.layer.borderWidth = 1.0;
        [fstLetLabel sizeToFit];
        [self.view addSubview:fstLetLabel];

        UILabel *secLetLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        secLetLabel.text = secondLetters[i];
        secLetLabel.textAlignment = NSTextAlignmentCenter;
        secLetLabel.layer.borderWidth = 1.0;
        [secLetLabel sizeToFit];
        [self.view addSubview:secLetLabel];

        NSDictionary *mnemDigit = @{ @"number" : numLabel,
                                     @"firstLetter" : fstLetLabel,
                                     @"secondLetter" : secLetLabel };

        self.numbersLabelsArray[i] = mnemDigit;
    }
}

- (void) addRulesTextView
{
    self.rulesTextView = [[UITextView alloc] initWithFrame:CGRectZero];
    self.rulesTextView.editable = NO;
    self.rulesTextView.text = @"Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица. Это мнемоническая таблица.";

    [self.view addSubview:self.rulesTextView];
}

@end
