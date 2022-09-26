unit uFrmConsultaPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDM, uFrmCadastroPedido;

type
  TfrmConsultaPedidos = class(TForm)
    grdPedidos: TDBGrid;
    pnlTitulo: TPanel;
    pnlFundo: TPanel;
    pnlBotoes: TPanel;
    btnFinalizar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCadastrat: TSpeedButton;
    qryPedidosGrid: TFDQuery;
    dtsPedidosGrid: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnCadastratClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure grdPedidosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    Administrador: Boolean;
  end;

var
  frmConsultaPedidos: TfrmConsultaPedidos;

implementation

{$R *.dfm}

procedure TfrmConsultaPedidos.btnAlterarClick(Sender: TObject);
var
  frmCadastroPedido: TfrmCadastroPedido;
begin
  if not(qryPedidosGrid.FieldByName('Nº Pedido').AsInteger > 0) then
    raise Exception.Create('Selecione um pedido!')
  else
  if qryPedidosGrid.FieldByName('Situação').AsInteger = 2 then
    raise Exception.Create('Pedidos finalizados não podem ser alterados ou excluídos');
  frmCadastroPedido := TfrmCadastroPedido.Create(nil);
  try
    frmCadastroPedido.idPedido := qryPedidosGrid.FieldByName('Nº Pedido').AsInteger;
    frmCadastroPedido.ShowModal;
  finally
    FreeAndNil(frmCadastroPedido);
  end;
  qryPedidosGrid.Refresh;
end;

procedure TfrmConsultaPedidos.btnCadastratClick(Sender: TObject);
var
  frmCadastroPedido: TfrmCadastroPedido;
begin
  frmCadastroPedido := TfrmCadastroPedido.Create(nil);
  try
    frmCadastroPedido.idPedido := 0;
    frmCadastroPedido.ShowModal;
  finally
    FreeAndNil(frmCadastroPedido);
  end;
  qryPedidosGrid.Refresh;
end;

procedure TfrmConsultaPedidos.btnExcluirClick(Sender: TObject);
const
  cSqlDeletaPedido = ' DELETE FROM PEDIDOS WHERE NROPEDIDO = :pNroPedido ';
  cSqlDeletaItensPedido = ' DELETE FROM PED_PRODS WHERE NROPEDIDO = :pNroPedido ';
var
  qryDeletaPedido: TFDQuery;
begin
  if not(qryPedidosGrid.FieldByName('Nº Pedido').AsInteger > 0) then
    raise Exception.Create('Selecione um pedido!')
  else
    if qryPedidosGrid.FieldByName('Situação').AsInteger = 2 then
      raise Exception.Create('Pedidos finalizados não podem ser alterados ou excluídos');

  qryDeletaPedido := TFDQuery.Create(nil);
  try
    qryDeletaPedido.Connection := DM.Connection;
    qryDeletaPedido.SQL.Add(cSqlDeletaItensPedido);
    qryDeletaPedido.ParamByName('pNroPedido').Value := qryPedidosGrid.FieldByName('Nº Pedido').AsInteger;
    qryDeletaPedido.ExecSQL;
    qryDeletaPedido.Close;
    qryDeletaPedido.SQL.Clear;
    qryDeletaPedido.SQL.Add(cSqlDeletaPedido);
    qryDeletaPedido.ParamByName('pNroPedido').Value := qryPedidosGrid.FieldByName('Nº Pedido').AsInteger;
    qryDeletaPedido.ExecSQL;
  finally
    FreeAndNil(qryDeletaPedido);
  end;
  qryPedidosGrid.Refresh;
end;

procedure TfrmConsultaPedidos.btnFinalizarClick(Sender: TObject);
const
  cSqlFinalizaPedido = ' UPDATE PEDIDOS SET SITUACAO = 2 WHERE NROPEDIDO = :pNroPedido ';
var
  qryFinalizaPedido: TFDQuery;
begin
  if not(qryPedidosGrid.FieldByName('Nº Pedido').AsInteger > 0) then
    raise Exception.Create('Selecione um pedido!');
  qryFinalizaPedido := TFDQuery.Create(nil);
  try
    qryFinalizaPedido.Connection := DM.Connection;
    qryFinalizaPedido.SQL.Add(cSqlFinalizaPedido);
    qryFinalizaPedido.ParamByName('pNroPedido').Value := qryPedidosGrid.FieldByName('Nº Pedido').AsInteger;
    qryFinalizaPedido.ExecSQL;
  finally
    FreeAndNil(qryFinalizaPedido);
    btnFinalizar.Enabled := false;
  end;
  qryPedidosGrid.Refresh;
end;

procedure TfrmConsultaPedidos.FormShow(Sender: TObject);
begin
  btnFinalizar.Visible := Administrador;
  qryPedidosGrid.Connection := DM.Connection;
  qryPedidosGrid.Open;
end;

procedure TfrmConsultaPedidos.grdPedidosCellClick(Column: TColumn);
begin
  if qryPedidosGrid.FieldByName('Situação').AsInteger = 2 then
  begin
    btnFinalizar.Enabled := false;
  end
  else
  begin
    btnFinalizar.Enabled := true;
  end;
end;

end.
