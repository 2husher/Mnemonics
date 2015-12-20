//
//  AIZInfoViewController+UIConstraints.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIZInfoViewController+UIConstraints.h"

@implementation AIZInfoViewController (UIConstraints)

- (void)addDigitLettersLabelsConstraints
{
    for (NSUInteger i = 0; i < 10; i++)
    {
        UILabel *numLabel = self.numbersLabelsArray[i][@"number"];
        UILabel *fstLetLabel = self.numbersLabelsArray[i][@"firstLetter"];
        UILabel *secLetLabel = self.numbersLabelsArray[i][@"secondLetter"];

        numLabel.translatesAutoresizingMaskIntoConstraints    = NO;
        fstLetLabel.translatesAutoresizingMaskIntoConstraints = NO;
        secLetLabel.translatesAutoresizingMaskIntoConstraints = NO;

        NSDictionary *nameMap = @{ @"numLabel" : numLabel,
                                   @"fstLetLabel" : fstLetLabel,
                                   @"secLetLabel" : secLetLabel };

        NSDictionary *metricsDict = @{ @"length" : @(80) };

        NSArray *horizontalConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:[numLabel(length)]-0-[fstLetLabel(length)]-0-[secLetLabel(length)]"
                                                options:0
                                                metrics:metricsDict
                                                  views:nameMap];
        [self.view addConstraints:horizontalConstraints];

        NSLayoutConstraint *horizontalFstLetLabelConstraints =
        [NSLayoutConstraint constraintWithItem:fstLetLabel
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0f
                                      constant:0.0f];
        [self.view addConstraints:@[horizontalFstLetLabelConstraints]];

        if (i == 0)
        {
            id topGuide = self.topLayoutGuide;
            NSDictionary *viewsDictionary
            = NSDictionaryOfVariableBindings (fstLetLabel, topGuide);

            NSArray *verticalConstraints =
            [NSLayoutConstraint constraintsWithVisualFormat: @"V:[topGuide]-20-[fstLetLabel]"
                                                    options: 0
                                                    metrics: nil
                                                      views: viewsDictionary];
            [self.view addConstraints:verticalConstraints];
        }
        else
        {
            NSDictionary *anotherNameMap =
            @{ @"prevFstLetLabel" :
                   self.numbersLabelsArray[i-1][@"firstLetter"],
               @"fstLetLabel" : fstLetLabel };

            NSArray *verticalFstLetLabelConstraints =
            [NSLayoutConstraint constraintsWithVisualFormat:@"V:[prevFstLetLabel]-[fstLetLabel]"
                                                    options:0
                                                    metrics:nil
                                                      views:anotherNameMap];
            [self.view addConstraints:verticalFstLetLabelConstraints];
        }

        NSLayoutConstraint *verticalNumLabelConstraints =
        [NSLayoutConstraint constraintWithItem:numLabel
                                     attribute:NSLayoutAttributeBaseline
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:fstLetLabel
                                     attribute:NSLayoutAttributeBaseline
                                    multiplier:1.0f
                                      constant:0.0f];

        NSLayoutConstraint *verticalSecLetLabelConstraints =
        [NSLayoutConstraint constraintWithItem:secLetLabel
                                     attribute:NSLayoutAttributeBaseline
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:fstLetLabel
                                     attribute:NSLayoutAttributeBaseline
                                    multiplier:1.0f
                                      constant:0.0f];

        [self.view addConstraints:@[verticalNumLabelConstraints,
                                    verticalSecLetLabelConstraints]];
    }
}


- (void) addRulesTextViewConstraints
{
    self.rulesTextView.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"table" : self.numbersLabelsArray[9][@"firstLetter"],
                               @"textView" : self.rulesTextView,
                               @"bottomGuide" :self.bottomLayoutGuide };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat: @"V:[table]-20-[textView]-20-[bottomGuide]"
                                            options: 0
                                            metrics: nil
                                              views: nameMap];
    [self.view addConstraints:verticalConstraints];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-[textView]-|"
                                            options: 0
                                            metrics: nil
                                              views: nameMap];
    [self.view addConstraints:horizontalConstraints];
}

@end
