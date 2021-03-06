unit UCadastro_controller;

interface

uses
  {Bibliotecas }
  System.SysUtils, Vcl.Dialogs, XMLDoc, XMLIntf,

  {Units do Sistema}
  UPessoa_model, UEndereco_model, UGerarXml, UEnviarEmail_service, UMensagem;

type
  TCadastroController = class
    private

    public
      constructor Create;
      destructor Destroy; override;

      {Fun??es de valida??o de dados}
      function ValidarCampos(pEndereco: TEndereco; pPessoa: TPessoa): Boolean;
      function ValidarCPF(pCPF: String): Boolean;

      {Fun??es para grava??o de dados}
      function CadastrarPessoa(pPessoa: TPessoa; pEndereco: TEndereco): Boolean;
end;

implementation

{ TController }

constructor TCadastroController.Create;
begin
   inherited Create;
end;

destructor TCadastroController.Destroy;
begin
  inherited;
end;

function TCadastroController.ValidarCampos(pEndereco: TEndereco;
  pPessoa: TPessoa): Boolean;
begin
  pPessoa.Telefone := StringReplace(pPessoa.Telefone, '.', '', [rfReplaceAll, rfIgnoreCase]);
  pPessoa.Telefone := StringReplace(pPessoa.Telefone, '-', '', [rfReplaceAll, rfIgnoreCase]);
  pPessoa.Telefone := StringReplace(pPessoa.Telefone, '(', '', [rfReplaceAll, rfIgnoreCase]);
  pPessoa.Telefone := StringReplace(pPessoa.Telefone, ')', '', [rfReplaceAll, rfIgnoreCase]);
  pPessoa.Telefone := StringReplace(pPessoa.Telefone, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  pEndereco.CEP := StringReplace(pEndereco.CEP, '.', '', [rfReplaceAll, rfIgnoreCase]);
  pEndereco.CEP := StringReplace(pEndereco.CEP, '-', '', [rfReplaceAll, rfIgnoreCase]);
  pEndereco.CEP := StringReplace(pEndereco.CEP, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  if pPessoa.Nome.IsEmpty  then
    Result := false;

  if pPessoa.Identidade.IsEmpty  then
    Result := false;

  if pPessoa.CPF.IsEmpty  then
    Result := false;

  if pPessoa.Telefone.IsEmpty  then
    Result := false;

  if pPessoa.Email.IsEmpty  then
    Result := false;

  if pEndereco.Logradouro.IsEmpty  then
    Result := false;

  if pEndereco.Bairro.IsEmpty  then
    Result := false;

  if pEndereco.Cidade.IsEmpty  then
    Result := false;

    if pEndereco.Estado.IsEmpty  then
    Result := false;

  if pEndereco.Pais.IsEmpty  then
    Result := false;

  if pEndereco.CEP.IsEmpty  then
    Result := false;
end;

function TCadastroController.ValidarCPF(pCPF: String): Boolean;
var
   xPessoa: TPessoa;
begin
  xPessoa := nil;
  xPessoa := TPessoa.Create;

  Result := xPessoa.ValidarCPF(pCPF);
end;

function TCadastroController.CadastrarPessoa(pPessoa: TPessoa; pEndereco: TEndereco): Boolean;
var
  xGerarXml: TGerarXML;
  xEnviarEmail: TEnviarEmail;
  xMensagem: TFrmMensagens;
  XMLDocument: TXMLDocument;
begin
   xGerarXml := nil;
   xEnviarEmail := nil;
   xMensagem := nil;
   XMLDocument := nil;
  try
    xGerarXML := TGerarXML.Create;
    xEnviarEmail := TEnviarEmail.Create;
    xMensagem := TFrmMensagens.Create(nil);

    XMLDocument := xGerarXML.GerarXML(pPessoa, pEndereco);
    if(xEnviarEmail.EnviarEmail(XMLDocument, pPessoa, pEndereco)) then
       xMensagem.Inform('XML Cadastrado com sucesso!', [tcbOk])
  finally
    if xMensagem <> nil then
      FreeAndNil(xMensagem);

    if xGerarXML <> nil then
      FreeAndNil(xGerarXML);
  end;
end;
end.
