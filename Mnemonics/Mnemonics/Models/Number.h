//
//  Number.h
//  Mnemonics
//
//  Created by X on 25/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Number : NSManagedObject

@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * letters;
@property (nonatomic, retain) NSString * section;
@property (nonatomic, retain) NSString * value;
@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSNumber * index;

@end
