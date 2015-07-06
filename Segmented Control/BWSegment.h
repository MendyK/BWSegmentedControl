//
//  BWSegmentedControl
//
//  BWSegment.h
//
//  Created by Mendy Krinsky on 6/2/15.
//  Copyright (c) 2015 Mendy Krinsky. All rights reserved.
//
//  Licensed under the MIT license.

#import <UIKit/UIKit.h>


/**
  A UIControl with an image on top and text on the bottom
 */
@interface BWSegment : UIControl
@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UILabel     *titleLabel;
@property (nonatomic, readonly) CGFloat imageHeight;
@end
