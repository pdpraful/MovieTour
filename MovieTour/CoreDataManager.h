//
//  CoreDataWrapper.h
//  MovieTour
//
//  Created by MM - 03 on 22/10/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"
#import "Global.h"
#import "AFNetworking.h"

@interface CoreDataManager : NSObject

+ (id ) alloc;
- (id) init;
+ (CoreDataManager *) CoreDataManagerSharedInstance;


//CoreData Setup Method
- (NSManagedObjectContext *)managedObjectContext;

//CoreData CRUD for Movie
-(BOOL)addMovieFromMovieName:(NSString *)movieName;
-(NSMutableArray *)getAllMoviesArray;
@end
