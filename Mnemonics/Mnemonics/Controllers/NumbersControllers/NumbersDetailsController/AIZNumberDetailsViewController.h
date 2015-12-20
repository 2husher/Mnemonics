//
//  AIZNumberDetailsViewController.h
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIZNumberDetailsViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) UILabel *numberLabel;
@property (strong, nonatomic) UILabel *lettersLabel;
@property (strong, nonatomic) UILabel *wordLabel;

@end
