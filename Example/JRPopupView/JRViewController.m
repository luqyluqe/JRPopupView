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

@interface JRViewController ()

@property (nonatomic,strong) JRPopupView* popupView;

@end

@implementation JRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    UIView* contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    contentView.backgroundColor=[UIColor whiteColor];
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    label.textAlignment=NSTextAlignmentCenter;
    CGRect contentViewBounds=contentView.bounds;
    CGPoint contentViewOrigin=contentViewBounds.origin;
    CGSize contentViewSize=contentViewBounds.size;
    label.center=CGPointMake(contentViewOrigin.x+contentViewSize.width/2, contentViewOrigin.y+contentViewSize.height/2);
    label.text=@"JRPopupView";
    [contentView addSubview:label];
    JRPopupViewConfiguration* config=[JRPopupViewConfiguration defaultConfiguration];
    JRPopupViewAnimationObject0* animation0=[JRPopupViewAnimationObject0 new];
    JRPopupViewAnimationObject1* animation1=[JRPopupViewAnimationObject1 new];
    animation1.anchor=CGPointMake(150, 20);
    animation1.fromScale=0.1;
    animation1.toCenter=CGPointMake(150, 200);
    config.animation=animation1;
    self.popupView=[[JRPopupView alloc] initWithContentView:contentView configuration:config];
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
