//
//  AIZNumberEditViewController+UIControls.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberEditViewController+UIControls.h"

@implementation AIZNumberEditViewController (UIControls)

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

@end
