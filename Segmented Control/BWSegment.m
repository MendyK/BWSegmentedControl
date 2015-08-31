//
//  BWSegmentedControl
//
//  BWSegment.m
//
//  Created by Mendy Krinsky on 6/2/15.
//  Copyright (c) 2015 Mendy Krinsky. All rights reserved.
//
//  Licensed under the MIT license.

#import "BWSegment.h"

@interface BWSegment ()

@end

@implementation BWSegment

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.font = [UIFont fontWithName:@"helvetica" size:13.0];
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        
//        self.backgroundColor = [UIColor blackColor]
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    self.imageView.frame = CGRectMake(CGRectGetMinX(bounds),
                                      CGRectGetMinY(bounds),
                                      CGRectGetWidth(bounds),
                                      CGRectGetHeight(bounds)/1.5f);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    if (self.imageHeight == 0) {
        _imageHeight = self.imageView.frame.size.height;
    }
    
    self.titleLabel.frame = CGRectMake(self.imageView.center.x - CGRectGetWidth(bounds)/4.0f,
                                       CGRectGetHeight(self.imageView.frame),
                                       CGRectGetWidth(bounds)/2,
                                       CGRectGetHeight(bounds) - CGRectGetHeight(self.imageView.frame));
}

- (CGSize)sizeThatFits:(CGSize)size{
    CGSize imageSize = [self.imageView sizeThatFits:size];
    CGSize labelSize = [self.titleLabel sizeThatFits:size];
    return CGSizeMake(imageSize.width, imageSize.height - labelSize.height);
}

@end
