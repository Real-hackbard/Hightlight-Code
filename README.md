# Hightlight-Code:

</br>

```ruby
Compiler    : Delphi10 Seattle, 10.1 Berlin, 10.2 Tokyo, 10.3 Rio, 10.4 Sydney, 11 Alexandria, 12 Athens
Components  : CodeToHTML.pas, Cpp.pas, Java.pas, Python.pas, Shell.pas
Discription : Example for Highlighting Code Syntax
Last Update : 09/2025
License     : Freeware
```

</br>


Syntax highlighting is a feature of [text editors](https://en.wikipedia.org/wiki/Text_editor) that is used for [programming](https://en.wikipedia.org/wiki/Programming_language), [scripting](https://en.wikipedia.org/wiki/Scripting_language), or [markup](https://en.wikipedia.org/wiki/Markup_language) languages, such as [HTML](https://en.wikipedia.org/wiki/HTML). The feature displays text, especially [source code](https://en.wikipedia.org/wiki/Source_code), in different colours and [fonts](https://en.wikipedia.org/wiki/Font) according to the category of terms. This feature facilitates writing in a structured language such as a programming language or a markup language as both structures and [syntax errors](https://en.wikipedia.org/wiki/Syntax_error) are visually distinct. This feature is also employed in many programming related contexts (such as programming manuals), either in the form of colourful books or online websites to make understanding code snippets easier for readers. Highlighting does not affect the meaning of the text itself; it is intended only for human readers.

</br>

![Highlight Codes](https://github.com/user-attachments/assets/470b74fb-23f6-467e-9fa7-c39ba29cd4e8)

</br>

Syntax highlighting is a form of [secondary notation](https://en.wikipedia.org/wiki/Secondary_notation), since the highlights are not part of the text meaning, but serve to reinforce it. Some editors also integrate syntax highlighting with other features, such as [spell checking](https://en.wikipedia.org/wiki/Spell_checking) or [code folding](https://en.wikipedia.org/wiki/Code_folding), as aids to editing which are external to the language.

</br>

![c_highlight](https://github.com/user-attachments/assets/635289ef-a9cf-4c20-a7d6-b7bb47257b39)

</br>

### Integrated Programming Languages:
* Pascal (*.pas)
* C/C++ (*.cpp)
* JavaScript (*.js)
* Python (*.py)
* Shell/Batch (*.bat)

These five programming languages ​​can currently be colorized with their code. However, the code can essentially be used for any programming language ever developed or to be developed in the future. You can even color simple syntax from an editor, if you want.

### How can I add a programming language?
The code colors the syntax into four methods:
* Entire lines
* Entire blocks
* Individual letters or numbers
* Entire individual ranges

To add your own Programming language and color it individually, you must create a new Unit from which the syntax coloring takes place. Otherwise, there would be overlaps with the other programming languages.

* First, create an empty *.pas file and rename it to your new programming language, Example: ```VisualBasic.vbs```
* Second, copy the contents of the "CodeToHTML.pas" file into your new file.
* Open the new *.pas file and rename the unit to VisualBasic.
* Now you have to make modifications to the code.
* Under Type, rename the ```TDelphiToHTML``` class to ```TVisualBasic```

```pascal

// Rename
type
  TDelphiToHTML = class(TObject)

// in

type
  TVisualBasic = class(TObject)
```

* After that, all functions must be renamed to the new class. The debugger will show you where.


