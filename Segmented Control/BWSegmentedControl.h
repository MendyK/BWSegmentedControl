//
//  BWSegmentedControl.h
//  MyTestApp
//
//  Created by Mendy Krinsky on 6/2/15.
//  Copyright (c) 2015 Mendy Krinsky. All rights reserved.
//
//  A segmented control that uses BWSegments as items.
//

#import <UIKit/UIKit.h>


@interface BWSegmentedControl : UIControl
- (instancetype)initWithItems:(NSArray *)items;

///Images and titles must have the same amount of items
- (instancetype)initWithImages: (NSArray *)images titles: (NSArray *)titles;
+ (instancetype)segmentedControlWithImages: (NSArray *)images titles: (NSArray *)titles;


- (void)setSelectedItemIndex:(NSUInteger)selectedItemIndex animated: (BOOL) animated;

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) UIColor *selectedItemIndicatorColor;

///Color of the rounded rect on the top part of the view. Default white
@property (nonatomic, strong) UIColor *topColor;
@property (nonatomic, readonly) NSUInteger selectedItemIndex;


@end
