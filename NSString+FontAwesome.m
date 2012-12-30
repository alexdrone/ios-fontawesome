//
//  NSString+FontAwesome.m
//
//  Created by Alex Usbergo on 12/30/12.
//
//

#import "NSString+FontAwesome.h"

@implementation NSString (FontAwesome)

/* Returns the correct enum for a font-awesome icon.
 * The list of identifiers can be found here:
 * http://fortawesome.github.com/Font-Awesome/#all-icons */
+ (FAIcon)fontAwesomeEnumForIconIdentifier:(NSString*)string
{
    // The icon prefix is allowed
    if ([string hasPrefix:@"icon-"])
        string = [string substringFromIndex:5];
    
    // Capitalizes the strings
    string = [string capitalizedString];
    string = [string toCamelCase];
    
    // Assembles the enum name
    if (![string hasPrefix:@"FAIcon"])
        string = [NSString stringWithFormat:@"%@%@", @"FAIcon", string];
    
    NSDictionary *enums = [self enumDictionary];
    return [enums[string] integerValue];
}

/* Returns the font-awesome character associated to the
 * icon enum passed as argument */
+ (NSString*)fontAwesomeIconStringForEnum:(FAIcon)value
{
    return [self fontAwesomeIcons][value];
}

/* Returns the font-awesome character associated to the font-awesome
 * identifier.
 * http://fortawesome.github.com/Font-Awesome/#all-icons */
+ (NSString*)fontAwesomeIconStringForIconIdentifier:(NSString*)identifier
{
    return [self fontAwesomeIconStringForEnum:[self fontAwesomeEnumForIconIdentifier:identifier]];
}

