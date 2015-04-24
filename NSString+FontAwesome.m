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

#pragma mark - Public API
+ (FAIcon)fontAwesomeEnumForIconIdentifier:(NSString*)string {
    NSDictionary *enums = [self enumDictionary];
    return [enums[string] integerValue];
}

+ (NSString*)fontAwesomeIconStringForEnum:(FAIcon)value {
    return [NSString fontAwesomeUnicodeStrings][value];
}

+ (NSString*)fontAwesomeIconStringForIconIdentifier:(NSString*)identifier {
    return [self fontAwesomeIconStringForEnum:[self fontAwesomeEnumForIconIdentifier:identifier]];
}


#pragma mark - Data Initialization
+ (NSArray *)fontAwesomeUnicodeStrings {
    
    static NSArray *fontAwesomeUnicodeStrings;
    
    static dispatch_once_t unicodeStringsOnceToken;
    dispatch_once(&unicodeStringsOnceToken, ^{
        
            fontAwesomeUnicodeStrings = @[@"\uf000", @"\uf001", @"\uf002", @"\uf003", @"\uf004", @"\uf005", @"\uf006", @"\uf007", @"\uf008", @"\uf009", @"\uf00a", @"\uf00b", @"\uf00c", @"\uf00d", @"\uf00e", @"\uf010", @"\uf011", @"\uf012", @"\uf013", @"\uf014", @"\uf015", @"\uf016", @"\uf017", @"\uf018", @"\uf019", @"\uf01a", @"\uf01b", @"\uf01c", @"\uf01d", @"\uf01e", @"\uf021", @"\uf022", @"\uf023", @"\uf024", @"\uf025", @"\uf026", @"\uf027", @"\uf028", @"\uf029", @"\uf02a", @"\uf02b", @"\uf02c", @"\uf02d", @"\uf02e", @"\uf02f", @"\uf030", @"\uf031", @"\uf032", @"\uf033", @"\uf034", @"\uf035", @"\uf036", @"\uf037", @"\uf038", @"\uf039", @"\uf03a", @"\uf03b", @"\uf03c", @"\uf03d", @"\uf03e", @"\uf040", @"\uf041", @"\uf042", @"\uf043", @"\uf044", @"\uf045", @"\uf046", @"\uf047", @"\uf048", @"\uf049", @"\uf04a", @"\uf04b", @"\uf04c", @"\uf04d", @"\uf04e", @"\uf050", @"\uf051", @"\uf052", @"\uf053", @"\uf054", @"\uf055", @"\uf056", @"\uf057", @"\uf058", @"\uf059", @"\uf05a", @"\uf05b", @"\uf05c", @"\uf05d", @"\uf05e", @"\uf060", @"\uf061", @"\uf062", @"\uf063", @"\uf064", @"\uf065", @"\uf066", @"\uf067", @"\uf068", @"\uf069", @"\uf06a", @"\uf06b", @"\uf06c", @"\uf06d", @"\uf06e", @"\uf070", @"\uf071", @"\uf072", @"\uf073", @"\uf074", @"\uf075", @"\uf076", @"\uf077", @"\uf078", @"\uf079", @"\uf07a", @"\uf07b", @"\uf07c", @"\uf07d", @"\uf07e", @"\uf080", @"\uf081", @"\uf082", @"\uf083", @"\uf084", @"\uf085", @"\uf086", @"\uf087", @"\uf088", @"\uf089", @"\uf08a", @"\uf08b", @"\uf08c", @"\uf08d", @"\uf08e", @"\uf090", @"\uf091", @"\uf092", @"\uf093", @"\uf094", @"\uf095", @"\uf096", @"\uf097", @"\uf098", @"\uf099", @"\uf09a", @"\uf09b", @"\uf09c", @"\uf09d", @"\uf09e", @"\uf0a0", @"\uf0a1", @"\uf0f3", @"\uf0a3", @"\uf0a4", @"\uf0a5", @"\uf0a6", @"\uf0a7", @"\uf0a8", @"\uf0a9", @"\uf0aa", @"\uf0ab", @"\uf0ac", @"\uf0ad", @"\uf0ae", @"\uf0b0", @"\uf0b1", @"\uf0b2", @"\uf0c0", @"\uf0c1", @"\uf0c2", @"\uf0c3", @"\uf0c4", @"\uf0c5", @"\uf0c6", @"\uf0c7", @"\uf0c8", @"\uf0c9", @"\uf0ca", @"\uf0cb", @"\uf0cc", @"\uf0cd", @"\uf0ce", @"\uf0d0", @"\uf0d1", @"\uf0d2", @"\uf0d3", @"\uf0d4", @"\uf0d5", @"\uf0d6", @"\uf0d7", @"\uf0d8", @"\uf0d9", @"\uf0da", @"\uf0db", @"\uf0dc", @"\uf0dd", @"\uf0de", @"\uf0e0", @"\uf0e1", @"\uf0e2", @"\uf0e3", @"\uf0e4", @"\uf0e5", @"\uf0e6", @"\uf0e7", @"\uf0e8", @"\uf0e9", @"\uf0ea", @"\uf0eb", @"\uf0ec", @"\uf0ed", @"\uf0ee", @"\uf0f0", @"\uf0f1", @"\uf0f2", @"\uf0a2", @"\uf0f4", @"\uf0f5", @"\uf0f6", @"\uf0f7", @"\uf0f8", @"\uf0f9", @"\uf0fa", @"\uf0fb", @"\uf0fc", @"\uf0fd", @"\uf0fe", @"\uf100", @"\uf101", @"\uf102", @"\uf103", @"\uf104", @"\uf105", @"\uf106", @"\uf107", @"\uf108", @"\uf109", @"\uf10a", @"\uf10b", @"\uf10c", @"\uf10d", @"\uf10e", @"\uf110", @"\uf111", @"\uf112", @"\uf113", @"\uf114", @"\uf115", @"\uf118", @"\uf119", @"\uf11a", @"\uf11b", @"\uf11c", @"\uf11d", @"\uf11e", @"\uf120", @"\uf121", @"\uf122", @"\uf122", @"\uf123", @"\uf124", @"\uf125", @"\uf126", @"\uf127", @"\uf128", @"\uf129", @"\uf12a", @"\uf12b", @"\uf12c", @"\uf12d", @"\uf12e", @"\uf130", @"\uf131", @"\uf132", @"\uf133", @"\uf134", @"\uf135", @"\uf136", @"\uf137", @"\uf138", @"\uf139", @"\uf13a", @"\uf13b", @"\uf13c", @"\uf13d", @"\uf13e", @"\uf140", @"\uf141", @"\uf142", @"\uf143", @"\uf144", @"\uf145", @"\uf146", @"\uf147", @"\uf148", @"\uf149", @"\uf14a", @"\uf14b", @"\uf14c", @"\uf14d", @"\uf14e", @"\uf150", @"\uf151", @"\uf152", @"\uf153", @"\uf154", @"\uf155", @"\uf156", @"\uf157", @"\uf158", @"\uf159", @"\uf15a", @"\uf15b", @"\uf15c", @"\uf15d", @"\uf15e", @"\uf160", @"\uf161", @"\uf162", @"\uf163", @"\uf164", @"\uf165", @"\uf166", @"\uf167", @"\uf168", @"\uf169", @"\uf16a", @"\uf16b", @"\uf16c", @"\uf16d", @"\uf16e", @"\uf170", @"\uf171", @"\uf172", @"\uf173", @"\uf174", @"\uf175", @"\uf176", @"\uf177", @"\uf178", @"\uf179", @"\uf17a", @"\uf17b", @"\uf17c", @"\uf17d", @"\uf17e", @"\uf180", @"\uf181", @"\uf182", @"\uf183", @"\uf184", @"\uf185", @"\uf186", @"\uf187", @"\uf188", @"\uf189", @"\uf18a", @"\uf18b", @"\uf18c", @"\uf18d", @"\uf18e", @"\uf190", @"\uf191", @"\uf192", @"\uf193", @"\uf194", @"\uf195", @"\uf196",
            /* Font Awesome ver 4.10 */
            @"\uf1b9", @"\uf19c", @"\uf1b4", @"\uf1b5", @"\uf1e2", @"\uf1ad", @"\uf1ba", @"\uf1b9", @"\uf1ae", @"\uf1ce", @"\uf1db", @"\uf1cb", @"\uf1b2", @"\uf1b3", @"\uf1c0", @"\uf1a5", @"\uf1bd", @"\uf1a6", @"\uf1a9", @"\uf1d1", @"\uf199", @"\uf1ac", @"\uf1c6", @"\uf1c7", @"\uf1c9", @"\uf1c3", @"\uf1c5", @"\uf1c8", @"\uf1c1", @"\uf1c5", @"\uf1c5", @"\uf1c4", @"\uf1c7", @"\uf1c8", @"\uf1c2", @"\uf1c6", @"\uf1d1", @"\uf1d3", @"\uf1d2", @"\uf1a0", @"\uf19d", @"\uf1d4", @"\uf1dc", @"\uf1da", @"\uf19c", @"\uf1aa", @"\uf1cc", @"\uf1ab", @"\uf1cd", @"\uf1cd", @"\uf1cd", @"\uf19d", @"\uf19b", @"\uf1d8", @"\uf1d9", @"\uf1dd", @"\uf1b0", @"\uf1a7", @"\uf1a8", @"\uf1a7", @"\uf1d6", @"\uf1d0", @"\uf1d0", @"\uf1b8", @"\uf1a1", @"\uf1a2", @"\uf1d8", @"\uf1d9", @"\uf1e0", @"\uf1e1", @"\uf198", @"\uf1de", @"\uf1be", @"\uf197", @"\uf1b1", @"\uf1bc", @"\uf1b6", @"\uf1b7", @"\uf1a4", @"\uf1a3", @"\uf1cd", @"\uf1ba", @"\uf1d5", @"\uf1bb", @"\uf19c", @"\uf1ca", @"\uf1d7", @"\uf1d7", @"\uf19a", @"\uf19e",
            /* Font Awesome ver 4.20 */
            @"\uf209", @"\uf1fe", @"\uf1fa", @"\uf1f6", @"\uf1f7", @"\uf206", @"\uf1e5", @"\uf1fd", @"\uf207", @"\uf1ec", @"\uf20a", @"\uf1f3", @"\uf1f2", @"\uf1f1", @"\uf1f4", @"\uf1f5", @"\uf1f0", @"\uf1f9", @"\uf1fb", @"\uf1e3", @"\uf1ee", @"\uf20b", @"\uf208", @"\uf202", @"\uf203", @"\uf201", @"\uf20c", @"\uf1ea", @"\uf1fc", @"\uf1ed", @"\uf200", @"\uf1e6", @"\uf20b", @"\uf20b", @"\uf1e7", @"\uf1e3", @"\uf204", @"\uf205", @"\uf1f8", @"\uf1e4", @"\uf1e8", @"\uf1eb", @"\uf1e9",
            /* Font Awesome ver 4.30 */
            @"\uf236", @"\uf20d", @"\uf218", @"\uf217;", @"\uf20e", @"\uf210", @"\uf219", @"\uf230", @"\uf211", @"\uf21e", @"\uf236", @"\uf212", @"\uf222", @"\uf227", @"\uf229", @"\uf22b", @"\uf22a", @"\uf23a", @"\uf223", @"\uf21c", @"\uf22c", @"\uf231", @"\uf213", @"\uf233", @"\uf21a", @"\uf214", @"\uf215", @"\uf216", @"\uf21d", @"\uf239", @"\uf238", @"\uf224", @"\uf225", @"\uf234", @"\uf21b", @"\uf235", @"\uf221", @"\uf226", @"\uf228", @"\uf237", @"\uf1e8", @"\uf1eb", @"\uf1e9"];
    });
    
    return fontAwesomeUnicodeStrings;
}

