//
//  JRPopupView.m
//  Pods
//
//  Created by JIRENTIANXIANG on 1/1/15.
//
//

#import "JRPopupView.h"

@interface JRPopupView ()

@property (nonatomic,strong) UIView* maskView;
@property (nonatomic,strong) UIView* contentView;

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
        self.configuration=configuration;
        
        self.maskView=[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.maskView.backgroundColor=[UIColor grayColor];
        UITapGestureRecognizer* tapRecog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewTapped:)];
        [self.maskView addGestureRecognizer:tapRecog];
        
        [self addSubview:contentView];
        self.contentView=contentView;
        
        self.contentView.layer.cornerRadius=configuration.cornerRadius;
    }
    return self;
}

-(void)show
{
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
    self.maskView.alpha=0;
    self.center=CGPointMake(window.center.x, window.center.y-100);
    self.alpha=0;
    [window addSubview:self.maskView];
    [window addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.maskView.alpha=0.5;
        self.center=self.window.center;
        self.alpha=1;
    }];
}

-(void)dismiss
{
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
    [UIView animateWithDuration:0.5 animations:^{
        self.maskView.alpha=0;
        self.center=CGPointMake(window.center.x, window.center.y-100);
        self.alpha=0;
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

-(void)maskViewTapped:(UIView*)maskView
{
    [self dismiss];
}

@end
