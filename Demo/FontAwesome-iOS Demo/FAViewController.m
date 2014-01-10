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
    self.stars = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < kStarsNumber; i++) {
        UIButton *star = [UIButton buttonWithType:UIButtonTypeCustom];
        star.tag = i;
        star.frame = CGRectMake(60.f+(i *40.f), 200.f, 40.f, 40.f);
        star.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:35];
        star.titleLabel.shadowOffset = CGSizeMake(0, -1);
        [star setTitle:[NSString fontAwesomeIconStringForEnum:FAStarO] forState:UIControlStateNormal];
        [star setTitle:[NSString fontAwesomeIconStringForEnum:FAStar] forState:UIControlStateSelected];
        [star setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [star addTarget:self action:@selector(didSelectStar:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:star];
        self.stars[i] = star;
    }
    
    FAImageView *imageView = [[FAImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, 100.f)];
    imageView.image = nil;    

    
    [self.view addSubview:imageView];
}

- (void)didSelectStar:(id)sender
{
    for (NSUInteger i = 0; i < self.stars.count; i++)
        [self.stars[i] setSelected:(i <= [sender tag])];
}

@end
