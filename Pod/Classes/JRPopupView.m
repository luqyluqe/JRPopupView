//
//  JRPopupView.m
//  Pods
//
//  Created by JIRENTIANXIANG on 1/1/15.
//
//

#import "JRPopupView.h"
#import "JRPopupViewAnimationObject.h"
#import "JRPopupViewAnimationObject0.h"
#import "JRPopupViewAnimationObject1.h"

@interface JRPopupView ()

@end

@implementation JRPopupView

-(instancetype)initWithContentView:(UIView*)contentView
{
    self=[self initWithContentView:contentView configuration:[JRPopupViewConfiguration defaultConfiguration]];
    return self;
}

-(instancetype)initWithContentView:(UIView *)contentView configuration:(JRPopupViewConfiguration *)configuration
{
    if (self=[super initWithFrame:contentView.frame]) {
        contentView.frame=self.bounds;
        [self addSubview:contentView];
        self.contentView=contentView;
        self.contentView.layer.cornerRadius=configuration.cornerRadius;
        self.configuration=configuration;
        self.maskView=[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.maskView.backgroundColor=configuration.maskViewColor?:[UIColor grayColor];
        self.maskView.alpha=configuration.maskViewOpacity;
        if ([configuration tapMaskViewToDismiss]) {
            UITapGestureRecognizer* tapRecog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewTapped:)];
            [self.maskView addGestureRecognizer:tapRecog];
        }
        self.configuration.animation.popupView=self;
        self.layer.shadowOffset=configuration.shadowOffset;
        self.layer.shadowOpacity=configuration.shadowOpacity;
        self.layer.shadowRadius=configuration.shadowRadius;
        if (configuration.shadowColor) {
            self.layer.shadowColor=configuration.shadowColor.CGColor;
        }
    }
    return self;
}

-(void)show
{
    if ([self isShowing]) {
        return;
    }
    
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
    
    [window addSubview:self.maskView];
    [window addSubview:self];
    
    if ([self.configuration.animation respondsToSelector:@selector(animateShow)]) {
        [self.configuration.animation animateShow];
    }
    
    _showing=YES;
}

-(void)showInView:(UIView *)view
{
    [view addSubview:self];
    if ([self.configuration.animation respondsToSelector:@selector(animateShow)]) {
        [self.configuration.animation animateShow];
    }
}

-(void)dismiss
{
    if (![self isShowing]) {
        return;
    }
    
    if ([self.configuration.animation respondsToSelector:@selector(animateDismissWithCompletion:)]) {
        [self.configuration.animation animateDismissWithCompletion:^{
            [self.maskView removeFromSuperview];
            [self removeFromSuperview];
        }];
    }else{
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
    }
    
    _showing=NO;
}

-(void)maskViewTapped:(UIView*)maskView
{
    [self dismiss];
}

@end
