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
#import "AIZNumbersStore.h"

@interface AIZNumberEditViewController ()

@end

@implementation AIZNumberEditViewController

- (void)setEditItem:(id)newEditItem
{
    if (_editItem != newEditItem)
    {
        _editItem = newEditItem;
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.editItem)
    {
        self.numberLabel.text =
        [[self.editItem valueForKey:@"value"] description];

        [self.lettersSegmentedControl removeAllSegments];
        NSArray *letters = [[AIZNumbersStore sharedStore]
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

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addNavItems];

    [self addNumberLabel];
    [self addNumberLabelConstraints];

    [self addLetterLabelSegmentedControl];
    [self addLetterLabelSegmentedControlConstraints];

    // Update the view.
    [self configureView];
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
















