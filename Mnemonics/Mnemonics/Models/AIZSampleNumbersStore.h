//
//  AIZSampleNumbersStore.h
//  Mnemonics
//
//  Created by X on 21/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIZSampleNumbersStore : NSObject

+ (instancetype)sharedStore;

- (NSArray *)allNumbers;

- (NSNumber *)ordinalByValue:(NSString *)value;

@end
