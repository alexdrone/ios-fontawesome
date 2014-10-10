//
//  FAViewController.m
//  FontAwesome-iOS Demo
//
//  Created by Alex Usbergo on 12/30/12.
//  Copyright (c) 2012 Alex Usbergo. All rights reserved.
//

#import "FAViewController.h"
#import "NSString+FontAwesome.h"
#import "FAImageView.h"
#import "UIImage+FontAwesome.h"

@interface FAViewController ()
@property (nonatomic, strong) NSMutableArray *stars;
@end

@implementation FAViewController

#define kStarsNumber 5

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = NSLocalizedString(@"Stars", nil);

    self.view.backgroundColor = [UIColor whiteColor];
    
    FAImageView *imageView = [[FAImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, 100.f)];
    imageView.image = nil;
    [self.view addSubview:imageView];
    
    UIImage *icon = [UIImage imageWithIcon:@"fa-github" backgroundColor:[UIColor purpleColor] iconColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:255] fontSize:50];
    UIImageView *github = [[UIImageView alloc] initWithImage:icon];
    CGRect rect = github.frame;
    rect.origin.y += CGRectGetMaxY(imageView.frame);
    github.frame = rect;
    [self.view addSubview:github];
    
    icon = [UIImage imageWithIcon:@"fa-bitbucket" backgroundColor:[UIColor colorWithRed:0.1 green:0.3 blue:0.5 alpha:255] iconColor:[UIColor whiteColor] fontSize:100];
    UIImageView *bitbucket = [[UIImageView alloc] initWithImage:icon];
    rect = bitbucket.frame;
    rect.origin.y += CGRectGetMaxY(github.frame);
    bitbucket.frame = rect;
    [self.view addSubview:bitbucket];
    
    int y = CGRectGetMaxY(bitbucket.frame);
    self.stars = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < kStarsNumber; i++) {
        UIButton *star = [UIButton buttonWithType:UIButtonTypeCustom];
        star.tag = i;
        star.frame = CGRectMake(60.f+(i *40.f), y, 40.f, 40.f);
        star.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:35];
        star.titleLabel.shadowOffset = CGSizeMake(0, -1);
        [star setTitle:[NSString fontAwesomeIconStringForEnum:FAStarO] forState:UIControlStateNormal];
        [star setTitle:[NSString fontAwesomeIconStringForEnum:FAStar] forState:UIControlStateSelected];
        [star setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [star addTarget:self action:@selector(didSelectStar:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:star];
        self.stars[i] = star;
    }
}

- (void)didSelectStar:(id)sender
{
    for (NSUInteger i = 0; i < self.stars.count; i++)
        [self.stars[i] setSelected:(i <= [sender tag])];
}

@end
