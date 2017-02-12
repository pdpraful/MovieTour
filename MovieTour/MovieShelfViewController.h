//
//  MovieShelfViewController.h
//  MovieTour
//
//  Created by MM - 03 on 22/10/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieShelfCollectionViewCell.h"
#import "MovieDetailViewController.h"
#import "Global.h"
#import "CoreDataManager.h"

@interface MovieShelfViewController : UIViewController <UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *movieShelfCollectionView;
@property (strong, nonatomic) NSMutableArray *moviesList;
@end
