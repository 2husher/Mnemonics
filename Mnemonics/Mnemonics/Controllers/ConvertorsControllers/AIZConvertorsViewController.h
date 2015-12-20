//
//  AIZWord2NumbersViewController.h
//  Mnemonics
//
//  Created by X on 18/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIZConvertorsViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UILabel *inputLabel;
@property (nonatomic, strong) UITextField *inputTextField;
@property (nonatomic, strong) UILabel *outputLabel;
@property (nonatomic, strong) UITextField *outputTextField;

@property (nonatomic, strong) NSMutableArray *numbersLabelsArray;

- (void)toggleControls:(UISegmentedControl *)sender;

@end
