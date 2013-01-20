FontAwesome+iOS
===================

Font awesome is an iconic font. Read more about it on http://fortawesome.github.com/Font-Awesome/

This category brings this great iconic font on iOS.

Usage
--------------------

First, make sure you have `FontAwesome.ttf` bundled in your project and that `UIAppFonts` key in the project's plist file contains a String item named `FontAwesome.ttf` 
Then add the `NSString+FontAwesome` category to the project.

	UILabel *label = [...]
	label.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
	
You can now use enums for all the different iconic characters

	label.text = [NSString fontAwesomeIconStringForEnum:FAIconGithub];
	
or you can reference them by using the class identifiers listed here http://fortawesome.github.com/Font-Awesome/#all-icons

	label.text = [NSString fontAwesomeIconStringForIconIdentifier:@"icon-github"];
	
That's it!
For further information have a look to the small demo project!

FAImageView
--------------------

FAImageView is now extended and contains a new property called `defaultView` that is shown when the image is set to nil.
It is possible to use one the font-awesome icon as a default placeholder for an image view.

	FAImageView *imageView = [[FAImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, 100.f)];
    imageView.image = nil;
    [imageView setDefaultIconIdentifier:@"icon-github"];

License
-------------------

This project uses the FontAwesome fix made by Pit Garbe that you can find at https://github.com/leberwurstsaft/FontAwesome-for-iOS Version 2.0 of the Font Awesome font, CSS, and LESS files are licensed under CC BY 3.0: http://creativecommons.org/licenses/by/3.0/ A mention of 'Font Awesome - http://fortawesome.github.com/Font-Awesome' in human-readable source code is considered acceptable attribution (most common on the web). If human readable source code is not available to the end user, a mention in an 'About' or 'Credits' screen is considered acceptable (most common in desktop or mobile software)