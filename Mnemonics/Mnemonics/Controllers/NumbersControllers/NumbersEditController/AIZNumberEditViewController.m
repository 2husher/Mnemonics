//
//  AIZNumberEditViewController.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberEditViewController.h"
#import "AIZNumberEditViewController+UIControls.h"
#import "AIZNumberEditViewController+UIConstraints.h"
#import "AIZDigitsStore.h"

@implementation AIZNumberEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Edit", @"Edit");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self addNavItems];

    [self addNumberLabel];
    [self addNumberLabelConstraints];

    [self addLetterLabelSegmentedControl];
    [self addLetterLabelSegmentedControlConstraints];

    [self configureView];
}

- (void)configureView
{
    if (self.editedItem)
    {
        self.numberLabel.text = [[self.editedItem valueForKey:@"value"]
                                 description];
        
        [self.lettersSegmentedControl removeAllSegments];

        NSArray *letters = [[AIZDigitsStore sharedStore]
                            getLettersForDigits:self.numberLabel.text];
        NSUInteger len = [letters count];
        for (NSUInteger i = 0; i < len; i++)
        {
            NSString *title = [letters[i] componentsJoinedByString:@""];
            [self.lettersSegmentedControl insertSegmentWithTitle:title
                                                         atIndex:i
                                                        animated:NO];
        }
    }
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
}

- (void)toggleControls:(UISegmentedControl *)sender
{
}

@end
















