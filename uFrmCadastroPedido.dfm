object frmCadastroPedido: TfrmCadastroPedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro do pedido'
  ClientHeight = 578
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 49
    Width = 515
    Height = 248
    Align = alTop
    TabOrder = 0
    object lblNro: TLabel
      Left = 57
      Top = 32
      Width = 88
      Height = 19
      Caption = 'N'#186' Pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblData: TLabel
      Left = 100
      Top = 57
      Width = 45
      Height = 19
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCodCliente: TLabel
      Left = 45
      Top = 82
      Width = 100
      Height = 19
      Caption = 'C'#243'd Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNomeCliente: TLabel
      Left = 32
      Top = 107
      Width = 113
      Height = 19
      Caption = 'Nome cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSituacao: TLabel
      Left = 69
      Top = 132
      Width = 76
      Height = 19
      Caption = 'Situa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipo: TLabel
      Left = 103
      Top = 157
      Width = 42
      Height = 19
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdeTotal: TLabel
      Left = 56
      Top = 182
      Width = 89
      Height = 19
      Caption = 'Qtde total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 52
      Top = 207
      Width = 93
      Height = 19
      Caption = 'Valor total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNroPedido: TEdit
      Left = 160
      Top = 30
      Width = 297
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 0
    end
    object edtCodCliente: TEdit
      Left = 160
      Top = 80
      Width = 297
      Height = 21
      NumbersOnly = True
      TabOrder = 2
      OnExit = edtCodClienteExit
    end
    object edtNomeCliente: TEdit
      Left = 160
      Top = 105
      Width = 297
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 3
    end
    object edtQtde: TEdit
      Left = 160
      Top = 180
      Width = 297
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 6
    end
    object edtValorTotal: TEdit
      Left = 160
      Top = 205
      Width = 297
      Height = 21
      TabOrder = 7
    end
    object edtData: TEdit
      Left = 160
      Top = 55
      Width = 297
      Height = 21
      Color = clSilver
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 1
    end
    object edtSituacao: TEdit
      Left = 160
      Top = 130
      Width = 297
      Height = 21
      Color = clSilver
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 4
    end
    object cbTipo: TComboBox
      Left = 160
      Top = 155
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 5
      Text = 'V - Venda'
      Items.Strings = (
        'V - Venda'
        'B - Bonifica'#231#227'o'
        'T - Troca')
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 49
    Align = alTop
    Caption = 'Cadastro do pedido'
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
  object pnlItens: TPanel
    Left = 0
    Top = 297
    Width = 515
    Height = 233
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 2
    object btnCadastrar: TSpeedButton
      Left = 16
      Top = 191
      Width = 65
      Height = 34
      Caption = 'Cadastrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCadastrarClick
    end
    object btnAlterar: TSpeedButton
      Left = 361
      Top = 191
      Width = 65
      Height = 34
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnAlterarClick
    end
    object btnExcluir: TSpeedButton
      Left = 432
      Top = 191
      Width = 65
      Height = 34
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnExcluirClick
    end
    object grdItensPedido: TDBGrid
      Left = 16
      Top = 15
      Width = 481
      Height = 170
      DataSource = dtsGridItens
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 536
    Width = 515
    Height = 42
    Align = alBottom
    TabOrder = 3
    object btnSalvarPedido: TSpeedButton
      Left = 416
      Top = 3
      Width = 94
      Height = 34
      Caption = 'Salvar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSalvarPedidoClick
    end
    object btnCancelar: TSpeedButton
      Left = 4
      Top = 3
      Width = 94
      Height = 34
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
    end
  end
  object dtsGridItens: TDataSource
    DataSet = qryGridItens
    Left = 440
    Top = 337
  end
  object qryGridItens: TFDQuery
    SQL.Strings = (
      
        'SELECT PP.NROPED_PRODS, PP.NROITEM AS "Nro Item", PP.CODPRODUTO ' +
        'AS "C'#243'd Produto", P.PRODUTO AS "Produto", PP.QTDE AS "Qtde", PP.' +
        'PRECO AS "Pre'#231'o", PP.VALDESCONTO AS "Vlr Desconto", PP.VALTOTAL ' +
        'AS "Valor total"'
      'FROM PED_PRODS PP '
      'INNER JOIN PRODUTOS P ON PP.CODPRODUTO = P.CODPRODUTO ')
    Left = 440
    Top = 401
  end
end
