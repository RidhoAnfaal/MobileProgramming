# Practicum Assignments 
## 1. Complete the practicum, then document and push it to your repository in the form of a screenshot of the work results along with an explanation in the file README.md!
![practicum](images/pract.png)

- The RedTextWidget (AutoSizeText) handles text overflow issues by automatically reducing font size when the text does not fit within a narrow width of 50 pixels. The Standard Text Widget (main.dart) fails to do this due to its default font size. The application still functions as a standard Flutter counter application, with the _incrementCounter function triggering setState() to update the Text widget. This practical demonstration highlights the importance of third-party plugins like AutoSizeText in addressing common layout issues and ensuring app layout remains clean and responsive, especially on small screens or with specific widget size constraints.

##

## 2. Explain the purpose of step 2 in the practicum!
- The main purpose of Step 2 is to integrate third-party (external) code into your Flutter project. Specifically: 
    1. Dependency Management: The command automatically adds auto_size_text: ^[version] to the dependencies section in the pubspec.yaml file. This tells Flutter that the project requires this package to function.
    2. Fetching Code: This command runs flutter pub get behind the scenes, which downloads the auto_size_text plugin code from Pub.dev and makes it available in the local cache so that it can be imported and used in your code.

##

## 3. Explain the purpose of step 5 in the practicum!
- The goal of Step 5 is to make the RedTextWidget dynamic and reusable by accepting external data.
    1. RedTextWidget can now accept different text each time it is called, rather than just static text.
    2. Since RedTextWidget is a StatelessWidget, the text variable is defined as final. This ensures that the data will not change after the widget is created.
    3. Required Parameter: Using required this.text forces users of this widget to provide a text value, preventing bugs where the widget is displayed without the required data.

##

## 4. In step 6 there are two widgets added, explain their functions and differences!
- The main difference lies in the engine used to render text:
    1. RedTextWidget (with AutoSizeText): Adaptive. It changes the font size so that the text content can adjust to the width of the container, avoiding overflow.
    2. Standard Text: Non-adaptive It retains the original font size. Since a width of only 100 pixels is insufficient, the text will overflow and be truncated. This experiment demonstrates the superiority of AutoSizeText in scenarios with strict space constraints.

##

## 5. Explain the meaning of each parameter in the plugin based on the links in thisauto_size_text documentation !
- Main function : AutoSizeText behaves like Flutter’s normal Text widget, but automatically resizes the font so the text fits inside its available space (width and height).

1. Key : Controls how one widget replaces another widget in the tree. Same behavior as Flutter’s Text widget key. Used internally by Flutter for widget identification during rebuilds.

2. textKey : Sets the key for the resulting internal Text widget. Optional, rarely used. Useful if you need to directly identify or test the internal Text instance created by AutoSizeText.

3. style : Defines how the text looks (font, size, weight, color, etc.). Exactly like Text.style in Flutter.

4. minFontSize : The smallest possible font size the text can shrink to. Default: 12. If the text still doesn’t fit even at this size, it’s handled based on the overflow parameter.

5. maxFontSize : The largest possible font size allowed for resizing. Useful if you’re inheriting a text style but want to prevent it from becoming too large.

6. stepGranularity : The step size (in points) that the font size decreases each iteration when fitting text. Smaller values = smoother resizing but slightly slower. Default is usually 1.0.

7. presetFontSizes : Allows only specific font sizes to be used. Overrides minFontSize, maxFontSize, and stepGranularity. Must be in descending order.

8. group : Synchronizes font sizes of multiple AutoSizeText widgets. All texts in the same AutoSizeGroup resize to the same final font size (the smallest size among them). Helps keep UI consistent.

9. textAlign : Aligns the text horizontally inside its box. Same as in Text. Example: TextAlign.center, TextAlign.right.

10. textDirection : Defines the direction of the text. Important for languages like Arabic or Hebrew. Example: TextDirection.ltr or TextDirection.rtl.

11. locale : Used to pick a proper font if a character looks different depending on locale.

12. softWrap : Whether the text should break at soft line breaks. Same as in Text. Usually true (the text will wrap automatically to fit lines).

13.  wrapWords : Whether words that don’t fit in one line should be wrapped. Default: true. If false, words too long for a single line might overflow.

14. overflow : Determines what happens when text still doesn’t fit. Common values:
    - TextOverflow.clip → cuts off the text
    - TextOverflow.ellipsis → adds “…” at the end
    - TextOverflow.fade → fades out the text

15. overflowReplacement : Widget displayed instead of the text when it overflows and can’t fit within its bounds. Useful for showing fallback UI.

16. textScaleFactor : Multiplier for the font size (e.g., accessibility or user scaling). Affects all font sizes, including minFontSize, maxFontSize, and presetFontSizes.

17. maxLines : Maximum number of lines the text can occupy. If not set, AutoSizeText resizes text freely based on width/height.

18. semanticsLabel : Provides an alternative text label for accessibility (screen readers).

19. Special Constructor : Allows to using Rich Text (multiple styles or clickable spans). Works like Text.rich.