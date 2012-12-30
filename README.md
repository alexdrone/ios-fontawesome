Use Font Awesome in iOS.
========

Font awesome is an iconic font. Read more about it on http://fortawesome.github.com/Font-Awesome/
This category helps using this great iconic font on iOS.

* Usage

First, make sure you have `FontAwesome.ttf` bundled in your project and that `UIAppFonts` key in the project's plist file contains a String item named `FontAwesome.ttf` 
Then add the `NSString+FontAwesome` category to the project.

	UILabel *label = [...]
	label.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
	
You can now use enums for all the different iconic characters

	label.text = [NSString fontAwesomeIconStringForEnum:FAIconGithub];
	
or you can reference them by using the class identifiers listed here http://fortawesome.github.com/Font-Awesome/#all-icons

	label.text = [NSString fontAwesomeEnumForIconIdentifier:@"icon-github"];
	
That's it!
For further information have a look to the small demo project!