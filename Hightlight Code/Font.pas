unit Font;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, StrUtils, Buttons, IniFiles, ShellApi,
  Spin;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ColorBox1: TColorBox;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ColorBox2: TColorBox;
    Label4: TLabel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Edit3: TEdit;
    Edit4: TEdit;
    ColorBox3: TColorBox;
    Label7: TLabel;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Edit5: TEdit;
    Edit6: TEdit;
    ColorBox4: TColorBox;
    Label10: TLabel;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    Edit7: TEdit;
    Edit8: TEdit;
    ColorBox5: TColorBox;
    Label13: TLabel;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    Edit9: TEdit;
    Edit10: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox16: TCheckBox;
    TabSheet6: TTabSheet;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ColorDialog1: TColorDialog;
    Shape1: TShape;
    Label8: TLabel;
    ColorBox7: TColorBox;
    BitBtn3: TBitBtn;
    TabSheet7: TTabSheet;
    RichEdit1: TRichEdit;
    Edit11: TEdit;
    Label9: TLabel;
    CheckBox17: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure CheckBox17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GenOpenTag(Color: TColor; IsBold, IsItalic, IsUnderLine: Boolean):
      string;
    function GenCloseTag(Color: TColor; IsBold, IsItalic, IsUnderLine: Boolean):
      string;
    procedure WriteOptions;
    procedure ReadOptions;
    procedure ReadDefault;
  end;

var
  Form2: TForm2;
  TIF : TIniFile;

implementation

uses Unit1;

