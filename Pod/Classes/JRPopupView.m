//
//  JRPopupView.m
//  Pods
//
//  Created by JIRENTIANXIANG on 1/1/15.
//
//

#import "JRPopupView.h"

#define SCALE 1.5

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
    
    UIImageView* imageView=[self getImageView];
    CGSize size=self.bounds.size;
    imageView.bounds=CGRectMake(0, 0, size.width*SCALE, size.height*SCALE);
    [self addSubview:imageView];
    
    self.maskView.alpha=0;
    self.center=CGPointMake(window.center.x, window.center.y-100);
    self.alpha=0;
    
    [window addSubview:self.maskView];
    [window addSubview:self];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.maskView.alpha=0.5;
        self.center=self.window.center;
        self.alpha=1;
        imageView.bounds=CGRectMake(0, 0, size.width, size.height);
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}

-(void)dismiss
{
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
    
    UIImageView* imageView=[self getImageView];
    CGSize size=self.bounds.size;
    imageView.bounds=CGRectMake(0, 0, size.width, size.height);
    [self addSubview:imageView];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.maskView.alpha=0;
        self.center=CGPointMake(window.center.x, window.center.y-100);
        self.alpha=0;
        imageView.bounds=CGRectMake(0, 0, size.width*SCALE, size.height*SCALE);
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
        [imageView removeFromSuperview];
    }];
}

-(UIImageView*)getImageView
{
    UIImage* image=[self captureImage];
    UIImageView* imageView=[[UIImageView alloc] initWithImage:image];
    imageView.contentMode=UIViewContentModeScaleToFill;
    CGSize size=self.bounds.size;
    CGPoint origin=self.bounds.origin;
    imageView.center=CGPointMake(origin.x+size.width/2, origin.y+size.height/2);
    return imageView;
}

-(UIImage*)captureImage
{
    UIGraphicsBeginImageContext(self.contentView.bounds.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    [self.contentView.layer renderInContext:context];
    UIImage* image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)maskViewTapped:(UIView*)maskView
{
    [self dismiss];
}

@end
