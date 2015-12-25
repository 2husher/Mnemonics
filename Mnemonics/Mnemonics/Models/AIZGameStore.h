//
//  AIZGameStore.h
//  Mnemonics
//
//  Created by X on 24/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AIZGameStore : NSObject

+ (instancetype)sharedStore;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (NSManagedObject *)nextObject;
- (void)updateSettingsFromValue:(NSString *)fromValue
                        toValue:(NSString *)toValue
                      withOrder:(NSString *)order;

@end
