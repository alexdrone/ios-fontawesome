//
//  FATableViewController.m
//  FontAwesome-iOS Demo
//
//  Created by Rune Madsen on 2013-01-09.
//  Copyright (c) 2013 Rune Madsen. All rights reserved.
//  runmad.com
//

#import "FATableViewController.h"
#import "NSString+FontAwesome.h"
#import "FATableViewCell.h"
#import "UIImage+FontAwesome.h"

@interface FATableViewController ()

@end

@implementation FATableViewController

@synthesize iconIdentiferArray;
@synthesize iconSearchArray;
@synthesize searchBar;
@synthesize searchDisplayController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = NSLocalizedString(@"Icon List", nil);
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44)];
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    self.searchBar.showsScopeBar = YES;
    self.searchBar.delegate = self;
    self.tableView.tableHeaderView = self.searchBar;
	
	self.searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController: self];
    self.searchDisplayController.delegate = self;
    self.searchDisplayController.searchResultsDataSource = self;
    self.searchDisplayController.searchResultsDelegate = self;
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
	
	[self.tableView registerClass:[FATableViewCell class] forCellReuseIdentifier:@"Cell"];

	[self.navigationItem setTitle:[NSString stringWithFormat:@"%lu Font Awesome icons", (unsigned long)[self.iconIdentiferArray count]]];
    
    UIImage *icon = [UIImage imageWithIcon:@"fa-bars" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(26, 26)];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:icon style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setLeftBarButtonItem:leftBarButton];
    
    icon = [UIImage imageWithIcon:@"fa-cog" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(26, 26)];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithImage:icon style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setRightBarButtonItem:rightBarButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.iconSearchArray count];
    } else {
        return [self.iconIdentiferArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    FATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [NSString fontAwesomeIconStringForIconIdentifier:[self.iconSearchArray objectAtIndex:indexPath.row]], [self.iconSearchArray objectAtIndex:indexPath.row]];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@", [NSString fontAwesomeIconStringForIconIdentifier:[self.iconSearchArray objectAtIndex:indexPath.row]], [self.iconSearchArray objectAtIndex:indexPath.row]]];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(1, [cell.textLabel.text length] - 1)];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:22] range:NSMakeRange(0, 1)];
        [cell.textLabel setAttributedText:attributedString];
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [NSString fontAwesomeIconStringForIconIdentifier:[self.iconIdentiferArray objectAtIndex:indexPath.row]], [self.iconIdentiferArray objectAtIndex:indexPath.row]];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@", [NSString fontAwesomeIconStringForIconIdentifier:[self.iconIdentiferArray objectAtIndex:indexPath.row]], [self.iconIdentiferArray objectAtIndex:indexPath.row]]];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(1, [cell.textLabel.text length] - 1)];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:22] range:NSMakeRange(0, 1)];
        [cell.textLabel setAttributedText:attributedString];
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Search

- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView {
	[tableView registerClass:[FATableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    self.iconSearchArray = nil;
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (int i = 0; [self.iconIdentiferArray count] > i; i++) {
        NSString *iconName = [self.iconIdentiferArray objectAtIndex:i];
        NSRange result = [iconName rangeOfString:searchString options:NSCaseInsensitiveSearch];
        if (result.location != NSNotFound) {
            [tmpArray addObject:iconName];
        }
    }
    self.iconSearchArray  = [NSArray arrayWithArray:tmpArray];
    return YES;
}

- (NSArray*)iconIdentiferArray {
    static NSArray *enumArray;
	if (nil == enumArray) {
        enumArray = [[[self icons] allKeys] sortedArrayUsingSelector:@selector(compare:)];
	}
    return enumArray;
}

#pragma mark - Copy of the enumDictionary

- (NSDictionary*)icons {
    static NSDictionary *icons;
	if (nil == icons) {
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
        
        /* FontAwesome ver 4.4.0 */
        tmp[@"fa-500px"]                = @(FA500px);
        tmp[@"fa-amazon"]               = @(FAamazon);
        tmp[@"fa-balance-scale"]        = @(FAbalanceScale);
        tmp[@"fa-battery-empty"]        = @(FAbatteryEmpty);
        tmp[@"fa-battery-full"]         = @(FAbatteryFull);
        tmp[@"fa-battery-half"]         = @(FAbatteryHalf);
        tmp[@"fa-battery-quarter"]      = @(FAbatteryQuarter);
        tmp[@"fa-battery-three-quarters"]   = @(FAbatteryThreeQuarters);
        tmp[@"fa-black-tie"]            = @(FAblackTie);
        tmp[@"fa-calendar-check-o"]     = @(FAcalendarCheckO);
        tmp[@"fa-calendar-minus-o"]     = @(FAcalendarMinusO);
        tmp[@"fa-calendar-plus-o"]      = @(FAcalendarPlusO);
        tmp[@"fa-calendar-times-o"]     = @(FAcalendarTimesO);
        tmp[@"fa-cc-diners-club"]       = @(FAccDinersClub);
        tmp[@"fa-cc-jcb"]               = @(FAccJcb);
        tmp[@"fa-chrome"]               = @(FAchrome);
        tmp[@"fa-clone"]                = @(FAclone);
        tmp[@"fa-commenting"]           = @(FAcommenting);
        tmp[@"fa-commenting-o"]         = @(FAcommentingO);
        tmp[@"fa-contao"]               = @(FAcontao);
        tmp[@"fa-creative-commons"]     = @(FAcreativeCommons);
        tmp[@"fa-expeditedssl"]         = @(FAexpeditedssl);
        tmp[@"fa-firefox"]              = @(FAfirefox);
        tmp[@"fa-fonticons"]            = @(FAfonticons);
        tmp[@"fa-genderless"]           = @(FAgenderless);
        tmp[@"fa-get-pocket"]           = @(FAgetPocket);
        tmp[@"fa-gg"]                   = @(FAgg);
        tmp[@"fa-gg-circle"]            = @(FAggCircle);
        tmp[@"fa-hand-lizard-o"]        = @(FAhandLizardO);
        tmp[@"fa-hand-paper-o"]         = @(FAhandPaperO);
        tmp[@"fa-hand-peace-o"]         = @(FAhandPeaceO);
        tmp[@"fa-hand-pointer-o"]       = @(FAhandPointerO);
        tmp[@"fa-hand-rock-o"]          = @(FAhandRockO);
        tmp[@"fa-hand-scissors-o"]      = @(FAhandScissorsO);
        tmp[@"fa-hand-spock-o"]         = @(FAhandSpockO);
        tmp[@"fa-hourglass"]            = @(FAhourglass);
        tmp[@"fa-hourglass-end"]        = @(FAhourglassEnd);
        tmp[@"fa-hourglass-half"]       = @(FAhourglassHalf);
        tmp[@"fa-hourglass-o"]          = @(FAhourglassO);
        tmp[@"fa-hourglass-start"]      = @(FAhourglassStart);
        tmp[@"fa-houzz"]                = @(FAhouzz);
        tmp[@"fa-i-cursor"]             = @(FAiCursor);
        tmp[@"fa-industry"]             = @(FAindustry);
        tmp[@"fa-internet-explorer"]    = @(FAinternetExplorer);
        tmp[@"fa-map"]                  = @(FAmap);
        tmp[@"fa-map-o"]                = @(FAmapO);
        tmp[@"fa-map-pin"]              = @(FAmapPin);
        tmp[@"fa-map-signs"]            = @(FAmapSigns);
        tmp[@"fa-mouse-pointer"]        = @(FAmousePointer);
        tmp[@"fa-object-group"]         = @(FAobjectGroup);
        tmp[@"fa-object-ungroup"]       = @(FAobjectUngroup);
        tmp[@"fa-odnoklassniki"]        = @(FAodnoklassniki);
        tmp[@"fa-odnoklassniki-square"] = @(FAodnoklassnikiSquare);
        tmp[@"fa-opencart"]             = @(FAopencart);
        tmp[@"fa-opera"]                = @(FAopera);
        tmp[@"fa-optin-monster"]        = @(FAoptinMonster);
        tmp[@"fa-registered"]           = @(FAregistered);
        tmp[@"fa-safari"]               = @(FAsafari);
        tmp[@"fa-sticky-note"]          = @(FAstickyNote);
        tmp[@"fa-sticky-note-o"]        = @(FAstickyNoteO);
        tmp[@"fa-television"]           = @(FAtelevision);
        tmp[@"fa-trademark"]            = @(FAtrademark);
        tmp[@"fa-tripadvisor"]          = @(FAtripadvisor);
        tmp[@"fa-vimeo"]                = @(FAvimeo);
        tmp[@"fa-wikipedia-w"]          = @(FAwikipediaW);
        tmp[@"fa-y-combinator"]         = @(FAyCombinator);

        icons = [NSDictionary dictionaryWithDictionary:tmp];
	}
    return icons;
}

@end
