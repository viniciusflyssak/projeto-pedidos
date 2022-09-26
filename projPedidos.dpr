program projPedidos;

uses
  Vcl.Forms,
  uFrmLogin in 'uFrmLogin.pas' {frmLogin},
  uDM in 'DM\uDM.pas' {DM: TDataModule},
  uFrmMenuPrincipal in 'uFrmMenuPrincipal.pas' {frmMenuPrincipal},
  uFrmConsultaPedidos in 'uFrmConsultaPedidos.pas' {frmConsultaPedidos},
  uPedido in 'CLASS\uPedido.pas',
  uFrmCadastroPedido in 'uFrmCadastroPedido.pas' {frmCadastroPedido},
  uFrmCadastroItem in 'uFrmCadastroItem.pas' {frmCadastroItem},
  uItem in 'CLASS\uItem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
