//
//  JRPopupViewAnimationObject0.m
//  Pods
//
//  Created by JIRENTIANXIANG on 4/29/16.
//
//

#import "JRPopupViewAnimationObject0.h"
#import "JRPopupView.h"

@implementation JRPopupViewAnimationObject0

-(void)animateShow
{
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
    
    self.popupView.maskView.alpha=0;
    self.popupView.center=CGPointMake(window.center.x, window.center.y-100);
    self.popupView.alpha=0;

    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:0 options:0 animations:^{
        self.popupView.maskView.alpha=0.2;
        self.popupView.center=window.center;
        self.popupView.alpha=1;
    } completion:^(BOOL finished) {
    }];
    
    CAKeyframeAnimation* animation=[CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values=@[@1.5,@0.8,@1.1,@0.95,@1.0];
    animation.keyTimes=@[@0,@0.25,@0.5,@0.75,@1.0];
    animation.timingFunctions=@[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    animation.duration=0.7;
    [self.popupView.layer addAnimation:animation forKey:nil];
}

-(void)animateDismissWithCompletion:(void(^)())completion
{
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
    UIImageView* snapshotView=[self snapshotImageView];
    CGSize size=self.popupView.bounds.size;
    snapshotView.bounds=CGRectMake(0, 0, size.width, size.height);
    [self.popupView addSubview:snapshotView];
    
    [UIView animateWithDuration:0.4 animations:^{
        self.popupView.maskView.alpha=0;
        self.popupView.center=CGPointMake(window.center.x, window.center.y-100);
        self.popupView.alpha=0;
    snapshotView.bounds=CGRectMake(0, 0, size.width*1.5, size.height*1.5);
    } completion:^(BOOL finished) {
        [snapshotView removeFromSuperview];
        completion();
    }];
}


@end
