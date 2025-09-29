object Form2: TForm2
  Left = 1977
  Top = 134
  AlphaBlend = True
  AlphaBlendValue = 210
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 192
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 407
    Height = 151
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 403
    ExplicitHeight = 150
    object TabSheet1: TTabSheet
      Caption = 'Integer'
      object Label1: TLabel
        Left = 8
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Color :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorBox1: TColorBox
        Left = 54
        Top = 10
        Width = 219
        Height = 22
        Selected = clNavy
        TabOrder = 0
        OnSelect = CheckBox1Click
      end
      object CheckBox1: TCheckBox
        Left = 10
        Top = 48
        Width = 47
        Height = 17
        Caption = 'Bold'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 103
        Top = 48
        Width = 50
        Height = 17
        Caption = 'Italic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 188
        Top = 48
        Width = 77
        Height = 17
        Caption = 'Underline'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object Edit1: TEdit
        Left = 8
        Top = 72
        Width = 265
        Height = 21
        TabOrder = 4
        Text = '<span style="color: navy;">'
        OnChange = Edit1Change
      end
      object Edit2: TEdit
        Left = 8
        Top = 96
        Width = 265
        Height = 21
        TabOrder = 5
        Text = '</span>'
        OnChange = Edit1Change
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Strings'
      ImageIndex = 1
      object Label4: TLabel
        Left = 8
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Color :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorBox2: TColorBox
        Left = 54
        Top = 10
        Width = 219
        Height = 22
        Selected = clGreen
        TabOrder = 0
        OnSelect = CheckBox4Click
      end
      object CheckBox4: TCheckBox
        Left = 10
        Top = 48
        Width = 47
        Height = 17
        Caption = 'Bold'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = CheckBox4Click
      end
      object CheckBox5: TCheckBox
        Left = 103
        Top = 48
        Width = 50
        Height = 17
        Caption = 'Italic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox4Click
      end
      object CheckBox6: TCheckBox
        Left = 188
        Top = 48
        Width = 77
        Height = 17
        Caption = 'Underline'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = CheckBox4Click
      end
      object Edit3: TEdit
        Left = 8
        Top = 72
        Width = 265
        Height = 21
        TabOrder = 4
        Text = '<span style="color: navy;">'
        OnChange = Edit1Change
      end
      object Edit4: TEdit
        Left = 8
        Top = 96
        Width = 265
        Height = 21
        TabOrder = 5
        Text = '</span>'
        OnChange = Edit1Change
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Function'
      ImageIndex = 2
      object Label7: TLabel
        Left = 8
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Color :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorBox3: TColorBox
        Left = 54
        Top = 10
        Width = 219
        Height = 22
        TabOrder = 0
        OnSelect = CheckBox7Click
      end
      object CheckBox7: TCheckBox
        Left = 10
        Top = 48
        Width = 47
        Height = 17
        Caption = 'Bold'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox7Click
      end
      object CheckBox8: TCheckBox
        Left = 103
        Top = 48
        Width = 50
        Height = 17
        Caption = 'Italic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox7Click
      end
      object CheckBox9: TCheckBox
        Left = 188
        Top = 48
        Width = 77
        Height = 17
        Caption = 'Underline'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = CheckBox7Click
      end
      object Edit5: TEdit
        Left = 8
        Top = 72
        Width = 265
        Height = 21
        TabOrder = 4
        Text = '<b style="color: navy;">'
        OnChange = Edit1Change
      end
      object Edit6: TEdit
        Left = 8
        Top = 96
        Width = 265
        Height = 21
        TabOrder = 5
        Text = '</b>'
        OnChange = Edit1Change
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Comment'
      ImageIndex = 3
      object Label10: TLabel
        Left = 8
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Color :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorBox4: TColorBox
        Left = 54
        Top = 10
        Width = 219
        Height = 22
        Selected = clGray
        TabOrder = 0
        OnSelect = CheckBox10Click
      end
      object CheckBox10: TCheckBox
        Left = 10
        Top = 48
        Width = 47
        Height = 17
        Caption = 'Bold'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = CheckBox10Click
      end
      object CheckBox11: TCheckBox
        Left = 103
        Top = 48
        Width = 50
        Height = 17
        Caption = 'Italic'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox10Click
      end
      object CheckBox12: TCheckBox
        Left = 188
        Top = 48
        Width = 77
        Height = 17
        Caption = 'Underline'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = CheckBox10Click
      end
      object Edit7: TEdit
        Left = 8
        Top = 72
        Width = 265
        Height = 21
        TabOrder = 4
        Text = '<i style="color: navy;">'
        OnChange = Edit1Change
      end
      object Edit8: TEdit
        Left = 8
        Top = 96
        Width = 265
        Height = 21
        TabOrder = 5
        Text = '</i>'
        OnChange = Edit1Change
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Brace Bracket'
      ImageIndex = 4
      object Label13: TLabel
        Left = 8
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Color :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ColorBox5: TColorBox
        Left = 54
        Top = 10
        Width = 219
        Height = 22
        Selected = clGreen
        TabOrder = 0
        OnSelect = CheckBox13Click
      end
      object CheckBox13: TCheckBox
        Left = 10
        Top = 48
        Width = 47
        Height = 17
        Caption = 'Bold'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = CheckBox13Click
      end
      object CheckBox14: TCheckBox
        Left = 103
        Top = 48
        Width = 50
        Height = 17
        Caption = 'Italic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox13Click
      end
      object CheckBox15: TCheckBox
        Left = 188
        Top = 48
        Width = 77
        Height = 17
        Caption = 'Underline'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = CheckBox13Click
      end
      object Edit9: TEdit
        Left = 8
        Top = 72
        Width = 265
        Height = 21
        TabOrder = 4
        Text = '<span style="color: green;">'
        OnChange = Edit1Change
      end
      object Edit10: TEdit
        Left = 8
        Top = 96
        Width = 265
        Height = 21
        TabOrder = 5
        Text = '</span>'
        OnChange = Edit1Change
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Body Colors'
      ImageIndex = 5
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 148
        Height = 13
        Caption = 'Background Color (RGB) :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 52
        Width = 18
        Height = 13
        Caption = 'R :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 96
        Top = 52
        Width = 18
        Height = 13
        Caption = 'G :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 176
        Top = 52
        Width = 17
        Height = 13
        Caption = 'B :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape1: TShape
        Left = 168
        Top = 15
        Width = 49
        Height = 17
        Cursor = crHandPoint
        OnMouseDown = Shape1MouseDown
      end
      object Label8: TLabel
        Left = 16
        Top = 91
        Width = 67
        Height = 13
        Caption = 'Text Color :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpinEdit1: TSpinEdit
        Left = 40
        Top = 48
        Width = 49
        Height = 22
        MaxLength = 3
        MaxValue = 255
        MinValue = 0
        TabOrder = 0
        Value = 255
        OnChange = SpinEdit1Change
      end
      object SpinEdit2: TSpinEdit
        Left = 120
        Top = 48
        Width = 49
        Height = 22
        MaxLength = 3
        MaxValue = 255
        MinValue = 0
        TabOrder = 1
        Value = 255
        OnChange = SpinEdit2Change
      end
      object SpinEdit3: TSpinEdit
        Left = 200
        Top = 48
        Width = 49
        Height = 22
        MaxLength = 3
        MaxValue = 255
        MinValue = 0
        TabOrder = 2
        Value = 255
        OnChange = SpinEdit3Change
      end
      object ColorBox7: TColorBox
        Left = 96
        Top = 88
        Width = 153
        Height = 22
        TabOrder = 3
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Copyright'
      ImageIndex = 6
      object Label9: TLabel
        Left = 8
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Bottom :'
      end
      object RichEdit1: TRichEdit
        Left = 8
        Top = 8
        Width = 385
        Height = 81
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 0
        OnChange = RichEdit1Change
      end
      object Edit11: TEdit
        Left = 56
        Top = 100
        Width = 337
        Height = 21
        TabOrder = 1
        Text = 'Copyright '#169' 2025'
        OnChange = Edit1Change
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 151
    Width = 407
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 150
    ExplicitWidth = 403
    object BitBtn1: TBitBtn
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = '  Save'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000C1761BC27519
        BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
        04BC690AB96A15C3791FD5933DEFB736CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DB
        E8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6FFCDC6C0EAA714C0761DCD9551E8AE3C
        DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
        E9DCD7D4E59E20C77B25D09653EAB447DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDF
        E0DDE0DFDDDFDEDDDFE0DEDBD9D9EDEDEDDCD7D4E7A62BC9802BD49B58EBB950
        DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
        E9DCD7D4E8AC37CC8531D69E5BEDBD5ADCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EAB340D08B34D9A45EF0C263
        DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
        E9DCD7D4EDB749D2903AD8A35CF0C66DDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EEBD54D7963EDEAC69F9D281
        C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
        5EC19A64F7CA6BD99B44DDAB67F6D58BFFD056C0A887C8C5C9CEC6BFCDC6C0CD
        C6C0CDC6BFD6D0CAD6D3D0CFCED4C0A888FFD25DF3CC75DCA148DCA966F6D993
        FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
        A9FBCB63F3D07EE0A74CE5B973F6DA97FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDF
        DDDCEFF3F99F886FE5AF479E9189C7BDB2FDCF6AF5D484E3AC51E9BC75F8DD9E
        FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
        B8FFD26EF9DA8EE7B25BEAC079F8E09BFBD165D3C4AFEAEEF6ECEBE8ECEBE9EB
        E9E6FBFFFFA28E78DEAF4FA89C95D1C7B9FFDA78F5D889E2A442ECC47EFEF4D5
        FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
        E2FFDE88E4AA45FCF5ECECC681F0CA82F4CA7DE8C788EFCF94EFD498EDCF92EE
        D092EED093F2D396F7D79BF6D69BE6C48AEBB552FDF9F2FFFFFF}
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = '  Cancel'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object CheckBox16: TCheckBox
      Left = 8
      Top = 13
      Width = 65
      Height = 17
      Caption = 'Stay Top'
      TabOrder = 2
      OnClick = CheckBox16Click
    end
    object BitBtn3: TBitBtn
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      Caption = '  Default'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFF6DFBEEFC781EAB34EEBB84FEBB74EEAB54FEFC781F6DFBEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBF8E7B05FEEC35AF5D777FCEC8FFD
        E88BF8E289F7E286F6DA79EEC35AE7B05FFEFBF8FFFFFFFFFFFFFFFFFFFEFCF8
        E1A040F3D371F6DB80FAE284F2CF63B65100F5D775F2D272F4D476F6DC80F3D2
        71E19F3FFEFCF8FFFFFFFFFFFFE0A55CF2CD68F5D474F9DB77EDBE4ABB672FBB
        672FFFE272F9DC78F9DB76F9DA75FCE480F3D26BE0A55BFFFFFFF0D7BEE5AE4A
        F4D36FF6D66EE6AB3AB15B11FAFEFFBB672FD78B24DB9A35DB9833DA9632DB95
        36F2CE69E7B34CF0D7BEE0AD73EDC154F7D366E19E2ABD7030F7F2F0FFFFFFBB
        672FCF7B0FCF7B0FCF7B0FCF7B0FCF7B0FD49232F7D360E0AD73D28C41FDDA73
        E29C27C78544FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFCF7B0FFCDB70D38B41D49246E6BD65C6854BFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF800FFFEE9DD08B40C98338EEC971
        C98F59FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDCA643FAE795C67E32C27738FCE186E2AC4ACB893FF8F4F3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFA741F8DC81C27838CC9369EACA80
        EECA6BE3B045D09342F9F8F9FFFFFFE7B34EE7B34EE7B34EE7B34EE7B34EE7B3
        4EE7B34EEECE84CC9369E4C7B7CC904AF9E392E7BB58E2A937D59840FFFFFFDD
        AA6ADC9D23E1A83CE0A536DFA32EDFAB40F8E495CD904AE3C7B7FFFFFFB56F47
        E2B667F7E293E8C162E0A42DDBA75EDCA462E1A72CE4AF3FE4B349E8BD5FF7E5
        96E2B669B56F47FFFFFFFFFFFFFCF9F8A74F1ADFAF5AF8E189F1D87FE7C05EDE
        A547E8BF62E8C568F0D47CF8E18ADFAE5AA74F1AFCF9F8FFFFFFFFFFFFFFFFFF
        FCF8F6AD6345C17C2CE2B85BF1D274F8DF7FF5DB7EF0D173E2B85BC17C2CAD63
        45FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC1B7BD8362B05E1AAE
        6123AE6123B05E1ABD8362DCC1B7FFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object CheckBox17: TCheckBox
      Left = 88
      Top = 13
      Width = 38
      Height = 17
      Caption = 'Trz'
      TabOrder = 4
      OnClick = CheckBox17Click
    end
  end
  object ColorDialog1: TColorDialog
    Left = 284
    Top = 32
  end
end
