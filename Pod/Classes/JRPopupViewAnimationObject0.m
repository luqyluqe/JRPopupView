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
    
    UIImageView* imageView=[self snapshotImageView];
    CGSize size=self.popupView.bounds.size;
    imageView.bounds=CGRectMake(0, 0, size.width*1.5, size.height*1.5);
    [self.popupView addSubview:imageView];
    
    self.popupView.maskView.alpha=0;
    self.popupView.center=CGPointMake(window.center.x, window.center.y-100);
    self.popupView.alpha=0;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.popupView.maskView.alpha=0.5;
        self.popupView.center=window.center;
        self.popupView.alpha=1;
        imageView.bounds=CGRectMake(0, 0, size.width, size.height);
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}

-(void)animateDismissWithCompletion:(void(^)())completion
{
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];

    UIImageView* imageView=[self snapshotImageView];
    CGSize size=self.popupView.bounds.size;
    imageView.bounds=CGRectMake(0, 0, size.width, size.height);
    [self.popupView addSubview:imageView];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.popupView.maskView.alpha=0;
        self.popupView.center=CGPointMake(window.center.x, window.center.y-100);
        self.popupView.alpha=0;
        imageView.bounds=CGRectMake(0, 0, size.width*1.5, size.height*1.5);
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
        completion();
    }];
}

@end
