# BWSegmentedControl
A segmented control with a ball indicator 

Partially inspired by [this post on dribbble](https://dribbble.com/shots/1737521-Settings-UI?list=searches&offset=141)

![alt tag](https://raw.github.com/MendyK/BWSegmentedControl/master/Demo images/gifCropped.gif)

![alt tag](https://raw.github.com/MendyK/BWSegmentedControl/master/Demo images/demoImage.png)
##Getting started

To start, create an array of images and an array of titles (make sure both arrays have the same number of items).

````smalltalk

UIImage *firstImage = [UIImage imageNamed:@"firstImage"];
UIImage *secondImage = [UIImage imageNamed:@"secondImage"];
    
NSArray *images = @[ firstImage, secondImage ];
NSArray *titles = @[@"First title", @"Second title"];
    
````

Initialize the segmented control with those arrays and add `self` as a target. Then call `sizeToFit` so it can decide its own size.
````smalltalk
    
BWSegmentedControl *segmentedControl = [BWSegmentedControl segmentedControlWithImages:images titles:titles];
[segmentedControl addTarget:self action:@selector(segmentMoved:) forControlEvents:UIControlEventValueChanged];
[segmentedControl sizeToFit];  
````


Finally, add it to your view.

````smalltalk
self.navigationItem.titleView = segmentedControl;
  ````
  
  
##CocoaPods

`pod 'BWSegmentedControl', :git => 'https://github.com/MendyK/BWSegmentedControl'`
##License
```
  The MIT License (MIT)

Copyright (c) 2015 Mendy Krinsky

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
