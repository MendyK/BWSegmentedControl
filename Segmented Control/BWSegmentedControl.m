//
//  BWSegmentedControl
//
//  BWSegmentedControl.m
//
//  Created by Mendy Krinsky on 6/2/15.
//  Copyright (c) 2015 Mendy Krinsky. All rights reserved.
//
//  Licensed under the MIT license.

#pragma mark - Imports

#import "BWSegmentedControl.h"
#import "BWSegment.h"

@interface BWSegmentedControl()

@property (nonatomic, strong) UIView *selectedItemIndicator;
@property (nonatomic, readwrite) NSUInteger selectedItemIndex;
@property (nonatomic, readonly) CGFloat itemWidth;
@property (nonatomic, readonly) CGFloat upperViewHeight;
@property (nonatomic) CGRect  topRect;
@property (nonatomic) CGFloat selectedItemIndicatorCornerRadius;
@property (nonatomic) CGFloat topRectCornerRadius;
@property (nonatomic) CGFloat interItemSpacing;

@end

@implementation BWSegmentedControl

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.topColor = [UIColor whiteColor];

        self.selectedItemIndicator = [[UIView alloc]initWithFrame:CGRectZero];
        self.selectedItemIndicatorColor = [UIColor blueColor];

        self.selectedItemIndicator.clipsToBounds = YES;
        self.selectedItemIndicator.backgroundColor = self.selectedItemIndicatorColor;
        self.interItemSpacing = 30;
        self.animationDuration = 0.5;
        
        [self addSubview:self.selectedItemIndicator];
        self.items = items;
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
        [panGestureRecognizer setMinimumNumberOfTouches:1];
        [panGestureRecognizer setMaximumNumberOfTouches:1];
        [self.selectedItemIndicator addGestureRecognizer:panGestureRecognizer];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

- (instancetype) initWithImages:(NSArray *)images titles:(NSArray *)titles
{
    NSArray *segments = [self createSegmentsWithImages: images titles: titles];
    self = [self initWithItems:segments];
    return self;
}

+ (instancetype)segmentedControlWithImages: (NSArray *)images titles: (NSArray *)titles
{
    return [[self alloc]initWithImages:images titles:titles];
}

///images and titles array must have same number of objects
- (NSArray *)createSegmentsWithImages: (NSArray *)images titles: (NSArray *)titles
{
    NSAssert([images count] == [titles count], @"The images and titles arrays must have the same number of objects");
    
    NSMutableArray *allSegments = [NSMutableArray array];
    
    for (NSInteger index = 0; index < [images count]; index++) {
        BWSegment *segment = [BWSegment new];
        segment.imageView.image = images[index];
        segment.titleLabel.text = titles[index];
        [allSegments addObject:segment];
    }
    return allSegments;
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (NSInteger i = 0; i < [self.items count]; i++) {
        UIControl *item = self.items[i];
        item.frame = [self frameForItemAtIndex:i];
    }
    self.selectedItemIndicator.frame = [self frameForIndicatorAtIndex:self.selectedItemIndex];
    self.selectedItemIndicator.layer.cornerRadius = self.selectedItemIndicatorCornerRadius;
    [self setSelectedItemIndex:self.selectedItemIndex animated:NO moveIndicator:NO];
}

- (CGRect)frameForItemAtIndex:(NSUInteger)index
{
    NSUInteger totalItemCount = [self.items count];
    CGFloat interItemSpacing = (self.bounds.size.width - (self.itemWidth*totalItemCount)) / ((CGFloat)totalItemCount-1.f);
    self.interItemSpacing = interItemSpacing;
    
    CGFloat startX = (self.itemWidth + interItemSpacing) * index;
    return CGRectMake(startX,
                      CGRectGetMinY(self.bounds),
                      self.itemWidth,
                      CGRectGetHeight(self.bounds));
}

- (CGRect)frameForIndicatorAtIndex: (NSUInteger)index
{
    CGRect itemRect = [self frameForItemAtIndex:index];
    CGFloat itemCenter = itemRect.origin.x + [self itemWidth]/2;
    CGFloat indicatorX = itemCenter - self.upperViewHeight/2;
    
    return CGRectMake(indicatorX,
                      itemRect.origin.y,
                      self.upperViewHeight,
                      self.upperViewHeight);
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGFloat segmentWidth = [[self.items firstObject]sizeThatFits:size].width;
    self.selectedItemIndicator.frame = [self frameForIndicatorAtIndex:self.selectedItemIndex];
    
    return CGSizeMake(segmentWidth * [self.items count] + self.interItemSpacing, 47);
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *topPath = [UIBezierPath bezierPathWithRoundedRect:self.topRect cornerRadius:self.topRectCornerRadius];
    [self.topColor setFill];
    [topPath fill];
}

#pragma mark - Segment indicator

- (void)tapGestureRecognized: (UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint location = [tapGestureRecognizer locationInView:self];
    
    for (BWSegment *item in self.items) {
        
        if (CGRectContainsPoint(item.frame, location)) {
            
            NSUInteger selectedItemIndex = [self.items indexOfObject:item];

            if (selectedItemIndex != self.selectedItemIndex) {
                [self setSelectedItemIndex:selectedItemIndex animated:YES];
                [self sendActionsForControlEvents:UIControlEventValueChanged];
            }

        }
    }
}

