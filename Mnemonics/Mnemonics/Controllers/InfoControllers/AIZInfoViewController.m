//
//  AIZInfoViewController.m
//  Mnemonics
//
//  Created by X on 17/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZInfoViewController.h"
#import "AIZInfoViewController+UIControls.h"
#import "AIZInfoViewController+UIConstraints.h"

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

    [self addRulesTextView];
    [self addRulesTextViewConstraints];
}

@end



















