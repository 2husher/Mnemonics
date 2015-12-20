//
//  AIZNumbersMasterViewController.m
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumbersMasterViewController.h"
#import "AIZNumbersMasterViewController+TableView.h"

@interface AIZNumbersMasterViewController () 


@property (nonatomic, strong) NSArray *numbers;

@end


@implementation AIZNumbersMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Master", @"Master");

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initNumbers];
    [self addMyTableView];
}

- (void)initNumbers
{
    NSManagedObjectContext *context =
        [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity =
        [[self.fetchedResultsController fetchRequest] entity];
    self.numbers = [self.fetchedResultsController fetchedObjects];
    if ([self.numbers count] == 0)
    {
        NSLog(@"Set 100 of numbers");
        for (NSInteger num = 0; num < 100; num++)
        {
            NSManagedObject *newManagedObject =
            [NSEntityDescription insertNewObjectForEntityForName:[entity name]
                                          inManagedObjectContext:context];
            [newManagedObject setValue:[NSNumber numberWithInteger:num]
                                forKey:@"value"];
            NSError *error = nil;
            if (![context save:&error])
            {
                NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
            }
        }
        self.fetchedResultsController = nil;
    }
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Number"];
    [fetchRequest setFetchBatchSize:20];
    NSSortDescriptor *sortDescriptor =
        [[NSSortDescriptor alloc] initWithKey:@"value"
                                    ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];

    [fetchRequest setSortDescriptors:sortDescriptors];

    NSFetchedResultsController *aFetchedResultsController =
        [[NSFetchedResultsController alloc]
         initWithFetchRequest:fetchRequest
         managedObjectContext:self.managedObjectContext
         sectionNameKeyPath:nil
         cacheName:nil];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;

    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error])
    {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    return _fetchedResultsController;
}

- (void)configureCell:(UITableViewCell *)cell
          atIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *object = [self.fetchedResultsController
                               objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:@"value"] description];
}

@end
