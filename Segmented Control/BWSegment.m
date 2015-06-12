//
//  BWSegment.m
//  MyTestApp
//
//  Created by Mendy Krinsky on 6/2/15.
//  Copyright (c) 2015 Mendy Krinsky. All rights reserved.
//

#import "BWSegment.h"



@implementation BWSegment

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];

        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.adjustsFontSizeToFitWidth = YES;

        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    self.imageView.frame = CGRectMake(CGRectGetMinX(bounds),
                                      CGRectGetMinY(bounds),
                                      CGRectGetWidth(bounds),
                                      CGRectGetHeight(bounds)/2.0f);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    if (self.imageHeight == 0) {
        _imageHeight = self.imageView.frame.size.height;
    }
    
    self.titleLabel.frame = CGRectMake(self.imageView.center.x - CGRectGetWidth(bounds)/4.0f,
                                       CGRectGetHeight(self.imageView.frame),
                                       CGRectGetWidth(bounds)/2,
                                       CGRectGetHeight(bounds) - CGRectGetHeight(self.imageView.frame));

}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    if (selected) {
        self.titleLabel.textColor = [UIColor blueColor];
    }
    else{
        self.titleLabel.textColor = [UIColor blackColor];
    }
    
}
@end
