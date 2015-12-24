//
//  AIZSampleNumbersStore.m
//  Mnemonics
//
//  Created by X on 21/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSampleNumbersStore.h"

@interface AIZSampleNumbersStore ()

@property (nonatomic) NSArray *privateNumbers;

@end

@implementation AIZSampleNumbersStore

+ (instancetype)sharedStore
{
    static AIZSampleNumbersStore *sharedStore = nil;

    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[AIZSampleNumbersStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        self.privateNumbers =
        @[ @{ @"section":@"0", @"index":@1, @"value":@"0", @"letters":@"М", @"word":@"ЯМА" },
           @{ @"section":@"0", @"index":@2, @"value":@"1", @"letters":@"Ж", @"word":@"ЕЖ" },
           @{ @"section":@"0", @"index":@3, @"value":@"2", @"letters":@"Д", @"word":@"ЯД" },
           @{ @"section":@"0", @"index":@4, @"value":@"3", @"letters":@"Х", @"word":@"УХА" },
           @{ @"section":@"0", @"index":@5, @"value":@"4", @"letters":@"Ч", @"word":@"ЧАЙ" },
           @{ @"section":@"0", @"index":@6, @"value":@"5", @"letters":@"Б", @"word":@"ОБОИ" },
           @{ @"section":@"0", @"index":@7, @"value":@"6", @"letters":@"Ш", @"word":@"ШЕЯ" },
           @{ @"section":@"0", @"index":@8, @"value":@"7", @"letters":@"С", @"word":@"УСЫ" },
           @{ @"section":@"0", @"index":@9, @"value":@"8", @"letters":@"В", @"word":@"ИВА" },
           @{ @"section":@"0", @"index":@10, @"value":@"9", @"letters":@"Ц", @"word":@"ЯЙЦО" },

           @{ @"section":@"10", @"index":@11, @"value":@"10", @"letters":@"ГР", @"word":@"ГОРА" },
           @{ @"section":@"10", @"index":@12, @"value":@"11", @"letters":@"ГГ", @"word":@"ГАГА" },
           @{ @"section":@"10", @"index":@13, @"value":@"12", @"letters":@"ГТ", @"word":@"АГАТ" },
           @{ @"section":@"10", @"index":@14, @"value":@"13", @"letters":@"ЖК", @"word":@"ЖУК" },
           @{ @"section":@"10", @"index":@15, @"value":@"14", @"letters":@"ГЩ", @"word":@"ГУЩА" },
           @{ @"section":@"10", @"index":@16, @"value":@"15", @"letters":@"ГБ", @"word":@"ГУБЫ" },
           @{ @"section":@"10", @"index":@17, @"value":@"16", @"letters":@"ГЛ", @"word":@"ИГЛА" },
           @{ @"section":@"10", @"index":@18, @"value":@"17", @"letters":@"ГС", @"word":@"ГУСЬ" },
           @{ @"section":@"10", @"index":@19, @"value":@"18", @"letters":@"ГВ", @"word":@"ГАВАИ" },
           @{ @"section":@"10", @"index":@20, @"value":@"19", @"letters":@"ГР", @"word":@"ГОРА" },

           @{ @"section":@"EXT", @"index":@21, @"value":@"00", @"letters":@"МН", @"word":@"МИНА" },
           @{ @"section":@"EXT", @"index":@22, @"value":@"01", @"letters":@"НГ", @"word":@"НОГА" },
           @{ @"section":@"EXT", @"index":@23, @"value":@"02", @"letters":@"НТ", @"word":@"НОТА" },
           @{ @"section":@"EXT", @"index":@24, @"value":@"03", @"letters":@"МХ", @"word":@"МУХА" },
           @{ @"section":@"EXT", @"index":@25, @"value":@"04", @"letters":@"МЧ", @"word":@"МЕЧ" },
           @{ @"section":@"EXT", @"index":@26, @"value":@"05", @"letters":@"НБ", @"word":@"НЕБО" },
           @{ @"section":@"EXT", @"index":@27, @"value":@"06", @"letters":@"МЛ", @"word":@"МЕЛ" },
           @{ @"section":@"EXT", @"index":@28, @"value":@"07", @"letters":@"НС", @"word":@"НОС" },
           @{ @"section":@"EXT", @"index":@29, @"value":@"08", @"letters":@"МФ", @"word":@"МАФИЯ" },
           @{ @"section":@"EXT", @"index":@30, @"value":@"09", @"letters":@"МР", @"word":@"МОРЕ" }
           ];
    }
    return self;
}

- (NSArray *)allNumbers
{
    return self.privateNumbers;
}

- (NSUInteger)indexByValue:(NSString *)value
{
    NSUInteger len = [self.privateNumbers count];
    for (NSUInteger i = 0; i < len; i++)
    {
        NSString *myValue = self.privateNumbers[i][@"value"];
        if ([myValue isEqualToString:value])
        {
            return [self.privateNumbers[i][@"index"] integerValue];
        }
    }
    return 0;
}

@end
