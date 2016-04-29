//
//  JRPopupViewAnimationObject.m
//  Pods
//
//  Created by JIRENTIANXIANG on 4/29/16.
//
//

#import "JRPopupViewAnimationObject.h"
#import "JRPopupView.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation JRPopupViewAnimationObject
#pragma clang diagnostic pop

-(UIImageView*)snapshotImageView
{
    UIImage* image=[self snapshot];
    UIImageView* imageView=[[UIImageView alloc] initWithImage:image];
    imageView.contentMode=UIViewContentModeScaleToFill;
    CGSize size=self.popupView.bounds.size;
    CGPoint origin=self.popupView.bounds.origin;
    imageView.center=CGPointMake(origin.x+size.width/2, origin.y+size.height/2);
    return imageView;
}

-(UIImage*)snapshot
{
    UIGraphicsBeginImageContext(self.popupView.contentView.bounds.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    [self.popupView.contentView.layer renderInContext:context];
    UIImage* image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
