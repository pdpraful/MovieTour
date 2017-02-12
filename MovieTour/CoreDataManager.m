//
//  CoreDataWrapper.m
//  MovieTour
//
//  Created by MM - 03 on 22/10/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager



CoreDataManager *CoreDataManagerSharedInstance = nil;

+ (id ) alloc
{
    @synchronized([CoreDataManager class])
    {
        NSAssert(CoreDataManagerSharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
        CoreDataManagerSharedInstance = [super alloc];
        return CoreDataManagerSharedInstance;
    }
    return nil;
}
- (id) init
{
    self = [super init];
    if (self != nil)
    {
        //Some setup
        
    }
    return self;
}
+ (CoreDataManager *) CoreDataManagerSharedInstance
{
    @synchronized ([CoreDataManager class])
    {
        if (!CoreDataManagerSharedInstance)
        {
            CoreDataManagerSharedInstance = [[CoreDataManager alloc] init];
        }
        return CoreDataManagerSharedInstance;
    }
    return nil;
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

//CRUD for movies


//Create a new movie
-(BOOL)addMovieFromMovieName:(NSString *)movieName{
    
    BOOL result;
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newMovie = [NSEntityDescription insertNewObjectForEntityForName:ENTITY_MOVIE_NAME
                                                              inManagedObjectContext:context];
    [newMovie setValue:[NSNumber numberWithInt:1] forKey:MOVIE_ATTR_ID];
    [newMovie setValue:movieName forKey:MOVIE_ATTR_NAME];
    
    NSError *error = nil;
    // Save the object to persistent store
    result = YES;
    if (![context save:&error]) {
        result = NO;
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    return  result;
}
-(NSMutableArray *)getAllMoviesArray{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:ENTITY_MOVIE_NAME];
    return [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
}



//CRUD for Movies

//creata a new plot
-(BOOL)addPlotForMovie:(NSString *)movieName{
    
    BOOL result;
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newMovie = [NSEntityDescription insertNewObjectForEntityForName:ENTITY_MOVIE_NAME
                                                              inManagedObjectContext:context];
    [newMovie setValue:[NSNumber numberWithInt:1] forKey:MOVIE_ATTR_ID];
    [newMovie setValue:movieName forKey:MOVIE_ATTR_NAME];
    
    NSError *error = nil;
    // Save the object to persistent store
    result = YES;
    if (![context save:&error]) {
        result = NO;
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    return  result;
}




@end
