object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 260
  ClientWidth = 422
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
  object pnlFundo: TPanel
    Left = 0
    Top = 49
    Width = 422
    Height = 211
    Align = alClient
    TabOrder = 0
    object lblUsuario: TLabel
      Left = 18
      Top = 35
      Width = 80
      Height = 23
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSenha: TLabel
      Left = 33
      Top = 99
      Width = 65
      Height = 23
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnLogin: TSpeedButton
      Left = 248
      Top = 152
      Width = 153
      Height = 38
      Caption = 'Entrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnLoginClick
    end
    object btnFechar: TSpeedButton
      Left = 18
      Top = 152
      Width = 153
      Height = 38
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnFecharClick
    end
    object edtUsuario: TEdit
      Left = 112
      Top = 40
      Width = 289
      Height = 21
      Hint = 'Deve digitar seu usu'#225'rio neste campo.'
      TabOrder = 0
      OnKeyDown = edtUsuarioKeyDown
    end
    object edtSenha: TEdit
      Left = 112
      Top = 104
      Width = 289
      Height = 21
      Hint = 'Deve digitar a senha do usu'#225'rio informado neste campo.'
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = edtSenhaKeyDown
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 49
    Align = alTop
    Caption = 'Login'
    Color = clDefault
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
end
