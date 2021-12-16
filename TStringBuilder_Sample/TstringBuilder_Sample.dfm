object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TStringBuilderSample'
  ClientHeight = 256
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 24
    Width = 105
    Height = 25
    Caption = 'Compare Size'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 70
    Width = 105
    Height = 25
    Caption = 'Compare Time'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 136
    Top = 70
    Width = 263
    Height = 178
    TabOrder = 2
  end
end
