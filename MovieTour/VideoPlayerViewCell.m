//
//  VideoPlayerViewCell.m
//  MovieTour
//
//  Created by Tudip Technology on 30/11/16.
//  Copyright © 2016 praful. All rights reserved.
//

#import "VideoPlayerViewCell.h"

@implementation VideoPlayerViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setTheVideoIdForYoutubeView:(NSString *)videoId{
    NSDictionary *playerVars = @{
                                 @"playsinline" : @1,
                                 @"autoplay": @1,
                                 };
    [self.youtubePlayer loadWithVideoId:videoId playerVars:playerVars];
    self.youtubePlayer.delegate = self;
}
- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    switch (state) {
        case kYTPlayerStatePlaying:
            NSLog(@"Started playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            break;
        default:
            break;
    }
}
@end
