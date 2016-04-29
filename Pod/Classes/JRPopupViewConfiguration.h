//
//  JRPopupViewConfiguration.h
//  Pods
//
//  Created by JIRENTIANXIANG on 4/12/16.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JRPopupViewAnimation){
    JRPopupViewAnimationCustom,
    JRPopupViewAnimation0,
    JRPopupViewAnimation1,
};

@interface JRPopupViewConfiguration : NSObject

@property (nonatomic,assign) CGFloat cornerRadius;

@property (nonatomic,assign) JRPopupViewAnimation animation;

+(JRPopupViewConfiguration*)defaultConfiguration;

@end
