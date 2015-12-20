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
        self.privateNumbers =
        @[@[@"Н", @"Г", @"Д", @"К", @"Ч", @"П", @"Ш", @"С", @"В", @"Р"],
          @[@"М", @"Ж", @"Т", @"Х", @"Щ", @"Б", @"Л", @"З", @"Ф", @"Ц"]];
    }
    return self;
}

- (NSArray *)getLettersForDigits:(NSString *)digitsStr
{
    NSMutableArray *letters = [[NSMutableArray alloc] init];
    NSArray *firstLetters  = self.privateNumbers[0];
    NSArray *secondLetters = self.privateNumbers[1];
    if (digitsStr.length == 1 || digitsStr.length == 2)
    {
        NSInteger number = [digitsStr integerValue];
        if (number < 10)
        {
            [letters addObject:@[firstLetters[number]]];
            [letters addObject:@[secondLetters[number]]];
        }
        else if (number > 9 && number < 100)
        {
            NSInteger firstDigit  = number / 10;
            NSInteger secondDigit = number % 10;
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
        NSUInteger index = [self.privateNumbers[0] indexOfObject:ch];
        if (index == NSNotFound)
        {
            index = [self.privateNumbers[1] indexOfObject:ch];
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

@end
