object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FileLoad&Parsing'
  ClientHeight = 676
  ClientWidth = 1109
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonLoadFile: TButton
    Left = 40
    Top = 40
    Width = 75
    Height = 25
    Caption = #48520#47084#50724#44592
    TabOrder = 0
    OnClick = ButtonLoadFileClick
  end
  object MemoContent: TMemo
    Left = 144
    Top = 42
    Width = 633
    Height = 626
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object MemoNotFounded: TMemo
    Left = 800
    Top = 42
    Width = 301
    Height = 626
    TabOrder = 2
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 32
    Top = 432
  end
end
