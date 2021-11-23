object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 193
  ClientWidth = 342
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
    Left = 72
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Delimeter'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 182
    Top = 56
    Width = 75
    Height = 25
    Caption = 'CommaText'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 72
    Top = 87
    Width = 185
    Height = 89
    TabOrder = 2
  end
  object Button3: TButton
    Left = 72
    Top = 56
    Width = 75
    Height = 25
    Caption = 'LineBreak'
    TabOrder = 3
    OnClick = Button3Click
  end
end
