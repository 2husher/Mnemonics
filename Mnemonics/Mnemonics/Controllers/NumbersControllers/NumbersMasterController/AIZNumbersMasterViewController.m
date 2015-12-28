//
//  AIZNumbersMasterViewController.m
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumbersMasterViewController.h"
#import "AIZNumbersMasterViewController+TableView.h"
#import "AIZSampleNumbersStore.h"
#import "AIZAppDelegate.h"

@interface AIZNumbersMasterViewController ()

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

    self.view.backgroundColor = [UIColor whiteColor];

    [self initNumbers];
    [self addMyTableView];
}

- (void)initNumbers
{
    NSArray *numbers = [self.fetchedResultsController fetchedObjects];
    if ([numbers count] == 0)
    {
        [self loadSampleNumbers];
    }
}

- (void)loadSampleNumbers
{
#warning "move all core data to appdelegate"
    NSArray *sampleNumbers = [[AIZSampleNumbersStore sharedStore] allNumbers];

    NSManagedObjectContext *context =
        [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity =
        [[self.fetchedResultsController fetchRequest] entity];
    NSUInteger len = [sampleNumbers count];
    for (NSUInteger num = 0; num < len; num++)
    {
        NSManagedObject *newManagedObject =
        [NSEntityDescription insertNewObjectForEntityForName:[entity name]
                                      inManagedObjectContext:context];
        [newManagedObject setValue:sampleNumbers[num][@"section"]
                            forKey:@"section"];
        [newManagedObject setValue:sampleNumbers[num][@"value"]
                            forKey:@"value"];
        [newManagedObject setValue:sampleNumbers[num][@"letters"]
                            forKey:@"letters"];
        [newManagedObject setValue:sampleNumbers[num][@"word"]
                            forKey:@"word"];
        [newManagedObject setValue:sampleNumbers[num][@"ordinal"]
                            forKey:@"ordinal"];
        NSError *error = nil;
        if (![context save:&error])
        {
            NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
        }
        self.fetchedResultsController = nil;
    }
}

- (void)saveNumber
{
    AIZAppDelegate *delegate =
        (AIZAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate saveContext];
}


- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"Number"];
    [fetchRequest setFetchBatchSize:20];
    NSSortDescriptor *sectionSort =
        [[NSSortDescriptor alloc] initWithKey:@"section"
                                    ascending:YES];
    NSSortDescriptor *valueSort =
        [[NSSortDescriptor alloc] initWithKey:@"value"
                                    ascending:YES];
    NSArray *sortDescriptors = @[sectionSort, valueSort];

    [fetchRequest setSortDescriptors:sortDescriptors];

    NSFetchedResultsController *aFetchedResultsController =
        [[NSFetchedResultsController alloc]
         initWithFetchRequest:fetchRequest
         managedObjectContext:self.managedObjectContext
         sectionNameKeyPath:@"section"
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
