//
//  MovieDetailCell.m
//  MovieTour
//
//  Created by Praful on 30/11/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import "MovieDetailCell.h"

@implementation MovieDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.movieDetailsSegmentControl addTarget:self
                         action:@selector(movieSegmentChanged:)
               forControlEvents:UIControlEventValueChanged];
    
    //Set the plot view as default first view
    [self removeAllSubviewFromCurrentView];
    self.plotView = (PlotView *)[[[NSBundle mainBundle] loadNibNamed:@"PlotTableView" owner:self options:nil]
                                      firstObject];
    self.plotView.frame = CGRectMake(self.plotView.bounds.origin.x
                                ,self.movieDetailsSegmentControl.frame.size.height + self.topSpaceForSegmentControl.constant + 10
                                ,self.plotView.bounds.size.width
                                ,self.plotView.bounds.size.height);
    [self.plotView setArrayOfPlots:[NSMutableArray arrayWithObjects:@"object 1", @"object 2", nil]];
    [self insertSubview:self.plotView aboveSubview:self.movieDetailsSegmentControl];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.plotView.plotsTableView reloadData];
    });
    
}
- (NSManagedObjectContext *)managedObjectContext {
    return [[CoreDataManager CoreDataManagerSharedInstance] managedObjectContext];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)movieSegmentChanged:(id)sender{
    if(self.movieDetailsSegmentControl.selectedSegmentIndex == 0){
        self.plotView.hidden = NO;
    }
    else{
        self.plotView.hidden = YES;
    }
}
-(void)removeAllSubviewFromCurrentView{
    NSMutableArray  *subviews = (NSMutableArray *)self.subviews;
    for (UIView *view in subviews) {
        if([view isKindOfClass:[UISegmentedControl class]]){
            [view removeFromSuperview];
        }
    }
}

@end
