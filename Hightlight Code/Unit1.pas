unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CodeToHTML, Buttons, XPMan, ComCtrls,
  ShellApi, Font, IniFiles, Cpp, JavaScript, Python, Shell;

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel4: TPanel;
    Splitter1: TSplitter;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox6: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ScrollBar1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    procedure DropFiles(var msg: TMessage ); message WM_DROPFILES;
  public
    { Public declarations }
    procedure WriteOptions;
    procedure ReadOptions;
  end;

var
  Form1: TForm1;
  TIF : TIniFile;
  Img : TImage;

implementation

{$R *.dfm}
function MainDir : string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TForm1.WriteOptions;    // ################### Options Write
var OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(MainDir + 'Data\Options\')
   then ForceDirectories(MainDir + 'Data\Options\');

   TIF := TIniFile.Create(MainDir + 'Data\Options\Options.ini');
   with TIF do
   begin
   WriteBool(OPT,'Edit',CheckBox2.Checked);
   WriteInteger(OPT,'Font',ScrollBar1.Position);
   WriteBool(OPT,'BodyTag',CheckBox1.Checked);
   WriteBool(OPT,'Invert',CheckBox3.Checked);
   WriteBool(OPT,'Bold',CheckBox4.Checked);
   WriteBool(OPT,'Copyright',CheckBox5.Checked);
   WriteInteger(OPT,'Code',Combobox1.ItemIndex);
   WriteBool(OPT,'Tabs',CheckBox6.Checked);


   //WriteBool(OPT,'SaveOptions',CheckBox1.Checked);
   //WriteInteger(OPT,'Compress',Combobox1.ItemIndex);
   //WriteInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
   Free;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var OPT:string;
begin
  OPT := 'Options';
  if FileExists(MainDir + 'Data\Options\Options.ini') then
  begin
  TIF:=TIniFile.Create(MainDir + 'Data\Options\Options.ini');
  with TIF do
  begin
  CheckBox2.Checked:=ReadBool(OPT,'Edit',CheckBox2.Checked);
  ScrollBar1.Position:=ReadInteger(OPT,'Font',ScrollBar1.Position);
  CheckBox1.Checked:=ReadBool(OPT,'BodyTag',CheckBox1.Checked);
  CheckBox3.Checked:=ReadBool(OPT,'Invert',CheckBox3.Checked);
  CheckBox4.Checked:=ReadBool(OPT,'Bold',CheckBox4.Checked);
  CheckBox5.Checked:=ReadBool(OPT,'Copyright',CheckBox5.Checked);
  Combobox1.ItemIndex:=ReadInteger(OPT,'Code',combobox1.ItemIndex);
  CheckBox6.Checked:=ReadBool(OPT,'Tabs',CheckBox6.Checked);


  //CheckBox1.Checked:=ReadBool(OPT,'SaveOptions',CheckBox1.Checked);
  //Combobox1.ItemIndex:=ReadInteger(OPT,'Compress',combobox1.ItemIndex);
  //RadioGroup1.ItemIndex:=ReadInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
  Free;
  end;
  end;
end;

function FormatHTMLClipboardHeader(HTMLText: string): string;
const
  CrLf = #13#10;
begin
  Result := 'Version:0.9' + CrLf;
  Result := Result + 'StartHTML:-1' + CrLf;
  Result := Result + 'EndHTML:-1' + CrLf;
  Result := Result + 'StartFragment:000081' + CrLf;
  Result := Result + 'EndFragment:같같같' + CrLf;
  Result := Result + HTMLText + CrLf;
  Result := StringReplace(Result, '같같같', Format('%.6d', [Length(Result)]), []);
end;

procedure CopyHTMLToClipBoard(const str: string; const htmlStr: string = '');
var
  gMem: HGLOBAL;
  lp: PChar;
  Strings: array[0..1] of string;
  Formats: array[0..1] of UINT;
  i: Integer;
begin
  gMem := 0;
  {$IFNDEF USEVCLCLIPBOARD}
  Win32Check(OpenClipBoard(0));
  {$ENDIF}
  try
    //most descriptive first as per api docs
    Strings[0] := FormatHTMLClipboardHeader(htmlStr);
    Strings[1] := str;
    Formats[0] := RegisterClipboardFormat('HTML Format');
    Formats[1] := CF_TEXT;
    {$IFNDEF USEVCLCLIPBOARD}
    Win32Check(EmptyClipBoard);
    {$ENDIF}
    for i := 0 to High(Strings) do
    begin
      if Strings[i] = '' then Continue;
      //an extra "1" for the null terminator
      gMem := GlobalAlloc(GMEM_DDESHARE + GMEM_MOVEABLE, Length(Strings[i]) + 1);
      {Succeeded, now read the stream contents into the memory the pointer points at}
      try
        Win32Check(gmem <> 0);
        lp := GlobalLock(gMem);
        Win32Check(lp <> nil);
        CopyMemory(lp, PChar(Strings[i]), Length(Strings[i]) + 1);
      finally
        GlobalUnlock(gMem);
      end;
      Win32Check(gmem <> 0);
      SetClipboardData(Formats[i], gMEm);
      Win32Check(gmem <> 0);
      gmem := 0;
    end;
  finally
    {$IFNDEF USEVCLCLIPBOARD}
    Win32Check(CloseClipBoard);
    {$ENDIF}
  end;
end;

function Get_File_Size4(const S: string): Int64;
var
  FD: TWin32FindData;
  FH: THandle;
begin
  FH := FindFirstFile(PChar(S), FD);
  if FH = INVALID_HANDLE_VALUE then Result := 0
  else
    try
      Result := FD.nFileSizeHigh;
      Result := Result shl 32;
      Result := Result + FD.nFileSizeLow;
    finally
     // CloseHandle(FH);
    end;
end;

procedure TForm1.DropFiles(var msg: TMessage );
var
  i, count  : integer;
  dropFileName : array [0..511] of Char;
  MAXFILENAME: integer; 
begin
  Img.Free;
  Memo1.Clear;

  MAXFILENAME := 511;
  count := DragQueryFile(msg.WParam, $FFFFFFFF, dropFileName, MAXFILENAME);
  for i := 0 to count - 1 do
  begin 
    DragQueryFile(msg.WParam, i, dropFileName, MAXFILENAME);
    Memo1.Lines.LoadFromFile(dropFileName);
    Memo2.Clear;
    StatusBar1.Panels[1].Text := ExtractFileName(dropFileName);
    StatusBar1.Panels[7].Text := IntToStr(Memo1.Lines.Count);
    OpenDialog1.FileName := dropFileName;
    StatusBar1.Panels[3].Text := IntToStr( Get_File_Size4(OpenDialog1.FileName) div 1000) + ' Kb';
  end;

  if CheckBox6.Checked = true then begin
    Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, #9, '   ', [rfReplaceAll]);
  end;

  DragFinish(msg.WParam);
  Img:= TImage.Create(Memo1);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 112 then Memo1.Clear;
  if Key = 113 then Memo2.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DragAcceptFiles(Handle, True);
  Memo1.MaxLength := $7FFFFFF0;
  Memo2.MaxLength := $7FFFFFF0;

  Application.HintPause := 0;
  Application.HintHidePause := 50000;

  Img:= TImage.Create(Memo1);
  Img.ClientHeight := Memo1.ClientHeight;
  Img.ClientWidth := Memo1.ClientWidth;
  Img.Left := 20;
  Img.Top := 40;
  Img.Picture.LoadFromFile(MainDir + 'gfx\Drag.bmp');
  Img.Parent := Memo1;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  if Memo2.Text = '' then begin
  Beep;
  MessageDlg('No HTML Code found.',mtInformation, [mbOK], 0);
  Exit;
  end;

  if SaveDialog1.Execute then Memo2.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  Screen.Cursor := crHourGlass;
  if Memo1.Text = '' then begin
  Screen.Cursor := crDefault;
  Beep;
  MessageDlg('No HTML Code to Convert.',mtInformation, [mbOK], 0);
  Exit;
  end;

  if ComboBox1.ItemIndex = 0 then begin
    with TDelphiToHTML.Create, Form2 do begin
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

  if ComboBox1.ItemIndex = 1 then begin
    with TCppToHTML.Create, Form2 do begin
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

    if ComboBox1.ItemIndex = 2 then begin
    with TJavaScriptToHTML.Create, Form2 do begin
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

    if ComboBox1.ItemIndex = 3 then begin
    with TPythonToHTML.Create, Form2 do begin
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

    if ComboBox1.ItemIndex = 4 then begin
    with TShellToHTML.Create, Form2 do begin
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

  Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  BitBtn4.Enabled := false;
  Form2.Show;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var
  Dir: string;
begin
  StatusBar1.SetFocus;
  if Memo2.Text = '' then begin
  Beep;
  MessageDlg('No HTML Code to Test.',mtInformation, [mbOK], 0);
  Exit;
  end;

  Dir := ExtractFilePath(ParamStr(0));
  Memo2.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + 'Data\Temp\Tempfile.html');
  ShellExecute(Handle, 'open',
  PChar(ExtractFilePath(Application.ExeName) + 'Data\Temp\Tempfile.html'),
                    nil, nil, SW_SHOWNORMAL) ;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ReadOptions;
  ComboBox1.OnChange(sender);
  CheckBox2.OnClick(sender);
  ScrollBar1.OnChange(sender);

  try
  Form2.Show;
  Form2.ColorBox1.OnSelect(sender);
  Form2.ColorBox2.OnSelect(sender);
  Form2.ColorBox3.OnSelect(sender);
  Form2.ColorBox4.OnSelect(sender);
  Form2.ColorBox5.OnSelect(sender);
  Form2.Close;
  except
  Form2.Close;
  end;

  CheckBox3.OnClick(sender);
  CheckBox4.OnClick(sender);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteOptions;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Memo1.Font.Size := ScrollBar1.Position;
  Memo2.Font.Size := ScrollBar1.Position;
  StatusBar1.Panels[5].Text := IntToStr(Scrollbar1.Position);
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  if CheckBox2.Checked = true then begin
  Memo1.ReadOnly := false;
  Memo2.ReadOnly := false;
  Memo1.Color := clWhite;
  Memo2.Color := clWhite;
  end else begin
  Memo1.ReadOnly := true;
  Memo2.ReadOnly := true;
  Memo1.Color := cl3DLight;
  Memo2.Color := cl3DLight;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Img.Free;
  Memo1.Clear;

  if OpenDialog1.Execute then begin
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  StatusBar1.Panels[1].Text := ExtractFileName(OpenDialog1.FileName);
  StatusBar1.Panels[7].Text := IntToStr(Memo1.Lines.Count);

  if CheckBox6.Checked = true then begin
    Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, #9, '   ', [rfReplaceAll]);
  end;

  StatusBar1.Panels[3].Text := IntToStr( Get_File_Size4(OpenDialog1.FileName) div 1000) + ' Kb';
  end;
  Img:= TImage.Create(Memo1);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
  StatusBar1.Panels[1].Text := '';
  StatusBar1.Panels[3].Text := '0 Kb';
  StatusBar1.Panels[7].Text := '0';

  Img:= TImage.Create(Memo1);
  Img.ClientHeight := Memo1.ClientHeight;
  Img.ClientWidth := Memo1.ClientWidth;
  Img.Left := 20;
  Img.Top := 40;
  Img.Picture.LoadFromFile(MainDir + 'gfx\Drag.bmp');
  Img.Parent := Memo1;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  StatusBar1.Panels[1].Text := ExtractFileName(OpenDialog1.FileName);
  StatusBar1.Panels[7].Text := IntToStr(Memo1.Lines.Count);
  StatusBar1.Panels[3].Text := IntToStr( Get_File_Size4(OpenDialog1.FileName) div 1000) + ' Kb';
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, #9, '   ', [rfReplaceAll]);
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked = true then begin
  Memo2.Color := clBlack;
  Memo2.Font.Color := clWhite;
  Memo1.Color := clBlack;
  Memo1.Font.Color := clWhite;
  end else begin
  Memo2.Color := clWhite;
  Memo2.Font.Color := clBlack;
  Memo1.Color := clWhite;
  Memo1.Font.Color := clBlack;
  end;
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked = true then begin
  Memo2.Font.Style := [fsBold];
  Memo1.Font.Style := [fsBold];
  end else begin
  Memo2.Font.Style := [];
  Memo1.Font.Style := [];
  end;
  StatusBar1.SetFocus;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
  0 : Form2.TabSheet5.Caption := 'Brace Bracket';
  1 : Form2.TabSheet5.Caption := 'Parameters';
  2 : Form2.TabSheet5.Caption := 'Parameters';
  3 : Form2.TabSheet5.Caption := 'Parameters';
  4 : Form2.TabSheet5.Caption := 'Parameters';
  end;

  try
    Form2.Show;
    Form2.ColorBox1.OnSelect(sender);
    Form2.ColorBox2.OnSelect(sender);
    Form2.ColorBox3.OnSelect(sender);
    Form2.ColorBox4.OnSelect(sender);
    Form2.ColorBox5.OnSelect(sender);
    Form2.Close;
  except
    Form2.Close;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  Memo2.Clear;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  StatusBar1.SetFocus;
  CopyHTMLToClipBoard(Memo2.Text);
end;

end.

