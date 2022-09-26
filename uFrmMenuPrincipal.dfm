object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Menu principal'
  ClientHeight = 498
  ClientWidth = 490
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 49
    Align = alTop
    Caption = 'Menu Principal'
    Color = clDefault
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object pnlFundo: TPanel
    Left = 0
    Top = 49
    Width = 490
    Height = 449
    Align = alClient
    TabOrder = 1
    object btnPedidos: TSpeedButton
      Left = 152
      Top = 281
      Width = 177
      Height = 49
      Caption = 'Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnPedidosClick
    end
    object btnSair: TSpeedButton
      Left = 152
      Top = 368
      Width = 177
      Height = 49
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSairClick
    end
  end
end
