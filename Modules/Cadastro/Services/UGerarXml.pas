unit UGerarXml;

interface

uses
  {Bibliotecas}
  XMLDoc, XMLIntf, SysUtils,

  {Units do sistema}
  UPessoa_model, UEndereco_model;

type
  TGerarXML = class
    private

    public
      function GerarXML(pPessoa: TPessoa; pEndereco: TEndereco): TXMLDocument;

end;

implementation


{ TGerarXML }

function TGerarXML.GerarXML(pPessoa: TPessoa; pEndereco: TEndereco): TXMLDocument;
var
  XMLDocument: TXMLDocument;
  NodeRegistro, NodeEndereco: IXMLNode;
begin
  XMLDocument := TXMLDocument.Create(nil);

  XMLDocument.Active := True;
  NodeRegistro := XMLDocument.AddChild('Registro');
  NodeRegistro.ChildValues['Nome'] := pPessoa.Nome;
  NodeRegistro.ChildValues['Email'] := pPessoa.Email;
  NodeRegistro.ChildValues['RG'] := pPessoa.Identidade;
  NodeRegistro.ChildValues['CPF'] := pPessoa.CPF;
  NodeRegistro.ChildValues['Telefone'] := pPessoa.Telefone;
  NodeEndereco := NodeRegistro.AddChild('Endereco');
  NodeEndereco.ChildValues['CEP'] := pEndereco.CEP;
  NodeEndereco.ChildValues['Pa?s'] := pEndereco.Pais;
  NodeEndereco.ChildValues['Estado'] := pEndereco.Estado;
  NodeEndereco.ChildValues['Cidade'] := pEndereco.Cidade;
  NodeEndereco.ChildValues['Bairro'] := pEndereco.Bairro;
  NodeEndereco.ChildValues['Logradouro'] := pEndereco.Logradouro;
  NodeEndereco.ChildValues['Numero'] := pEndereco.Numero;
  NodeEndereco.ChildValues['Complemento'] := pEndereco.Complemento;

  Result := XMLDocument;
end;

end.
