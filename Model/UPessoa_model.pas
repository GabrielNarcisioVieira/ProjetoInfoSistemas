unit UPessoa_model;

interface

  uses SysUtils;

  type TPessoa = class

    private
      FEmail: String;
      FCPF: String;
      FIdentidade: String;
      FNome: String;
      FTelefone: String;
      procedure SetCPF(const Value: String);
      procedure SetEmail(const Value: String);
      procedure SetIdentidade(const Value: String);
      procedure SetNome(const Value: String);
      procedure SetTelefone(const Value: String);

    public
      constructor Create;
      property Nome         : String read FNome write SetNome;
      property Identidade   : String read FIdentidade write SetIdentidade;
      property CPF          : String read FCPF write SetCPF;
      property Telefone     : String read FTelefone write SetTelefone;
      property Email        : String read FEmail write SetEmail;

      {Validar dados}
     function ValidarCPF(pCPF : String) : Boolean;

  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
   Self.Nome := '';
   Self.Identidade := '';
   Self.CPF := '';
   Self.Telefone := '';
   Self.Email := '';
end;

procedure TPessoa.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TPessoa.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TPessoa.SetIdentidade(const Value: String);
begin
  FIdentidade := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

function TPessoa.ValidarCPF(pCPF: String): Boolean;
var
   xCPFNumeral : array[1..11] of Integer;
   xBaseCalculoP : array[1..9] of Integer;
   xBaseCalculoS : array[1..10] of Integer;
   xMultiplicacao : array[1..9] of integer;
   xSoma : Integer;
   xValidacao : Integer;
   xResto : Integer;
   xQuociente : Integer;
   xPrimeiroDigito : Integer;
   xSegundoDigito : Integer;
   i : Integer;
   j : Integer;
begin
   pCPF := StringReplace(pCPF, '.', '', [rfReplaceAll, rfIgnoreCase]);
   pCPF := StringReplace(pCPF, '-', '', [rfReplaceAll, rfIgnoreCase]);
   pCPF := StringReplace(pCPF, ' ', '', [rfReplaceAll, rfIgnoreCase]);

   if (pCPF = '') or
      (pCPF = '00000000000') or
      (pCPF = '11111111111') or
      (pCPF = '22222222222') or
      (pCPF = '33333333333') or
      (pCPF = '44444444444') or
      (pCPF = '55555555555') or
      (pCPF = '66666666666') or
      (pCPF = '77777777777') or
      (pCPF = '88888888888') or
      (pCPF = '99999999999') then
   begin
      Result := False;
      Exit;
   end;

   xCPFNumeral[10] := -1;
   xCPFNumeral[11] := -1;
   xResto := 0;
   xQuociente := 0;
   xSoma := 0;
   j := 10;

   for i := 1 to 9 do
   begin
      xBaseCalculoP[i] := j;
      xCPFNumeral[i] := StrToInt(pCPF[i]);
      xMultiplicacao[i] := xCPFNumeral[i] * xBaseCalculoP[i];
      xSoma := xSoma + xMultiplicacao[i];
      j := j-1;
   end;

   xValidacao := Trunc(xSoma / 11);
   xQuociente := Trunc(xSoma div 11);
   xResto := (Trunc(xSoma mod 11));
   xSoma := 0;

   if xResto < 2 then
   begin
      xPrimeiroDigito := 0;
   end
   else
   begin
      xPrimeiroDigito := 11-xResto;
   end;

   j := 11;
   xCPFNumeral[10] := xPrimeiroDigito;

   for i := 1 to 10 do
   begin
      xBaseCalculoS[i] := j;
      xMultiplicacao[i] := xCPFNumeral[i] * xBaseCalculoS[i];
      xSoma := xSoma + xMultiplicacao[i];
      j := j-1;
   end;

   xValidacao := Trunc(xSoma / 11);
   xQuociente := Trunc(xSoma div 11);
   xResto := (Trunc(xSoma mod 11));

   if xResto < 2 then
   begin
      xSegundoDigito := 0;
   end
   else
   begin
      xSegundoDigito := 11-xResto;
   end;

   if ((xPrimeiroDigito = StrToInt(pCPF[10])) and
         (xSegundoDigito = StrToInt(pCPF[11]))) then
   begin
      Result := True;
   end
   else
   begin
      Result := False;
   end;
end;

end.
