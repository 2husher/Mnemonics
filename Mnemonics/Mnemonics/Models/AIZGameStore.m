//
//  AIZGameStore.m
//  Mnemonics
//
//  Created by X on 24/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZGameStore.h"
#import "AIZSampleNumbersStore.h"

//NSString * const AIZGettingType = @"GettingType";
//NSString * const AIZFromValue   = @"FromValue";
//NSString * const AIZToValue     = @"ToValue";

#warning "types for asc, des, rand"

//  @"00", @"01", @"02"
//  @30,   @31,   @32
//  0,     1,     2

@interface AIZGameStore ()

@property (nonatomic, copy) NSMutableArray *privateOrdinals;
@property (nonatomic, copy) NSMutableDictionary *config;
@property (nonatomic) NSUInteger nextOrdinalIndex;

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
        self.privateOrdinals = [[NSMutableArray alloc] init];
        self.config = [@{@"fromOrdinal" : @0,
                         @"toOrdinal" : @1,
                         @"order" : @"" } mutableCopy];

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

- (NSNumber *)nextOrdinal
{
    if (self.nextOrdinalIndex >= [self.privateOrdinals count])
    {
#warning "check if game loading"
        [self loadGame];
    }
    NSNumber *nextOrdinal = self.privateOrdinals[self.nextOrdinalIndex];
    self.nextOrdinalIndex++;
    return nextOrdinal;
}

- (void)updateSettingsFromValue:(NSString *)fromValue
                        toValue:(NSString *)toValue
                      withOrder:(NSString *)order
{
    self.config[@"fromOrdinal"] = [[AIZSampleNumbersStore sharedStore]
                                   ordinalByValue:fromValue];
    self.config[@"toOrdinal"] = [[AIZSampleNumbersStore sharedStore]
                                 ordinalByValue:toValue];
    self.config[@"order"] = order;//[NSString stringWithString:order];
    [self loadGame];
}

- (void)loadGame
{
    NSLog(@"Loading game...");

    [self.privateOrdinals removeAllObjects];
    self.nextOrdinalIndex = 0;
    NSUInteger from = [self.config[@"fromOrdinal"] integerValue];
    NSUInteger to   = [self.config[@"toOrdinal"] integerValue];

#warning  "add validation to form"
    if (from <= to)
    {
        for (NSUInteger i = from; i <= to; i++)
        {
            NSNumber *ordinal = [NSNumber numberWithInteger:i];
            [self.privateOrdinals addObject:ordinal];
        }
    }
    else if (from > to)
    {
        for (NSUInteger i = from; i <= to; i--)
        {
            NSNumber *ordinal = [NSNumber numberWithInteger:i];
            [self.privateOrdinals addObject:ordinal];
        }
    }
    if ([self.config[@"order"] isEqualToString:@"Random"])
    {
        NSUInteger count = [self.privateOrdinals count];
        for (NSUInteger i = 0; i < count - 1; ++i) {
            NSInteger remainingCount = count - i;
            NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
            [self.privateOrdinals exchangeObjectAtIndex:i
                                      withObjectAtIndex:exchangeIndex];
        }
    }

    NSLog(@"array %@", self.privateOrdinals);
}

- (NSManagedObject *)nextObject
{
    NSNumber *ordinal = [[AIZGameStore sharedStore] nextOrdinal];
    NSManagedObjectContext *context = [self managedObjectContext];

    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescr =[NSEntityDescription
                                       entityForName:@"Number"
                                       inManagedObjectContext:context];
    request.entity = entityDescr;

    NSPredicate *pred = [NSPredicate
                         predicateWithFormat:@"(ordinal = %@)", ordinal];
    request.predicate = pred;

    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    if (objects == nil)
    {
        // handle error
    }
    return [objects lastObject];
}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

@end
