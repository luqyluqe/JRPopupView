//
//  JRPopupViewConfiguration.h
//  Pods
//
//  Created by JIRENTIANXIANG on 4/12/16.
//
//

#import <UIKit/UIKit.h>
#import "JRPopupViewAnimationObject.h"

@interface JRPopupViewConfiguration : NSObject

@property (nonatomic,assign) CGFloat cornerRadius;

@property (nonatomic,strong) JRPopupViewAnimationObject* animation;

+(JRPopupViewConfiguration*)defaultConfiguration;

@end
