//
//  AIZConvertorsViewController+UIControls.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIZConvertorsViewController+UIControls.h"

@implementation AIZConvertorsViewController (UIControls)

- (void)addSegmentedControl
{
    self.segmentedControl = [[UISegmentedControl alloc]
                             initWithItems:@[@"Word2Numbers", @"Number2Words"]];
    [self.segmentedControl addTarget:self
                              action:@selector(toggleControls:)
                    forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:self.segmentedControl];
}

- (void)addInputLabelAndTextField
{
    self.inputLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //self.inputLabel.backgroundColor = [UIColor grayColor];
    self.inputLabel.text = @"Word:";
    [self.inputLabel sizeToFit];
    [self.view addSubview:self.inputLabel];

    self.inputTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputTextField.returnKeyType = UIReturnKeyDone;
    self.inputTextField.placeholder = @"Type in a word...";
    self.inputTextField.delegate = self;
    [self.view addSubview:self.inputTextField];
}

- (void)addOutputLabelAndTextField
{
    self.outputLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //self.outputLabel.backgroundColor = [UIColor grayColor];
    self.outputLabel.text = @"Number:";
    [self.outputLabel sizeToFit];
    [self.view addSubview:self.outputLabel];

    self.outputTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.outputTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.outputTextField.enabled = NO;
    [self.view addSubview:self.outputTextField];
}

@end
