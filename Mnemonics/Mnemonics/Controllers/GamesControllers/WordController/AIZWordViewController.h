//
//  AIZWordViewController.h
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AIZWordViewController : UIViewController

@property (strong, nonatomic) UILabel *wordLabel;

- (instancetype)initWithNumber:(NSManagedObject *)number;

@end
