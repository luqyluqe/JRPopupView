//
//  JRPopupViewAnimationObject.h
//  Pods
//
//  Created by JIRENTIANXIANG on 4/29/16.
//
//

#import <UIKit/UIKit.h>

@class JRPopupView;

@interface JRPopupViewAnimationObject : NSObject

@property (nonatomic,weak) JRPopupView* popupView;

-(void)animateShow;
-(void)animateDismissWithCompletion:(void(^)())completion;

-(UIImageView*)snapshotImageView;

@end
