object FormFreeAndNil: TFormFreeAndNil
  Left = 0
  Top = 0
  Caption = 'Free and FreeAndNil'
  ClientHeight = 191
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonExecTwice: TButton
    Left = 32
    Top = 32
    Width = 185
    Height = 25
    Caption = 'Execute FreeAndNil Twice'
    TabOrder = 0
    OnClick = ButtonExecTwiceClick
  end
  object ButtonFreeAndFreeAndNil: TButton
    Left = 32
    Top = 80
    Width = 185
    Height = 25
    Caption = 'Execute Free and FreeAndNil'
    TabOrder = 1
    OnClick = ButtonFreeAndFreeAndNilClick
  end
  object ButtonIndividually: TButton
    Left = 32
    Top = 128
    Width = 185
    Height = 25
    Caption = 'Exec Free and assign Nil'
    TabOrder = 2
    OnClick = ButtonIndividuallyClick
  end
end
