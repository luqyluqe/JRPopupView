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

-(instancetype)initWithContentView:(UIView*)contentView;
-(instancetype)initWithContentView:(UIView *)contentView configuration:(JRPopupViewConfiguration*)configuration;

-(void)show;
-(void)showInView:(UIView*)view;
-(void)dismiss;

@end
