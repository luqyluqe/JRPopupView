//
//  JRViewController.m
//  JRPopupView
//
//  Created by luqyluqe on 04/11/2016.
//  Copyright (c) 2016 luqyluqe. All rights reserved.
//

#import "JRViewController.h"
#import "JRPopupView.h"

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
    self.popupView=[[JRPopupView alloc] initWithContentView:contentView];
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
