//
//  MovieDetailViewController.m
//  MovieTour
//
//  Created by MM - 03 on 05/11/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import "MovieDetailViewController.h"
#define SECTION_IN_TABLE 1;
#define ROWS_IN_TABLE 2;


@interface MovieDetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *detailsTableView;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailsTableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    self.detailsTableView.delegate = self;
    self.detailsTableView.dataSource = self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//table view delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *dummyCell;
    //If Video Player Cell Number
    if(indexPath.row == 0){
        VideoPlayerViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerView"];
        if (cell == nil) {
            NSArray *parts = [[NSBundle mainBundle] loadNibNamed:@"PlayerView" owner:nil options:nil];
            cell = (VideoPlayerViewCell *)[parts objectAtIndex:0];
            [cell setTheVideoIdForYoutubeView:@"rJePvN_4T_E"];
        }
        return cell;
    }
    //If Movie Details Cell Number
    if(indexPath.row == 1){
         MovieDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieDetails"];
        if (cell == nil) {
            NSArray *parts = [[NSBundle mainBundle] loadNibNamed:@"MovieDetails" owner:nil options:nil];
            cell = (MovieDetailCell *)[parts objectAtIndex:0];
        }
        return cell;
    }
   
    return dummyCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return self.detailsTableView.frame.size.height * 0.40;
    }
    if(indexPath.row == 1){
        return self.detailsTableView.frame.size.height * 0.60;
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ROWS_IN_TABLE;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return SECTION_IN_TABLE;
}

@end
