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
    CGSize _size;
}

-(void)setPopupView:(JRPopupView *)popupView
{
    [super setPopupView:popupView];
    _size=popupView.bounds.size;
}

-(void)animateShow
{
    self.popupView.center=[self fromCenter];
    
    self.popupView.maskView.alpha=0;
    self.popupView.alpha=0;
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:0 animations:^{
        self.popupView.maskView.alpha=0.2;
        self.popupView.alpha=1;
        self.popupView.center=self.toCenter;
    } completion:^(BOOL finished) {
    }];
    
    CAKeyframeAnimation* animation=[CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    if (self.fromScale>1) {
        animation.values=@[@(self.fromScale),@1,@0.9,@1,@1.05,@1,@0.975,@1.0];
    }else{
        animation.values=@[@(self.fromScale),@1,@1.1,@1,@0.95,@1,@1.025,@1.0];
    }
    animation.keyTimes=@[@0,@(1.0/7),@(2.0/7),@(3.0/7),@(4.0/7),@(5.0/7),@(6.0/7),@1];
    animation.timingFunctions=@[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.duration=0.7;
    [self.popupView.layer addAnimation:animation forKey:nil];
}

-(void)animateDismissWithCompletion:(void(^)())completion
{
    UIImageView* snapshotView=[self snapshotImageView];
    snapshotView.frame=CGRectMake(0, 0, _size.width, _size.height);
    [self.popupView addSubview:snapshotView];
    self.popupView.contentView.hidden=YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.popupView.maskView.alpha=0;
        self.popupView.center=[self fromCenter];
        self.popupView.bounds=CGRectMake(0, 0, _size.width*self.fromScale, _size.height*self.fromScale);
        self.popupView.contentView.frame=CGRectMake(0, 0, _size.width*self.fromScale, _size.height*self.fromScale);
        snapshotView.frame=CGRectMake(0, 0, _size.width*self.fromScale, _size.height*self.fromScale);
        self.popupView.alpha=0;
    } completion:^(BOOL finished) {
        [snapshotView removeFromSuperview];
        [self reset];
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
    fromSize.height=size.height*self.fromScale;
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

-(CGPoint)fromCenter
{
    CGPoint center=self.popupView.center;
    CGPoint vector=CGPointMake(center.x-self.anchor.x, center.y-self.anchor.y);
    vector.x*=self.fromScale;
    vector.y*=self.fromScale;
    CGPoint fromCenter=CGPointMake(self.anchor.x+vector.x, self.anchor.y+vector.y);
    return fromCenter;
}

-(void)reset
{
    self.popupView.bounds=CGRectMake(0, 0, _size.width, _size.height);
    self.popupView.contentView.frame=CGRectMake(0, 0, _size.width, _size.height);
    self.popupView.clipsToBounds=NO;
    self.popupView.contentView.hidden=NO;
}

@end
