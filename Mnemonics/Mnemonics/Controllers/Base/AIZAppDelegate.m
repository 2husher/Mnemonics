//
//  AIZAppDelegate.m
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZNumbersMasterViewController.h"
#import "AIZInfoViewController.h"
#import "AIZConvertorsViewController.h"
#import "AIZAllGamesViewController.h"

@interface AIZAppDelegate ()

@property (nonatomic, strong) UINavigationController *numbersNavC;
@property (nonatomic, strong) UINavigationController *allGamesNavC;
@property (nonatomic, strong) UINavigationController *convertorsNavC;
@property (nonatomic, strong) UINavigationController *infoNavC;

@end

@implementation AIZAppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    self.tabBarController = [[UITabBarController alloc] init];

    [self addNumbersTab];
    [self addGamesTab];
    [self addConvertorsTab];
    [self addInfoTab];

    self.tabBarController.viewControllers = @[self.numbersNavC,
                                              self.allGamesNavC,
                                              self.convertorsNavC,
                                              self.infoNavC];
    self.window.rootViewController = self.tabBarController;

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)addNumbersTab
{
    AIZNumbersMasterViewController *numbersMasterVC =
        [[AIZNumbersMasterViewController alloc] initWithNibName:nil
                                                         bundle:nil];
    self.numbersNavC = [[UINavigationController alloc]
                        initWithRootViewController:numbersMasterVC];

    numbersMasterVC.managedObjectContext = self.managedObjectContext;
}

-(void)addGamesTab
{
    AIZAllGamesViewController *allGamesVC =
        [[AIZAllGamesViewController alloc] initWithNibName:nil
                                                    bundle:nil];
    self.allGamesNavC = [[UINavigationController alloc]
                         initWithRootViewController:allGamesVC];
}

- (void)addConvertorsTab
{
    AIZConvertorsViewController *convertorsVC =
        [[AIZConvertorsViewController alloc] initWithNibName:nil
                                                      bundle:nil];
    self.convertorsNavC = [[UINavigationController alloc]
                           initWithRootViewController:convertorsVC];
}

- (void)addInfoTab
{
    AIZInfoViewController *infoVC =
        [[AIZInfoViewController alloc] initWithNibName:nil
                                                bundle:nil];
    self.infoNavC = [[UINavigationController alloc]
                     initWithRootViewController:infoVC];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory
{
    // The directory the application uses to store the Core Data store file. This code uses a directory named "alex.izotov.Mnemonics" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel
{
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Mnemonics"
                                              withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Mnemonics.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeURL
                                                         options:nil
                                                           error:&error])
    {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN"
                                    code:9999
                                userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext
{
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator)
    {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        else
        {
#ifdef DEBUG
            NSLog(@"Context saved successfully!");
#endif
        }
    }
}

@end
