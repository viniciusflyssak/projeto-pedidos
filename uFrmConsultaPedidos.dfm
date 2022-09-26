object frmConsultaPedidos: TfrmConsultaPedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta: pedidos'
  ClientHeight = 538
  ClientWidth = 1161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1161
    Height = 49
    Align = alTop
    Caption = 'Consulta de pedidos'
    Color = clDefault
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 515
  end
  object pnlFundo: TPanel
    Left = 0
    Top = 49
    Width = 1161
    Height = 440
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 515
    object grdPedidos: TDBGrid
      Left = 8
      Top = 6
      Width = 1142
      Height = 428
      DataSource = dtsPedidosGrid
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grdPedidosCellClick
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 489
    Width = 1161
    Height = 49
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 515
    object btnFinalizar: TSpeedButton
      Left = 707
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Finalizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnFinalizarClick
    end
    object btnAlterar: TSpeedButton
      Left = 588
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnAlterarClick
    end
    object btnExcluir: TSpeedButton
      Left = 469
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnExcluirClick
    end
    object btnCadastrat: TSpeedButton
      Left = 350
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Cadastrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCadastratClick
    end
  end
  object qryPedidosGrid: TFDQuery
    SQL.Strings = (
      
        'SELECT P.NROPEDIDO AS "N'#186' Pedido", P.DATA AS "Data", P.CODCLIENT' +
        'E AS "C'#243'd Cliente", C.NOME AS "Nome cliente", '
      
        #9'   P.SITUACAO AS "Situa'#231#227'o", P.TIPO AS "Tipo", P.QTDETOTAL AS "' +
        'Qtde total", P.VALORTOTAL AS "Valor total" '
      'FROM PEDIDOS P'
      'INNER JOIN  CLIENTES C ON C.CODCLIENTE = P.CODCLIENTE  ')
    Left = 400
    Top = 105
  end
  object dtsPedidosGrid: TDataSource
    DataSet = qryPedidosGrid
    Left = 400
    Top = 169
  end
end
