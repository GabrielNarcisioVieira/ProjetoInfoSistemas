unit UEndereco_model;

interface

type
   TEndereco = class
      private
         FLogradouro: String;
         FBairro: String;
         FCEP: String;
         FNumero: Integer;
         FComplemento: String;
         FCidade: String;
         FEstado: String;
         FPais: string;
         procedure SetBairro(const Value: String);
         procedure SetCEP(const Value: String);
         procedure SetCidade(const Value: String);
         procedure SetComplemento(const Value: String);
         procedure SetEstado(const Value: String);
         procedure SetLogradouro(const Value: String);
         procedure SetNumero(const Value: Integer);
         procedure SetPais(const Value: string);

      public
         constructor Create;
         property Logradouro     : String read FLogradouro write SetLogradouro;
         property Numero         : Integer read FNumero write SetNumero;
         property Bairro         : String read FBairro write SetBairro;
         property Complemento    : String read FComplemento write SetComplemento;
         property Cidade         : String read FCidade write SetCidade;
         property Estado         : String read FEstado write SetEstado;
         property CEP            : String read FCEP write SetCEP;
         property Pais           : string read FPais write SetPais;
   end;

implementation

var
   _Instance : TEndereco;

{ TEndereco }

constructor TEndereco.Create;
begin
  Self.Logradouro := '';
  Self.numero :=  0;
  Self.Bairro := '';
  Self.Cidade := '';
  Self.Estado := '';
  Self.Pais := '';
  Self.CEP := '';
end;

procedure TEndereco.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TEndereco.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TEndereco.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TEndereco.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

procedure TEndereco.SetPais(const Value: string);
begin
  FPais := Value;
end;

procedure TEndereco.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

end.
