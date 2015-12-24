//
//  AIZNumberViewController.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberViewController.h"
#import "AIZNumberViewController+UIControls.h"
#import "AIZNumberViewController+UIConstraints.h"

@interface AIZNumberViewController ()

@property (nonatomic, strong) NSString *value;

@end

@implementation AIZNumberViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor yellowColor];
    self.view = view;
}

- (instancetype)initWithNumber:(NSManagedObject *)number
{
    self = [super init];
    if (self)
    {
        self.value = [number valueForKey:@"value"];
    }
    return self;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"NSManagedObject is needed"
                                   reason:@"Use initWithNumber: instead"
                                 userInfo:nil];
    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addNumberLabelWithTitle:self.value];
    [self addNumberLabelConstraints];
}

@end