/* Transform a hyphen-case string into a camel case one */
- (NSString*)toCamelCase
{
    NSMutableString *output = [NSMutableString string];
    BOOL makeNextCharacterUpperCase = NO;
    for (NSInteger i = 0; i < self.length; i++) {
        
        unichar c = [self characterAtIndex:i];
        
        if (c == '-') {
            makeNextCharacterUpperCase = YES;
        } else if (makeNextCharacterUpperCase) {
            [output appendString:[[NSString stringWithCharacters:&c length:1] uppercaseString]];
            makeNextCharacterUpperCase = NO;
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

#pragma mark - data initialization

+ (NSArray*)fontAwesomeIcons
{
    static NSArray *fontAwesomeIcons;
    if (nil == fontAwesomeIcons) {
        fontAwesomeIcons = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    }
    return fontAwesomeIcons;
}

+ (NSDictionary*)enumDictionary
{
	static NSDictionary *enumDictionary;
	if (nil == enumDictionary) {
		NSMutableDictionary *tmp = [[NSMutableDictionary alloc] init];
		tmp[@"FAIconGlass"] = @(FAIconGlass);
		tmp[@"FAIconMusic"] = @(FAIconMusic);
		tmp[@"FAIconSearch"] = @(FAIconSearch);
		tmp[@"FAIconEnvelope"] = @(FAIconEnvelope);
		tmp[@"FAIconHeart"] = @(FAIconHeart);
		tmp[@"FAIconStar"] = @(FAIconStar);
		tmp[@"FAIconStarEmpty"] = @(FAIconStarEmpty);
		tmp[@"FAIconUser"] = @(FAIconUser);
		tmp[@"FAIconFilm"] = @(FAIconFilm);
		tmp[@"FAIconThLarge"] = @(FAIconThLarge);
		tmp[@"FAIconTh"] = @(FAIconTh);
		tmp[@"FAIconThList"] = @(FAIconThList);
		tmp[@"FAIconOk"] = @(FAIconOk);
		tmp[@"FAIconRemove"] = @(FAIconRemove);
		tmp[@"FAIconZoomIn"] = @(FAIconZoomIn);
		tmp[@"FAIconZoomOut"] = @(FAIconZoomOut);
		tmp[@"FAIconOff"] = @(FAIconOff);
		tmp[@"FAIconSignal"] = @(FAIconSignal);
		tmp[@"FAIconCog"] = @(FAIconCog);
		tmp[@"FAIconTrash"] = @(FAIconTrash);
		tmp[@"FAIconHome"] = @(FAIconHome);
		tmp[@"FAIconFile"] = @(FAIconFile);
		tmp[@"FAIconTime"] = @(FAIconTime);
		tmp[@"FAIconRoad"] = @(FAIconRoad);
		tmp[@"FAIconDownloadAlt"] = @(FAIconDownloadAlt);
		tmp[@"FAIconDownload"] = @(FAIconDownload);
		tmp[@"FAIconUpload"] = @(FAIconUpload);
		tmp[@"FAIconInbox"] = @(FAIconInbox);
		tmp[@"FAIconPlayCircle"] = @(FAIconPlayCircle);
		tmp[@"FAIconRepeat"] = @(FAIconRepeat);
		tmp[@"FAIconRefresh"] = @(FAIconRefresh);
		tmp[@"FAIconListAlt"] = @(FAIconListAlt);
		tmp[@"FAIconLock"] = @(FAIconLock);
		tmp[@"FAIconFlag"] = @(FAIconFlag);
		tmp[@"FAIconHeadphones"] = @(FAIconHeadphones);
		tmp[@"FAIconVolumeOff"] = @(FAIconVolumeOff);
		tmp[@"FAIconVolumeDown"] = @(FAIconVolumeDown);
		tmp[@"FAIconVolumeUp"] = @(FAIconVolumeUp);
		tmp[@"FAIconQrcode"] = @(FAIconQrcode);
		tmp[@"FAIconBarcode"] = @(FAIconBarcode);
		tmp[@"FAIconTag"] = @(FAIconTag);
		tmp[@"FAIconTags"] = @(FAIconTags);
		tmp[@"FAIconBook"] = @(FAIconBook);
		tmp[@"FAIconBookmark"] = @(FAIconBookmark);
		tmp[@"FAIconPrint"] = @(FAIconPrint);
		tmp[@"FAIconCamera"] = @(FAIconCamera);
		tmp[@"FAIconFont"] = @(FAIconFont);
		tmp[@"FAIconBold"] = @(FAIconBold);
		tmp[@"FAIconItalic"] = @(FAIconItalic);
		tmp[@"FAIconTextHeight"] = @(FAIconTextHeight);
		tmp[@"FAIconTextWidth"] = @(FAIconTextWidth);
		tmp[@"FAIconAlignLeft"] = @(FAIconAlignLeft);
		tmp[@"FAIconAlignCenter"] = @(FAIconAlignCenter);
		tmp[@"FAIconAlignRight"] = @(FAIconAlignRight);
		tmp[@"FAIconAlignJustify"] = @(FAIconAlignJustify);
		tmp[@"FAIconList"] = @(FAIconList);
		tmp[@"FAIconIndentLeft"] = @(FAIconIndentLeft);
		tmp[@"FAIconIndentRight"] = @(FAIconIndentRight);
		tmp[@"FAIconFacetimeVideo"] = @(FAIconFacetimeVideo);
		tmp[@"FAIconPicture"] = @(FAIconPicture);
		tmp[@"FAIconPencil"] = @(FAIconPencil);
		tmp[@"FAIconMapMarker"] = @(FAIconMapMarker);
		tmp[@"FAIconAdjust"] = @(FAIconAdjust);
		tmp[@"FAIconTint"] = @(FAIconTint);
		tmp[@"FAIconEdit"] = @(FAIconEdit);
		tmp[@"FAIconShare"] = @(FAIconShare);
		tmp[@"FAIconCheck"] = @(FAIconCheck);
		tmp[@"FAIconMove"] = @(FAIconMove);
		tmp[@"FAIconStepBackward"] = @(FAIconStepBackward);
		tmp[@"FAIconFastBackward"] = @(FAIconFastBackward);
		tmp[@"FAIconBackward"] = @(FAIconBackward);
		tmp[@"FAIconPlay"] = @(FAIconPlay);
		tmp[@"FAIconPause"] = @(FAIconPause);
		tmp[@"FAIconStop"] = @(FAIconStop);
		tmp[@"FAIconForward"] = @(FAIconForward);
		tmp[@"FAIconFastForward"] = @(FAIconFastForward);
		tmp[@"FAIconStepForward"] = @(FAIconStepForward);
		tmp[@"FAIconEject"] = @(FAIconEject);
		tmp[@"FAIconChevronLeft"] = @(FAIconChevronLeft);
		tmp[@"FAIconChevronRight"] = @(FAIconChevronRight);
		tmp[@"FAIconPlusSign"] = @(FAIconPlusSign);
		tmp[@"FAIconMinusSign"] = @(FAIconMinusSign);
		tmp[@"FAIconRemoveSign"] = @(FAIconRemoveSign);
		tmp[@"FAIconOkSign"] = @(FAIconOkSign);
		tmp[@"FAIconQuestionSign"] = @(FAIconQuestionSign);
		tmp[@"FAIconInfoSign"] = @(FAIconInfoSign);
		tmp[@"FAIconScreenshot"] = @(FAIconScreenshot);
		tmp[@"FAIconRemoveCircle"] = @(FAIconRemoveCircle);
		tmp[@"FAIconOkCircle"] = @(FAIconOkCircle);
		tmp[@"FAIconBanCircle"] = @(FAIconBanCircle);
		tmp[@"FAIconArrowLeft"] = @(FAIconArrowLeft);
		tmp[@"FAIconArrowRight"] = @(FAIconArrowRight);
		tmp[@"FAIconArrowUp"] = @(FAIconArrowUp);
		tmp[@"FAIconArrowDown"] = @(FAIconArrowDown);
		tmp[@"FAIconShareAlt"] = @(FAIconShareAlt);
		tmp[@"FAIconResizeFull"] = @(FAIconResizeFull);
		tmp[@"FAIconResizeSmall"] = @(FAIconResizeSmall);
		tmp[@"FAIconPlus"] = @(FAIconPlus);
		tmp[@"FAIconMinus"] = @(FAIconMinus);
		tmp[@"FAIconAsterisk"] = @(FAIconAsterisk);
		tmp[@"FAIconExclamationSign"] = @(FAIconExclamationSign);
		tmp[@"FAIconGift"] = @(FAIconGift);
		tmp[@"FAIconLeaf"] = @(FAIconLeaf);
		tmp[@"FAIconFire"] = @(FAIconFire);
		tmp[@"FAIconEyeOpen"] = @(FAIconEyeOpen);
		tmp[@"FAIconEyeClose"] = @(FAIconEyeClose);
		tmp[@"FAIconWarningSign"] = @(FAIconWarningSign);
		tmp[@"FAIconPlane"] = @(FAIconPlane);
		tmp[@"FAIconCalendar"] = @(FAIconCalendar);
		tmp[@"FAIconRandom"] = @(FAIconRandom);
		tmp[@"FAIconComment"] = @(FAIconComment);
		tmp[@"FAIconMagnet"] = @(FAIconMagnet);
		tmp[@"FAIconChevronUp"] = @(FAIconChevronUp);
		tmp[@"FAIconChevronDown"] = @(FAIconChevronDown);
		tmp[@"FAIconRetweet"] = @(FAIconRetweet);
		tmp[@"FAIconShoppingCart"] = @(FAIconShoppingCart);
		tmp[@"FAIconFolderClose"] = @(FAIconFolderClose);
		tmp[@"FAIconFolderOpen"] = @(FAIconFolderOpen);
		tmp[@"FAIconResizeVertical"] = @(FAIconResizeVertical);
		tmp[@"FAIconResizeHorizontal"] = @(FAIconResizeHorizontal);
		tmp[@"FAIconBarChart"] = @(FAIconBarChart);
		tmp[@"FAIconTwitterSign"] = @(FAIconTwitterSign);
		tmp[@"FAIconFacebookSign"] = @(FAIconFacebookSign);
		tmp[@"FAIconCameraRetro"] = @(FAIconCameraRetro);
		tmp[@"FAIconKey"] = @(FAIconKey);
		tmp[@"FAIconCogs"] = @(FAIconCogs);
		tmp[@"FAIconComments"] = @(FAIconComments);
		tmp[@"FAIconThumbsUp"] = @(FAIconThumbsUp);
		tmp[@"FAIconThumbsDown"] = @(FAIconThumbsDown);
		tmp[@"FAIconStarHalf"] = @(FAIconStarHalf);
		tmp[@"FAIconHeartEmpty"] = @(FAIconHeartEmpty);
		tmp[@"FAIconSignout"] = @(FAIconSignout);
		tmp[@"FAIconLinkedinSign"] = @(FAIconLinkedinSign);
		tmp[@"FAIconPushpin"] = @(FAIconPushpin);
		tmp[@"FAIconExternalLink"] = @(FAIconExternalLink);
		tmp[@"FAIconSignin"] = @(FAIconSignin);
		tmp[@"FAIconTrophy"] = @(FAIconTrophy);
		tmp[@"FAIconGithubSign"] = @(FAIconGithubSign);
		tmp[@"FAIconUploadAlt"] = @(FAIconUploadAlt);
		tmp[@"FAIconLemon"] = @(FAIconLemon);
		tmp[@"FAIconPhone"] = @(FAIconPhone);
		tmp[@"FAIconCheckEmpty"] = @(FAIconCheckEmpty);
		tmp[@"FAIconBookmarkEmpty"] = @(FAIconBookmarkEmpty);
		tmp[@"FAIconPhoneSign"] = @(FAIconPhoneSign);
		tmp[@"FAIconTwitter"] = @(FAIconTwitter);
		tmp[@"FAIconFacebook"] = @(FAIconFacebook);
		tmp[@"FAIconGithub"] = @(FAIconGithub);
		tmp[@"FAIconUnlock"] = @(FAIconUnlock);
		tmp[@"FAIconCreditCard"] = @(FAIconCreditCard);
		tmp[@"FAIconRss"] = @(FAIconRss);
		tmp[@"FAIconHdd"] = @(FAIconHdd);
		tmp[@"FAIconBullhorn"] = @(FAIconBullhorn);
		tmp[@"FAIconBell"] = @(FAIconBell);
		tmp[@"FAIconCertificate"] = @(FAIconCertificate);
		tmp[@"FAIconHandRight"] = @(FAIconHandRight);
		tmp[@"FAIconHandLeft"] = @(FAIconHandLeft);
		tmp[@"FAIconHandUp"] = @(FAIconHandUp);
		tmp[@"FAIconHandDown"] = @(FAIconHandDown);
		tmp[@"FAIconCircleArrowLeft"] = @(FAIconCircleArrowLeft);
		tmp[@"FAIconCircleArrowRight"] = @(FAIconCircleArrowRight);
		tmp[@"FAIconCircleArrowUp"] = @(FAIconCircleArrowUp);
		tmp[@"FAIconCircleArrowDown"] = @(FAIconCircleArrowDown);
		tmp[@"FAIconGlobe"] = @(FAIconGlobe);
		tmp[@"FAIconWrench"] = @(FAIconWrench);
		tmp[@"FAIconTasks"] = @(FAIconTasks);
		tmp[@"FAIconFilter"] = @(FAIconFilter);
		tmp[@"FAIconBriefcase"] = @(FAIconBriefcase);
		tmp[@"FAIconFullscreen"] = @(FAIconFullscreen);
		tmp[@"FAIconGroup"] = @(FAIconGroup);
		tmp[@"FAIconLink"] = @(FAIconLink);
		tmp[@"FAIconCloud"] = @(FAIconCloud);
		tmp[@"FAIconBeaker"] = @(FAIconBeaker);
		tmp[@"FAIconCut"] = @(FAIconCut);
		tmp[@"FAIconCopy"] = @(FAIconCopy);
		tmp[@"FAIconPaperClip"] = @(FAIconPaperClip);
		tmp[@"FAIconSave"] = @(FAIconSave);
		tmp[@"FAIconSignBlank"] = @(FAIconSignBlank);
		tmp[@"FAIconReorder"] = @(FAIconReorder);
		tmp[@"FAIconListUl"] = @(FAIconListUl);
		tmp[@"FAIconListOl"] = @(FAIconListOl);
		tmp[@"FAIconStrikethrough"] = @(FAIconStrikethrough);
		tmp[@"FAIconUnderline"] = @(FAIconUnderline);
		tmp[@"FAIconTable"] = @(FAIconTable);
		tmp[@"FAIconMagic"] = @(FAIconMagic);
		tmp[@"FAIconTruck"] = @(FAIconTruck);
		tmp[@"FAIconPinterest"] = @(FAIconPinterest);
		tmp[@"FAIconPinterestSign"] = @(FAIconPinterestSign);
		tmp[@"FAIconGooglePlusSign"] = @(FAIconGooglePlusSign);
		tmp[@"FAIconGooglePlus"] = @(FAIconGooglePlus);
		tmp[@"FAIconMoney"] = @(FAIconMoney);
		tmp[@"FAIconCaretDown"] = @(FAIconCaretDown);
		tmp[@"FAIconCaretUp"] = @(FAIconCaretUp);
		tmp[@"FAIconCaretLeft"] = @(FAIconCaretLeft);
		tmp[@"FAIconCaretRight"] = @(FAIconCaretRight);
		tmp[@"FAIconColumns"] = @(FAIconColumns);
		tmp[@"FAIconSort"] = @(FAIconSort);
		tmp[@"FAIconSortDown"] = @(FAIconSortDown);
		tmp[@"FAIconSortUp"] = @(FAIconSortUp);
		tmp[@"FAIconEnvelopeAlt"] = @(FAIconEnvelopeAlt);
		tmp[@"FAIconLinkedin"] = @(FAIconLinkedin);
		tmp[@"FAIconUndo"] = @(FAIconUndo);
		tmp[@"FAIconLegal"] = @(FAIconLegal);
		tmp[@"FAIconDashboard"] = @(FAIconDashboard);
		tmp[@"FAIconCommentAlt"] = @(FAIconCommentAlt);
		tmp[@"FAIconCommentsAlt"] = @(FAIconCommentsAlt);
		tmp[@"FAIconBolt"] = @(FAIconBolt);
		tmp[@"FAIconSitemap"] = @(FAIconSitemap);
		tmp[@"FAIconUmbrella"] = @(FAIconUmbrella);
		tmp[@"FAIconPaste"] = @(FAIconPaste);
		tmp[@"FAIconUserMd"] = @(FAIconUserMd);
		enumDictionary = tmp;
	}
    
    return enumDictionary;
}

@end