- (void)panGestureRecognized:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint translation = [panGestureRecognizer translationInView:panGestureRecognizer.view.superview];
    
    // Find the difference in horizontal position between the current and previous touches
    CGFloat xDiff = translation.x;
    
    // Check that the indicator doesn't exit the bounds of the control
    CGRect newSegmentIndicatorFrame = self.selectedItemIndicator.frame;
    newSegmentIndicatorFrame.origin.x += xDiff;
    
    if (CGRectContainsRect(CGRectInset(self.topRect, self.interItemSpacing, 0), newSegmentIndicatorFrame)) {
        self.selectedItemIndicator.center = CGPointMake(self.selectedItemIndicator.center.x + xDiff, self.selectedItemIndicator.center.y);
    }
    
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:panGestureRecognizer.view.superview];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        for (NSUInteger index = 0; index < [self.items count]; index++) {
            
            BWSegment *item = self.items[index];
            
            if (CGRectContainsPoint(item.frame, self.selectedItemIndicator.center)) {
                if (index != self.selectedItemIndex) {
                    self.selectedItemIndex = index;
                    [self sendActionsForControlEvents:UIControlEventValueChanged];
                }
                [self moveSelectedSegmentIndicatorToSegmentAtIndex:index animated:YES];

            }
        }
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    [super hitTest:point withEvent:event];
    if (CGRectContainsPoint(self.selectedItemIndicator.frame, point)) {
        return self.selectedItemIndicator;
    }
    return self;
}

- (void)moveSelectedSegmentIndicatorToSegmentAtIndex:(NSUInteger)index animated:(BOOL)animated
{
    __weak typeof(self)weakSelf = self;
    
    void (^animationsBlock)(void) = ^{
        weakSelf.selectedItemIndicator.frame = [weakSelf frameForIndicatorAtIndex:index];
        };
 
    if (!animated) {
        animationsBlock();
        return;
    }
    [UIView animateWithDuration:self.animationDuration animations:animationsBlock];
}

#pragma mark - Properties

- (CGFloat)itemWidth
{
    return CGRectGetWidth(self.frame) / [self.items count];
}

- (void)setItems:(NSArray *)items{

    for( UIControl *control in _items ) {
        [control removeFromSuperview];
    }
    _items = items;
    
    if ([_items count] == 0) {
        return;
    }
    
    for (UIControl *control in _items) {
        [self addSubview:control];
    }
}

#pragma mark Top Rect

- (CGRect)topRect
{
    if (CGRectEqualToRect(_topRect, CGRectZero)) {
        BWSegment *firstSegment = [self.items firstObject];
        
        _topRect = CGRectZero;
        _topRect.origin.y = CGRectGetMinY(self.bounds);
        _topRect.origin.x = firstSegment.titleLabel.frame.origin.x;
        _topRect.size.height = self.upperViewHeight;
        _topRect.size.width = CGRectGetWidth(self.bounds) - _topRect.origin.x * 2;
    }
    return _topRect;
}

- (CGFloat)topRectCornerRadius
{
    return CGRectGetHeight(self.bounds)/2;
}

- (void)setTopColor:(UIColor *)topColor
{
    _topColor = topColor;
    [self setNeedsDisplay];
}

- (CGFloat)upperViewHeight{
    BWSegment *item = [self.items firstObject];
    return item.imageHeight;
}

#pragma mark selectedItemIndicator

- (CGFloat)selectedItemIndicatorCornerRadius{
    return self.selectedItemIndicator.frame.size.width/2;
}

///Public
- (void)setSelectedItemIndex:(NSUInteger)selectedItemIndex animated: (BOOL) animated{
    [self setSelectedItemIndex:selectedItemIndex animated:animated moveIndicator:YES];
}

///Private
- (void)setSelectedItemIndex:(NSUInteger)selectedItemIndex animated: (BOOL) animated moveIndicator: (BOOL)moveIndicator{
    
    self.selectedItemIndex = selectedItemIndex;
    if (moveIndicator) {
        [self moveSelectedSegmentIndicatorToSegmentAtIndex:self.selectedItemIndex animated:animated];
    }
    [self setNeedsDisplay];

}

///Private
- (void)setSelectedItemIndex:(NSUInteger)selectedItemIndex{
    
    _selectedItemIndex = selectedItemIndex;
    
    for (NSUInteger i = 0; i < [self.items count]; i++) {
        BWSegment *item = self.items[i];
        BOOL isSelectedItem = i == selectedItemIndex;
        item.titleLabel.textColor = isSelectedItem ? self.selectedItemIndicatorColor : item.imageView.tintColor;
        item.selected = isSelectedItem ? YES : NO;
    }
    [self setNeedsDisplay];
}

- (void)setSelectedItemIndicatorColor:(UIColor *)selectedItemIndicatorColor
{
    _selectedItemIndicatorColor = selectedItemIndicatorColor;
    self.selectedItemIndicator.backgroundColor = _selectedItemIndicatorColor;
}

- (void)setSegmentImageTintColor:(UIColor *)segmentImageTintColor{
    _segmentImageTintColor = segmentImageTintColor;
    
    for (BWSegment *item in self.items) {
        UIImage *originalImage = item.imageView.image;
        item.imageView.image = [originalImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        item.imageView.tintColor = _segmentImageTintColor;
    }
    [self setNeedsDisplay];
}

@end

