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
* Next, the characters that assign the coloring to the syntax must be specified.

```pascal
// Coloring between {$ ... }
if (S[J] = '{') and (S[J + 1] = '$') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        IsDir := True;
        Insert(Bdir, S, J);
        Inc(J, Length(Bdir) + 1);
        Continue;
      end;
      if (S[J] = '}') and Isdir then begin
        IsDir := False;
        Insert(Edir, S, J + 1);
        Inc(J, Length(Edir));
        Continue;
      end;


// Coloring between (*$ ... *)
      if (S[J] = '(') and (S[J + 1] = '*') and (S[J + 2] = '$') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        IsDir1 := True;
        Insert(Bdir, S, J);
        Inc(J, Length(Bdir) + 2);
        Continue;
      end;
      if (S[J] = '*') and (S[J + 1] = ')') and IsDir1 then begin
        IsDir1 := False;
        Insert(Edir, S, J + 2);
        Inc(J, Length(Edir) + 1);
        Continue;
      end;


// Coloring between { ... }
      if (S[J] = '{') and not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then
        begin
        IsCom := True;
        Insert(Bcom, S, J);
        Inc(J, Length(Bcom));
        Continue;
      end;
      if (S[J] = '}') and IsCom then begin
        IsCom := False;
        Insert(Ecom, S, J + 1);
        Inc(J, Length(Ecom));
        Continue;
      end;

// Coloring between (* ... *)
      if (S[J] = '(') and (S[J + 1] = '*') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        IsCom1 := True;
        Insert(Bcom, S, J);
        Inc(J, Length(Bcom) + 1);
        Continue;
      end;
      if (S[J] = '*') and (S[J + 1] = ')') and IsCom1 then begin
        IsCom1 := False;
        Insert(Ecom, S, J + 2);
        Inc(J, Length(Ecom) + 1);
        Continue;
      end;

// Coloring between ' ... '
      if (S[J] = '''') and not (IsCom or IsDir or IsStr or IsCom1 or IsDir1)
        then begin
        IsStr := True;
        Insert(Bstr, S, J);
        Inc(J, Length(Bstr));
        Continue;
      end;
      if (S[J] = '''') and IsStr then begin
        IsStr := False;
        Insert(Estr, S, J + 1);
        Inc(J, Length(Estr));
        Continue;
      end;

// Coloring after // ...
      if (S[J] = '/') and (S[J + 1] = '/') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        Insert(Bcom, S, J);
        Insert(Ecom, S, Length(S) + 1);
        Break;
      end;
```
* Sections can be removed or added as desired, depending on how many colorings are needed.

* To color a line by character, the code would look like this:
```pascal
      if (S[J] = '/') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        Insert(Bcom, S, J);
        Insert(Ecom, S, Length(S) + 1);
        Break;
      end;
```

To color after a whole word, each character must be assigned to the parameter individually. Then the code looks like this:
```pascal
// Here everything is colored according to the MS-DOS command "Rem".
if (S[J] = 'R') and (S[J + 1] = 'e') and (S[J + 2] = 'm') and (S[J + 3] = ' ') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        Insert(Bcom, S, J);
        Insert(Ecom, S, Length(S) + 1);
        Break;
      end;
```

* In the lower part of the code, reserved commands can be defined for the entire text code, such as "Dim" or "integer" in Visual Basic. This reserved list can be extended to infinity.

```pascal
procedure TVisualBasic.LoadReservList;
begin
  with ReservList do begin
  Add('Dimn');
  Add('integer');
{ type in how much want }

  end;
end;
```

* Next, you need to add your programming language to the "OnChange" Event of the code box in the Main Unit. This is this section.
```pascal
if ComboBox1.ItemIndex = 5 then begin
    with TVisualBasic.Create, Form2 do begin
      Bcom := Edit7.Text;
      ECom := Edit8.Text;
      Bres := Edit5.Text;
      Eres := Edit6.Text;
      Bnum := Edit1.Text;
      Enum := Edit2.Text;
      Bstr := Edit3.Text;
      Estr := Edit4.Text;
      Bdir := Edit9.Text;
      Edir := Edit10.Text;
      Memo2.Text := Convert(Memo1.Text, Form1.CheckBox1.Checked);
      end;
    end;
```

* Now you can use the options form for your coloring and create an HTML product.

### Important: [Text tabs](https://en.wikipedia.org/wiki/Tab_key):
If you copy code from the browser, there are usually no tabs in the code, but this is not the case with local system editors. Pre-written program code often has tabs in the text that you can't see. The problem is that these tabs can interfere with the coloring of the code. The code can't detect the tabs, and the coloring fails.

To prevent this problem, the program has a "Remove Tabs" option in the top left corner. Therefore, you should try both methods to ensure successful coloring.

If the tabs are removed from the code, the code loses its cascading, which would then have to be edited manually if you care about it.

In [word processing](https://en.wikipedia.org/wiki/Word_processor) and [text editing](https://en.wikipedia.org/wiki/Text_editor), the Tab key will move the insertion point to the next tab stop in a table, insert the ASCII tab character, or insert multiple space characters (depending on the program used).

When filling out a computerized form, pressing Tab will sometimes move the cursor to the next field (and Shift-Tab will move the cursor to the previous field), eliminating the need to use a mouse to click in an adjacent field.
