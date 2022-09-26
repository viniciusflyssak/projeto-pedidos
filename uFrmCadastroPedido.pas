unit uFrmCadastroPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, uFrmCadastroItem, uDM, uPedido;

type
  TfrmCadastroPedido = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TPanel;
    lblNro: TLabel;
    lblData: TLabel;
    lblCodCliente: TLabel;
    lblNomeCliente: TLabel;
    lblSituacao: TLabel;
    lblTipo: TLabel;
    lblQtdeTotal: TLabel;
    lblValorTotal: TLabel;
    edtNroPedido: TEdit;
    edtCodCliente: TEdit;
    edtNomeCliente: TEdit;
    edtQtde: TEdit;
    edtValorTotal: TEdit;
    edtData: TEdit;
    edtSituacao: TEdit;
    pnlItens: TPanel;
    grdItensPedido: TDBGrid;
    btnCadastrar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    dtsGridItens: TDataSource;
    qryGridItens: TFDQuery;
    pnlBotoes: TPanel;
    btnSalvarPedido: TSpeedButton;
    btnCancelar: TSpeedButton;
    cbTipo: TComboBox;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarPedidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    idPedido: Integer;
  end;

var
  frmCadastroPedido: TfrmCadastroPedido;
  Pedido: TPedido;

implementation

{$R *.dfm}

procedure TfrmCadastroPedido.btnAlterarClick(Sender: TObject);
var
  frmCadastroItem: TfrmCadastroItem;
begin
  frmCadastroItem := TfrmCadastroItem.Create(nil);
  try
    frmCadastroItem.idItem := qryGridItens.FieldByName('NROPED_PRODS').AsInteger;
    frmCadastroItem.idPedido := idPedido;
    frmCadastroItem.ShowModal;
  finally
    FreeAndNil(frmCadastroItem);
  end;
  qryGridItens.Refresh;
end;

procedure TfrmCadastroPedido.btnCadastrarClick(Sender: TObject);
var
  frmCadastroItem: TfrmCadastroItem;
begin
  frmCadastroItem := TfrmCadastroItem.Create(nil);
  try
    frmCadastroItem.idItem := 0;
    frmCadastroItem.idPedido := idPedido;
    frmCadastroItem.ShowModal;
  finally
    FreeAndNil(frmCadastroItem);
  end;
  qryGridItens.Refresh;
end;

procedure TfrmCadastroPedido.btnCancelarClick(Sender: TObject);
begin
  DM.Connection.Rollback;
  Close;
end;

procedure TfrmCadastroPedido.btnExcluirClick(Sender: TObject);
const
  cSqlDeletariItem = ' DELETE FROM PED_PRODS WHERE NROPED_PRODS = :pNroItem ';
var
  qryDeletaItem: TFDQuery;
begin
  qryDeletaItem := TFDQuery.Create(nil);
  try
    qryDeletaItem.Connection := DM.Connection;
    qryDeletaItem.SQL.add(cSqlDeletariItem);
    qryDeletaItem.ParamByName('pNroItem').Value := qryGridItens.FieldByName('NROPED_PRODS').AsInteger;
    qryDeletaItem.ExecSQL;
  finally
    FreeAndNil(qryDeletaItem);
  end;
  qryGridItens.Refresh;
end;

procedure TfrmCadastroPedido.btnSalvarPedidoClick(Sender: TObject);
begin
  if Trim(edtCodCliente.Text) = '' then
  begin
    edtCodCliente.SetFocus;
    raise Exception.Create('O código do cliente é obrigatório!');    
  end;
  if qryGridItens.Eof then
  begin
    raise Exception.Create('Não é possível salvar pedidos sem itens!');
  end;
  Pedido.Cod_cliente := StrToInt(edtCodCliente.Text);
  Pedido.Tipo := Copy((cbTipo.Items[cbTipo.ItemIndex]), 1, 1);
  Pedido.ValorTotal := StrToFloatDef(edtValorTotal.Text, 0);
  Pedido.salvarAlteracoes;
  
  DM.Connection.Commit;
  modalResult := mrOk;
end;

procedure TfrmCadastroPedido.edtCodClienteExit(Sender: TObject);
const
  cSqlVerificaCliente = ' SELECT NOME FROM CLIENTES WHERE CODCLIENTE = :pCodCliente '; 
var 
  qryVerificaCliente: TFDQuery;
