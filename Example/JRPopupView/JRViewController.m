//
//  JRViewController.m
//  JRPopupView
//
//  Created by luqyluqe on 04/11/2016.
//  Copyright (c) 2016 luqyluqe. All rights reserved.
//

#import "JRViewController.h"
#import "JRPopupView.h"
#import "JRPopupViewAnimationObject0.h"
#import "JRPopupViewAnimationObject1.h"
#import "JRPopupViewAnimationObject2.h"

@interface JRViewController ()

@property (nonatomic,strong) JRPopupView* popupView;

@end

@implementation JRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    UIView* contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 120)];
    contentView.center=CGPointMake(self.view.bounds.size.width/2., self.view.bounds.size.height/2.);
    contentView.backgroundColor=[UIColor whiteColor];
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 100)];
    label.numberOfLines=0;
    label.textColor=[UIColor darkGrayColor];
    label.font=[UIFont systemFontOfSize:12];
    CGRect contentViewBounds=contentView.bounds;
    CGPoint contentViewOrigin=contentViewBounds.origin;
    CGSize contentViewSize=contentViewBounds.size;
    label.center=CGPointMake(contentViewOrigin.x+contentViewSize.width/2, contentViewOrigin.y+contentViewSize.height/2);
    label.text=[NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@",
                @"Long walks at night",
                @"that's what good for the soul",
                @"peeking into windows",
                @"watching tired housewives",
                @"trying to fight off",
                @"their beer-maddened husbands"];
     [contentView addSubview:label];
    JRPopupViewConfiguration* config=[JRPopupViewConfiguration defaultConfiguration];
    config.maskViewColor=[UIColor blackColor];
    config.maskViewOpacity=0.8;
    JRPopupViewAnimationObject0* animation0=[JRPopupViewAnimationObject0 new];
//    JRPopupViewAnimationObject1* animation1=[JRPopupViewAnimationObject1 new];
//    animation1.anchor=CGPointMake(150, 20);
//    animation1.fromScale=0.1;
//    animation1.toCenter=CGPointMake(150, 200);
//    JRPopupViewAnimationObject2* animation2=[JRPopupViewAnimationObject2 new];
    config.animation=animation0;
    self.popupView=[[JRPopupView alloc] initWithContentView:contentView configuration:config];
    
//    [self.popupView performSelector:@selector(show) withObject:nil afterDelay:2];
//    [self.popupView performSelector:@selector(dismiss) withObject:nil afterDelay:4];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    UITapGestureRecognizer* tapRecog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(show)];
    [self.view addGestureRecognizer:tapRecog];
}

-(void)show
{
    [self.popupView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
