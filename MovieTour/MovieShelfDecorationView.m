//
//  MovieShelfDecorationView.m
//  MovieTour
//
//  Created by MM - 03 on 22/10/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import "MovieShelfDecorationView.h"

@interface MovieShelfDecorationView()
{
    UIImageView *shelfTexture;
}
@end

@implementation MovieShelfDecorationView
+ (NSString *)kind
{
    return @"MovieShelfDecorationView";
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage *background = [[UIImage imageNamed:@"shelf"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
        
        shelfTexture = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                     0,
                                                                     CGRectGetWidth(frame),
                                                                     CGRectGetHeight(frame))];
        shelfTexture.image = background;
        [self addSubview:shelfTexture];
    }
    return self;
}


@end
