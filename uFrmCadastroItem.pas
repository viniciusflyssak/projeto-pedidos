unit uFrmCadastroItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, uItem,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDM;

type
  TfrmCadastroItem = class(TForm)
    pnlTitulo: TPanel;
    pnlFundo: TPanel;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    lblNroPedido: TLabel;
    lblNroPedProd: TLabel;
    lblNroItem: TLabel;
    lblProduto: TLabel;
    lblQtde: TLabel;
    lblUn: TLabel;
    lblPreco: TLabel;
    lblPercDesconto: TLabel;
    lblValDesconto: TLabel;
    lblValTotal: TLabel;
    edtNroPedProd: TEdit;
    edtNroPedido: TEdit;
    edtNroItem: TEdit;
    edtCodProduto: TEdit;
    edtQtde: TEdit;
    edtValTotal: TEdit;
    edtValDesc: TEdit;
    edtPercoDesc: TEdit;
    edtPreco: TEdit;
    edtUn: TEdit;
    edtNomeProduto: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodProdutoExit(Sender: TObject);
  public
    idItem: integer;
    idPedido: integer;
  end;

var
  frmCadastroItem: TfrmCadastroItem;
  Item: TItem;

implementation

{$R *.dfm}

procedure TfrmCadastroItem.btnCancelarClick(Sender: TObject);
begin
  modalResult := mrCancel;
end;

procedure TfrmCadastroItem.btnGravarClick(Sender: TObject);
begin
  if Trim(edtQtde.Text) = '' then
  begin
    edtQtde.SetFocus;
    raise Exception.Create('É obrigatório informar a quantidade!');
  end;
  if Trim(edtUn.Text) = '' then
  begin
    edtUn.SetFocus;
    raise Exception.Create('É obrigatório informar a UN!');
  end;
  if Trim(edtPreco.Text) = '' then
  begin
    edtPreco.SetFocus;
    raise Exception.Create('É obrigatório informar o preço!');
  end;
  if Trim(edtValTotal.Text) = '' then
  begin
    edtValTotal.SetFocus;
    raise Exception.Create('É obrigatório informar o valor total');
  end;
  if Trim(edtCodProduto.Text) = '' then
  begin
    edtCodProduto.SetFocus;
    raise Exception.Create('O código do produto é obrigatório!');
  end;

  Item.NroItem := StrToInt(edtNroPedProd.Text);
  Item.NroPedido := StrToInt(edtNroPedido.Text);
  Item.NroItemPedido := StrToInt(edtNroItem.Text);
  Item.CodProduto := edtCodProduto.Text;
  Item.Qtde := StrToFloat(edtQtde.Text);
  Item.Un := edtUn.Text;
  Item.Preco := StrToFloat(edtPreco.Text);
  Item.PercDesconto := StrToFloatDef(edtPercoDesc.Text, 0);
  Item.ValorDesconto := StrToFloatDef(edtValDesc.Text, 0);
  Item.ValorTotal := StrToFloat(edtValTotal.Text);
  Item.salvarItem(idItem);
  ModalResult := mrOk;
end;

procedure TfrmCadastroItem.edtCodProdutoExit(Sender: TObject);
const
  cSqlPesquisaProd = ' SELECT PRODUTO FROM PRODUTOS WHERE CODPRODUTO = :pCodProduto ';
var
  qryPesquisaProd: TFDQuery;
begin
  if Trim(edtCodProduto.Text) = '' then
  begin
    edtCodProduto.SetFocus;
    raise Exception.Create('O código do produto é obrigatório!');
  end;
  qryPesquisaProd := TFDQuery.Create(nil);
  try
    qryPesquisaProd.Connection := DM.Connection;
    qryPesquisaProd.SQL.Add(cSqlPesquisaProd);
    qryPesquisaProd.ParamByName('pCodProduto').Value := edtCodProduto.Text;
    qryPesquisaProd.Open;
    if qryPesquisaProd.RecordCount > 0 then
    begin
      edtNomeProduto.Text := qryPesquisaProd.FieldByName('PRODUTO').AsString;
    end
    else
    begin
      raise Exception.Create('O produto informado não foi encontrado, verifique!');
    end;
  finally
    FreeAndNil(qryPesquisaProd);
  end;
end;

procedure TfrmCadastroItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Item);
end;

procedure TfrmCadastroItem.FormShow(Sender: TObject);
  procedure nroItemNovo;
  const
    cSqlNroItem = ' SELECT FIRST 1 NROPED_PRODS FROM PED_PRODS ORDER BY NROPED_PRODS DESC ';
    cSqlNroItemPedido = ' SELECT FIRST 1 NROITEM FROM PED_PRODS WHERE NROPEDIDO = :pNroPedido ORDER BY NROITEM DESC ';
  var
    qryNroItemNovo: TFDQuery;
  begin
    DM.Connection.StartTransaction;
    qryNroItemNovo := TFDQuery.Create(nil);
    try
      qryNroItemNovo.Connection := DM.Connection;
      qryNroItemNovo.SQL.add(cSqlNroItem);
      qryNroItemNovo.Open;
      edtNroPedProd.Text := IntToStr(qryNroItemNovo.FieldByName('NROPED_PRODS').AsInteger + 1);
      qryNroItemNovo.Close;
      qryNroItemNovo.SQL.Clear;
      qryNroItemNovo.SQL.add(cSqlNroItemPedido);
      qryNroItemNovo.ParamByName('pNroPedido').Value := idPedido;
      qryNroItemNovo.Open;
      edtNroItem.Text := IntToStr(qryNroItemNovo.FieldByName('NROITEM').AsInteger + 1);
    finally
      FreeAndNil(qryNroItemNovo);
    end;
  end;
begin
  Item := TItem.Create;
  if idItem > 0 then
  begin
    Item.getItem(idItem);
    edtNroItem.Text := IntToStr(Item.NroItemPedido);
    edtNroPedProd.Text := IntToStr(Item.NroItem);
    edtNroPedido.Text := IntToStr(Item.NroPedido);
  end
  else
  begin
    nroItemNovo;
    edtNroPedido.Text := IntToStr(idPedido);
  end;
  edtCodProduto.Text := Item.CodProduto;
  edtQtde.Text := FloatToStr(Item.Qtde);
  edtUn.Text := Item.Un;
  edtPreco.Text := FloatToStr(Item.Preco);
  edtPercoDesc.Text := FloatToStr(Item.PercDesconto);
  edtValDesc.Text := FloatToStr(Item.ValorDesconto);
  edtValTotal.Text := FloatToStr(Item.ValorTotal);
  if idItem > 0 then
    edtCodProdutoExit(Sender);
end;

end.
