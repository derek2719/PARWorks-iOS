//
//  ARSiteImagesInfoView.m
//  PARWorks iOS
//
//  Created by Demetri Miller on 12/8/12.
//  Copyright (c) 2012 Ben Gotow. All rights reserved.
//

#import "ARSiteImagesInfoView.h"

@implementation ARSiteImagesInfoView


#pragma mark - Lifecycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self sharedInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [self sharedInit];
}

- (void)sharedInit
{
    UIColor *shadowColor = [UIColor blackColor];
    CGSize offset = CGSizeZero;
    CGFloat opacity = 1.0;
    CGFloat radius = 2.0;
    
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.opacity = opacity;
    
    _addBaseImageButton.layer.shadowColor = shadowColor.CGColor;
    _addBaseImageButton.layer.shadowOffset = offset;
    _addBaseImageButton.layer.shadowOpacity = opacity;
    _addBaseImageButton.layer.shadowRadius = radius;
    
    _processBaseImageButton.layer.shadowColor = shadowColor.CGColor;
    _processBaseImageButton.layer.shadowOffset = offset;
    _processBaseImageButton.layer.shadowOpacity = opacity;
    _processBaseImageButton.layer.shadowRadius = radius;
    
    _addOverlayButton.layer.shadowColor = shadowColor.CGColor;
    _addOverlayButton.layer.shadowOffset = offset;
    _addOverlayButton.layer.shadowOpacity = opacity;
    _addOverlayButton.layer.shadowRadius = radius;
    
}


#pragma mark - Getters/Setters
- (void)setSiteStatus:(ARSiteStatus)siteStatus
{
    _siteStatus = siteStatus;
    int step = 0;
    NSString *directionsText = @"";
    switch (siteStatus) {
        case ARSiteStatusCreating:
        case ARSiteStatusNotProcessed:
            step = 1;
            directionsText = @"Take 15-20 images of your subject";
            _processBaseImageButton.hidden = NO;
            _addBaseImageButton.hidden = NO;
            _addOverlayButton.hidden = YES;
            break;
        case ARSiteStatusProcessing:
            step = 2;
            directionsText = @"Processing...";
            _processBaseImageButton.hidden = YES;
            _addBaseImageButton.hidden = YES;
            _addOverlayButton.hidden = YES;
            break;
        case ARSiteStatusProcessingFailed:
            step = 2;
            directionsText = @"Processing Failed.";
            _processBaseImageButton.hidden = YES;
            _addBaseImageButton.hidden = YES;
            _addOverlayButton.hidden = YES;
            break;
        case ARSiteStatusProcessed:
            step = 3;
            directionsText = @"Tap images to add overlays, then test!";
            _processBaseImageButton.hidden = YES;
            _addBaseImageButton.hidden = YES;
            _addOverlayButton.hidden = NO;
            break;
        default:
            break;
    }
    
    _stepLabel.text = [NSString stringWithFormat:@"%d/3", step];
    _directionsLabel.text = directionsText;
}

@end



@implementation ARSiteImagesInfoViewButton

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    self.backgroundColor = highlighted ? [UIColor colorWithRed:0.15 green:0.4 blue:0.15 alpha:1] : [UIColor whiteColor];
}

@end