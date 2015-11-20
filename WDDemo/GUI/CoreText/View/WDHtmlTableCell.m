//
//  WDHtmlTableCell.m
//  WDDemo
//
//  Created by wd on 15/11/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDHtmlTableCell.h"
#import "WDHtmlTableItem.h"

@interface WDHtmlTableCell ()<DTAttributedTextContentViewDelegate, DTLazyImageViewDelegate>

@property (nonatomic, strong) DTAttributedTextContentView *htmlView;

@end

@implementation WDHtmlTableCell

+ (CGFloat) heightWithItem: (RETableViewItem*) item tableViewManager: (RETableViewManager*) tableViewManager
{
    WDHtmlTableItem * sItem = (WDHtmlTableItem *)item;
    DTAttributedTextContentView * view = [[DTAttributedTextContentView alloc] init];
    NSData *htmlData = [sItem.htmlString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *option = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:18], DTDefaultFontSize,
                            [UIColor blackColor], DTDefaultTextColor,
                            [NSNumber numberWithFloat:1], DTDefaultLineHeightMultiplier,nil];
    view.attributedString = [[NSAttributedString alloc] initWithHTMLData:htmlData options:option documentAttributes:nil];
    CGSize size = [view suggestedFrameSizeToFitEntireStringConstraintedToWidth:__MainScreen_Width - 20];
    return size.height + 20;
}

- (void) cellDidLoad
{
    [super cellDidLoad];
    self.htmlView = [[DTAttributedTextContentView alloc] init];
    self.htmlView.delegate = self;
    [self.contentView addSubview:self.htmlView];
    [self.htmlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    self.htmlView.shouldDrawImages = YES;
}

- (void) cellWillAppear
{
    [super cellWillAppear];
    WDHtmlTableItem * item = (WDHtmlTableItem *)self.item;
    NSData *htmlData = [item.htmlString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *option = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:18], DTDefaultFontSize,
                            [UIColor blackColor], DTDefaultTextColor,
                            [NSNumber numberWithFloat:1], DTDefaultLineHeightMultiplier,nil];
    self.htmlView.attributedString = [[NSAttributedString alloc] initWithHTMLData:htmlData options:option documentAttributes:nil];
    [self.htmlView relayoutText];
}

#pragma mark DTAttributedTextContentViewDelegate
- (void)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView willDrawLayoutFrame:(DTCoreTextLayoutFrame *)layoutFrame inContext:(CGContextRef)context
{
    NSLog(@"willDrawLayoutFrame");
}

- (void)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView didDrawLayoutFrame:(DTCoreTextLayoutFrame *)layoutFrame inContext:(CGContextRef)context
{
    NSLog(@"didDrawLayoutFrame");
}

