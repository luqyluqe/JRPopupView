//
//  JRPopupViewAnimationObject1.m
//  Pods
//
//  Created by JIRENTIANXIANG on 4/29/16.
//
//

#import "JRPopupViewAnimationObject1.h"
#import "JRPopupView.h"

@implementation JRPopupViewAnimationObject1
{
    CGRect _frame;
}

-(void)setPopupView:(JRPopupView *)popupView
{
    [super setPopupView:popupView];
    _frame=popupView.frame;
}

-(void)animateShow
{
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
    
    UIImageView* imageView=[self snapshotImageView];
    CGSize size=self.popupView.bounds.size;
    imageView.bounds=CGRectMake(0, 0, size.width*1.5, size.height*1.5);
    [self.popupView addSubview:imageView];
    
    self.popupView.maskView.alpha=0;
    self.popupView.frame=[self fromFrame];
    self.popupView.alpha=0;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.popupView.maskView.alpha=0.5;
        self.popupView.frame=_frame;
        self.popupView.alpha=1;
        imageView.bounds=CGRectMake(0, 0, size.width, size.height);
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}

-(void)animateDismissWithCompletion:(void (^)())completion
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

-(CGRect)fromFrame
{
    CGSize fromSize;
    CGPoint fromOrigin;
    CGRect frame=self.popupView.frame;
    CGSize size=frame.size;
    CGPoint origin=frame.origin;
    fromSize.width=size.width*self.fromScale;
    fromSize.height*=size.height*self.fromScale;
    CGPoint vector=CGPointMake(origin.x-self.anchor.x, origin.y-self.anchor.y);
    vector.x*=self.fromScale;
    vector.y*=self.fromScale;
    fromOrigin.x=self.anchor.x+vector.x;
    fromOrigin.y=self.anchor.y+vector.y;
    CGRect fromFrame;
    fromFrame.size=fromSize;
    fromFrame.origin=fromOrigin;
    return fromFrame;
}

@end
