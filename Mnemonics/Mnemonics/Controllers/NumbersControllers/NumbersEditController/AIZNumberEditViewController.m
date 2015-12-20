//
//  AIZNumberEditViewController.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberEditViewController.h"

@interface AIZNumberEditViewController ()

@end

@implementation AIZNumberEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addNavItems];

    [self addNumberLabel];
    [self addNumberLabelConstraints];

    [self addLetterLabelSegmentedControl];
    [self addLetterLabelSegmentedControlConstraints];
}

- (void)addNavItems
{
    self.navigationItem.title = @"Edit";

    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                  target:self
                                  action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cancelBtn;

    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                target:self
                                action:@selector(save)];
    self.navigationItem.rightBarButtonItem = saveBtn;
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
}

- (void)addNumberLabel
{
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.numberLabel.text = @"69";
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.font = [UIFont systemFontOfSize:100.0f];
    [self.numberLabel sizeToFit];
    [self.view addSubview:self.numberLabel];
}

- (void)addLetterLabelSegmentedControl
{
    self.lettersLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.lettersLabel.text = @"Выберите буквы для запоминания числа:";
    self.lettersLabel.textAlignment = NSTextAlignmentCenter;
    self.lettersLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.lettersLabel sizeToFit];
    [self.view addSubview:self.lettersLabel];

    self.lettersSegmentedControl = [[UISegmentedControl alloc]
                             initWithItems:@[@"ШР", @"ШЦ", @"ЛР", @"ЛЦ"]];
    [self.lettersSegmentedControl addTarget:self
                              action:@selector(toggleControls:)
                    forControlEvents:UIControlEventValueChanged];
    //self.segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:self.lettersSegmentedControl];
}

- (void)toggleControls:(UISegmentedControl *)sender
{
}

- (void)addNumberLabelConstraints
{
    self.numberLabel.translatesAutoresizingMaskIntoConstraints  = NO;

    NSDictionary *nameMap = @{ @"topGuide" : self.topLayoutGuide,
                               @"numberLabel" : self.numberLabel };

    NSArray *horizontalNumberLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[numberLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalNumberLabelConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-[numberLabel]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalConstraints];
}

- (void)addLetterLabelSegmentedControlConstraints
{
    self.lettersLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.lettersSegmentedControl.translatesAutoresizingMaskIntoConstraints  = NO;

    NSDictionary *nameMap = @{ @"numberLabel" : self.numberLabel,
                               @"segmentedControl" : self.lettersSegmentedControl,
                               @"lettersLabel" : self.lettersLabel };

    NSArray *horizontallettersLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[lettersLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontallettersLabelConstraints];

    NSArray *horizontallettersSegmentedControlConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[segmentedControl]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontallettersSegmentedControlConstraints];


    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[numberLabel]-[lettersLabel]-[segmentedControl]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalConstraints];
}

@end
















