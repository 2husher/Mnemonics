//
//  AIZGameStore.m
//  Mnemonics
//
//  Created by X on 24/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZGameStore.h"

//NSString * const AIZGettingType = @"GettingType";
//NSString * const AIZFromValue   = @"FromValue";
//NSString * const AIZToValue     = @"ToValue";

#warning "types for asc, des, rand"

@interface AIZGameStore ()

@property (nonatomic, strong) NSMutableArray *privateItems;
@property (nonatomic, strong) NSString *order;
@property (nonatomic) NSUInteger fromIndex;
@property (nonatomic) NSUInteger toIndex;
@property (nonatomic) NSUInteger nextItemIndex;

@end

@implementation AIZGameStore

+ (instancetype)sharedStore
{
    static AIZGameStore *sharedStore = nil;

    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        self.privateItems = [[NSMutableArray alloc] init];

#warning "always erase settings with defaults?"
    }
    return self;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[AIZGameStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (NSNumber *)nextItem
{
    if (self.nextItemIndex >= [self.privateItems count])
    {
#warning "check if game loading"
        [self loadGame];
    }
    NSNumber *nextItem = self.privateItems[self.nextItemIndex];
    self.nextItemIndex++;
    return nextItem;
}

- (void)updateSettingsFromValue:(NSUInteger)from
                        toValue:(NSUInteger)to
                       withOrder:(NSString *)order
{
    self.fromIndex = from;
    self.toIndex = to;
    self.order = order;
    [self loadGame];
}

- (void)loadGame
{
    NSLog(@"Loading game...");

    [self.privateItems removeAllObjects];
    self.nextItemIndex = 1;

    NSUInteger from = self.fromIndex;
    NSUInteger to   = self.toIndex;
#warning  "add validation to form"
    if (from <= to)
    {
        for (NSUInteger i = from; i <= to; i++)
        {
            [self.privateItems addObject:[NSNumber numberWithInteger:i]];
        }
    }
    else if (from > to)
    {
        for (NSUInteger i = from; i <= to; i--)
        {
            [self.privateItems addObject:[NSNumber numberWithInteger:i]];
        }
    }
    if ([self.order isEqualToString:@"Random"])
    {
        NSUInteger count = [self.privateItems count];
        for (NSUInteger i = 0; i < count - 1; ++i) {
            NSInteger remainingCount = count - i;
            NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
            [self.privateItems exchangeObjectAtIndex:i
                                   withObjectAtIndex:exchangeIndex];
        }
    }

    NSLog(@"array %@", self.privateItems);
}

@end



















