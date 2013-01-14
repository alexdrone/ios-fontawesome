//
//  FATableViewController.h
//  FontAwesome-iOS Demo
//
//  Created by Rune Madsen on 2013-01-09.
//  Copyright (c) 2013 Rune Madsen. All rights reserved.
//  runmad.com
//

#import <UIKit/UIKit.h>

@interface FATableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) NSArray *iconIdentiferArray;
@property (nonatomic, strong) NSArray *iconSearchArray;
@property (nonatomic, strong) UISearchDisplayController *searchDisplayController;
@property (nonatomic, strong) UISearchBar *searchBar;

@end
