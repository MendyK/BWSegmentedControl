//
//  BWSegmentedControl
//
//  BWSegmentedControl.h
//
//  Created by Mendy Krinsky on 6/2/15.
//  Copyright (c) 2015 Mendy Krinsky. All rights reserved.
//
//  Licensed under the MIT license.

#import <UIKit/UIKit.h>

/**
 A segmented control that uses BWSegments as items.
 */
@interface BWSegmentedControl : UIControl

// -----
// @name Methods
// -----

/**
 Initializes a new segmented control. 
 @discussion Items must be BWSegments.
 */
- (instancetype)initWithItems:(NSArray *)items;

/**
 Initializes a new segmented control.
 @discussion Images and titles must have the same amount of items.
*/
- (instancetype)initWithImages: (NSArray *)images titles: (NSArray *)titles;

/**
 Convenience initializer
 */
+ (instancetype)segmentedControlWithImages: (NSArray *)images titles: (NSArray *)titles;

/**
 Sets the selected segment index
 
 */
- (void)setSelectedItemIndex:(NSUInteger)selectedItemIndex animated: (BOOL) animated;

// -----
// @name Properties
// -----
#pragma mark - Properties

/**
 Segments
 */
@property (nonatomic, strong) NSArray *items;

/**
 Color of the indicator. Default blue.
 */
@property (nonatomic, strong) UIColor *selectedItemIndicatorColor;

/**
 Color of the rounded rect on the top part of the view. Default white.
 */
@property (nonatomic, strong) UIColor *topColor;

/**
 Current selected segment index
 */
@property (nonatomic, readonly) NSUInteger selectedItemIndex;

/**
 Time it takes for segments to move from one place to another.
 */
@property (nonatomic) NSTimeInterval animationDuration;

/**
 Sets the tint color of the segments' images.
 When set, the image rendering modes of each segment will change to `template`
 */
@property (nonatomic, strong) UIColor *segmentImageTintColor;


@end
