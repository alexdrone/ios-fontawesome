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

	
	label.text = [NSString fontAwesomeIconStringForEnum:FAGithub];
or you can reference them by using the class identifiers listed here http://fortawesome.github.io/Font-Awesome/icons

	
	label.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-github"];
or you can add the `UIImage+FontAwesome` category to generate icon image directly

	UIImage *github = [UIImage imageWithIcon:@"fa-github" backgroundColor:[UIColor purpleColor] iconColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:255] iconScale:2.f fontSize:20];
then you will get an icon like this

![image](Resources/fontawesome-github.jpg)

That's all.  
Have a look at the small demo project for further information.

FAImageView
--------------------

FAImageView is now extended and contains a new property called `defaultView` that is shown when the image is set to nil.
It is possible to use one the font-awesome icon as a default placeholder for an image view.

	FAImageView *imageView = [[FAImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, 100.f)];
    imageView.image = nil;
    [imageView setDefaultIconIdentifier:@"fa-github"];


Troubleshooting
--------------------

### Some icons are not available on some devices

Keep in mind that if you have installed the FontAwesome font in your iOS system (with [InstaFont](https://itunes.apple.com/us/app/instafont-install-any-new/id1020299046) for example), the embedded font in your App will not be used! So if your system FontAwesome font is v4.2, you will never be able to display icons from v4.3 and v4.4 for example from the embedded font.

Two solutions :

1. Remove the font profile from your iOS device
2. Rename the Postscript name of file `FontAwesome.ttf` with a tool like [ttx](https://github.com/behdad/fonttools/) for example and use the new name in `NSString+FontAwesome.h`

Here is the step by step for second solution :

- Install fonttools
  ```
  git clone https://github.com/behdad/fonttools.git ;
  cd fonttools/
  sudo python setup.py install
  ```

- Convert the `FontAwesome.ttf` file to `ttx` format
  ```
  cd your_app/Pods/FontAwesome+iOS/Resources/
  ttx FontAwesome.ttf
  ```

- Replace all occurence of `FontAwesome` with `FontAwesome440` for example in `ttx` file and save

- Convert back `ttx` font to `ttf`
  ```
  ttx FontAwesome.ttx
  mv FontAwesome.ttf FontAwesome.ttf.orig
  mv FontAwesome#1.ttf FontAwesome.ttf
  ```

- In file `NSString+FontAwesome.h`, change font Postscript name :
  ```
  static NSString *const kFontAwesomeFamilyName = @"FontAwesome440";
  ```

- Build, run and dance


License
-------------------

This project uses the FontAwesome fix made by Pit Garbe that you can find at https://github.com/leberwurstsaft/FontAwesome-for-iOS Version 2.0 of the Font Awesome font, CSS, and LESS files are licensed under CC BY 3.0: http://creativecommons.org/licenses/by/3.0/ A mention of 'Font Awesome - http://fortawesome.github.com/Font-Awesome' in human-readable source code is considered acceptable attribution (most common on the web). If human readable source code is not available to the end user, a mention in an 'About' or 'Credits' screen is considered acceptable (most common in desktop or mobile software)