begin
  if Trim(edtCodCliente.Text) = '' then
  begin
    edtCodCliente.SetFocus;
    raise Exception.Create('O código do cliente é obrigatório!');    
  end;
  qryVerificaCliente := TFDQuery.Create(nil);
  try  
    qryVerificaCliente.Connection := DM.Connection;
    qryVerificaCliente.SQL.Add(cSqlVerificaCliente);
    qryVerificaCliente.ParamByName('pCodCliente').Value := edtCodCliente.Text;
    qryVerificaCliente.Open;
    if qryVerificaCliente.RecordCount > 0 then
    begin
      edtNomeCliente.Text := qryVerificaCliente.FieldByName('NOME').AsString;  
    end
    else
    begin
      raise Exception.Create('O cliente informado não foi encontrado, verifique!');
    end;
  finally
    FreeAndNil(qryVerificaCliente);
  end;
end;

procedure TfrmCadastroPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(Pedido);
end;

procedure TfrmCadastroPedido.FormShow(Sender: TObject);
  function nroPedidoNovo: integer;
  const
    cSqlNroPedido = ' SELECT FIRST 1 NROPEDIDO FROM PEDIDOS ORDER BY NROPEDIDO DESC ';
  var
    qryNroPedidoNovo: TFDQuery;
  begin
    qryNroPedidoNovo := TFDQuery.Create(nil);
    try
      qryNroPedidoNovo.Connection := DM.Connection;
      qryNroPedidoNovo.SQL.add(cSqlNroPedido);
      qryNroPedidoNovo.Open;
      result := qryNroPedidoNovo.FieldByName('NROPEDIDO').AsInteger + 1;
    finally
      FreeAndNil(qryNroPedidoNovo);
    end;
  end;

  procedure criaPedido(nroPedido: integer);
  const
    cSqlCriaPedido = ' INSERT INTO PEDIDOS(NROPEDIDO, DATA, CODCLIENTE, SITUACAO, DATAENTREGA, CODCPAGTO, QTDETOTAL, TIPO) VALUES '+
                     ' (:pNroPedido, :pData, :pCodCliente, :pSituacao, :pDataEntrega, :pCodPgto, :pQtdeTotal, :pTipo) ';
  var
    qryCriaPedidoGenerico: TFDQuery;
  begin
    qryCriaPedidoGenerico := TFDQuery.Create(nil);
    try
      qryCriaPedidoGenerico.Connection := DM.Connection;
      qryCriaPedidoGenerico.SQL.Add(cSqlCriaPedido);
      qryCriaPedidoGenerico.ParamByName('pNroPedido').Value := nroPedido;
      qryCriaPedidoGenerico.ParamByName('pData').Value := now;
      qryCriaPedidoGenerico.ParamByName('pCodCliente').Value := 1;
      qryCriaPedidoGenerico.ParamByName('pSituacao').Value := 1;
      qryCriaPedidoGenerico.ParamByName('pDataEntrega').Value := now;                        
      qryCriaPedidoGenerico.ParamByName('pCodPgto').Value := 1;                        
      qryCriaPedidoGenerico.ParamByName('pQtdeTotal').Value := 0;                        
      qryCriaPedidoGenerico.ParamByName('pTipo').Value := 'V';                                                
      qryCriaPedidoGenerico.ExecSQL;
      idPedido := nroPedido;
    finally
      FreeAndNil(qryCriaPedidoGenerico);
    end;
  end;
begin
  DM.Connection.StartTransaction;
  Pedido := TPedido.Create;
  if not(idPedido > 0) then
  begin
    criaPedido(nroPedidoNovo);
  end;
  pedido.getPedido(idPedido);
  if pedido.Situacao = 1 then
    edtSituacao.Text := '1 - Pendente'
  else
    edtSituacao.Text := '2 - Finalizado';
  edtQtde.Text := FloatToStr(Pedido.QtdeTotal);
  edtNroPedido.Text := IntToStr(Pedido.Cod_pedido);
  edtCodCliente.Text := IntToStr(Pedido.Cod_Cliente);
  edtNomeCliente.Text := Pedido.NomeCliente;
  if pedido.Tipo = 'V' then
    cbTipo.itemIndex := 0
  else
  begin
    if pedido.Tipo = 'B' then
      cbTipo.itemIndex := 1
    else
      cbTipo.itemIndex := 2;
  end;
  edtValorTotal.Text := FloatToStr(Pedido.ValorTotal);
  edtData.Text := DateToStr(pedido.Data);

  qryGridItens.Connection := dm.Connection;
  qryGridItens.SQL.Add(' AND PP.NROPEDIDO = :pNROPedido ');
  qryGridItens.ParamByName('pNROPedido').Value := idPedido;
  qryGridItens.Open;
  grdItensPedido.Columns[0].Visible := false;
end;

end.
