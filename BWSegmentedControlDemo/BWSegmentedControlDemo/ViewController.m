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

    BWSegment *segment1 = [BWSegment new];
    segment1.imageView.image = [UIImage imageNamed:@"user"];
    segment1.titleLabel.text = @"User";
    
    BWSegment *segment2 = [BWSegment new];
    segment2.imageView.image = [UIImage imageNamed:@"user-group"];
    segment2.titleLabel.text = @"Group";

    BWSegment *segment3 = [BWSegment new];
    segment3.imageView.image = [UIImage imageNamed:@"image-alt"];
    segment3.titleLabel.text = @"Globe";
    
    BWSegmentedControl *segmentedControl = [[BWSegmentedControl alloc]initWithItems:@[ segment1, segment2, segment3]];
    segmentedControl.backgroundColor = [UIColor grayColor];
    segmentedControl.topColor = [UIColor grayColor];
    CGRect frame = self.view.frame;
    
    segmentedControl.frame = CGRectMake(CGRectGetMinX(frame),
                                        CGRectGetMidY(frame),
                                        CGRectGetWidth(frame),
                                        88);
    [segmentedControl addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
}

- (void)tapped: (BWSegmentedControl *)segmentedControl{
    NSLog(@"Changed to %lu", (unsigned long)segmentedControl.selectedItemIndex);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
