unit Shell;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Font, StrUtils;
type
  TShellToHTML = class(TObject)
  private
    ReservList: TStringList; 
    DelphiList: TStringList;
    HTMLList: TStringList;
    DelimSet: set of char;
    procedure LoadReservList;
    procedure ReplaceText(CharNum: Integer; OldText, NewText: string;
      var Text: string);
    function GetWord(nByte: Integer; S: string): string;
    function IsReservWord(S: string): Boolean;
    function IsValue(S: string): Boolean;
  public
    Bcom, Ecom, 
    Bres, Eres, 
    Bnum, Enum, 
    Bstr, Estr,
    Bdir, Edir 
    : string;
  public
    constructor Create(); overload;
    destructor Destroy(); override;
    function Convert(DelphiText: string; GenHTMLPage: Boolean = False): string;
  published
  end;
implementation

uses Unit1;

function TShellToHTML.Convert(DelphiText: string;
  GenHTMLPage: Boolean = False): string;
var
  I, J, C: Integer;
  S: string;
  Str, A : string;
  IsCom, IsCom1, IsDir, IsDir1, IsStr: Boolean;
begin
  HTMLList.Clear;
  if GenHTMLPage then begin

  A := ColorToString(Form2.ColorBox7.Selected);
  A := RightStr(a, Length(a)- 2);

    HTMLList.Add('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
    HTMLList.Add('<html>');
    HTMLList.Add('<head>');
    HTMLList.Add('<title> New Delphi Code </title>');
    HTMLList.Add('<meta name="Generator" content="Delphi Code Modifier">');
    HTMLList.Add(' <meta content="text/html; charset=windows-1251"' +
      ' http-equiv="content-type">');
    HTMLList.Add('</head>');

    HTMLList.Add('<body text="' + A +'" ' +
                            'style="background-color:rgb(' + IntToStr(Form2.SpinEdit1.Value) + ',' +
                            IntToStr(Form2.SpinEdit2.Value) + ',' +
                            IntToStr(Form2.SpinEdit3.Value) + ');">');
  end;

  HTMLList.Add('<pre>');

  if Form1.CheckBox5.Checked = true then begin
  HTMLList.Add(Form2.RichEdit1.Text);
  HTMLList.Add('');
  end;

  DelphiList.Text := DelphiText;
  if DelphiList.Count = 0 then Exit;
  IsCom := False;
  IsCom1 := False;
  IsDir := False; 
  IsDir1 := False;
  {$R-}
  for I := 0 to DelphiList.Count - 1 do begin
    S := DelphiList[I];
    while Pos('<', S) > 0 do ReplaceText(Pos('<', S), '<', '&lt;', S);
    while Pos('>', S) > 0 do ReplaceText(Pos('>', S), '>', '&gt;', S);
    J := 0;
    IsStr := False; 
    while J < Length(S) do begin
      Inc(J);

      if (S[J] = '[') and not (IsCom or IsDir or IsStr or IsCom1 or IsDir1)
        then begin
        IsDir := True;
        Insert(BDir, S, J);
        Inc(J, Length(BDir));
        Continue;
      end;
      if (S[J] = ']') and IsDir then begin
        IsDir := False;
        Insert(EDir, S, J + 1);
        Inc(J, Length(EDir));
        Continue;
      end;

      if (S[J] = '"') and not (IsCom or IsDir or IsStr or IsCom1 or IsDir1)
        then begin
        IsStr := True;
        Insert(Bstr, S, J);
        Inc(J, Length(Bstr));
        Continue;
      end;
      if (S[J] = '"') and IsStr then begin
        IsStr := False;
        Insert(Estr, S, J + 1);
        Inc(J, Length(Estr));
        Continue;
      end;

      if (S[J] = ' ') and (S[J + 1] = '#') or (S[J] = '#') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        Insert(Bcom, S, J);
        Insert(Ecom, S, Length(S) + 1);
        Break;
      end;

      if (S[J] = 'R') and (S[J + 1] = 'e') and (S[J + 2] = 'm') and (S[J + 3] = ' ') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        Insert(Bcom, S, J);
        Insert(Ecom, S, Length(S) + 1);
        Break;
      end;

      if not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) and
        (((S[J] in DelimSet) and not (S[J + 1] in DelimSet)) or
        ((J = 1) and not (S[J] in DelimSet))) then begin
        if (J = 1) and not (S[J] in DelimSet) then C := 1 else C := J + 1;
        Str := GetWord(C, S);
        if IsReservWord(Str) then begin
          Insert(Bres, S, C);
          C := C + Length(Bres + Str);
          Insert(Eres, S, C);
          J := C + Length(Eres) - 1;
          Continue;
        end;
        if IsValue(Str) then begin
          Insert(Bnum, S, C);
          C := C + Length(Bnum + Str);
          Insert(Enum, S, C);
          J := C + Length(Enum) - 1;
          Continue;
        end;
      end;
    end;
    HTMLList.Add(S);
  end;
  {$R+}
  if Form1.CheckBox5.Checked = true then begin
  HTMLList.Add('<hr>');
  HTMLList.Add(Form2.Edit11.Text);
  end;

  HTMLList.Add('</pre>');
  if GenHTMLPage then begin
    HTMLList.Add('</body>');
    HTMLList.Add('</html>');
  end;
  Result := HTMLList.Text;
