//
//  JRPopupView.h
//  Pods
//
//  Created by JIRENTIANXIANG on 1/1/15.
//
//

#import "JRPopupViewConfiguration.h"

@interface JRPopupView : UIView

@property (nonatomic,strong) JRPopupViewConfiguration* configuration;
@property (nonatomic,strong) UIView* maskView;
@property (nonatomic,strong) UIView* contentView;
@property (nonatomic,readonly,getter=isShowing) BOOL showing;

-(instancetype)initWithContentView:(UIView*)contentView;
-(instancetype)initWithContentView:(UIView *)contentView configuration:(JRPopupViewConfiguration*)configuration;

-(void)show;
-(void)showAnimated:(BOOL)animated;
-(void)showInView:(UIView*)view;
-(void)showInView:(UIView *)view animated:(BOOL)animated;

-(void)dismiss;
-(void)dismissAnimated:(BOOL)animated;

@end
