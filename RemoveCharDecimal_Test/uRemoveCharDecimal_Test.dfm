object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 144
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 40
    Top = 48
    Width = 193
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 280
    Top = 46
    Width = 109
    Height = 25
    Caption = 'Remove Char'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 280
    Top = 86
    Width = 109
    Height = 25
    Caption = 'Remove Decimal'
    TabOrder = 2
    OnClick = Button2Click
  end
end
