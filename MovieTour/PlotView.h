//
//  PlotView.h
//  MovieTour
//
//  Created by Praful on 03/12/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlotTableViewCell.h"

@interface PlotView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSMutableArray *arrayOfPlots;
@property (weak, nonatomic) IBOutlet UITableView *plotsTableView;



-(void)setTheArrayOfPlotItems:(NSMutableArray *)plotItems;

@end
