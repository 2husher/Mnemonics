//
//  AIZDigitsStore.m
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDigitsStore.h"

@interface AIZDigitsStore ()

@property (nonatomic) NSArray *privateDigits;

@end

@implementation AIZDigitsStore

+ (instancetype)sharedStore
{
    static AIZDigitsStore *sharedStore = nil;

    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[AIZDigitsStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        self.privateDigits =
        @[@[@"Н", @"Г", @"Д", @"К", @"Ч", @"П", @"Ш", @"С", @"В", @"Р"],
          @[@"М", @"Ж", @"Т", @"Х", @"Щ", @"Б", @"Л", @"З", @"Ф", @"Ц"]];
    }
    return self;
}

- (NSArray *)getLettersForDigits:(NSString *)digitsStr
{
#warning "Where is to implement validation for digits in str, not letters"
    NSMutableArray *letters = [[NSMutableArray alloc] init];
    NSArray *firstLetters  = self.privateDigits[0];
    NSArray *secondLetters = self.privateDigits[1];
    if (digitsStr.length == 1)
    {
        NSInteger onlyDigit  = [digitsStr integerValue];

        [letters addObject:@[firstLetters[onlyDigit]]];
        [letters addObject:@[secondLetters[onlyDigit]]];
    }
    else if (digitsStr.length == 2)
    {
        NSString *firstChar  = [digitsStr
                                substringWithRange:NSMakeRange(0, 1)];
        NSString *secondChar = [digitsStr
                                substringWithRange:NSMakeRange(1, 1)];

        NSInteger firstDigit  = [firstChar integerValue];
        NSInteger secondDigit = [secondChar integerValue];
        NSArray *firstPair = @[firstLetters[firstDigit],
                               secondLetters[firstDigit]];
        NSArray *secondPair = @[firstLetters[secondDigit],
                               secondLetters[secondDigit]];
        for (int i = 0; i < 2; i++)
        {
            for (int j = 0; j < 2; j++)
            {
                NSArray *lettersPair = @[firstPair[i],
                                         secondPair[j]];
                [letters addObject:lettersPair];
            }
        }
    }
    else
    {
        @throw [NSException exceptionWithName:@"Letters for digits"
                                       reason:@"Digits length must be one or two"
                                     userInfo:nil];
    }
    return letters;
}

- (NSArray *)getDigitsForLetters:(NSString *)lettersStr
{
    NSUInteger len = lettersStr.length;
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < len; i++)
    {
        NSString *ch = [[lettersStr substringWithRange:NSMakeRange(i, 1)]
                        uppercaseString];
        NSUInteger index = [self.privateDigits[0] indexOfObject:ch];
        if (index == NSNotFound)
        {
            index = [self.privateDigits[1] indexOfObject:ch];
            if (index == NSNotFound)
            {
                continue;
            }
            else
            {
                [output addObject:[NSString
                                   stringWithFormat:@"%lu", index]];
            }
        }
        else
        {
            [output addObject:[NSString
                               stringWithFormat:@"%lu", index]];
        }
    }
    return output;
}

- (BOOL)checkWord:(NSString *)word forLetters:(NSString *)letters
{
    NSMutableSet *set = [NSMutableSet setWithArray:self.privateDigits[0]];
    [set addObjectsFromArray:self.privateDigits[1]];
    NSUInteger len = [word length];
    NSMutableString *outStr = [[NSMutableString alloc] init];
    for (NSUInteger i = 0; i < len; i++)
    {
        NSString *ch = [[word substringWithRange:NSMakeRange(i, 1)]
                        uppercaseString];
        if ([set containsObject:ch])
        {
            [outStr appendString:ch];
        }
    }
    return [outStr isEqualToString:letters];
}

@end
