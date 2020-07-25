object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonWork: TButton
    Left = 56
    Top = 40
    Width = 120
    Height = 25
    Caption = 'ButtonWork'
    TabOrder = 0
    OnClick = ButtonWorkClick
  end
  object Memo1: TMemo
    Left = 208
    Top = 8
    Width = 409
    Height = 265
    TabOrder = 1
  end
  object Button1: TButton
    Left = 72
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
end
