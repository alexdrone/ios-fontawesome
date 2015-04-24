//
//  UIFont+FontAwesome.m
//  FontAwesome-iOS Demo
//
//  Created by Alex Usbergo on 1/16/13.
//  Copyright (c) 2013 Alex Usbergo. All rights reserved.
//

#import "UIFont+FontAwesome.h"
#import "NSString+FontAwesome.h"

@implementation UIFont (FontAwesome)

#pragma mark - Public API
+ (UIFont*)fontAwesomeFontOfSize:(CGFloat)size {
	UIFont *font = [UIFont fontWithName:kFontAwesomeFamilyName size:size];
    NSAssert(font!=nil, @"%@ couldn't be loaded",kFontAwesomeFamilyName);
    return font;
}

@end