end;
constructor TShellToHTML.Create;
begin
  ReservList := TStringList.Create;
  DelphiList := TStringList.Create;
  HTMLList := TStringList.Create;
  LoadReservList(); 
  DelimSet := [',', ';', ':', '=', '+', '-', '*', '/', ' ', '''', '@', '(', ')',
    '[', ']'];
  Bcom := '<i style="color: navy;">'; Ecom := '</i>'; 
  Bres := '<b>'; ERes := '</b>'; 
  Bnum := '<span style="color: navy;">'; Enum := '</span>'; 
  Bstr := '<span style="color: navy;">'; Estr := '</span>'; 
  Bdir := '<span style="color: green;">'; Edir := '</span>';
end;
destructor TShellToHTML.Destroy;
begin
  ReservList.Free;
  DelphiList.Free;
  HTMLList.Free;
  inherited Destroy;
end;
function TShellToHTML.GetWord(nByte: Integer; S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := nByte to Length(S) do
    if (S[I] in DelimSet) then Exit else Result := Result + S[I];
end;
function TShellToHTML.IsReservWord(S: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  S := AnsiLowerCase(S);
  for I := 0 to ReservList.Count - 1 do
    if ReservList[I] = S then begin Result := True; Exit; end;
end;
function TShellToHTML.IsValue(S: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  if S = '' then Exit;
  if S = '.' then Exit;
  if not (S[1] in ['0'..'9', '$', '#', '.']) then Exit;
  if Length(S) = 1 then begin Result := True; Exit; end;
  for I := 2 to length(S) do
    if not (S[I] in ['0'..'9', '$', '#', '.', 'a'..'f', 'A'..'F']) then Exit;
  Result := True;
end;
procedure TShellToHTML.LoadReservList;
begin
  with ReservList do begin
  Add('cout'); Add('cin');
  Add('const'); Add('int');
  Add('strand'); Add('for');
  Add('include'); Add('void');
  Add('else'); Add('return');
  Add('main'); Add('while');
  Add('strand'); Add('if');
  Add('print'); Add('type');
  Add('class'); Add('array');
  Add('endl'); Add('double');
  Add('string'); Add('float');
  Add('char'); Add('using');
  Add('continue'); Add('break');
  Add('public'); Add('operator');
  Add('add'); Add('bool');
  Add('struct'); Add('typedef');
  Add('complex'); Add('long');
  Add('and'); Add('bitand');
  Add('case'); Add('compl');
  Add('default'); Add('dynam,ic_cast');
  Add('export'); Add('inline');
  Add('protected'); Add('static');
  Add('template'); Add('try');
  Add('union'); Add('xor');
  Add('and_eq'); Add('bitor');
  Add('catch'); Add('delete');
  Add('extern'); Add('friend');
  Add('new'); Add('or');
  Add('short'); Add('static_cast');
  Add('this'); Add('unsigned');
  Add('volatile'); Add('xor_eq');
  Add('asm'); Add('const_cast');
  Add('do'); Add('enum');
  Add('false'); Add('goto');
  Add('not'); Add('or_eq');
  Add('register'); Add('signed');
  Add('throw'); Add('typeid');
  Add('using'); Add('wchar_t');
  Add('auto'); Add('explicit');
  Add('mutable'); Add('not_eq');
  Add('private'); Add('sizeof');
  Add('switch'); Add('true');
  Add('let'); Add('global');
  Add('function'); Add('param');
  Add('value'); Add('NULL');
  Add('null');  Add('def');
  Add('set');  Add('echo');
  Add('@echo');  Add('shell');

  Add('assoc');  Add('attrib');
  Add('break');  Add('bootcfg');
  Add('cacls');  Add('call');
  Add('cd');  Add('chcp');
  Add('chdir');  Add('chkdsk');
  Add('chkntfs');  Add('cls');
  Add('cmd');  Add('color');
  Add('comp');  Add('compact');
  Add('convert');  Add('copy');
  Add('date');  Add('del');
  Add('dir');  Add('diskpart');
  Add('doskey');  Add('drivequery');
  Add('endlocal');  Add('erase');
  Add('exit');  Add('fc');
  Add('find');  Add('findstr');
  Add('for');  Add('format');
  Add('fsutil');  Add('ftype');
  Add('goto');  Add('gpresult');
  Add('graftabl');  Add('help');
  Add('label');  Add('md');
  Add('mklink');  Add('mode');
  Add('more');  Add('move');
  Add('openfiles');  Add('path');
  Add('pause');  Add('popd');
  Add('print');  Add('prompt');
  Add('pushd');  Add('rd');
  Add('recover');  Add('ren');
  Add('rename');  Add('replace');
  Add('rmdir');  Add('robocopy');
  Add('sc');  Add('setlocal');
  Add('schtasks');  Add('shift');
  Add('shutdown');  Add('sort');
  Add('start');  Add('subst');
  Add('systeminfo');  Add('tasklist');
  Add('taskkill');  Add('time');
  Add('title');  Add('tree');
  Add('type');  Add('ver');
  Add('verify');  Add('vol');
  Add('xcopy');  Add('wmic');

  end;
end;
procedure TShellToHTML.ReplaceText(CharNum: Integer; OldText,
  NewText: string; var Text: string);
begin
  Delete(Text, CharNum, Length(OldText));
  Insert(NewText, Text, CharNum);
end;
end.



