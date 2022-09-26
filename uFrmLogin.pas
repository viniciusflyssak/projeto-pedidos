unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, IdHashMessageDigest, uDM, uFrmMenuPrincipal;

type
  TfrmLogin = class(TForm)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    pnlFundo: TPanel;
    pnlTitulo: TPanel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    btnLogin: TSpeedButton;
    btnFechar: TSpeedButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
const
  cSqlVerificaUsuario = ' SELECT LOGIN, SENHA FROM USUARIOS ' +
                        ' WHERE LOGIN = :pLogin ';
var
  qryVerificaLogin: TFDQuery;
  frmMenuPrincipal: TfrmMenuPrincipal;
  procedure validaCampos;
  begin
    if (Trim(edtUsuario.Text) = '') then
    begin
      edtUsuario.SetFocus;
      raise Exception.Create('O campo usuário não pode estar vazio!');
    end;
    if (Trim(edtSenha.Text) = '') then
    begin
      edtSenha.SetFocus;
      raise Exception.Create('O campo senha não pode estar vazio!');
    end;
  end;

  function senhaMD5: string;
  var
    idmd5: TIdHashMessageDigest5;
  begin
    result := '';
    idmd5 := TIdHashMessageDigest5.Create;
    try
      result := idmd5.HashStringAsHex(edtSenha.Text);
    finally
      idmd5.Free;
    end;
  end;
  
begin
  validaCampos;
  
  frmMenuPrincipal := TfrmMenuPrincipal.Create(nil);
  qryVerificaLogin := TFDQuery.Create(nil);
  try
    qryVerificaLogin.Connection := DM.Connection;
    qryVerificaLogin.SQL.Add(cSqlVerificaUsuario);
    qryVerificaLogin.ParamByName('pLogin').Value := edtUsuario.Text;
    qryVerificaLogin.Open;
    if (qryVerificaLogin.RecordCount > 0) then
    begin
      if (qryVerificaLogin.FieldByName('SENHA').AsString = senhaMD5) then
      begin
        frmLogin.Visible := false;
        frmMenuPrincipal.Administrador := qryVerificaLogin.FieldByName('LOGIN').AsString = 'ADM';
        frmMenuPrincipal.ShowModal;
        Close;
      end
      else
        raise Exception.Create('Senha não confere com o login informado! Verifique!');
    end
    else
      raise Exception.Create('Usuário não localizado, verifique os dados e tente novamente!');
  finally
    FreeAndNil(qryVerificaLogin);
    FreeAndNil(frmMenuPrincipal);
  end;
end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close
  else
  if (Key = VK_RETURN) then
    btnLoginClick(Sender);
end;

procedure TfrmLogin.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close
  else
  if (Key = VK_RETURN) then
    edtSenha.SetFocus;
end;

end.
