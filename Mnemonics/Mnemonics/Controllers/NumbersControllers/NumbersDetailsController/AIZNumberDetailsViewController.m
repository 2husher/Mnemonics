//
//  AIZNumberDetailsViewController.m
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberDetailsViewController.h"
#import "AIZNumberEditViewController.h"
#import "AIZNumberDetailsViewController+UIControls.h"
#import "AIZNumberDetailsViewController+UIConstraints.h"

@interface AIZNumberDetailsViewController ()

@end

@implementation AIZNumberDetailsViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem)
    {
        _detailItem = newDetailItem;

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem)
    {
        self.numberLabel.text =
            [[self.detailItem valueForKey:@"value"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addNumberLettersWordLabels];
    [self addNumberLettersWordLabelsConstraints];

    [self addNavItem];

 //   [self configureView];
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}

- (void)editNumber
{
    AIZNumberEditViewController *numberEditVC = [[AIZNumberEditViewController alloc] init];

    UINavigationController *nc = [[UINavigationController alloc]
                                  initWithRootViewController:numberEditVC];

    numberEditVC.editItem = self.detailItem;

    [self presentViewController:nc animated:YES completion:nil];
}

@end

























