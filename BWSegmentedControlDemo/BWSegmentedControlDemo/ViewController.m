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

    BWSegmentedControl *segmentedControl = [[BWSegmentedControl alloc]initWithImages:@[ [UIImage imageNamed:@"user"], [UIImage imageNamed:@"user-group"], [UIImage imageNamed:@"image-alt"]]
                                                                              titles:@[ @"User", @"Group", @"Globe"]];
    segmentedControl.topColor = [UIColor grayColor];

    [segmentedControl addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    [segmentedControl sizeToFit];
    self.navigationItem.titleView = segmentedControl;
}

- (void)tapped: (BWSegmentedControl *)segmentedControl{
    NSLog(@"Changed to %lu", (unsigned long)segmentedControl.selectedItemIndex);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
