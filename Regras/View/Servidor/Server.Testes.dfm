object frmTestes: TfrmTestes
  Left = 0
  Top = 0
  Caption = 'frmTestes'
  ClientHeight = 277
  ClientWidth = 471
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
    Left = 40
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Build Database'
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 160
    Top = 8
    Width = 303
    Height = 265
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 216
    Width = 137
    Height = 25
    Caption = 'Propriedade via rtti'
    TabOrder = 2
    OnClick = Button2Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=efficax'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 88
    Top = 136
  end
end
