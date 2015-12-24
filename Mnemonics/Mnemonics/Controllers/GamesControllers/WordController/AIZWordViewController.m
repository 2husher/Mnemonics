//
//  AIZWordViewController.m
//  Mnemonics
//
//  Created by X on 23/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZWordViewController.h"
#import "AIZWordViewController+UIControls.h"
#import "AIZWordViewController+UIConstraints.h"

@interface AIZWordViewController ()

@property (nonatomic, strong) NSString *word;

@end

@implementation AIZWordViewController

- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor blueColor];
    self.view = view;
}

- (instancetype)initWithNumber:(NSManagedObject *)number
{
    self = [super init];
    if (self)
    {
        self.word = [number valueForKey:@"word"];
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

    [self addNumberLabelWithTitle:self.word];
    [self addWordLabelConstraints];
}

@end
