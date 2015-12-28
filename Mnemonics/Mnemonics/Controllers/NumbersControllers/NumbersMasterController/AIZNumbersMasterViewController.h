//
//  AIZNumbersMasterViewController.h
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AIZNumberDetailsViewController.h"

@interface AIZNumbersMasterViewController : UIViewController <NSFetchedResultsControllerDelegate, AIZNumberDetailsViewDelegate>

@property (nonatomic, strong) AIZNumberDetailsViewController *detailViewController;
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)configureCell:(UITableViewCell *)cell
          atIndexPath:(NSIndexPath *)indexPath;

@end