- (BOOL)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView shouldDrawBackgroundForTextBlock:(DTTextBlock *)textBlock frame:(CGRect)frame context:(CGContextRef)context forLayoutFrame:(DTCoreTextLayoutFrame *)layoutFrame
{
    NSLog(@"shouldDrawBackgroundForTextBlock");
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:10];
    
    CGColorRef color = [textBlock.backgroundColor CGColor];
    if (color)
    {
        CGContextSetFillColorWithColor(context, color);
    }
    CGContextAddPath(context, [roundedRect CGPath]);
    CGContextFillPath(context);
    
    CGContextAddPath(context, [roundedRect CGPath]);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextStrokePath(context);
    
    return NO; // draw standard background
}

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame
{
    NSLog(@"viewForAttachment");
    if ([attachment isKindOfClass:[DTVideoTextAttachment class]])
    {
        /*
        NSURL *url = (id)attachment.contentURL;
        
        // we could customize the view that shows before playback starts
        UIView *grayView = [[UIView alloc] initWithFrame:frame];
        grayView.backgroundColor = [DTColor blackColor];
        
        // find a player for this URL if we already got one
        MPMoviePlayerController *player = nil;
        for (player in self.mediaPlayers)
        {
            if ([player.contentURL isEqual:url])
            {
                break;
            }
        }
        
        if (!player)
        {
            player = [[MPMoviePlayerController alloc] initWithContentURL:url];
            [self.mediaPlayers addObject:player];
        }
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_4_2
        NSString *airplayAttr = [attachment.attributes objectForKey:@"x-webkit-airplay"];
        if ([airplayAttr isEqualToString:@"allow"])
        {
            if ([player respondsToSelector:@selector(setAllowsAirPlay:)])
            {
                player.allowsAirPlay = YES;
            }
        }
#endif
        
        NSString *controlsAttr = [attachment.attributes objectForKey:@"controls"];
        if (controlsAttr)
        {
            player.controlStyle = MPMovieControlStyleEmbedded;
        }
        else
        {
            player.controlStyle = MPMovieControlStyleNone;
        }
        
        NSString *loopAttr = [attachment.attributes objectForKey:@"loop"];
        if (loopAttr)
        {
            player.repeatMode = MPMovieRepeatModeOne;
        }
        else
        {
            player.repeatMode = MPMovieRepeatModeNone;
        }
        
        NSString *autoplayAttr = [attachment.attributes objectForKey:@"autoplay"];
        if (autoplayAttr)
        {
            player.shouldAutoplay = YES;
        }
        else
        {
            player.shouldAutoplay = NO;
        }
        
        [player prepareToPlay];
        
        player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        player.view.frame = grayView.bounds;
        [grayView addSubview:player.view];
        
        return grayView;*/
    }else if ([attachment isKindOfClass:[DTImageTextAttachment class]])
    {
        // if the attachment has a hyperlinkURL then this is currently ignored
        DTImageTextAttachment *attachment_New = (DTImageTextAttachment *)attachment;
        DTLazyImageView *imageView = [[DTLazyImageView alloc] initWithFrame:frame];
        imageView.delegate = self;
        if (attachment_New.image)
        {
            imageView.image = attachment_New.image;
        }
        
        // url for deferred loading
        imageView.url = attachment_New.contentURL;
        
        // if there is a hyperlink then add a link button on top of this image
        if (attachment_New.hyperLinkURL)
        {
            // NOTE: this is a hack, you probably want to use your own image view and touch handling
            // also, this treats an image with a hyperlink by itself because we don't have the GUID of the link parts
            imageView.userInteractionEnabled = YES;
            DTLinkButton *button = (DTLinkButton *)[self attributedTextContentView:attributedTextContentView viewForLink:attachment_New.hyperLinkURL identifier:attachment_New.hyperLinkGUID frame:imageView.bounds];
            [imageView addSubview:button];
        }
        
        return imageView;
    }
    else if ([attachment isKindOfClass:[DTIframeTextAttachment class]])
    {
        DTWebVideoView *videoView = [[DTWebVideoView alloc] initWithFrame:frame];
        videoView.attachment = attachment;
        
        return videoView;
    }
    else if ([attachment isKindOfClass:[DTObjectTextAttachment class]])
    {
        // somecolorparameter has a HTML color
        UIColor *someColor = [UIColor colorWithHTMLName:[attachment.attributes objectForKey:@"somecolorparameter"]];
        
        UIView *someView = [[UIView alloc] initWithFrame:frame];
        someView.backgroundColor = someColor;
        someView.layer.borderWidth = 1;
        
        someView.layer.borderColor = [UIColor blackColor].CGColor;
        
        return someView;
    }
    
    return nil;

}

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForLink:(NSURL *)url identifier:(NSString *)identifier frame:(CGRect)frame
{
    DTLinkButton *button = [[DTLinkButton alloc] initWithFrame:frame];
    button.URL = url;
    button.minimumHitSize = CGSizeMake(25, 25); // adjusts it's bounds so that button is always large enough
    button.GUID = identifier;
    
    // use normal push action for opening URL
    [button addTarget:self action:@selector(linkPushed:) forControlEvents:UIControlEventTouchUpInside];
    
    // demonstrate combination with long press
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(linkLongPressed:)];
    [button addGestureRecognizer:longPress];
    
    return button;
}

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttributedString:(NSAttributedString *)string frame:(CGRect)frame
{
    NSLog(@"viewForAttributedString");
    return nil;
}

#pragma mark DTLinkButton
- (void)linkPushed:(DTLinkButton *)sender
{
    NSLog(@"linkPushed");
}

- (void)linkLongPressed:(UIGestureRecognizer *)gesture
{
    NSLog(@"linkLongPressed");
}

#pragma mark DTLazyImageViewDelegate
- (void)lazyImageView:(DTLazyImageView *)lazyImageView didChangeImageSize:(CGSize)size
{
    NSLog(@"didChangeImageSize");
    NSURL *url = lazyImageView.url;
    CGSize imageSize = size;
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"contentURL == %@", url];
    
    // update all attachments that matchin this URL (possibly multiple images with same size)
    for (DTTextAttachment *oneAttachment in [self.htmlView.layoutFrame textAttachmentsWithPredicate:pred])
    {
        oneAttachment.originalSize = imageSize;
        
        if (!CGSizeEqualToSize(imageSize, oneAttachment.displaySize))
        {
            oneAttachment.displaySize = imageSize;
        }
    }
    
    // redo layout
    // here we're layouting the entire string, might be more efficient to only relayout the paragraphs that contain these attachments
    [self.htmlView relayoutText];

}
@end
