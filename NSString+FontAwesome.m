//
//  NSString+FontAwesome.m
//
//  Copyright (c) 2012 Alex Usbergo. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//

#import "NSString+FontAwesome.h"

@implementation NSString (FontAwesome)

#pragma mark - public

/* Returns the correct enum for a font-awesome icon.
 * The list of identifiers can be found here:
 * http://fortawesome.github.com/Font-awesome/#all-icons */
+ (FAIcon)fontAwesomeEnumForIconIdentifier:(NSString*)string
{
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
 * http://fortawesome.github.com/Font-awesome/#all-icons */
+ (NSString*)fontAwesomeIconStringForIconIdentifier:(NSString*)identifier
{
    return [self fontAwesomeIconStringForEnum:[self fontAwesomeEnumForIconIdentifier:identifier]];
}

#pragma mark - data initialization

+ (NSArray*)fontAwesomeIcons
{
    static NSArray *fontAwesomeIcons;
    if (nil == fontAwesomeIcons) {
        fontAwesomeIcons = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
    }
    return fontAwesomeIcons;
}

+ (NSDictionary*)enumDictionary
{
	static NSDictionary *enumDictionary;
	if (nil == enumDictionary) {
		NSMutableDictionary *tmp = [[NSMutableDictionary alloc] init];
		tmp[@"icon-glass"] = @(FAIconGlass);
    tmp[@"icon-music"] = @(FAIconMusic);
    tmp[@"icon-search"] = @(FAIconSearch);
    tmp[@"icon-envelope"] = @(FAIconEnvelope);
    tmp[@"icon-heart"] = @(FAIconHeart);
    tmp[@"icon-star"] = @(FAIconStar);
    tmp[@"icon-star-empty"] = @(FAIconStarEmpty);
    tmp[@"icon-user"] = @(FAIconUser);
    tmp[@"icon-film"] = @(FAIconFilm);
    tmp[@"icon-th-large"] = @(FAIconThLarge);
    tmp[@"icon-th"] = @(FAIconTh);
    tmp[@"icon-th-list"] = @(FAIconThList);
    tmp[@"icon-ok"] = @(FAIconOk);
    tmp[@"icon-remove"] = @(FAIconRemove);
    tmp[@"icon-zoom-in"] = @(FAIconZoomIn);
    tmp[@"icon-zoom-out"] = @(FAIconZoomOut);
    tmp[@"icon-off"] = @(FAIconOff);
    tmp[@"icon-signal"] = @(FAIconSignal);
    tmp[@"icon-cog"] = @(FAIconCog);
    tmp[@"icon-trash"] = @(FAIconTrash);
    tmp[@"icon-home"] = @(FAIconHome);
    tmp[@"icon-file"] = @(FAIconFile);
    tmp[@"icon-time"] = @(FAIconTime);
    tmp[@"icon-road"] = @(FAIconRoad);
    tmp[@"icon-download-alt"] = @(FAIconDownloadAlt);
    tmp[@"icon-download"] = @(FAIconDownload);
    tmp[@"icon-upload"] = @(FAIconUpload);
    tmp[@"icon-inbox"] = @(FAIconInbox);
    tmp[@"icon-play-circle"] = @(FAIconPlayCircle);
    tmp[@"icon-repeat"] = @(FAIconRepeat);
    tmp[@"icon-refresh"] = @(FAIconRefresh);
    tmp[@"icon-list-alt"] = @(FAIconListAlt);
    tmp[@"icon-lock"] = @(FAIconLock);
    tmp[@"icon-flag"] = @(FAIconFlag);
    tmp[@"icon-headphones"] = @(FAIconHeadphones);
    tmp[@"icon-volume-off"] = @(FAIconVolumeOff);
    tmp[@"icon-volume-down"] = @(FAIconVolumeDown);
    tmp[@"icon-volume-up"] = @(FAIconVolumeUp);
    tmp[@"icon-qrcode"] = @(FAIconQrcode);
    tmp[@"icon-barcode"] = @(FAIconBarcode);
    tmp[@"icon-tag"] = @(FAIconTag);
    tmp[@"icon-tags"] = @(FAIconTags);
    tmp[@"icon-book"] = @(FAIconBook);
    tmp[@"icon-bookmark"] = @(FAIconBookmark);
    tmp[@"icon-print"] = @(FAIconPrint);
    tmp[@"icon-camera"] = @(FAIconCamera);
    tmp[@"icon-font"] = @(FAIconFont);
    tmp[@"icon-bold"] = @(FAIconBold);
    tmp[@"icon-italic"] = @(FAIconItalic);
    tmp[@"icon-text-height"] = @(FAIconTextHeight);
    tmp[@"icon-text-width"] = @(FAIconTextWidth);
    tmp[@"icon-align-left"] = @(FAIconAlignLeft);
    tmp[@"icon-align-center"] = @(FAIconAlignCenter);
    tmp[@"icon-align-right"] = @(FAIconAlignRight);
    tmp[@"icon-align-justify"] = @(FAIconAlignJustify);
    tmp[@"icon-list"] = @(FAIconList);
    tmp[@"icon-indent-left"] = @(FAIconIndentLeft);
    tmp[@"icon-indent-right"] = @(FAIconIndentRight);
    tmp[@"icon-facetime-video"] = @(FAIconFacetimeVideo);
    tmp[@"icon-picture"] = @(FAIconPicture);
    tmp[@"icon-pencil"] = @(FAIconPencil);
    tmp[@"icon-map-marker"] = @(FAIconMapMarker);
    tmp[@"icon-adjust"] = @(FAIconAdjust);
    tmp[@"icon-tint"] = @(FAIconTint);
    tmp[@"icon-edit"] = @(FAIconEdit);
    tmp[@"icon-share"] = @(FAIconShare);
    tmp[@"icon-check"] = @(FAIconCheck);
    tmp[@"icon-move"] = @(FAIconMove);
    tmp[@"icon-step-backward"] = @(FAIconStepBackward);
    tmp[@"icon-fast-backward"] = @(FAIconFastBackward);
    tmp[@"icon-backward"] = @(FAIconBackward);
    tmp[@"icon-play"] = @(FAIconPlay);
    tmp[@"icon-pause"] = @(FAIconPause);
    tmp[@"icon-stop"] = @(FAIconStop);
    tmp[@"icon-forward"] = @(FAIconForward);
    tmp[@"icon-fast-forward"] = @(FAIconFastForward);
    tmp[@"icon-step-forward"] = @(FAIconStepForward);
    tmp[@"icon-eject"] = @(FAIconEject);
    tmp[@"icon-chevron-left"] = @(FAIconChevronLeft);
    tmp[@"icon-chevron-right"] = @(FAIconChevronRight);
    tmp[@"icon-plus-sign"] = @(FAIconPlusSign);
    tmp[@"icon-minus-sign"] = @(FAIconMinusSign);
    tmp[@"icon-remove-sign"] = @(FAIconRemoveSign);
    tmp[@"icon-ok-sign"] = @(FAIconOkSign);
    tmp[@"icon-question-sign"] = @(FAIconQuestionSign);
    tmp[@"icon-info-sign"] = @(FAIconInfoSign);
    tmp[@"icon-screenshot"] = @(FAIconScreenshot);
    tmp[@"icon-remove-circle"] = @(FAIconRemoveCircle);
    tmp[@"icon-ok-circle"] = @(FAIconOkCircle);
    tmp[@"icon-ban-circle"] = @(FAIconBanCircle);
    tmp[@"icon-arrow-left"] = @(FAIconArrowLeft);
    tmp[@"icon-arrow-right"] = @(FAIconArrowRight);
    tmp[@"icon-arrow-up"] = @(FAIconArrowUp);
    tmp[@"icon-arrow-down"] = @(FAIconArrowDown);
    tmp[@"icon-share-alt"] = @(FAIconShareAlt);
    tmp[@"icon-resize-full"] = @(FAIconResizeFull);
    tmp[@"icon-resize-small"] = @(FAIconResizeSmall);
    tmp[@"icon-plus"] = @(FAIconPlus);
    tmp[@"icon-minus"] = @(FAIconMinus);
    tmp[@"icon-asterisk"] = @(FAIconAsterisk);
    tmp[@"icon-exclamation-sign"] = @(FAIconExclamationSign);
    tmp[@"icon-gift"] = @(FAIconGift);
    tmp[@"icon-leaf"] = @(FAIconLeaf);
    tmp[@"icon-fire"] = @(FAIconFire);
    tmp[@"icon-eye-open"] = @(FAIconEyeOpen);
    tmp[@"icon-eye-close"] = @(FAIconEyeClose);
    tmp[@"icon-warning-sign"] = @(FAIconWarningSign);
    tmp[@"icon-plane"] = @(FAIconPlane);
    tmp[@"icon-calendar"] = @(FAIconCalendar);
    tmp[@"icon-random"] = @(FAIconRandom);
    tmp[@"icon-comment"] = @(FAIconComment);
    tmp[@"icon-magnet"] = @(FAIconMagnet);
    tmp[@"icon-chevron-up"] = @(FAIconChevronUp);
    tmp[@"icon-chevron-down"] = @(FAIconChevronDown);
    tmp[@"icon-retweet"] = @(FAIconRetweet);
    tmp[@"icon-shopping-cart"] = @(FAIconShoppingCart);
    tmp[@"icon-folder-close"] = @(FAIconFolderClose);
    tmp[@"icon-folder-open"] = @(FAIconFolderOpen);
    tmp[@"icon-resize-vertical"] = @(FAIconResizeVertical);
    tmp[@"icon-resize-horizontal"] = @(FAIconResizeHorizontal);
    tmp[@"icon-bar-chart"] = @(FAIconBarChart);
    tmp[@"icon-twitter-sign"] = @(FAIconTwitterSign);
    tmp[@"icon-facebook-sign"] = @(FAIconFacebookSign);
    tmp[@"icon-camera-retro"] = @(FAIconCameraRetro);
    tmp[@"icon-key"] = @(FAIconKey);
    tmp[@"icon-cogs"] = @(FAIconCogs);
    tmp[@"icon-comments"] = @(FAIconComments);
    tmp[@"icon-thumbs-up"] = @(FAIconThumbsUp);
    tmp[@"icon-thumbs-down"] = @(FAIconThumbsDown);
    tmp[@"icon-star-half"] = @(FAIconStarHalf);
    tmp[@"icon-heart-empty"] = @(FAIconHeartEmpty);
    tmp[@"icon-signout"] = @(FAIconSignout);
    tmp[@"icon-linkedin-sign"] = @(FAIconLinkedinSign);
    tmp[@"icon-pushpin"] = @(FAIconPushpin);
    tmp[@"icon-external-link"] = @(FAIconExternalLink);
    tmp[@"icon-signin"] = @(FAIconSignin);
    tmp[@"icon-trophy"] = @(FAIconTrophy);
    tmp[@"icon-github-sign"] = @(FAIconGithubSign);
    tmp[@"icon-upload-alt"] = @(FAIconUploadAlt);
    tmp[@"icon-lemon"] = @(FAIconLemon);
    tmp[@"icon-phone"] = @(FAIconPhone);
    tmp[@"icon-check-empty"] = @(FAIconCheckEmpty);
    tmp[@"icon-bookmark-empty"] = @(FAIconBookmarkEmpty);
    tmp[@"icon-phone-sign"] = @(FAIconPhoneSign);
    tmp[@"icon-twitter"] = @(FAIconTwitter);
    tmp[@"icon-facebook"] = @(FAIconFacebook);
    tmp[@"icon-github"] = @(FAIconGithub);
    tmp[@"icon-unlock"] = @(FAIconUnlock);
    tmp[@"icon-credit-card"] = @(FAIconCreditCard);
    tmp[@"icon-rss"] = @(FAIconRss);
    tmp[@"icon-hdd"] = @(FAIconHdd);
    tmp[@"icon-bullhorn"] = @(FAIconBullhorn);
    tmp[@"icon-bell"] = @(FAIconBell);
    tmp[@"icon-certificate"] = @(FAIconCertificate);
    tmp[@"icon-hand-right"] = @(FAIconHandRight);
    tmp[@"icon-hand-left"] = @(FAIconHandLeft);
    tmp[@"icon-hand-up"] = @(FAIconHandUp);
    tmp[@"icon-hand-down"] = @(FAIconHandDown);
    tmp[@"icon-circle-arrow-left"] = @(FAIconCircleArrowLeft);
    tmp[@"icon-circle-arrow-right"] = @(FAIconCircleArrowRight);
    tmp[@"icon-circle-arrow-up"] = @(FAIconCircleArrowUp);
    tmp[@"icon-circle-arrow-down"] = @(FAIconCircleArrowDown);
    tmp[@"icon-globe"] = @(FAIconGlobe);
    tmp[@"icon-wrench"] = @(FAIconWrench);
    tmp[@"icon-tasks"] = @(FAIconTasks);
    tmp[@"icon-filter"] = @(FAIconFilter);
    tmp[@"icon-briefcase"] = @(FAIconBriefcase);
    tmp[@"icon-fullscreen"] = @(FAIconFullscreen);
    tmp[@"icon-group"] = @(FAIconGroup);
    tmp[@"icon-link"] = @(FAIconLink);
    tmp[@"icon-cloud"] = @(FAIconCloud);
    tmp[@"icon-beaker"] = @(FAIconBeaker);
    tmp[@"icon-cut"] = @(FAIconCut);
    tmp[@"icon-copy"] = @(FAIconCopy);
    tmp[@"icon-paper-clip"] = @(FAIconPaperClip);
    tmp[@"icon-save"] = @(FAIconSave);
    tmp[@"icon-sign-blank"] = @(FAIconSignBlank);
    tmp[@"icon-reorder"] = @(FAIconReorder);
    tmp[@"icon-list-ul"] = @(FAIconListUl);
    tmp[@"icon-list-ol"] = @(FAIconListOl);
    tmp[@"icon-strikethrough"] = @(FAIconStrikethrough);
    tmp[@"icon-underline"] = @(FAIconUnderline);
    tmp[@"icon-table"] = @(FAIconTable);
    tmp[@"icon-magic"] = @(FAIconMagic);
    tmp[@"icon-truck"] = @(FAIconTruck);
    tmp[@"icon-pinterest"] = @(FAIconPinterest);
    tmp[@"icon-pinterest-sign"] = @(FAIconPinterestSign);
    tmp[@"icon-google-plus-sign"] = @(FAIconGooglePlusSign);
    tmp[@"icon-google-plus"] = @(FAIconGooglePlus);
    tmp[@"icon-money"] = @(FAIconMoney);
    tmp[@"icon-caret-down"] = @(FAIconCaretDown);
    tmp[@"icon-caret-up"] = @(FAIconCaretUp);
    tmp[@"icon-caret-left"] = @(FAIconCaretLeft);
    tmp[@"icon-caret-right"] = @(FAIconCaretRight);
    tmp[@"icon-columns"] = @(FAIconColumns);
    tmp[@"icon-sort"] = @(FAIconSort);
    tmp[@"icon-sort-down"] = @(FAIconSortDown);
    tmp[@"icon-sort-up"] = @(FAIconSortUp);
    tmp[@"icon-envelope-alt"] = @(FAIconEnvelopeAlt);
    tmp[@"icon-linkedin"] = @(FAIconLinkedin);
    tmp[@"icon-undo"] = @(FAIconUndo);
    tmp[@"icon-legal"] = @(FAIconLegal);
    tmp[@"icon-dashboard"] = @(FAIconDashboard);
    tmp[@"icon-comment-alt"] = @(FAIconCommentAlt);
    tmp[@"icon-comments-alt"] = @(FAIconCommentsAlt);
    tmp[@"icon-bolt"] = @(FAIconBolt);
    tmp[@"icon-sitemap"] = @(FAIconSitemap);
    tmp[@"icon-umbrella"] = @(FAIconUmbrella);
    tmp[@"icon-paste"] = @(FAIconPaste);
    tmp[@"icon-lightbulb"] = @(FAIconLightbulb);
    tmp[@"icon-exchange"] = @(FAIconExchange);
    tmp[@"icon-cloud-download"] = @(FAIconCloudDownload);
    tmp[@"icon-cloud-upload"] = @(FAIconCloudUpload);
    tmp[@"icon-user-md"] = @(FAIconUserMd);
    tmp[@"icon-stethoscope"] = @(FAIconStethoscope);
    tmp[@"icon-suitcase"] = @(FAIconSuitcase);
    tmp[@"icon-bell-alt"] = @(FAIconBellAlt);
    tmp[@"icon-coffee"] = @(FAIconCoffee);
    tmp[@"icon-food"] = @(FAIconFood);
    tmp[@"icon-file-alt"] = @(FAIconFileAlt);
    tmp[@"icon-building"] = @(FAIconBuilding);
    tmp[@"icon-hospital"] = @(FAIconHospital);
    tmp[@"icon-ambulance"] = @(FAIconAmbulance);
    tmp[@"icon-medkit"] = @(FAIconMedkit);
    tmp[@"icon-fighter-jet"] = @(FAIconFighterJet);
    tmp[@"icon-beer"] = @(FAIconBeer);
    tmp[@"icon-h-sign"] = @(FAIconHSign);
    tmp[@"icon-plus-sign-alt"] = @(FAIconPlusSignAlt);
    tmp[@"icon-double-angle-left"] = @(FAIconDoubleAngleLeft);
    tmp[@"icon-double-angle-right"] = @(FAIconDoubleAngleRight);
    tmp[@"icon-double-angle-up"] = @(FAIconDoubleAngleUp);
    tmp[@"icon-double-angle-down"] = @(FAIconDoubleAngleDown);
    tmp[@"icon-angle-left"] = @(FAIconAngleLeft);
    tmp[@"icon-angle-right"] = @(FAIconAngleRight);
    tmp[@"icon-angle-up"] = @(FAIconAngleUp);
    tmp[@"icon-angle-down"] = @(FAIconAngleDown);
    tmp[@"icon-desktop"] = @(FAIconDesktop);
    tmp[@"icon-laptop"] = @(FAIconLaptop);
    tmp[@"icon-tablet"] = @(FAIconTablet);
    tmp[@"icon-mobile-phone"] = @(FAIconMobilePhone);
    tmp[@"icon-circle-blank"] = @(FAIconCircleBlank);
    tmp[@"icon-quote-left"] = @(FAIconQuoteLeft);
    tmp[@"icon-quote-right"] = @(FAIconQuoteRight);
    tmp[@"icon-spinner"] = @(FAIconSpinner);
    tmp[@"icon-circle"] = @(FAIconCircle);
    tmp[@"icon-reply"] = @(FAIconReply);
    tmp[@"icon-folder-close-alt"] = @(FAIconFolderCloseAlt);
    tmp[@"icon-folder-open-alt"] = @(FAIconFolderOpenAlt);
    tmp[@"icon-expand-alt"] = @(FAIconExpandAlt);
    tmp[@"icon-collapse-alt"] = @(FAIconCollapseAlt);
    tmp[@"icon-smile"] = @(FAIconSmile);
    tmp[@"icon-frown"] = @(FAIconFrown);
    tmp[@"icon-meh"] = @(FAIconMeh);
    tmp[@"icon-gamepad"] = @(FAIconGamepad);
    tmp[@"icon-keyboard"] = @(FAIconKeyboard);
    tmp[@"icon-flag-alt"] = @(FAIconFlagAlt);
    tmp[@"icon-flag-checkered"] = @(FAIconFlagCheckered);
    tmp[@"icon-terminal"] = @(FAIconTerminal);
    tmp[@"icon-code"] = @(FAIconCode);
    tmp[@"icon-reply-all"] = @(FAIconReplyAll);
    tmp[@"icon-mail-reply-all"] = @(FAIconMailReplyAll);
    tmp[@"icon-star-half-full"] = @(FAIconStarHalfFull);
    tmp[@"icon-star-half-empty"] = @(FAIconStarHalfEmpty);
    tmp[@"icon-location-arrow"] = @(FAIconLocationArrow);
    tmp[@"icon-crop"] = @(FAIconCrop);
    tmp[@"icon-code-fork"] = @(FAIconCodeFork);
    tmp[@"icon-unlink"] = @(FAIconUnlink);
    tmp[@"icon-question"] = @(FAIconQuestion);
    tmp[@"icon-info"] = @(FAIconInfo);
    tmp[@"icon-exclamation"] = @(FAIconExclamation);
    tmp[@"icon-superscript"] = @(FAIconSuperscript);
    tmp[@"icon-subscript"] = @(FAIconSubscript);
    tmp[@"icon-eraser"] = @(FAIconEraser);
    tmp[@"icon-puzzle-piece"] = @(FAIconPuzzlePiece);
    tmp[@"icon-microphone"] = @(FAIconMicrophone);
    tmp[@"icon-microphone-off"] = @(FAIconMicrophoneOff);
    tmp[@"icon-shield"] = @(FAIconShield);
    tmp[@"icon-calendar-empty"] = @(FAIconCalendarEmpty);
    tmp[@"icon-fire-extinguisher"] = @(FAIconFireExtinguisher);
    tmp[@"icon-rocket"] = @(FAIconRocket);
    tmp[@"icon-maxcdn"] = @(FAIconMaxcdn);
    tmp[@"icon-chevron-sign-left"] = @(FAIconChevronSignLeft);
    tmp[@"icon-chevron-sign-right"] = @(FAIconChevronSignRight);
    tmp[@"icon-chevron-sign-up"] = @(FAIconChevronSignUp);
    tmp[@"icon-chevron-sign-down"] = @(FAIconChevronSignDown);
    tmp[@"icon-html5"] = @(FAIconHtml5);
    tmp[@"icon-css3"] = @(FAIconCss3);
    tmp[@"icon-anchor"] = @(FAIconAnchor);
    tmp[@"icon-unlock-alt"] = @(FAIconUnlockAlt);
    tmp[@"icon-bullseye"] = @(FAIconBullseye);
    tmp[@"icon-ellipsis-horizontal"] = @(FAIconEllipsisHorizontal);
    tmp[@"icon-ellipsis-vertical"] = @(FAIconEllipsisVertical);
    tmp[@"icon-rss-sign"] = @(FAIconRssSign);
    tmp[@"icon-play-sign"] = @(FAIconPlaySign);
    tmp[@"icon-ticket"] = @(FAIconTicket);
    tmp[@"icon-minus-sign-alt"] = @(FAIconMinusSignAlt);
    tmp[@"icon-check-minus"] = @(FAIconCheckMinus);
    tmp[@"icon-level-up"] = @(FAIconLevelUp);
    tmp[@"icon-level-down"] = @(FAIconLevelDown);
    tmp[@"icon-check-sign"] = @(FAIconCheckSign);
    tmp[@"icon-edit-sign"] = @(FAIconEditSign);
    tmp[@"icon-external-link-sign"] = @(FAIconExternalLinkSign);
    tmp[@"icon-share-sign"] = @(FAIconShareSign);
		enumDictionary = tmp;
	}
    
    return enumDictionary;
}

@end
