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
        [self addSubview:contentView];
        self.contentView=contentView;
        self.contentView.layer.cornerRadius=configuration.cornerRadius;
        self.configuration=configuration;
        self.maskView=[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.maskView.backgroundColor=configuration.maskViewColor?:[UIColor grayColor];
        UITapGestureRecognizer* tapRecog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewTapped:)];
        [self.maskView addGestureRecognizer:tapRecog];
        self.configuration.animation.popupView=self;
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
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
    
    [window addSubview:self.maskView];
    [window addSubview:self];
    
    [self.configuration.animation animateShow];
}

-(void)showInView:(UIView *)view
{
    [view addSubview:self];
    [self.configuration.animation animateShow];
}

-(void)dismiss
{
    [self.configuration.animation animateDismissWithCompletion:^{
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

-(void)maskViewTapped:(UIView*)maskView
{
    [self dismiss];
}

@end
