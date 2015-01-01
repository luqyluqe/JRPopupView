//
//  JRPopupViewConfiguration.m
//  Pods
//
//  Created by JIRENTIANXIANG on 4/12/16.
//
//

#import "JRPopupViewConfiguration.h"
#import "JRPopupViewAnimationObject0.h"

@implementation JRPopupViewConfiguration

+(JRPopupViewConfiguration*)defaultConfiguration
{
    JRPopupViewConfiguration* config=[[JRPopupViewConfiguration alloc] init];
    config.cornerRadius=8;
    config.shadowOpacity=0.2;
    config.shadowRadius=5;
    config.animation=[JRPopupViewAnimationObject0 new];
    return config;
}

@end
