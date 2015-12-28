//
//  AIZNumberDetailsViewController.h
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIZNumberEditViewController.h"

@protocol AIZNumberDetailsViewDelegate <NSObject>

- (void)saveNumber;

@end

@interface AIZNumberDetailsViewController : UIViewController <AIZNumberEditViewDelegate>

@property (strong, nonatomic) id detailItem;
@property (nonatomic, strong) id<AIZNumberDetailsViewDelegate> delegate;
@property (nonatomic, strong) AIZNumberEditViewController *editedVC;

@property (strong, nonatomic) UILabel *numberLabel;
@property (strong, nonatomic) UILabel *lettersLabel;
@property (strong, nonatomic) UILabel *wordLabel;

- (void)editNumber;
- (void)configureView;

@end
