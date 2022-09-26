unit uPedido;

interface

uses Classes, SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDM;

type
  TPedido = class
  private
    FCod_pedido: Integer;
    FCod_cliente: Integer;
    FValorTotal: Currency;
    FData: TDateTime;
    FNomeCliente: String;
    FSituacao: Integer;
    FTipo: String;
    FQtdeTotal: Double;

  public
    constructor Create;
    procedure getPedido(idPedido: integer);
    procedure salvarAlteracoes;
    property Cod_pedido: Integer read FCod_pedido write FCod_pedido;
    property Cod_cliente: Integer read FCod_cliente write FCod_cliente;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
    property Data: TDateTime read FData write FData;
    property NomeCliente: String read FNomeCliente write FNomeCliente;
    property Situacao: Integer read FSituacao write FSituacao;
    property Tipo: String read FTipo write FTipo;
    property QtdeTotal: Double read FQtdeTotal write FQtdeTotal;
  end;

implementation

{ TPedido }

constructor TPedido.Create;
begin
  FCod_pedido := 0;
  FCod_cliente := 0;
  FValorTotal := 0;
  FData := date;
  FNomeCliente := '';
  FSituacao := 1;
  FTipo := 'V';
  FQtdeTotal := 0;
end;

procedure TPedido.getPedido(idPedido: integer);
const
  cSqlConsultaPedido = ' SELECT PEDIDOS.*, C.NOME FROM PEDIDOS '+
                       ' INNER JOIN CLIENTES C ON PEDIDOS.CODCLIENTE = C.CODCLIENTE  '+
                       ' WHERE NROPEDIDO = :pNroPedido ';
var
  qryConsultaPedido: TFDQuery;
begin
  qryConsultaPedido := TFDQuery.Create(nil);
  try
    qryConsultaPedido.Connection := DM.Connection;
    qryConsultaPedido.Sql.add(cSqlConsultaPedido);
    qryConsultaPedido.ParamByName('pNroPedido').Value := idPedido;
    qryConsultaPedido.Open;
    FCod_pedido := qryConsultaPedido.FieldByName('NROPEDIDO').AsInteger;
    FCod_cliente := qryConsultaPedido.FieldByName('CODCLIENTE').AsInteger;
    FValorTotal := qryConsultaPedido.FieldByName('VALORTOTAL').AsCurrency;
    FData := qryConsultaPedido.FieldByName('DATA').AsDateTime;
    FNomeCliente := qryConsultaPedido.FieldByName('NOME').AsString;
    FSituacao := qryConsultaPedido.FieldByName('SITUACAO').AsInteger;
    FTipo := qryConsultaPedido.FieldByName('TIPO').AsString;
    FQtdeTotal := qryConsultaPedido.FieldByName('QTDETOTAL').AsCurrency;
  finally
    FreeAndNil(qryConsultaPedido);
  end;
end;

procedure TPedido.salvarAlteracoes;
const
  cSqlSalvar = ' UPDATE PEDIDOS SET CODCLIENTE = :pCodCliente, TIPO = :pTipo, VALORTOTAL = :pValorTotal WHERE NROPEDIDO = :pNroPedido ';
var
  qrySalvar: TFDQuery;
begin
  qrySalvar := TFDQuery.Create(nil);
  try
    qrySalvar.Connection := DM.Connection;
    qrySalvar.Sql.Add(cSqlSalvar);
    qrySalvar.ParamByName('pCodCliente').Value := FCod_cliente;
    qrySalvar.ParamByName('pTipo').Value := FTipo;
    qrySalvar.ParamByName('pValorTotal').Value := FValorTotal;
    qrySalvar.ParamByName('pNroPedido').Value := FCod_Pedido;
    qrySalvar.ExecSQL;
  finally
    FreeAndNil(qrySalvar);
  end;
end;

end.
