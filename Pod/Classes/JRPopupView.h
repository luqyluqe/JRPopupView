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

-(instancetype)initWithContentView:(UIView*)contentView;
-(instancetype)initWithContentView:(UIView *)contentView configuration:(JRPopupViewConfiguration*)configuration;

-(void)show;
-(void)dismiss;

@end
