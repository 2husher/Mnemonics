//
//  AIZNumberEditViewController.h
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIZNumberEditViewController : UIViewController

@property (strong, nonatomic) id editedItem;

@property (strong, nonatomic) UILabel *numberLabel;
@property (strong, nonatomic) UILabel *lettersLabel;
@property (nonatomic, strong) UISegmentedControl *lettersSegmentedControl;

- (void)toggleControls:(UISegmentedControl *)sender;
- (void)cancel;
- (void)save;

@end


