//
//  JRPopupViewConfiguration.h
//  Pods
//
//  Created by JIRENTIANXIANG on 4/12/16.
//
//

#import <UIKit/UIKit.h>
#import "JRPopupViewAnimationObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface JRPopupViewConfiguration : NSObject

@property (nonatomic,assign) CGFloat cornerRadius;
@property (nonatomic,assign) CGSize shadowOffset;
@property (nonatomic,assign) CGFloat shadowOpacity;
@property (nonatomic,assign) CGFloat shadowRadius;
@property (nonatomic,copy,nullable) UIColor* shadowColor;
@property (nonatomic,copy,nullable) UIColor* maskViewColor;
@property (nonatomic,assign) CGFloat maskViewOpacity;
@property (nonatomic,assign) BOOL tapMaskViewToDismiss;

@property (nonatomic,strong) JRPopupViewAnimationObject* animation;

+(JRPopupViewConfiguration*)defaultConfiguration;

@end

NS_ASSUME_NONNULL_END
