//
//  MeterView.m
//  CollapsableOptions
//
//  Created by Robert Nash on 20/03/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import "MeterView.h"

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define LIGHT_GREY RGB(170, 170, 170)
#define DARK_GREY RGB(85, 85, 85)
#define ORANGE RGB(255, 127, 0)

@interface MeterView ()
@property (weak, nonatomic) IBOutlet UIView *top;
@property (weak, nonatomic) IBOutlet UIView *middle;
@property (weak, nonatomic) IBOutlet UIView *bottom;
@property (strong, nonatomic) dispatch_queue_t sleepQueue;
@end

@implementation MeterView

-(dispatch_queue_t)sleepQueue {
    
    if (_sleepQueue == nil) {
        _sleepQueue = dispatch_queue_create("rrn_sleepQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    return _sleepQueue;
}

-(void)awakeFromNib {
    self.top.backgroundColor = LIGHT_GREY;
}

-(void)lightUp:(BOOL)animated {
    if (animated) {
        [self lightUpAnimatedWithMiddleColour:DARK_GREY
                             withBottomColour:ORANGE];
    } else {
        self.middle.backgroundColor = DARK_GREY;
        self.bottom.backgroundColor = ORANGE;
    }
}

-(void)fadeOut:(BOOL)animated {
    if (animated) {
        [self fadeOutAnimatedWithMiddleColour:[DARK_GREY colorWithAlphaComponent:41/100.0]
                             withBottomColour:[ORANGE colorWithAlphaComponent:5/100.0]];
    } else {
        self.middle.backgroundColor = [DARK_GREY colorWithAlphaComponent:41/100.0];
        self.bottom.backgroundColor = [ORANGE colorWithAlphaComponent:5/100.0];
    }
}

-(void)lightUpAnimatedWithMiddleColour:(UIColor *)middle withBottomColour:(UIColor *)bottom {
    [UIView animateWithDuration:.3
                     animations:^{
                         self.middle.backgroundColor = middle;
                     } completion:^(BOOL finished) {
                         dispatch_async(self.sleepQueue, ^{
                             sleep(.3);
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 self.bottom.backgroundColor = bottom;
                             });
                         });
                     }];
}

-(void)fadeOutAnimatedWithMiddleColour:(UIColor *)middle withBottomColour:(UIColor *)bottom {
    [UIView animateWithDuration:.3
                     animations:^{
                         self.bottom.backgroundColor = middle;
                     } completion:^(BOOL finished) {
                         dispatch_async(self.sleepQueue, ^{
                             sleep(.3);
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 self.middle.backgroundColor = bottom;
                             });
                         });
                     }];
}

@end
