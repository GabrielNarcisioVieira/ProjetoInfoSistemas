unit MainView;

interface

uses
  {Bibliotecas}
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, SysUtils,

  {Units do Sistema}
  UPessoa_model, UEndereco_model, UCadastro_controller, UGetApiData_service,
  UMensagem;

type
  TMain = class(TForm)
    pnlFundo: TPanel;
    lblTitulo: TLabel;
    mskCPF: TMaskEdit;
    edtNome: TEdit;
    edtRG: TEdit;
    mskTelefone: TMaskEdit;
    edtEmail: TEdit;
    edtLogradouro: TEdit;
    mskCEP: TMaskEdit;
    edtPais: TEdit;
    edtEstado: TEdit;
    edtCidade: TEdit;
    edtBairro: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    lblNome: TLabel;
    lblEmail: TLabel;
    lblRG: TLabel;
    lblTelefone: TLabel;
    lblCPF: TLabel;
    lblCEP: TLabel;
    lblPais: TLabel;
    lblEstado: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblNumero: TLabel;
    lblLogradouro: TLabel;
    lblComplemento: TLabel;
    btnCadastrar: TSpeedButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure mskCPFExit(Sender: TObject);
    procedure mskCEPExit(Sender: TObject);

  private
    function GetCamposPessoa(): TPessoa;
    function GetCamposEndereco(): TEndereco;
    function ValidarCPF(): Boolean;
    procedure CadastrarPessoa;
    function GetEnderecoAPI(): Boolean;
    function IfTernario(condicao: Boolean; value1, value2: variant): Variant;

  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

{ Tmain_view }

procedure TMain.mskCEPExit(Sender: TObject);
begin
  GetEnderecoAPI();
end;

procedure TMain.mskCPFExit(Sender: TObject);
begin
  ValidarCPF;
end;

procedure TMain.btnCadastrarClick(Sender: TObject);
begin
  CadastrarPessoa;
end;

procedure TMain.CadastrarPessoa;
var
  xController: TCadastroController;
begin
  xController := nil;

  try
    xController := TCadastroController.Create;

    xController.CadastrarPessoa(GetCamposPessoa, GetCamposEndereco);
  finally
    if xController <> nil then
      FreeAndNil(xController);
  end;
end;

function TMain.GetCamposPessoa: TPessoa;
var
  xPessoa: TPessoa;
begin
  xPessoa := nil;

  xPessoa := TPessoa.Create;
  xPessoa.Nome := edtNome.Text;
  xPessoa.Email := edtEmail.Text;
  xPessoa.Identidade := edtRG.Text;
  xPessoa.CPF := mskCPF.Text;
  xPessoa.Telefone := mskTelefone.Text;

  Result := xPessoa;
end;

function TMain.GetCamposEndereco: TEndereco;
var
  xEndereco: TEndereco;
begin
  xEndereco := nil;

  xEndereco := TEndereco.Create;
  xEndereco.Logradouro := edtLogradouro.text;
  xEndereco.Numero := StrToInt(ifTernario(edtNumero.text = '', '0', edtNumero.text));
  xEndereco.Bairro := edtBairro.text;
  xEndereco.Cidade := edtCidade.text;
  xEndereco.Estado := edtEstado.text;
  xEndereco.Pais := edtPais.text;
  xEndereco.CEP := mskCEP.text;
  Result := xEndereco;
end;

function TMain.GetEnderecoAPI(): Boolean;
var
  xApi: TGetApiData;
  xEndereco: TEndereco;
  xMensagem: TFrmMensagens;
  xCep: String;
begin
  xApi := nil;
  xEndereco := nil;
  xMensagem := nil;
  xCep := '';

  try
    xApi := TGetApiData.Create;
    xEndereco := TEndereco.Create;
    xCep := mskCEP.text;
    xCep := StringReplace(xCep, '.', '', [rfReplaceAll, rfIgnoreCase]);
    xCep := StringReplace(xCep, '-', '', [rfReplaceAll, rfIgnoreCase]);
    xCep := StringReplace(xCep, ' ', '', [rfReplaceAll, rfIgnoreCase]);

    if (xCep = '') then
    begin
      xMensagem.Warning('O CEP ? obrigat?rio.', [tcbClose]);
      Exit;
    end;

    xEndereco := xAPi.BuscarCep(xCep);

    if(Assigned(xEndereco))then
    begin
      edtLogradouro.Text := xEndereco.Logradouro;
      edtCidade.Text := xEndereco.Cidade;
      edtBairro.Text := xEndereco.Bairro;
      edtEstado.Text := xEndereco.Estado;
      edtComplemento.Text := xEndereco.Complemento;

      if (xEndereco.Bairro.IsEmpty) then
      begin
        if(edtBairro.CanFocus)then
          edtBairro.SetFocus;
      end
      else if (xEndereco.Logradouro.IsEmpty) then
      begin
        if(edtLogradouro.CanFocus)then
          edtLogradouro.SetFocus;
      end
      else if(edtNumero.CanFocus)then
        edtNumero.SetFocus;
    end;
  finally
    if(xEndereco <> nil) then
      FreeAndNil(xEndereco);
  end;
end;

function TMain.ValidarCPF: Boolean;
var
  xController: TCadastroController;
  xMensagem: TFrmMensagens;
begin
  xController := nil;
  xMensagem := nil;

  try
    xController := TCadastroController.Create;
    xMensagem := TFrmMensagens.Create(nil);

    if xController.ValidarCPF(mskCPF.text) = false then
      xMensagem.Warning('CPF inv?lido!', [tcbClose]);
  finally
    if xMensagem <> nil then
      FreeAndNil(xMensagem);
  end;
end;

function TMain.IfTernario(condicao: Boolean; value1,
  value2: variant): Variant;
begin
  if (condicao) then
    result := value1
  else
    result := value2
end;

end.
