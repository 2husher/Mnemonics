//
//  AIZNumberEditViewController.h
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AIZNumberEditViewDelegate <NSObject>

- (void)updateView;

@end

@interface AIZNumberEditViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) id editedItem;
@property (strong, nonatomic) id<AIZNumberEditViewDelegate>delegate;

@property (strong, nonatomic) UILabel *numberLabel;
@property (strong, nonatomic) UILabel *lettersLabel;
@property (nonatomic, strong) UISegmentedControl *lettersSegmentedControl;
@property (strong, nonatomic) UILabel *wordLabel;
@property (strong, nonatomic) UITextField *wordTextField;

- (void)toggleControls:(UISegmentedControl *)sender;
- (void)cancel;
- (void)save;

@end


