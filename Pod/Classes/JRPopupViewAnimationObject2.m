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
        self.showAnimationDuration=0.5;
        self.dismissAnimationDuration=0.4;
    }
    return self;
}

-(void)animateShow
{
    if (![self isInitialized]) {
        self.toCenter=self.popupView.center;
        self.fromCenter=CGPointMake(self.toCenter.x, self.toCenter.y-self.popupView.frame.size.height*0.1);
        self.initialized=YES;
    }
    self.popupView.center=self.fromCenter;
    self.popupView.maskView.alpha=0;
    self.popupView.alpha=0;
    [UIView animateWithDuration:self.showAnimationDuration animations:^{
        self.popupView.maskView.alpha=self.popupView.configuration.maskViewOpacity;
        self.popupView.alpha=1;
        self.popupView.center=self.toCenter;
    } completion:^(BOOL finished) {
    }];
}

-(void)animateDismissWithCompletion:(void (^)())completion
{
    [UIView animateWithDuration:self.dismissAnimationDuration animations:^{
        self.popupView.maskView.alpha=0;
        self.popupView.center=self.fromCenter;
        self.popupView.alpha=0;
    } completion:^(BOOL finished) {
        completion();
    }];
}

@end
