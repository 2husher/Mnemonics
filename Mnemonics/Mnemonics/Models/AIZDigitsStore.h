//
//  AIZDigitsStore.h
//  Mnemonics
//
//  Created by X on 20/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIZDigitsStore : NSObject

+ (instancetype)sharedStore;

- (NSArray *)getLettersForDigits:(NSString *)digitsStr;
- (NSArray *)getDigitsForLetters:(NSString *)lettersStr;
- (BOOL)checkWord:(NSString *)word forLetters:(NSString *)letters;

@end
