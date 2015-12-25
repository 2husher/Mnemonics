//
//  AIZSettingsViewController.h
//  Mnemonics
//
//  Created by X on 24/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AIZSettingsViewController;

@protocol AIZSettingsDelegate <NSObject>
- (void)saveSettings: (AIZSettingsViewController *)sender;
@end

@interface AIZSettingsViewController : UIViewController

@property (nonatomic, weak) id <AIZSettingsDelegate> delegate;
@property (nonatomic, strong) id settingsItem;

@property (nonatomic, strong) UILabel *fromValueLabel;
@property (nonatomic, strong) UILabel *toValueLabel;

@property (nonatomic, strong) UITextField *fromValueTextField;
@property (nonatomic, strong) UITextField *toValueTextField;

@property (nonatomic, strong) UISegmentedControl *gettingType;

@property (nonatomic, strong) UITextView *currentSettingTextView;

@end