+ (NSDictionary *)enumDictionary {
    
	static NSDictionary *enumDictionary;
    
    static dispatch_once_t enumDictionaryOnceToken;
    dispatch_once(&enumDictionaryOnceToken, ^{
        
		NSMutableDictionary *tmp = [[NSMutableDictionary alloc] init];
        
        tmp[@"fa-glass"]				= @(FAGlass);
		tmp[@"fa-music"]				= @(FAMusic);
		tmp[@"fa-search"]				= @(FASearch);
		tmp[@"fa-envelope-o"]			= @(FAEnvelopeO);
		tmp[@"fa-heart"]				= @(FAHeart);
		tmp[@"fa-star"]					= @(FAStar);
		tmp[@"fa-star-o"]				= @(FAStarO);
		tmp[@"fa-user"]					= @(FAUser);
		tmp[@"fa-film"]					= @(FAFilm);
		tmp[@"fa-th-large"]				= @(FAThLarge);
		tmp[@"fa-th"]					= @(FATh);
		tmp[@"fa-th-list"]				= @(FAThList);
		tmp[@"fa-check"]				= @(FACheck);
		tmp[@"fa-times"]				= @(FATimes);
		tmp[@"fa-search-plus"]			= @(FASearchPlus);
		tmp[@"fa-search-minus"]			= @(FASearchMinus);
		tmp[@"fa-power-off"]			= @(FAPowerOff);
		tmp[@"fa-signal"]				= @(FASignal);
		tmp[@"fa-cog"]					= @(FACog);
		tmp[@"fa-trash-o"]				= @(FATrashO);
		tmp[@"fa-home"]					= @(FAHome);
		tmp[@"fa-file-o"]				= @(FAFileO);
		tmp[@"fa-clock-o"]				= @(FAClockO);
		tmp[@"fa-road"]					= @(FARoad);
		tmp[@"fa-download"]				= @(FADownload);
		tmp[@"fa-arrow-circle-o-down"]	= @(FAArrowCircleODown);
		tmp[@"fa-arrow-circle-o-up"]	= @(FAArrowCircleOUp);
		tmp[@"fa-inbox"]				= @(FAInbox);
		tmp[@"fa-play-circle-o"]		= @(FAPlayCircleO);
		tmp[@"fa-repeat"]				= @(FARepeat);
		tmp[@"fa-refresh"]				= @(FARefresh);
		tmp[@"fa-list-alt"]				= @(FAListAlt);
		tmp[@"fa-lock"]					= @(FALock);
		tmp[@"fa-flag"]					= @(FAFlag);
		tmp[@"fa-headphones"]			= @(FAHeadphones);
		tmp[@"fa-volume-off"]			= @(FAVolumeOff);
		tmp[@"fa-volume-down"]			= @(FAVolumeDown);
		tmp[@"fa-volume-up"]			= @(FAVolumeUp);
		tmp[@"fa-qrcode"]				= @(FAQrcode);
		tmp[@"fa-barcode"]				= @(FABarcode);
		tmp[@"fa-tag"]					= @(FATag);
		tmp[@"fa-tags"]					= @(FATags);
		tmp[@"fa-book"]					= @(FABook);
		tmp[@"fa-bookmark"]				= @(FABookmark);
		tmp[@"fa-print"]				= @(FAPrint);
		tmp[@"fa-camera"]				= @(FACamera);
		tmp[@"fa-font"]					= @(FAFont);
		tmp[@"fa-bold"]					= @(FABold);
		tmp[@"fa-italic"]				= @(FAItalic);
		tmp[@"fa-text-height"]			= @(FATextHeight);
		tmp[@"fa-text-width"]			= @(FATextWidth);
		tmp[@"fa-align-left"]			= @(FAAlignLeft);
		tmp[@"fa-align-center"]			= @(FAAlignCenter);
		tmp[@"fa-align-right"]			= @(FAAlignRight);
		tmp[@"fa-align-justify"]		= @(FAAlignJustify);
		tmp[@"fa-list"]					= @(FAList);
		tmp[@"fa-outdent"]				= @(FAOutdent);
		tmp[@"fa-indent"]				= @(FAIndent);
		tmp[@"fa-video-camera"]			= @(FAVideoCamera);
		tmp[@"fa-picture-o"]			= @(FAPictureO);
		tmp[@"fa-pencil"]				= @(FAPencil);
		tmp[@"fa-map-marker"]			= @(FAMapMarker);
		tmp[@"fa-adjust"]				= @(FAAdjust);
		tmp[@"fa-tint"]					= @(FATint);
		tmp[@"fa-pencil-square-o"]		= @(FAPencilSquareO);
		tmp[@"fa-share-square-o"]		= @(FAShareSquareO);
		tmp[@"fa-check-square-o"]		= @(FACheckSquareO);
		tmp[@"fa-arrows"]				= @(FAArrows);
		tmp[@"fa-step-backward"]		= @(FAStepBackward);
		tmp[@"fa-fast-backward"]		= @(FAFastBackward);
		tmp[@"fa-backward"]				= @(FABackward);
		tmp[@"fa-play"]					= @(FAPlay);
		tmp[@"fa-pause"]				= @(FAPause);
		tmp[@"fa-stop"]					= @(FAStop);
		tmp[@"fa-forward"]				= @(FAForward);
		tmp[@"fa-fast-forward"]			= @(FAFastForward);
		tmp[@"fa-step-forward"]			= @(FAStepForward);
		tmp[@"fa-eject"]				= @(FAEject);
		tmp[@"fa-chevron-left"]			= @(FAChevronLeft);
		tmp[@"fa-chevron-right"]		= @(FAChevronRight);
		tmp[@"fa-plus-circle"]			= @(FAPlusCircle);
		tmp[@"fa-minus-circle"]			= @(FAMinusCircle);
		tmp[@"fa-times-circle"]			= @(FATimesCircle);
		tmp[@"fa-check-circle"]			= @(FACheckCircle);
		tmp[@"fa-question-circle"]		= @(FAQuestionCircle);
		tmp[@"fa-info-circle"]			= @(FAInfoCircle);
		tmp[@"fa-crosshairs"]			= @(FACrosshairs);
		tmp[@"fa-times-circle-o"]		= @(FATimesCircleO);
		tmp[@"fa-check-circle-o"]		= @(FACheckCircleO);
		tmp[@"fa-ban"]					= @(FABan);
		tmp[@"fa-arrow-left"]			= @(FAArrowLeft);
		tmp[@"fa-arrow-right"]			= @(FAArrowRight);
		tmp[@"fa-arrow-up"]				= @(FAArrowUp);
		tmp[@"fa-arrow-down"]			= @(FAArrowDown);
		tmp[@"fa-share"]				= @(FAShare);
		tmp[@"fa-expand"]				= @(FAExpand);
		tmp[@"fa-compress"]				= @(FACompress);
		tmp[@"fa-plus"]					= @(FAPlus);
		tmp[@"fa-minus"]				= @(FAMinus);
		tmp[@"fa-asterisk"]				= @(FAAsterisk);
		tmp[@"fa-exclamation-circle"]	= @(FAExclamationCircle);
		tmp[@"fa-gift"]					= @(FAGift);
		tmp[@"fa-leaf"]					= @(FALeaf);
		tmp[@"fa-fire"]					= @(FAFire);
		tmp[@"fa-eye"]					= @(FAEye);
		tmp[@"fa-eye-slash"]			= @(FAEyeSlash);
		tmp[@"fa-exclamation-triangle"]	= @(FAExclamationTriangle);
		tmp[@"fa-plane"]				= @(FAPlane);
		tmp[@"fa-calendar"]				= @(FACalendar);
		tmp[@"fa-random"]				= @(FARandom);
		tmp[@"fa-comment"]				= @(FAComment);
		tmp[@"fa-magnet"]				= @(FAMagnet);
		tmp[@"fa-chevron-up"]			= @(FAChevronUp);
		tmp[@"fa-chevron-down"]			= @(FAChevronDown);
		tmp[@"fa-retweet"]				= @(FARetweet);
		tmp[@"fa-shopping-cart"]		= @(FAShoppingCart);
		tmp[@"fa-folder"]				= @(FAFolder);
		tmp[@"fa-folder-open"]			= @(FAFolderOpen);
		tmp[@"fa-arrows-v"]				= @(FAArrowsV);
		tmp[@"fa-arrows-h"]				= @(FAArrowsH);
		tmp[@"fa-bar-chart-o"]			= @(FABarChartO);
		tmp[@"fa-twitter-square"]		= @(FATwitterSquare);
		tmp[@"fa-facebook-square"]		= @(FAFacebookSquare);
		tmp[@"fa-camera-retro"]			= @(FACameraRetro);
		tmp[@"fa-key"]					= @(FAKey);
		tmp[@"fa-cogs"]					= @(FACogs);
		tmp[@"fa-comments"]				= @(FAComments);
		tmp[@"fa-thumbs-o-up"]			= @(FAThumbsOUp);
		tmp[@"fa-thumbs-o-down"]		= @(FAThumbsODown);
		tmp[@"fa-star-half"]			= @(FAStarHalf);
		tmp[@"fa-heart-o"]				= @(FAHeartO);
		tmp[@"fa-sign-out"]				= @(FASignOut);
		tmp[@"fa-linkedin-square"]		= @(FALinkedinSquare);
		tmp[@"fa-thumb-tack"]			= @(FAThumbTack);
		tmp[@"fa-external-link"]		= @(FAExternalLink);
		tmp[@"fa-sign-in"]				= @(FASignIn);
		tmp[@"fa-trophy"]				= @(FATrophy);
		tmp[@"fa-github-square"]		= @(FAGithubSquare);
		tmp[@"fa-upload"]				= @(FAUpload);
		tmp[@"fa-lemon-o"]				= @(FALemonO);
		tmp[@"fa-phone"]				= @(FAPhone);
		tmp[@"fa-square-o"]				= @(FASquareO);
		tmp[@"fa-bookmark-o"]			= @(FABookmarkO);
		tmp[@"fa-phone-square"]			= @(FAPhoneSquare);
		tmp[@"fa-twitter"]				= @(FATwitter);
		tmp[@"fa-facebook"]				= @(FAFacebook);
		tmp[@"fa-github"]				= @(FAGithub);
		tmp[@"fa-unlock"]				= @(FAUnlock);
		tmp[@"fa-credit-card"]			= @(FACreditCard);
		tmp[@"fa-rss"]					= @(FARss);
		tmp[@"fa-hdd-o"]				= @(FAHddO);
		tmp[@"fa-bullhorn"]				= @(FABullhorn);
		tmp[@"fa-bell"]					= @(FABell);
		tmp[@"fa-certificate"]			= @(FACertificate);
		tmp[@"fa-hand-o-right"]			= @(FAHandORight);
		tmp[@"fa-hand-o-left"]			= @(FAHandOLeft);
		tmp[@"fa-hand-o-up"]			= @(FAHandOUp);
		tmp[@"fa-hand-o-down"]			= @(FAHandODown);
		tmp[@"fa-arrow-circle-left"]	= @(FAArrowCircleLeft);
		tmp[@"fa-arrow-circle-right"]	= @(FAArrowCircleRight);
		tmp[@"fa-arrow-circle-up"]		= @(FAArrowCircleUp);
		tmp[@"fa-arrow-circle-down"]	= @(FAArrowCircleDown);
		tmp[@"fa-globe"]				= @(FAGlobe);
		tmp[@"fa-wrench"]				= @(FAWrench);
		tmp[@"fa-tasks"]				= @(FATasks);
		tmp[@"fa-filter"]				= @(FAFilter);
		tmp[@"fa-briefcase"]			= @(FABriefcase);
		tmp[@"fa-arrows-alt"]			= @(FAArrowsAlt);
		tmp[@"fa-users"]				= @(FAUsers);
		tmp[@"fa-link"]					= @(FALink);
		tmp[@"fa-cloud"]				= @(FACloud);
		tmp[@"fa-flask"]				= @(FAFlask);
		tmp[@"fa-scissors"]				= @(FAScissors);
		tmp[@"fa-files-o"]				= @(FAFilesO);
		tmp[@"fa-paperclip"]			= @(FAPaperclip);
		tmp[@"fa-floppy-o"]				= @(FAFloppyO);
		tmp[@"fa-square"]				= @(FASquare);
		tmp[@"fa-bars"]					= @(FABars);
		tmp[@"fa-list-ul"]				= @(FAListUl);
		tmp[@"fa-list-ol"]				= @(FAListOl);
		tmp[@"fa-strikethrough"]		= @(FAStrikethrough);
		tmp[@"fa-underline"]			= @(FAUnderline);
		tmp[@"fa-table"]				= @(FATable);
		tmp[@"fa-magic"]				= @(FAMagic);
		tmp[@"fa-truck"]				= @(FATruck);
		tmp[@"fa-pinterest"]			= @(FAPinterest);
		tmp[@"fa-pinterest-square"]		= @(FAPinterestSquare);
		tmp[@"fa-google-plus-square"]	= @(FAGooglePlusSquare);
		tmp[@"fa-google-plus"]			= @(FAGooglePlus);
		tmp[@"fa-money"]				= @(FAMoney);
		tmp[@"fa-caret-down"]			= @(FACaretDown);
		tmp[@"fa-caret-up"]				= @(FACaretUp);
		tmp[@"fa-caret-left"]			= @(FACaretLeft);
		tmp[@"fa-caret-right"]			= @(FACaretRight);
		tmp[@"fa-columns"]				= @(FAColumns);
		tmp[@"fa-sort"]					= @(FASort);
		tmp[@"fa-sort-asc"]				= @(FASortAsc);
		tmp[@"fa-sort-desc"]			= @(FASortDesc);
		tmp[@"fa-envelope"]				= @(FAEnvelope);
		tmp[@"fa-linkedin"]				= @(FALinkedin);
		tmp[@"fa-undo"]					= @(FAUndo);
		tmp[@"fa-gavel"]				= @(FAGavel);
		tmp[@"fa-tachometer"]			= @(FATachometer);
		tmp[@"fa-comment-o"]			= @(FACommentO);
		tmp[@"fa-comments-o"]			= @(FACommentsO);
		tmp[@"fa-bolt"]					= @(FABolt);
		tmp[@"fa-sitemap"]				= @(FASitemap);
		tmp[@"fa-umbrella"]				= @(FAUmbrella);
		tmp[@"fa-clipboard"]			= @(FAClipboard);
		tmp[@"fa-lightbulb-o"]			= @(FALightbulbO);
		tmp[@"fa-exchange"]				= @(FAExchange);
		tmp[@"fa-cloud-download"]		= @(FACloudDownload);
		tmp[@"fa-cloud-upload"]			= @(FACloudUpload);
		tmp[@"fa-user-md"]				= @(FAUserMd);
		tmp[@"fa-stethoscope"]			= @(FAStethoscope);
		tmp[@"fa-suitcase"]				= @(FASuitcase);
		tmp[@"fa-bell-o"]				= @(FABellO);
		tmp[@"fa-coffee"]				= @(FACoffee);
		tmp[@"fa-cutlery"]				= @(FACutlery);
		tmp[@"fa-file-text-o"]			= @(FAFileTextO);
		tmp[@"fa-building-o"]			= @(FABuildingO);
		tmp[@"fa-hospital-o"]			= @(FAHospitalO);
		tmp[@"fa-ambulance"]			= @(FAAmbulance);
		tmp[@"fa-medkit"]				= @(FAMedkit);
		tmp[@"fa-fighter-jet"]			= @(FAFighterJet);
		tmp[@"fa-beer"]					= @(FABeer);
		tmp[@"fa-h-square"]				= @(FAHSquare);
		tmp[@"fa-plus-square"]			= @(FAPlusSquare);
		tmp[@"fa-angle-double-left"]	= @(FAAngleDoubleLeft);
		tmp[@"fa-angle-double-right"]	= @(FAAngleDoubleRight);
		tmp[@"fa-angle-double-up"]		= @(FAAngleDoubleUp);
		tmp[@"fa-angle-double-down"]	= @(FAAngleDoubleDown);
		tmp[@"fa-angle-left"]			= @(FAAngleLeft);
		tmp[@"fa-angle-right"]			= @(FAAngleRight);
		tmp[@"fa-angle-up"]				= @(FAAngleUp);
		tmp[@"fa-angle-down"]			= @(FAAngleDown);
		tmp[@"fa-desktop"]				= @(FADesktop);
		tmp[@"fa-laptop"]				= @(FALaptop);
		tmp[@"fa-tablet"]				= @(FATablet);
		tmp[@"fa-mobile"]				= @(FAMobile);
		tmp[@"fa-circle-o"]				= @(FACircleO);
		tmp[@"fa-quote-left"]			= @(FAQuoteLeft);
		tmp[@"fa-quote-right"]			= @(FAQuoteRight);
		tmp[@"fa-spinner"]				= @(FASpinner);
		tmp[@"fa-circle"]				= @(FACircle);
		tmp[@"fa-reply"]				= @(FAReply);
		tmp[@"fa-github-alt"]			= @(FAGithubAlt);
		tmp[@"fa-folder-o"]				= @(FAFolderO);
		tmp[@"fa-folder-open-o"]		= @(FAFolderOpenO);
		tmp[@"fa-smile-o"]				= @(FASmileO);
		tmp[@"fa-frown-o"]				= @(FAFrownO);
		tmp[@"fa-meh-o"]				= @(FAMehO);
		tmp[@"fa-gamepad"]				= @(FAGamepad);
		tmp[@"fa-keyboard-o"]			= @(FAKeyboardO);
		tmp[@"fa-flag-o"]				= @(FAFlagO);
		tmp[@"fa-flag-checkered"]		= @(FAFlagCheckered);
		tmp[@"fa-terminal"]				= @(FATerminal);
		tmp[@"fa-code"]					= @(FACode);
		tmp[@"fa-reply-all"]			= @(FAReplyAll);
		tmp[@"fa-mail-reply-all"]		= @(FAMailReplyAll);
		tmp[@"fa-star-half-o"]			= @(FAStarHalfO);
		tmp[@"fa-location-arrow"]		= @(FALocationArrow);
		tmp[@"fa-crop"]					= @(FACrop);
		tmp[@"fa-code-fork"]			= @(FACodeFork);
		tmp[@"fa-chain-broken"]			= @(FAChainBroken);
		tmp[@"fa-question"]				= @(FAQuestion);
		tmp[@"fa-info"]					= @(FAInfo);
		tmp[@"fa-exclamation"]			= @(FAExclamation);
		tmp[@"fa-superscript"]			= @(FASuperscript);
		tmp[@"fa-subscript"]			= @(FASubscript);
		tmp[@"fa-eraser"]				= @(FAEraser);
		tmp[@"fa-puzzle-piece"]			= @(FAPuzzlePiece);
		tmp[@"fa-microphone"]			= @(FAMicrophone);
		tmp[@"fa-microphone-slash"]		= @(FAMicrophoneSlash);
		tmp[@"fa-shield"]				= @(FAShield);
		tmp[@"fa-calendar-o"]			= @(FACalendarO);
		tmp[@"fa-fire-extinguisher"]	= @(FAFireExtinguisher);
		tmp[@"fa-rocket"]				= @(FARocket);
		tmp[@"fa-maxcdn"]				= @(FAMaxcdn);
		tmp[@"fa-chevron-circle-left"]	= @(FAChevronCircleLeft);
		tmp[@"fa-chevron-circle-right"]	= @(FAChevronCircleRight);
		tmp[@"fa-chevron-circle-up"]	= @(FAChevronCircleUp);
		tmp[@"fa-chevron-circle-down"]	= @(FAChevronCircleDown);
		tmp[@"fa-html5"]				= @(FAHtml5);
		tmp[@"fa-css3"]					= @(FACss3);
		tmp[@"fa-anchor"]				= @(FAAnchor);
		tmp[@"fa-unlock-alt"]			= @(FAUnlockAlt);
		tmp[@"fa-bullseye"]				= @(FABullseye);
		tmp[@"fa-ellipsis-h"]			= @(FAEllipsisH);
		tmp[@"fa-ellipsis-v"]			= @(FAEllipsisV);
		tmp[@"fa-rss-square"]			= @(FARssSquare);
		tmp[@"fa-play-circle"]			= @(FAPlayCircle);
		tmp[@"fa-ticket"]				= @(FATicket);
		tmp[@"fa-minus-square"]			= @(FAMinusSquare);
		tmp[@"fa-minus-square-o"]		= @(FAMinusSquareO);
		tmp[@"fa-level-up"]				= @(FALevelUp);
		tmp[@"fa-level-down"]			= @(FALevelDown);
		tmp[@"fa-check-square"]			= @(FACheckSquare);
		tmp[@"fa-pencil-square"]		= @(FAPencilSquare);
		tmp[@"fa-external-link-square"]	= @(FAExternalLinkSquare);
		tmp[@"fa-share-square"]			= @(FAShareSquare);
		tmp[@"fa-compass"]				= @(FACompass);
		tmp[@"fa-caret-square-o-down"]	= @(FACaretSquareODown);
		tmp[@"fa-caret-square-o-up"]	= @(FACaretSquareOUp);
		tmp[@"fa-caret-square-o-right"]	= @(FACaretSquareORight);
		tmp[@"fa-eur"]					= @(FAEur);
		tmp[@"fa-gbp"]					= @(FAGbp);
		tmp[@"fa-usd"]					= @(FAUsd);
		tmp[@"fa-inr"]					= @(FAInr);
		tmp[@"fa-jpy"]					= @(FAJpy);
		tmp[@"fa-rub"]					= @(FARub);
		tmp[@"fa-krw"]					= @(FAKrw);
		tmp[@"fa-btc"]					= @(FABtc);
		tmp[@"fa-file"]					= @(FAFile);
		tmp[@"fa-file-text"]			= @(FAFileText);
		tmp[@"fa-sort-alpha-asc"]		= @(FASortAlphaAsc);
		tmp[@"fa-sort-alpha-desc"]		= @(FASortAlphaDesc);
		tmp[@"fa-sort-amount-asc"]		= @(FASortAmountAsc);
		tmp[@"fa-sort-amount-desc"]		= @(FASortAmountDesc);
		tmp[@"fa-sort-numeric-asc"]		= @(FASortNumericAsc);
		tmp[@"fa-sort-numeric-desc"]	= @(FASortNumericDesc);
		tmp[@"fa-thumbs-up"]			= @(FAThumbsUp);
		tmp[@"fa-thumbs-down"]			= @(FAThumbsDown);
		tmp[@"fa-youtube-square"]		= @(FAYoutubeSquare);
		tmp[@"fa-youtube"]				= @(FAYoutube);
		tmp[@"fa-xing"]					= @(FAXing);
		tmp[@"fa-xing-square"]			= @(FAXingSquare);
		tmp[@"fa-youtube-play"]			= @(FAYoutubePlay);
		tmp[@"fa-dropbox"]				= @(FADropbox);
		tmp[@"fa-stack-overflow"]		= @(FAStackOverflow);
		tmp[@"fa-instagram"]			= @(FAInstagram);
		tmp[@"fa-flickr"]				= @(FAFlickr);
		tmp[@"fa-adn"]					= @(FAAdn);
		tmp[@"fa-bitbucket"]			= @(FABitbucket);
		tmp[@"fa-bitbucket-square"]		= @(FABitbucketSquare);
		tmp[@"fa-tumblr"]				= @(FATumblr);
		tmp[@"fa-tumblr-square"]		= @(FATumblrSquare);
		tmp[@"fa-long-arrow-down"]		= @(FALongArrowDown);
		tmp[@"fa-long-arrow-up"]		= @(FALongArrowUp);
		tmp[@"fa-long-arrow-left"]		= @(FALongArrowLeft);
		tmp[@"fa-long-arrow-right"]		= @(FALongArrowRight);
		tmp[@"fa-apple"]				= @(FAApple);
		tmp[@"fa-windows"]				= @(FAWindows);
		tmp[@"fa-android"]				= @(FAAndroid);
		tmp[@"fa-linux"]				= @(FALinux);
		tmp[@"fa-dribbble"]				= @(FADribbble);
		tmp[@"fa-skype"]				= @(FASkype);
		tmp[@"fa-foursquare"]			= @(FAFoursquare);
		tmp[@"fa-trello"]				= @(FATrello);
		tmp[@"fa-female"]				= @(FAFemale);
		tmp[@"fa-male"]					= @(FAMale);
		tmp[@"fa-gittip"]				= @(FAGittip);
		tmp[@"fa-sun-o"]				= @(FASunO);
		tmp[@"fa-moon-o"]				= @(FAMoonO);
		tmp[@"fa-archive"]				= @(FAArchive);
		tmp[@"fa-bug"]					= @(FABug);
		tmp[@"fa-vk"]					= @(FAVk);
		tmp[@"fa-weibo"]				= @(FAWeibo);
		tmp[@"fa-renren"]				= @(FARenren);
		tmp[@"fa-pagelines"]			= @(FAPagelines);
		tmp[@"fa-stack-exchange"]		= @(FAStackExchange);
		tmp[@"fa-arrow-circle-o-right"]	= @(FAArrowCircleORight);
		tmp[@"fa-arrow-circle-o-left"]	= @(FAArrowCircleOLeft);
		tmp[@"fa-caret-square-o-left"]	= @(FACaretSquareOLeft);
		tmp[@"fa-dot-circle-o"]			= @(FADotCircleO);
		tmp[@"fa-wheelchair"]			= @(FAWheelchair);
		tmp[@"fa-vimeo-square"]			= @(FAVimeoSquare);
		tmp[@"fa-try"]					= @(FATry);
		tmp[@"fa-plus-square-o"]		= @(FAPlusSquareO);

        /* FontAwesome ver 4.1.0 */
        tmp[@"fa-automobile"]             = @(FAautomobile);
        tmp[@"fa-bank"]                 = @(FAbank);
        tmp[@"fa-behance"]              = @(FAbehance);
        tmp[@"fa-behance-square"]       = @(FAbehanceSquare);
        tmp[@"fa-bomb"]                 = @(FAbomb);
        tmp[@"fa-building"]             = @(FAbuilding);
        tmp[@"fa-cab"]                  = @(FAcab);
        tmp[@"fa-car"]                  = @(FAcar);
        tmp[@"fa-child"]                = @(FAchild);
        tmp[@"fa-circle-o-notch"]       = @(FAcircleONotch);
        tmp[@"fa-circle-thin"]          = @(FAcircleThin);
        tmp[@"fa-codepen"]              = @(FAcodepen);
        tmp[@"fa-cube"]                 = @(FAcube);
        tmp[@"fa-cubes"]                = @(FAcubes);
        tmp[@"fa-database"]             = @(FAdatabase);
        tmp[@"fa-delicious"]            = @(FAdelicious);
        tmp[@"fa-deviantart"]           = @(FAdeviantart);
        tmp[@"fa-digg"]                 = @(FAdigg);
        tmp[@"fa-drupal"]               = @(FAdrupal);
        tmp[@"fa-empire"]               = @(FAempire);
        tmp[@"fa-envelope-square"]      = @(FAenvelopeSquare);
        tmp[@"fa-fax"]                  = @(FAfax);
        tmp[@"fa-file-archive-o"]       = @(FAfileArchiveO);
        tmp[@"fa-file-audio-o"]         = @(FAfileAudioO);
        tmp[@"fa-file-code-o"]          = @(FAfileCodeO);
        tmp[@"fa-file-excel-o"]         = @(FAfileExcelO);
        tmp[@"fa-file-image-o"]         = @(FAfileImageO);
        tmp[@"fa-file-movie-o"]         = @(FAfileMovieO);
        tmp[@"fa-file-pdf-o"]           = @(FAfilePdfO);
        tmp[@"fa-file-photo-o"]         = @(FAfilePhotoO);
        tmp[@"fa-file-picture-o"]       = @(FAfilePictureO);
        tmp[@"fa-file-powerpoint-o"]    = @(FAfilePowerpointO);
        tmp[@"fa-file-sound-o"]         = @(FAfileSoundO);
        tmp[@"fa-file-video-o"]         = @(FAfileVideoO);
        tmp[@"fa-file-word-o"]          = @(FAfileWordO);
        tmp[@"fa-file-zip-o"]           = @(FAfileZipO);
        tmp[@"fa-ge"]                   = @(FAge);
        tmp[@"fa-git"]                  = @(FAgit);
        tmp[@"fa-git-square"]           = @(FAgitSquare);
        tmp[@"fa-google"]               = @(FAgoogle);
        tmp[@"fa-graduation-cap"]       = @(FAgraduationCap);
        tmp[@"fa-hacker-news"]          = @(FAhackerNews);
        tmp[@"fa-header"]               = @(FAheader);
        tmp[@"fa-history"]              = @(FAhistory);
        tmp[@"fa-institution"]          = @(FAinstitution);
        tmp[@"fa-joomla"]               = @(FAjoomla);
        tmp[@"fa-jsfiddle"]             = @(FAjsfiddle);
        tmp[@"fa-language"]             = @(FAlanguage);
        tmp[@"fa-life-bouy"]            = @(FAlifeBouy);
        tmp[@"fa-life-ring"]            = @(FAlifeRing);
        tmp[@"fa-life-saver"]           = @(FAlifeSaver);
        tmp[@"fa-mortar-board"]         = @(FAmortarBoard);
        tmp[@"fa-openid"]               = @(FAopenid);
        tmp[@"fa-paper-plane"]          = @(FApaperPlane);
        tmp[@"fa-paper-plane-o"]        = @(FApaperPlaneO);
        tmp[@"fa-paragraph"]            = @(FAparagraph);
        tmp[@"fa-paw"]                  = @(FApaw);
        tmp[@"fa-pied-piper"]           = @(FApiedPiper);
        tmp[@"fa-pied-piper-alt"]       = @(FApiedPiperalt);
        tmp[@"fa-pied-piper-square"]    = @(FApiedPipersquare);
        tmp[@"fa-qq"]                   = @(FAqq);
        tmp[@"fa-ra"]                   = @(FAra);
        tmp[@"fa-rebel"]                = @(FArebel);
        tmp[@"fa-recycle"]              = @(FArecycle);
        tmp[@"fa-reddit"]               = @(FAreddit);
        tmp[@"fa-reddit-square"]        = @(FAredditSquare);
        tmp[@"fa-send"]                 = @(FAsend);
        tmp[@"fa-send-o"]               = @(FAsendO);
        tmp[@"fa-share-alt"]            = @(FAshareAlt);
        tmp[@"fa-share-alt-square"]     = @(FAshareAltSquare);
        tmp[@"fa-slack"]                = @(FAslack);
        tmp[@"fa-sliders"]              = @(FAsliders);
        tmp[@"fa-soundcloud"]           = @(FAsoundcloud);
        tmp[@"fa-space-shuttle"]        = @(FAspaceShuttle);
        tmp[@"fa-spoon"]                = @(FAspoon);
        tmp[@"fa-spotify"]              = @(FAspotify);
        tmp[@"fa-steam"]                = @(FAsteam);
        tmp[@"fa-steam-square"]         = @(FAsteamSquare);
        tmp[@"fa-stumbleupon"]          = @(FAstumbleupon);
        tmp[@"fa-stumbleupon-circle"]   = @(FAstumbleuponCircle);
        tmp[@"fa-support"]              = @(FAsupport);
        tmp[@"fa-taxi"]                 = @(FAtaxi);
        tmp[@"fa-tencent-weibo"]        = @(FAtencentWeibo);
        tmp[@"fa-tree"]                 = @(FAtree);
        tmp[@"fa-university"]           = @(FAuniversity);
        tmp[@"fa-vine"]                 = @(FAvine);
        tmp[@"fa-wechat"]               = @(FAwechat);
        tmp[@"fa-weixin"]               = @(FAweixin);
        tmp[@"fa-wordpress"]            = @(FAwordpress);
        tmp[@"fa-yahoo"]                = @(FAyahoo);
        
        /* FontAwesome ver 4.2.0 */
        tmp[@"fa-angellist"]            = @(FAangellist);
        tmp[@"fa-area-chart"]           = @(FAareaChart);
        tmp[@"fa-at"]                   = @(FAat);
        tmp[@"fa-bell-slash"]           = @(FAbellSlash);
        tmp[@"fa-bell-slash-o"]         = @(FAbellSlashO);
        tmp[@"fa-bicycle"]              = @(FAbicycle);
        tmp[@"fa-binoculars"]           = @(FAbinoculars);
        tmp[@"fa-birthday-cake"]        = @(FAbirthdayCake);
        tmp[@"fa-bus"]                  = @(FAbus);
        tmp[@"fa-calculator"]           = @(FAcalculator);
        tmp[@"fa-cc"]                   = @(FAcc);
        tmp[@"fa-cc-amex"]              = @(FAccAmex);
        tmp[@"fa-cc-discover"]          = @(FAccDiscover);
        tmp[@"fa-cc-mastercard"]        = @(FAccMastercard);
        tmp[@"fa-cc-paypal"]            = @(FAccPaypal);
        tmp[@"fa-cc-stripe"]            = @(FAccStripe);
        tmp[@"fa-cc-visa"]              = @(FAccVisa);
        tmp[@"fa-copyright"]            = @(FAcopyright);
        tmp[@"fa-eyedropper"]           = @(FAeyedropper);
        tmp[@"fa-futbol-o"]             = @(FAfutbolO);
        tmp[@"fa-google-wallet"]        = @(FAgoogleWallet);
        tmp[@"fa-ils"]                  = @(FAils);
        tmp[@"fa-ioxhost"]              = @(FAioxhost);
        tmp[@"fa-lastfm"]               = @(FAlastfm);
        tmp[@"fa-lastfm-square"]        = @(FAlastfmSquare);
        tmp[@"fa-line-chart"]           = @(FAlineChart);
        tmp[@"fa-meanpath"]             = @(FAmeanpath);
        tmp[@"fa-newspaper-o"]          = @(FAnewspaperO);
        tmp[@"fa-paint-brush"]          = @(FApaintBrush);
        tmp[@"fa-paypal"]               = @(FApaypal);
        tmp[@"fa-pie-chart"]            = @(FApieChart);
        tmp[@"fa-plug"]                 = @(FAplug);
        tmp[@"fa-shekel"]               = @(FAshekel);
        tmp[@"fa-sheqel"]               = @(FAsheqel);
        tmp[@"fa-slideshare"]           = @(FAslideshare);
        tmp[@"fa-soccer-ball-o"]        = @(FAsoccerBallO);
        tmp[@"fa-toggle-off"]           = @(FAtoggleOff);
        tmp[@"fa-toggle-on"]            = @(FAtoggleOn);
        tmp[@"fa-trash"]                = @(FAtrash);
        tmp[@"fa-tty"]                  = @(FAtty);
        tmp[@"fa-twitch"]               = @(FAtwitch);
        tmp[@"fa-wifi"]                 = @(FAwifi);
        tmp[@"fa-yelp"]                 = @(FAyelp);
        
        /* FontAwesome ver 4.3.0 */
        tmp[@"fa-bed"]                  = @(FAbed);
        tmp[@"fa-buysellads"]           = @(FAbuysellads);
        tmp[@"fa-cart-arrow-down"]      = @(FAcartArrowDown);
        tmp[@"fa-cart-plus"]            = @(FAcartPlus);
        tmp[@"fa-connectdevelop"]       = @(FAconnectdevelop);
        tmp[@"fa-dashcube"]             = @(FAdashcube);
        tmp[@"fa-diamond"]              = @(FAdiamond);
        tmp[@"fa-facebook-official"]    = @(FAfacebookOfficial);
        tmp[@"fa-forumbee"]             = @(FAforumbee);
        tmp[@"fa-heartbeat"]            = @(FAheartbeat);
        tmp[@"fa-hotel"]                = @(FAhotel);
        tmp[@"fa-leanpub"]              = @(FAleanpub);
        tmp[@"fa-mars"]                 = @(FAmars);
        tmp[@"fa-mars-double"]          = @(FAmarsDouble);
        tmp[@"fa-mars-stroke"]          = @(FAmarsStroke);
        tmp[@"fa-mars-stroke-h"]        = @(FAmarsStrokeH);
        tmp[@"fa-mars-stroke-v"]        = @(FAmarsStrokeV);
        tmp[@"fa-medium"]               = @(FAmedium);
        tmp[@"fa-mercury"]              = @(FAmercury);
        tmp[@"fa-motorcycle"]           = @(FAmotorcycle);
        tmp[@"fa-neuter"]               = @(FAneuter);
        tmp[@"fa-pinterest-p"]          = @(FApinterestP);
        tmp[@"fa-sellsy"]               = @(FAsellsy);
        tmp[@"fa-server"]               = @(FAserver);
        tmp[@"fa-ship"]                 = @(FAship);
        tmp[@"fa-shirtsinbulk"]         = @(FAshirtsinbulk);
        tmp[@"fa-simplybuilt"]          = @(FAsimplybuilt);
        tmp[@"fa-skyatlas"]             = @(FAskyatlas);
        tmp[@"fa-street-view"]          = @(FAstreetView);
        tmp[@"fa-subway"]               = @(FAsubway);
        tmp[@"fa-train"]                = @(FAtrain);
        tmp[@"fa-transgender"]          = @(FAtransgender);
        tmp[@"fa-transgender-alt"]      = @(FAtransgenderAlt);
        tmp[@"fa-user-plus"]            = @(FAuserPlus);
        tmp[@"fa-user-secret"]          = @(FAuserSecret);
        tmp[@"fa-user-times"]           = @(FAuserTimes);
        tmp[@"fa-venus"]                = @(FAvenus);
        tmp[@"fa-venus-double"]         = @(FAvenusDouble);
        tmp[@"fa-venus-mars"]           = @(FAvenusMars);
        tmp[@"fa-viacoin"]              = @(FAviacoin);
        
		enumDictionary = tmp;
	});
    
    return enumDictionary;
}

@end
