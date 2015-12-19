//
//  AIZNumbersStore.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumbersStore.h"

@interface AIZNumbersStore ()

@property (nonatomic) NSArray *privateNumbers;

@end

@implementation AIZNumbersStore

+ (instancetype)sharedStore
{
    static AIZNumbersStore *sharedStore = nil;

    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[AIZNumbersStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        self.privateNumbers = @[@[@"H", @"М"],
                                @[@"Г", @"Ж"],
                                @[@"Д", @"Т"],
                                @[@"К", @"Х"],
                                @[@"Ч", @"Щ"],
                                @[@"П", @"Б"],
                                @[@"Ш", @"Л"],
                                @[@"С", @"З"],
                                @[@"В", @"Ф"],
                                @[@"Р", @"Ц"]
                                ];
    }
    return self;
}

@end
