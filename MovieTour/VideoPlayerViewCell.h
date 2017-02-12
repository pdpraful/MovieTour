//
//  VideoPlayerViewCell.h
//  MovieTour
//
//  Created by Tudip Technology on 30/11/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import <youtube-ios-player-helper/YTPlayerView.h>
#import <UIKit/UIKit.h>

@interface VideoPlayerViewCell : UITableViewCell <YTPlayerViewDelegate>

@property (weak, nonatomic) IBOutlet YTPlayerView *youtubePlayer;

-(void)setTheVideoIdForYoutubeView:(NSString *)loadWithVideoId;
@end
