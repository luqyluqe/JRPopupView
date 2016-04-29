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

#define SCALE 1.5

@interface JRPopupView ()

@property (nonatomic,strong) JRPopupViewAnimationObject* animationObject;

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
        switch (self.configuration.animation) {
            case JRPopupViewAnimationCustom:
                break;
            case JRPopupViewAnimation0:
                self.animationObject=[[JRPopupViewAnimationObject0 alloc] init];
                self.animationObject.popupView=self;
                break;
            case JRPopupViewAnimation1:
                break;
            default:
                break;
        }
        
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
    
    [window addSubview:self.maskView];
    [window addSubview:self];
    
    [self.animationObject animateShow];
}

-(void)dismiss
{
    [self.animationObject animateDismissWithCompletion:^{
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

-(void)maskViewTapped:(UIView*)maskView
{
    [self dismiss];
}

@end
