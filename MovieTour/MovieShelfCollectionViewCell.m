//
//  MovieShelfCollectionViewCell.m
//  MovieTour
//
//  Created by MM - 03 on 22/10/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import "MovieShelfCollectionViewCell.h"

@implementation MovieShelfCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    return self;
}

+ (NSString *)reuseId
{
    return MOVIE_CELL_IDENTIFIER;
}

-(void) setBackgroundImageWithId:(NSString *) seriesId
{
    UIImage *bgImage = [UIImage imageNamed:@"image"];
    self.backgroundView = [[UIImageView alloc] initWithImage:bgImage];
}
@end
