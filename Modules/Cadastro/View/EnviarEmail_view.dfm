object EnviarEmailView: TEnviarEmailView
  Left = 0
  Top = 0
  Caption = 'Enviar dados'
  ClientHeight = 327
  ClientWidth = 400
  Color = 14078360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblEmail: TLabel
    Left = 56
    Top = 79
    Width = 36
    Height = 16
    Caption = 'E-mail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSenha: TLabel
    Left = 56
    Top = 141
    Width = 36
    Height = 16
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnEnviar: TSpeedButton
    Left = 186
    Top = 272
    Width = 150
    Height = 40
    Caption = 'ENVIAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSmtp: TLabel
    Left = 56
    Top = 205
    Width = 95
    Height = 16
    Caption = 'Servidor (SMTP)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnCancelar: TSpeedButton
    Left = 56
    Top = 272
    Width = 113
    Height = 40
    Caption = 'CANCELAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtEmail: TEdit
    Left = 56
    Top = 101
    Width = 280
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 56
    Top = 163
    Width = 280
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtSmtp: TEdit
    Left = 56
    Top = 227
    Width = 280
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 60
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object lblTitulo: TLabel
      Left = 16
      Top = 10
      Width = 166
      Height = 35
      Caption = 'Enviar e-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
