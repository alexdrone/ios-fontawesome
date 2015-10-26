//
//  UIImage+UIImage_FontAwesome.m
//  FontAwesome-iOS Demo
//
//  Created by Pedro Piñera Buendía on 22/08/13.
//  Copyright (c) 2013 Alex Usbergo. All rights reserved.
//

#import "UIImage+FontAwesome.h"
#import "NSString+FontAwesome.h"

int fa_constraintLabelToSize(UILabel *label, CGSize size, int maxFontSize, int minFontSize)
{
    // Set the frame of the label to the targeted rectangle
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    label.frame = rect;
    
    // Try all font sizes from largest to smallest font size
    int fontSize = maxFontSize;
    
    // Fit label width wize
    CGSize constraintSize = CGSizeMake(label.frame.size.width, MAXFLOAT);
    
    do {
        // Set current font size
        label.font = [UIFont fontWithName:label.font.fontName size:fontSize];
        
        // Find label size for current font size
        CGRect textRect = [[label text] boundingRectWithSize:constraintSize
                                                     options:NSStringDrawingUsesFontLeading
                                                  attributes:@{NSFontAttributeName:label.font}
                                                     context:nil];
        // Done, if created label is within target size
        if( textRect.size.height <= label.frame.size.height )
            break;
        
        // Decrease the font size and try again
        fontSize -= 2;
        
    } while (fontSize > minFontSize);
    
    return fontSize;
}


@implementation UIImage (UIImage_FontAwesome)

+(UIImage*)imageWithIcon:(NSString*)identifier backgroundColor:(UIColor*)bgColor iconColor:(UIColor*)iconColor andSize:(CGSize)size{
    if (!bgColor) {
        bgColor = [UIColor clearColor];
    }
    if (!iconColor) {
        iconColor = [UIColor whiteColor];
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //// Abstracted Attributes
    NSString* textContent = identifier;
    if (identifier.length > 3 && [[identifier substringToIndex:3] isEqualToString:@"fa-"]) {
        textContent = [NSString fontAwesomeIconStringForIconIdentifier:identifier];
    }
    
    CGRect textRect = CGRectZero;
    textRect.size = size;
    
    //// Retangle Drawing
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:textRect];
    [bgColor setFill];
    [path fill];
    
    //// Text Drawing
    int fontSize = size.width;
    UIFont *font = [UIFont fontWithName:kFontAwesomeFamilyName size:fontSize];
    @autoreleasepool {
        UILabel *label = [UILabel new];
        label.font = font;
        label.text = textContent;
        fontSize = fa_constraintLabelToSize(label, size, 500, 5);
        font = label.font;
    }
    [iconColor setFill];
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    [textContent drawInRect:textRect withAttributes:@{NSFontAttributeName : font,
                                                      NSForegroundColorAttributeName : iconColor,
                                                      NSBackgroundColorAttributeName : bgColor,
                                                      NSParagraphStyleAttributeName: style,
                                                      }];

    //Image returns
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage*)imageWithIcon:(NSString*)identifier backgroundColor:(UIColor*)bgColor iconColor:(UIColor*)iconColor  fontSize:(int)fontSize
{
    if (!bgColor) {
        bgColor = [UIColor clearColor];
    }
    if (!iconColor) {
        iconColor = [UIColor whiteColor];
    }
    
    //// Abstracted Attributes
    NSString* textContent = identifier;
    if (identifier.length > 3 && [[identifier substringToIndex:3] isEqualToString:@"fa-"]) {
        textContent = [NSString fontAwesomeIconStringForIconIdentifier:identifier];
    }
    
    UIFont *font = [UIFont fontWithName:kFontAwesomeFamilyName size:fontSize];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName : font,
                                 NSForegroundColorAttributeName : iconColor,
                                 NSBackgroundColorAttributeName : bgColor,
                                 NSParagraphStyleAttributeName: style,
                                 };
    
    //// Content Edge Insets
    CGSize size = [textContent sizeWithAttributes:attributes];
    size = CGSizeMake(size.width * 1.1, size.height * 1.05);
    
    CGRect textRect = CGRectZero;
    textRect.size = size;
    
    CGPoint origin = CGPointMake(size.width * 0.05, size.height * 0.025);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);

    //// Rectangle Drawing
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:textRect];
    [bgColor setFill];
    [path fill];
    
    //// Text Drawing
    [textContent drawAtPoint:origin withAttributes:attributes];
    
    //Image returns
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
