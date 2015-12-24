//
//  AIZGameStore.h
//  Mnemonics
//
//  Created by X on 24/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIZGameStore : NSObject

+ (instancetype)sharedStore;

- (NSNumber *)nextItem;
- (void)updateSettingsFromValue:(NSUInteger)from
                        toValue:(NSUInteger)to
                      withOrder:(NSString *)order;

@end