{$R *.dfm}
function MainDir : string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TForm2.WriteOptions;    // ################### Options Write
var OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(MainDir + 'Data\Options\')
   then ForceDirectories(MainDir + 'Data\Options\');

   case Form1.ComboBox1.ItemIndex of
   0 : TIF := TIniFile.Create(MainDir + 'Data\Options\ConfigPascal.ini');
   1 : TIF := TIniFile.Create(MainDir + 'Data\Options\ConfigCpp.ini');
   2 : TIF := TIniFile.Create(MainDir + 'Data\Options\ConfigJava.ini');
   3 : TIF := TIniFile.Create(MainDir + 'Data\Options\ConfigPython.ini');
   4 : TIF := TIniFile.Create(MainDir + 'Data\Options\ConfigShell.ini');
   end;

   with TIF do
   begin
   WriteInteger(OPT,'Integer',ColorBox1.ItemIndex);
   WriteBool(OPT,'IntegerBold',CheckBox1.Checked);
   WriteBool(OPT,'IntegerItalic',CheckBox2.Checked);
   WriteBool(OPT,'IntegerUnderline',CheckBox3.Checked);

   WriteInteger(OPT,'String',ColorBox2.ItemIndex);
   WriteBool(OPT,'StringBold',CheckBox4.Checked);
   WriteBool(OPT,'StringItalic',CheckBox5.Checked);
   WriteBool(OPT,'StringUnderline',CheckBox6.Checked);

   WriteInteger(OPT,'Function',ColorBox3.ItemIndex);
   WriteBool(OPT,'FunctionBold',CheckBox7.Checked);
   WriteBool(OPT,'FunctionItalic',CheckBox8.Checked);
   WriteBool(OPT,'FunctionUnderline',CheckBox9.Checked);

   WriteInteger(OPT,'Comment',ColorBox4.ItemIndex);
   WriteBool(OPT,'CommentBold',CheckBox10.Checked);
   WriteBool(OPT,'CommentItalic',CheckBox11.Checked);
   WriteBool(OPT,'CommentUnderline',CheckBox12.Checked);

   WriteInteger(OPT,'Brace',ColorBox5.ItemIndex);
   WriteBool(OPT,'BraceBold',CheckBox13.Checked);
   WriteBool(OPT,'BraceItalic',CheckBox14.Checked);
   WriteBool(OPT,'BraceUnderline',CheckBox15.Checked);

   WriteBool(OPT,'StayTop',CheckBox16.Checked);

   WriteInteger(OPT,'Red',SpinEdit1.Value);
   WriteInteger(OPT,'Green',SpinEdit2.Value);
   WriteInteger(OPT,'Blue',SpinEdit3.Value);

   WriteInteger(OPT,'TextColor',ColorBox7.ItemIndex);

   WriteString(OPT,'IntegerStartTag',Edit1.Text);
   WriteString(OPT,'IntegerEndTag',Edit2.Text);
   WriteString(OPT,'StringStartTag',Edit3.Text);
   WriteString(OPT,'StringEndTag',Edit4.Text);
   WriteString(OPT,'FunctionStartTag',Edit5.Text);
   WriteString(OPT,'FunctionEndTag',Edit6.Text);
   WriteString(OPT,'CommentStartTag',Edit7.Text);
   WriteString(OPT,'CommentEndTag',Edit8.Text);
   WriteString(OPT,'BraceStartTag',Edit9.Text);
   WriteString(OPT,'BraceEndTag',Edit10.Text);

   WriteString(OPT,'Copyright',Edit11.Text);
   WriteBool(OPT,'Trz',CheckBox17.Checked);

   //WriteBool(OPT,'SaveOptions',CheckBox1.Checked);
   //WriteInteger(OPT,'Compress',Combobox1.ItemIndex);
   //WriteInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
   Free;
   end;
end;

procedure TForm2.ReadOptions;    // ################### Options Read
var OPT:string;
begin
  OPT := 'Options';

  if Form1.ComboBox1.ItemIndex = 0 then begin
  if FileExists(MainDir + 'Data\Options\ConfigPascal.ini') then
  end;

  if Form1.ComboBox1.ItemIndex = 1 then begin
  if FileExists(MainDir + 'Data\Options\ConfigCpp.ini') then
  end;

  if Form1.ComboBox1.ItemIndex = 2 then begin
  if FileExists(MainDir + 'Data\Options\ConfigJava.ini') then
  end;

  if Form1.ComboBox1.ItemIndex = 3 then begin
  if FileExists(MainDir + 'Data\Options\ConfigPython.ini') then
  end;

  if Form1.ComboBox1.ItemIndex = 4 then begin
  if FileExists(MainDir + 'Data\Options\ConfigShell.ini') then
  end;

  begin

  case Form1.ComboBox1.ItemIndex of
  0 : TIF:=TIniFile.Create(MainDir + 'Data\Options\ConfigPascal.ini');
  1 : TIF:=TIniFile.Create(MainDir + 'Data\Options\ConfigCpp.ini');
  2 : TIF:=TIniFile.Create(MainDir + 'Data\Options\ConfigJava.ini');
  3 : TIF:=TIniFile.Create(MainDir + 'Data\Options\ConfigPython.ini');
  4 : TIF:=TIniFile.Create(MainDir + 'Data\Options\ConfigShell.ini');
  end;

  with TIF do
  begin
  ColorBox1.ItemIndex:=ReadInteger(OPT,'Integer',ColorBox1.ItemIndex);
  CheckBox1.Checked:=ReadBool(OPT,'IntegerBold',CheckBox1.Checked);
  CheckBox2.Checked:=ReadBool(OPT,'IntegerItalic',CheckBox2.Checked);
  CheckBox3.Checked:=ReadBool(OPT,'IntegerUnderline',CheckBox3.Checked);

  ColorBox2.ItemIndex:=ReadInteger(OPT,'String',ColorBox2.ItemIndex);
  CheckBox4.Checked:=ReadBool(OPT,'StringBold',CheckBox4.Checked);
  CheckBox5.Checked:=ReadBool(OPT,'StringItalic',CheckBox5.Checked);
  CheckBox6.Checked:=ReadBool(OPT,'StringUnderline',CheckBox6.Checked);

  ColorBox3.ItemIndex:=ReadInteger(OPT,'Function',ColorBox3.ItemIndex);
  CheckBox7.Checked:=ReadBool(OPT,'FunctionBold',CheckBox7.Checked);
  CheckBox8.Checked:=ReadBool(OPT,'FunctionItalic',CheckBox8.Checked);
  CheckBox9.Checked:=ReadBool(OPT,'FunctionUnderline',CheckBox9.Checked);

  ColorBox4.ItemIndex:=ReadInteger(OPT,'Comment',ColorBox4.ItemIndex);
  CheckBox10.Checked:=ReadBool(OPT,'CommentBold',CheckBox10.Checked);
  CheckBox11.Checked:=ReadBool(OPT,'CommentItalic',CheckBox11.Checked);
  CheckBox12.Checked:=ReadBool(OPT,'CommentUnderline',CheckBox12.Checked);

  ColorBox5.ItemIndex:=ReadInteger(OPT,'Brace',ColorBox5.ItemIndex);
  CheckBox13.Checked:=ReadBool(OPT,'BraceBold',CheckBox13.Checked);
  CheckBox14.Checked:=ReadBool(OPT,'BraceItalic',CheckBox14.Checked);
  CheckBox15.Checked:=ReadBool(OPT,'BraceUnderline',CheckBox15.Checked);

  CheckBox16.Checked:=ReadBool(OPT,'StayTop',CheckBox16.Checked);

  SpinEdit1.Value:=ReadInteger(OPT,'Red',SpinEdit1.Value);
  SpinEdit2.Value:=ReadInteger(OPT,'Green',SpinEdit2.Value);
  SpinEdit3.Value:=ReadInteger(OPT,'Blue',SpinEdit3.Value);

  ColorBox7.ItemIndex:=ReadInteger(OPT,'TextColor',ColorBox7.ItemIndex);

  Edit1.Text:=ReadString(OPT,'IntegerStartTag',Edit1.Text);
  Edit2.Text:=ReadString(OPT,'IntegerEndTag',Edit2.Text);
  Edit3.Text:=ReadString(OPT,'StringStartTag',Edit3.Text);
  Edit4.Text:=ReadString(OPT,'StringEndTag',Edit4.Text);
  Edit5.Text:=ReadString(OPT,'FunctionStartTag',Edit5.Text);
  Edit6.Text:=ReadString(OPT,'FunctionEndTag',Edit6.Text);
  Edit7.Text:=ReadString(OPT,'CommentStartTag',Edit7.Text);
  Edit8.Text:=ReadString(OPT,'CommentEndTag',Edit8.Text);
  Edit9.Text:=ReadString(OPT,'BraceStartTag',Edit9.Text);
  Edit10.Text:=ReadString(OPT,'BraceEndTag',Edit10.Text);

  Edit11.Text:=ReadString(OPT,'Copyright',Edit11.Text);

  CheckBox17.Checked:=ReadBool(OPT,'Trz',CheckBox7.Checked);

  //CheckBox1.Checked:=ReadBool(OPT,'SaveOptions',CheckBox1.Checked);
  //Combobox1.ItemIndex:=ReadInteger(OPT,'Compress',combobox1.ItemIndex);
  //RadioGroup1.ItemIndex:=ReadInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
  Free;
  end;
  end;
end;

procedure TForm2.ReadDefault;    // ################### Options Read
var OPT:string;
begin
  OPT := 'Options';


  if Form1.ComboBox1.ItemIndex = 0 then begin
    if FileExists(MainDir + 'Data\Options\DefaultPascal.ini') then
  end;

  if Form1.ComboBox1.ItemIndex = 1 then begin
    if FileExists(MainDir + 'Data\Options\DefaultCpp.ini') then
  end;

  if Form1.ComboBox1.ItemIndex = 2 then begin
    if FileExists(MainDir + 'Data\Options\DefaultJava.ini') then
  end;

  if Form1.ComboBox1.ItemIndex = 3 then begin
    if FileExists(MainDir + 'Data\Options\DefaultPython.ini') then
  end;

  if Form1.ComboBox1.ItemIndex = 4 then begin
    if FileExists(MainDir + 'Data\Options\DefaultShell.ini') then
  end;

  case Form1.ComboBox1.ItemIndex of
    0 : TIF:=TIniFile.Create(MainDir + 'Data\Options\DefaultPascal.ini');
    1 : TIF:=TIniFile.Create(MainDir + 'Data\Options\DefaultCpp.ini');
    2 : TIF:=TIniFile.Create(MainDir + 'Data\Options\DefaultJava.ini');
    3 : TIF:=TIniFile.Create(MainDir + 'Data\Options\DefaultPython.ini');
    4 : TIF:=TIniFile.Create(MainDir + 'Data\Options\DefaultShell.ini');
  end;

  with TIF do
  begin
  ColorBox1.ItemIndex:=ReadInteger(OPT,'Integer',ColorBox1.ItemIndex);
  CheckBox1.Checked:=ReadBool(OPT,'IntegerBold',CheckBox1.Checked);
  CheckBox2.Checked:=ReadBool(OPT,'IntegerItalic',CheckBox2.Checked);
  CheckBox3.Checked:=ReadBool(OPT,'IntegerUnderline',CheckBox3.Checked);

  ColorBox2.ItemIndex:=ReadInteger(OPT,'String',ColorBox2.ItemIndex);
  CheckBox4.Checked:=ReadBool(OPT,'StringBold',CheckBox4.Checked);
  CheckBox5.Checked:=ReadBool(OPT,'StringItalic',CheckBox5.Checked);
  CheckBox6.Checked:=ReadBool(OPT,'StringUnderline',CheckBox6.Checked);

  ColorBox3.ItemIndex:=ReadInteger(OPT,'Function',ColorBox3.ItemIndex);
  CheckBox7.Checked:=ReadBool(OPT,'FunctionBold',CheckBox7.Checked);
  CheckBox8.Checked:=ReadBool(OPT,'FunctionItalic',CheckBox8.Checked);
  CheckBox9.Checked:=ReadBool(OPT,'FunctionUnderline',CheckBox9.Checked);

  ColorBox4.ItemIndex:=ReadInteger(OPT,'Comment',ColorBox4.ItemIndex);
  CheckBox10.Checked:=ReadBool(OPT,'CommentBold',CheckBox10.Checked);
  CheckBox11.Checked:=ReadBool(OPT,'CommentItalic',CheckBox11.Checked);
  CheckBox12.Checked:=ReadBool(OPT,'CommentUnderline',CheckBox12.Checked);

  ColorBox5.ItemIndex:=ReadInteger(OPT,'Brace',ColorBox5.ItemIndex);
  CheckBox13.Checked:=ReadBool(OPT,'BraceBold',CheckBox13.Checked);
  CheckBox14.Checked:=ReadBool(OPT,'BraceItalic',CheckBox14.Checked);
  CheckBox15.Checked:=ReadBool(OPT,'BraceUnderline',CheckBox15.Checked);

  CheckBox16.Checked:=ReadBool(OPT,'StayTop',CheckBox16.Checked);

  SpinEdit1.Value:=ReadInteger(OPT,'Red',SpinEdit1.Value);
  SpinEdit2.Value:=ReadInteger(OPT,'Green',SpinEdit2.Value);
  SpinEdit3.Value:=ReadInteger(OPT,'Blue',SpinEdit3.Value);

  ColorBox7.ItemIndex:=ReadInteger(OPT,'TextColor',ColorBox7.ItemIndex);

  Edit1.Text:=ReadString(OPT,'IntegerStartTag',Edit1.Text);
  Edit2.Text:=ReadString(OPT,'IntegerEndTag',Edit2.Text);
  Edit3.Text:=ReadString(OPT,'StringStartTag',Edit3.Text);
  Edit4.Text:=ReadString(OPT,'StringEndTag',Edit4.Text);
  Edit5.Text:=ReadString(OPT,'FunctionStartTag',Edit5.Text);
  Edit6.Text:=ReadString(OPT,'FunctionEndTag',Edit6.Text);
  Edit7.Text:=ReadString(OPT,'CommentStartTag',Edit7.Text);
  Edit8.Text:=ReadString(OPT,'CommentEndTag',Edit8.Text);
  Edit9.Text:=ReadString(OPT,'BraceStartTag',Edit9.Text);
  Edit10.Text:=ReadString(OPT,'BraceEndTag',Edit10.Text);

  //CheckBox1.Checked:=ReadBool(OPT,'SaveOptions',CheckBox1.Checked);
  //Combobox1.ItemIndex:=ReadInteger(OPT,'Compress',combobox1.ItemIndex);
  //RadioGroup1.ItemIndex:=ReadInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
  Free;
  end;
  //end;
end;

function TForm2.GenCloseTag(Color: TColor; IsBold, IsItalic,
  IsUnderLine: Boolean): string;
begin
  Result := '';
  if not (IsBold or IsItalic or IsUnderLine) then begin
    if Color <> clBlack then Result := '</span>'; end else
  begin
    if IsUnderLine then Result := Result + '</u>';
    if IsItalic then Result := Result + '</i>';
    if IsBold then Result := Result + '</b>';
  end;
end;

function TForm2.GenOpenTag(Color: TColor; IsBold, IsItalic,
  IsUnderLine: Boolean): string;
var
  S, a: string;
begin
  Result := '';
  if Color = clBlack then S := '' else

  a := ColorToString(Color);
  a := RightStr(a, Length(a)- 2);

    S := ' style="color: ' + a + ';"';
  if not (IsBold or IsItalic or IsUnderLine) then begin
    if S <> '' then Result := '<span' + S + '>'; end else
  begin
    if IsBold then Result := '<b' + S + '>';
    if IsItalic then if IsBold then Result := Result + '<i>' else
        Result := '<i' + S + '>';
    if IsUnderLine then if IsBold or IsItalic then Result := Result + '<u>' else
        Result := '<u' + S + '>';
  end;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  Edit1.Text := GenOpenTag(ColorBox1.Selected, CheckBox1.Checked,
    CheckBox2.Checked, CheckBox3.Checked);
  Edit2.Text := GenCloseTag(ColorBox1.Selected, CheckBox1.Checked,
    CheckBox2.Checked, CheckBox3.Checked);
  BitBtn1.Enabled := true; Panel1.SetFocus;
end;

procedure TForm2.CheckBox4Click(Sender: TObject);
begin
  Edit3.Text := GenOpenTag(ColorBox2.Selected, CheckBox4.Checked,
    CheckBox5.Checked, CheckBox6.Checked);
  Edit4.Text := GenCloseTag(ColorBox2.Selected, CheckBox4.Checked,
    CheckBox5.Checked, CheckBox6.Checked);
  BitBtn1.Enabled := true; Panel1.SetFocus;
end;

procedure TForm2.CheckBox7Click(Sender: TObject);
begin
  Edit5.Text := GenOpenTag(ColorBox3.Selected, CheckBox7.Checked,
    CheckBox8.Checked, CheckBox9.Checked);
  Edit6.Text := GenCloseTag(ColorBox3.Selected, CheckBox7.Checked,
    CheckBox8.Checked, CheckBox9.Checked);
  BitBtn1.Enabled := true; Panel1.SetFocus;
end;

procedure TForm2.CheckBox10Click(Sender: TObject);
begin
  Edit7.Text := GenOpenTag(ColorBox4.Selected, CheckBox10.Checked,
    CheckBox11.Checked, CheckBox12.Checked);
  Edit8.Text := GenCloseTag(ColorBox4.Selected, CheckBox10.Checked,
    CheckBox11.Checked, CheckBox12.Checked);
  BitBtn1.Enabled := true; Panel1.SetFocus;
end;

procedure TForm2.CheckBox13Click(Sender: TObject);
begin
  Edit9.Text := GenOpenTag(ColorBox5.Selected, CheckBox13.Checked,
    CheckBox14.Checked, CheckBox15.Checked);
  Edit10.Text := GenCloseTag(ColorBox5.Selected, CheckBox13.Checked,
    CheckBox14.Checked, CheckBox15.Checked);
  BitBtn1.Enabled := true; Panel1.SetFocus;
end;

procedure TForm2.CheckBox16Click(Sender: TObject);
begin
  if CheckBox16.Checked = true then begin
  SetWindowPos(Handle, HWND_TOPMOST, Left,Top, Width,Height,
             SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end else begin
  SetWindowPos(Handle, HWND_NOTOPMOST, Left,Top, Width,Height,
             SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end;
  BitBtn1.Enabled := true; Panel1.SetFocus;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  WriteOptions;

  RichEdit1.Lines.SaveToFile(ExtractFilePath(Application.ExeName) +
                             'Data\Options\Copyright.ini');
  Sleep(50);
  BitBtn1.Enabled := false;
  Panel1.SetFocus;
  Screen.Cursor := crDefault;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  ReadOptions;

  case Form1.ComboBox1.ItemIndex of
  0 : Caption := 'Config Pascal';
  1 : Caption := 'Config C/C++';
  2 : Caption := 'Config JavaScript';
  3 : Caption := 'Config Python';
  4 : Caption := 'Config Shell/Batch';
  end;

  RichEdit1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
                             'Data\Options\Copyright.ini');
  Shape1.Brush.Color := RGB(SpinEdit1.Value,SpinEdit2.Value,SpinEdit3.Value);

  CheckBox17.OnClick(sender);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Close();
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.BitBtn4.Enabled := true;
end;

procedure TForm2.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  MyColor : TColor;
begin
  if ColorDialog1.Execute then begin
  Shape1.Brush.Color := ColorDialog1.Color;

  MyColor := ColorDialog1.Color;

  SpinEdit1.Value := GetRValue(MyColor);
  SpinEdit2.Value := GetGValue(MyColor);
  SpinEdit3.Value := GetBValue(MyColor);

  end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  Panel1.SetFocus;
  Beep;
  if MessageBox(Handle,'This will load default settings, are you sure ?','Confirm',
                MB_YESNO) = IDYES then
    BEGIN
      ReadDefault;
    END;
end;

procedure TForm2.SpinEdit1Change(Sender: TObject);
begin
  Shape1.Brush.Color := RGB(SpinEdit1.Value,SpinEdit2.Value,SpinEdit3.Value);
end;

procedure TForm2.SpinEdit2Change(Sender: TObject);
begin
  Shape1.Brush.Color := RGB(SpinEdit1.Value,SpinEdit2.Value,SpinEdit3.Value);
end;

procedure TForm2.SpinEdit3Change(Sender: TObject);
begin
  Shape1.Brush.Color := RGB(SpinEdit1.Value,SpinEdit2.Value,SpinEdit3.Value);
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  BitBtn1.Enabled := true;
end;

procedure TForm2.RichEdit1Change(Sender: TObject);
begin
  BitBtn1.Enabled := true;
end;

procedure TForm2.CheckBox17Click(Sender: TObject);
begin
  if CheckBox17.Checked = true then begin
  Form2.AlphaBlend := true;
  end else begin
  Form2.AlphaBlend := false;
  end;  
end;

end.

