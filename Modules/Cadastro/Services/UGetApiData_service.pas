unit UGetApiData_service;

interface

uses
  {Bibliotecas}
  System.JSON, REST.Client, System.Classes, System.SysUtils,

  {Units do sistema}
  UEndereco_model;

type
  TGetApiData = class
    private

    public
      constructor Create;
      destructor Destroy; override;
      function BuscarCep(uCEP: string): TEndereco;
end;

implementation

{ TController }

function TGetApiData.BuscarCep(uCEP: string): TEndereco;
var
  xData: TJSONObject;
  xRESTClient1: TRESTClient;
  xRESTRequest1: TRESTRequest;
  xRESTResponse1: TRESTResponse;
  xEndereco: TEndereco;
begin
  ///A API VIACEP N?O POSSUI "PA?S"

  xRESTClient1 := TRESTClient.Create(nil);
  xRESTRequest1 := TRESTRequest.Create(nil);
  xRESTResponse1 := TRESTResponse.Create(nil);
  xRESTRequest1.Client := xRESTClient1;
  xRESTRequest1.Response := xRESTResponse1;
  xRESTClient1.BaseURL := 'https://viacep.com.br/ws/' + uCep + '/json';
  xRESTRequest1.Execute;
  xData := xRESTResponse1.JSONValue as TJSONObject;

  try
    xEndereco := TEndereco.Create;
    if Assigned(xData) then
    begin
      xEndereco.Numero := -1;
      try
        xEndereco.Logradouro := xData.Values['logradouro'].Value;
      except
        on Exception do
          xEndereco.Logradouro := '';
      end;

      try
        xEndereco.bairro := xData.Values['bairro'].Value;
      except
      on Exception do
        xEndereco.bairro := '';
      end;

      try
        xEndereco.estado := xData.Values['uf'].Value;
      except
       on Exception do
         xEndereco.estado := '';
      end;

      try
        xEndereco.cidade := xData.Values['localidade'].Value;
      except
        on Exception do
          xEndereco.cidade := '';
      end;

      try
        xEndereco.Complemento := xData.Values['complemento'].Value;
      except
        on Exception do
          xEndereco.Complemento := '';
      end;
    end;
  finally
    if(xData <> nil) then
      FreeAndNil(xData);
  end;
  Result := xEndereco;
end;

constructor TGetApiData.Create;
begin
   inherited Create;
end;

destructor TGetApiData.Destroy;
begin
  inherited;
end;

end.
