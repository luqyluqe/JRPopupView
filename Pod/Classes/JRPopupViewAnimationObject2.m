//
//  JRPopupViewAnimationObject2.m
//  Pods
//
//  Created by luqy on 8/18/17.
//
//

#import "JRPopupViewAnimationObject2.h"
#import "JRPopupView.h"

@interface JRPopupViewAnimationObject2 ()

@property (nonatomic,assign,getter=isInitialized) BOOL initialized;
@property (nonatomic,assign) CGPoint fromCenter;
@property (nonatomic,assign) CGPoint toCenter;

@end

@implementation JRPopupViewAnimationObject2

-(instancetype)init
{
    if (self=[super init]) {
        self.initialized=NO;
        self.translationScale=0.05;
        self.showAnimationDuration=0.4;
        self.dismissAnimationDuration=0.4;
    }
    return self;
}

-(void)animateShow
{
    [self initializeIfNeeded];
    
    self.popupView.center=self.toCenter;

    CAKeyframeAnimation* animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.values=@[[NSValue valueWithCGPoint:self.fromCenter],[NSValue valueWithCGPoint:self.toCenter]];
    animation.duration=self.showAnimationDuration;
    [self.popupView.layer addAnimation:animation forKey:nil];
    
    [UIView animateWithDuration:self.showAnimationDuration animations:^{
        self.popupView.maskView.alpha=self.popupView.configuration.maskViewOpacity;
        self.popupView.alpha=1;
    }];
}

-(void)animateDismissWithCompletion:(void (^)())completion
{
    [self initializeIfNeeded];

    CAKeyframeAnimation* animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.values=@[[NSValue valueWithCGPoint:self.toCenter],[NSValue valueWithCGPoint:self.fromCenter]];
    animation.duration=self.dismissAnimationDuration;
    [self.popupView.layer addAnimation:animation forKey:nil];
    
    [UIView animateWithDuration:self.dismissAnimationDuration animations:^{
        self.popupView.maskView.alpha=0;
        self.popupView.alpha=0;
    }completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

-(void)initializeIfNeeded
{
    if (![self isInitialized]) {
        self.toCenter=self.popupView.center;
        self.fromCenter=CGPointMake(self.toCenter.x, self.toCenter.y-self.popupView.frame.size.height*self.translationScale);
        self.initialized=YES;
    }
}

@end
