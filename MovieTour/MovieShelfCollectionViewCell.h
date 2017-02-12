//
//  MovieShelfCollectionViewCell.h
//  MovieTour
//
//  Created by MM - 03 on 22/10/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

@interface MovieShelfCollectionViewCell : UICollectionViewCell
+(NSString *)reuseId;
-(void) setBackgroundImageWithId:(NSString *) movieId;
@end
