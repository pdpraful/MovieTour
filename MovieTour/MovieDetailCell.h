//
//  MovieDetailCell.h
//  MovieTour
//
//  Created by Praful on 30/11/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlotView.h"
#import "CoreDataManager.h"

@interface MovieDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISegmentedControl *movieDetailsSegmentControl;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topSpaceForSegmentControl;
@property (strong, nonatomic) PlotView *plotView;
@end
