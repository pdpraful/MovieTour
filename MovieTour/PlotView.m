//
//  PlotView.m
//  MovieTour
//
//  Created by Praful on 03/12/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import "PlotView.h"

@implementation PlotView

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.plotsTableView.delegate = self;
    self.plotsTableView.dataSource = self;
 }


//Plot items setter

-(void)setTheArrayOfPlotItems:(NSMutableArray *)plotItems{
    self.arrayOfPlots = plotItems;
}

//table view delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PlotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlotTableViewCell"];
    NSArray *parts = [[NSBundle mainBundle] loadNibNamed:@"PlotTableViewCell" owner:nil options:nil];
    cell = (PlotTableViewCell *)[parts objectAtIndex:0];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.superview.frame.size.height / [self.arrayOfPlots count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayOfPlots count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


@end
