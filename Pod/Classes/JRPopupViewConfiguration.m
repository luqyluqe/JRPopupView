//
//  JRPopupViewConfiguration.m
//  Pods
//
//  Created by JIRENTIANXIANG on 4/12/16.
//
//

#import "JRPopupViewConfiguration.h"

@implementation JRPopupViewConfiguration

+(JRPopupViewConfiguration*)defaultConfiguration
{
    JRPopupViewConfiguration* config=[[JRPopupViewConfiguration alloc] init];
    config.cornerRadius=8;
    config.animation=JRPopupViewAnimation0;
    return config;
}

@end
