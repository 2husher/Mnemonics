//
//  AIZNumbersMasterViewController.h
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class AIZNumberDetailsViewController;

@interface AIZNumbersMasterViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) AIZNumberDetailsViewController *detailViewController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)configureCell:(UITableViewCell *)cell
          atIndexPath:(NSIndexPath *)indexPath;

@end
