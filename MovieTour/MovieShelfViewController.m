//
//  MovieShelfViewController.m
//  MovieTour
//
//  Created by MM - 03 on 22/10/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import "MovieShelfViewController.h"
#import "MovieShelfFlowLayout.h"
#import "CoreData/CoreData.h"

@interface MovieShelfViewController ()

@end

@implementation MovieShelfViewController
@synthesize moviesList;

//core data methods
- (NSManagedObjectContext *)managedObjectContext {
    return [[CoreDataManager CoreDataManagerSharedInstance] managedObjectContext];
}

- (void)viewDidLoad {
    self.title = @"MovieShelf";
    [super viewDidLoad];
    
    [self addMovieNames];
    
    self.movieShelfCollectionView.delegate = self;
    
    [self.movieShelfCollectionView registerClass:[MovieShelfCollectionViewCell class]
                      forCellWithReuseIdentifier:[MovieShelfCollectionViewCell reuseId]];
    self.movieShelfCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.movieShelfCollectionView.collectionViewLayout = [[MovieShelfFlowLayout alloc] init];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewDidAppear:(BOOL)animated{

    // Fetch the movies from persistent data store
    self.moviesList = [[CoreDataManager CoreDataManagerSharedInstance] getAllMoviesArray];
    [self.movieShelfCollectionView reloadData];
}

-(void)addMovieNames{
    [[CoreDataManager CoreDataManagerSharedInstance] addMovieFromMovieName:@"Inferno"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [self.moviesList count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MovieShelfCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:[MovieShelfCollectionViewCell reuseId] forIndexPath:indexPath];
    [cell setBackgroundImageWithId:@""];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.navigationController.navigationBarHidden = NO;

    MovieDetailViewController *movieDetailViewControl =
    [self.storyboard instantiateViewControllerWithIdentifier:@"MovieDetailViewController_id"];
    [self.navigationController pushViewController:movieDetailViewControl animated:YES];
}



@end
