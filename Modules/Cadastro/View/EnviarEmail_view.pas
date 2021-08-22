unit EnviarEmail_view;

interface

uses
  {Bibliotecas}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,

  {Units do sistema}
  UCadastro_controller;

type
  TEnviarEmailView = class(TForm)
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    btnEnviar: TSpeedButton;
    edtSmtp: TEdit;
    lblSmtp: TLabel;
    pnlFundo: TPanel;
    lblTitulo: TLabel;
    btnCancelar: TSpeedButton;
  private
    { Private declarations }
  public
    function EnviarEmail(): Boolean;
  end;

var
  EnviarEmailView: TEnviarEmailView;

implementation

{$R *.dfm}

function TEnviarEmailView.EnviarEmail: Boolean;
var
  xController: TCadastroController;
begin
  xController := nil;

  xController := TCadastroController.Create;
  xController.CadastrarPessoa(GetCamposPessoa, GetCamposEndereco);
end;

end.
