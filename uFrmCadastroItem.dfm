object frmCadastroItem: TfrmCadastroItem
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de item'
  ClientHeight = 302
  ClientWidth = 500
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 49
    Align = alTop
    Caption = 'Cadastro de item'
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
    Width = 500
    Height = 253
    Align = alClient
    TabOrder = 1
    object btnCancelar: TSpeedButton
      Left = 8
      Top = 216
      Width = 73
      Height = 30
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object btnGravar: TSpeedButton
      Left = 416
      Top = 216
      Width = 73
      Height = 30
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnGravarClick
    end
    object lblNroPedido: TLabel
      Left = 32
      Top = 35
      Width = 63
      Height = 13
      Caption = 'Nro Pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNroPedProd: TLabel
      Left = 14
      Top = 16
      Width = 81
      Height = 13
      Caption = 'Nro Ped. Prod.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNroItem: TLabel
      Left = 42
      Top = 54
      Width = 53
      Height = 13
      Caption = 'Nro Item:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProduto: TLabel
      Left = 47
      Top = 73
      Width = 48
      Height = 13
      Caption = 'Produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtde: TLabel
      Left = 65
      Top = 92
      Width = 30
      Height = 13
      Caption = 'Qtde:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblUn: TLabel
      Left = 74
      Top = 111
      Width = 21
      Height = 13
      Caption = 'UN: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPreco: TLabel
      Left = 60
      Top = 130
      Width = 35
      Height = 13
      Caption = 'Pre'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPercDesconto: TLabel
      Left = 8
      Top = 149
      Width = 87
      Height = 13
      Caption = 'Perc. Desconto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValDesconto: TLabel
      Left = 16
      Top = 168
      Width = 79
      Height = 13
      Caption = 'Val. Desconto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValTotal: TLabel
      Left = 40
      Top = 187
      Width = 55
      Height = 13
      Caption = 'Val. Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNroPedProd: TEdit
      Left = 112
      Top = 16
      Width = 353
      Height = 17
      AutoSize = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 0
    end
    object edtNroPedido: TEdit
      Left = 112
      Top = 35
      Width = 353
      Height = 17
      AutoSize = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object edtNroItem: TEdit
      Left = 112
      Top = 54
      Width = 353
      Height = 17
      AutoSize = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
    end
    object edtCodProduto: TEdit
      Left = 112
      Top = 73
      Width = 41
      Height = 17
      AutoSize = False
      TabOrder = 3
      OnExit = edtCodProdutoExit
    end
    object edtQtde: TEdit
      Left = 112
      Top = 92
      Width = 353
      Height = 17
      AutoSize = False
      TabOrder = 4
    end
    object edtPercoDesc: TEdit
      Left = 112
      Top = 149
      Width = 353
      Height = 17
      AutoSize = False
      TabOrder = 7
    end
    object edtPreco: TEdit
      Left = 112
      Top = 130
      Width = 353
      Height = 17
      AutoSize = False
      TabOrder = 6
    end
    object edtUn: TEdit
      Left = 112
      Top = 111
      Width = 353
      Height = 17
      AutoSize = False
      TabOrder = 5
    end
    object edtValDesc: TEdit
      Left = 112
      Top = 168
      Width = 353
      Height = 17
      AutoSize = False
      TabOrder = 8
    end
    object edtValTotal: TEdit
      Left = 112
      Top = 187
      Width = 353
      Height = 17
      AutoSize = False
      TabOrder = 9
    end
    object edtNomeProduto: TEdit
      Left = 159
      Top = 73
      Width = 306
      Height = 17
      AutoSize = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 10
      OnExit = edtCodProdutoExit
    end
  end
end
