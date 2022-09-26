unit uFrmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, uFrmConsultaPedidos;

type
  TfrmMenuPrincipal = class(TForm)
    pnlTitulo: TPanel;
    pnlFundo: TPanel;
    btnPedidos: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    Administrador: Boolean;
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

procedure TfrmMenuPrincipal.btnPedidosClick(Sender: TObject);
var
  frmConsultaPedidos: TfrmConsultaPedidos;
begin
  frmConsultaPedidos := TfrmConsultaPedidos.Create(nil);
  try
    frmConsultaPedidos.Administrador := Administrador;
    frmConsultaPedidos.ShowModal;
  finally
    FreeAndNil(frmConsultaPedidos);
  end;
end;

procedure TfrmMenuPrincipal.btnSairClick(Sender: TObject);
begin
  modalResult := mrClose;
end;

end.
