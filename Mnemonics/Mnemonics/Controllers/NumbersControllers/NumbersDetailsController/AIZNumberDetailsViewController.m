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

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self addNumberLettersWordLabels];
    [self addNumberLettersWordLabelsConstraints];

    [self addNavItem];

    [self configureView];
}

- (void)configureView
{
    if (self.detailItem && self.numberLabel &&
        self.lettersLabel && self.wordLabel)
    {
        self.numberLabel.text = [[self.detailItem valueForKey:@"value"]
                                 description];
        self.lettersLabel.text = [[self.detailItem valueForKey:@"letters"]
                                  description];
        self.wordLabel.text = [[self.detailItem valueForKey:@"word"]
                               description];

    }
}

- (void)editNumber
{
    self.editedVC = [[AIZNumberEditViewController alloc] init];

    UINavigationController *nc = [[UINavigationController alloc]
                                  initWithRootViewController:self.editedVC];

    self.editedVC.editedItem = self.detailItem;
    self.editedVC.delegate = self;

    [self presentViewController:nc animated:YES completion:nil];
}

- (void)updateView
{
    [self configureView];
    [self.delegate saveNumber];
}

@end

























