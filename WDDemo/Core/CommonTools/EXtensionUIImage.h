//
//  UIImage.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//


#import <UIKit/UIKit.h>
/*!
 *  @brief [UIImage][0] [graphics][1] extension.
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIImage_Class/Reference/Reference.html
 *      [1]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKitFunctionReference/Reference/reference.html#//apple_ref/doc/uid/TP40006894-CH3-SW8
 */
@interface UIImage (UIGraphics)

/*!
 *  @brief Resized image by given size.
 *  @param size The size to resize.
 *  @return An UIImage object containing a resized image from the image.
 *  @details This method depends on CoreGraphics.
 */
- (UIImage*) imageByResizingToSize: (CGSize) size;

/*!
 *  @brief Color filled image with given color.
 *  @param color The color to fill
 *  @details This method depends on CoreGraphics.
 */
- (UIImage*) imageByFilledWithColor: (UIColor*) color;

/*!
 *  @brief Colored image by given size.
 *  @param color The color to fill.
 *  @param size The image size to create.
 */
+ (UIImage*) imageWithColor: (UIColor*) color size: (CGSize) size;

/*!
 *  @brief Clear colored image.
 */
+ (UIImage*) clearImage;

/*!
 *  @brief Image drawn with bazier path.
 *  @param path The bezier path to draw.
 *  @param color The stroke color for bezier path.
 *  @param backgroundColor The fill color for bezier path.
 */
+ (UIImage*) imageWithBezierPath: (UIBezierPath*) path color: (UIColor*) color backgroundColor: (UIColor*) backgroundColor;

+ (UIImage*) imageWithColor: (UIColor*) color;

@end


/*!
 *  @brief [UIImage][1] generator for [UIColor][0].
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIImage_Class/Reference/Reference.html
 *      [1]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIColor_Class/Reference/Reference.html
 */
@interface UIColor (UIImage)

/*!
 *  @brief Colored image sized as given size.
 *  @param size The image size to create.
 */
- (UIImage*) imageOfSize: (CGSize) size;

/*!
 *  @brief Colored image sized 1x1
 */
- (UIImage*) image;

@end


/*!
 *  @brief [UIBezierPath][0] extension for [UIImage][1] creation.
 *      [0]: http://developer.apple.com/library/ios/#documentation/uikit/reference/UIBezierPath_class/Reference/Reference.html
 *      [1]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIImage_Class/Reference/Reference.html
 */
@interface UIBezierPath (UIImage)

/*!
 *  @brief Image drawn with bazier path.
 *  @param strokeColor The stroke color for bezier path.
 *  @param fillColor The fill color for bezier path.
 */
- (UIImage*) imageWithStrokeColor: (UIColor*) strokeColor fillColor: (UIColor*) fillColor;

/*!
 *  @brief Image drawn with bazier path.
 *  @param strokeColor The stroke color for bezier path.
 */
- (UIImage*) imageWithStrokeColor: (UIColor*) strokeColor;

/*!
 *  @brief Image drawn with bazier path.
 *  @param fillColor The fill color for bezier path.
 */
- (UIImage*) imageWithFillColor: (UIColor*) fillColor;

@end
