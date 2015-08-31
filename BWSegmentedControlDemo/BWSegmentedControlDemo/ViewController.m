//
//  ViewController.m
//  BWSegmentedControlDemo
//
//  Created by Mendy Krinsky on 6/11/15.
//  Copyright (c) 2015 Mendy Krinsky. All rights reserved.
//

#import "ViewController.h"
#import "BWSegmentedControl.h"
#import "BWSegment.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    UIImage *user = [UIImage imageNamed:@"user"];
    UIImage *userGroup = [UIImage imageNamed:@"user-group"];
    UIImage *imageAlt = [UIImage imageNamed:@"image-alt"];
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    BWSegmentedControl *segmentedControl = [[BWSegmentedControl alloc]initWithImages:@[ user,
                                                                                        userGroup,
                                                                                        imageAlt]
                                                                              titles:@[ @"User",
                                                                                        @"Group",
                                                                                        @"Globe"]];
    segmentedControl.topColor = [UIColor grayColor];
    segmentedControl.selectedItemIndicatorColor = [UIColor yellowColor];
    segmentedControl.segmentImageTintColor = [UIColor purpleColor];
    [segmentedControl setSelectedItemIndex:0 animated:YES];
    [segmentedControl addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    [segmentedControl sizeToFit];
    self.navigationItem.titleView = segmentedControl;
    
    
    //Second segmented control
    UIImage *lock = [UIImage imageNamed:@"lock"];
    UIImage *unlock = [UIImage imageNamed:@"unlock"];
    UIImage *settings = [UIImage imageNamed:@"settings"];
    UIImage *notif = [UIImage imageNamed:@"notification"];
    
    BWSegmentedControl *segmentedControlCenter = [[BWSegmentedControl alloc]initWithImages:@[lock,
                                                                                             unlock,
                                                                                             settings,
                                                                                             notif]
                                                                                    titles:@[ @"Lock",
                                                                                              @"Unlock",
                                                                                              @"Settings",
                                                                                              @"Note"]];
    segmentedControlCenter.topColor = [UIColor darkGrayColor];
    segmentedControlCenter.selectedItemIndicatorColor = [UIColor redColor];
    segmentedControlCenter.segmentImageTintColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:1.000];
    [segmentedControlCenter addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventValueChanged];

    segmentedControlCenter.frame = CGRectMake(0.0,
                                              CGRectGetMidY(self.view.bounds),
                                              CGRectGetWidth(self.view.bounds),
                                              60.0);
    [self.view addSubview:segmentedControlCenter];
}

- (void)tapped: (BWSegmentedControl *)segmentedControl
{
    NSLog(@"Changed to %lu", (unsigned long)segmentedControl.selectedItemIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
