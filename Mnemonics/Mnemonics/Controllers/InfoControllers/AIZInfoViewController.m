//
//  AIZInfoViewController.m
//  Mnemonics
//
//  Created by X on 17/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZInfoViewController.h"

@interface AIZInfoViewController ()

@end

@implementation AIZInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Info", @"Info");

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addDigitLettersLabels];
    [self addDigitLettersLabelsConstraints];
}

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

@end



















