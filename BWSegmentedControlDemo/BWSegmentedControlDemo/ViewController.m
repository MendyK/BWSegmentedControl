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

- (void)viewDidLoad {
    [super viewDidLoad];
        
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    BWSegmentedControl *segmentedControl = [[BWSegmentedControl alloc]initWithImages:@[ [UIImage imageNamed:@"user"],
                                                                                        [UIImage imageNamed:@"user-group"],
                                                                                        [UIImage imageNamed:@"image-alt"]]
                                                                              titles:@[ @"User", @"Group", @"Globe"]];
    segmentedControl.topColor = [UIColor grayColor];
    [segmentedControl setSelectedItemIndex:1 animated:YES];
    [segmentedControl addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    [segmentedControl sizeToFit];
    self.navigationItem.titleView = segmentedControl;

    
    
    UIImage *user = [UIImage imageNamed:@"user"];
    UIImage *userGroup = [UIImage imageNamed:@"user-group"];
    BWSegmentedControl *segmentedControl3 = [[BWSegmentedControl alloc]initWithImages:@[user,
                                                                                        userGroup,
                                                                                        userGroup,
                                                                                        userGroup,
                                                                                        userGroup]
                                                                titles:@[ @"User", @"Group", @"Group", @"Group", @"Group"]];
    segmentedControl3.topColor = [UIColor darkGrayColor];
    segmentedControl3.backgroundColor = [UIColor darkGrayColor];
    segmentedControl3.selectedItemIndicatorColor = [UIColor greenColor];
    segmentedControl3.segmentImageTintColor = [UIColor brownColor];
    segmentedControl3.frame = CGRectMake(0, CGRectGetMidX(self.view.bounds), 0, 0);

    [segmentedControl3 sizeToFit];

    [self.view addSubview:segmentedControl3];
}

- (void)tapped: (BWSegmentedControl *)segmentedControl{
    NSLog(@"Changed to %lu", (unsigned long)segmentedControl.selectedItemIndex);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
