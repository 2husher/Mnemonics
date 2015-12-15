//
//  Number.h
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Number : NSManagedObject

@property (nonatomic, retain) NSNumber * value;
@property (nonatomic, retain) NSString * abbriviation;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * word;

@end
