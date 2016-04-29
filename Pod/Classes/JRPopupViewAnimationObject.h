//
//  JRPopupViewAnimationObject.h
//  Pods
//
//  Created by JIRENTIANXIANG on 4/29/16.
//
//

#import "JRPopupView.h"

@interface JRPopupViewAnimationObject : NSObject

@property (nonatomic,weak) JRPopupView* popupView;

-(void)animateShow;
-(void)animateDismissWithCompletion:(void(^)())completion;

@end
