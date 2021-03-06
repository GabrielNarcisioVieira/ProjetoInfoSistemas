unit UEnviarEmail_service;

interface

uses
  {Bibliotecas}
  XMLDoc, XMLIntf, SysUtils, IdSMTP, IdText, IdMessage, IdSSLOpenSSL,
  IdExplicitTLSClientServerBase, Dialogs, IdAttachmentFile, IdTCPConnection,
IdTCPClient,
IdHTTP,
IdBaseComponent,
IdMessageClient,
IdSMTPBase,

IdIOHandler,
IdIOHandlerSocket,
IdIOHandlerStack,IdSSL,

  {Units do sistema}
  UPessoa_model, UEndereco_model, UMensagem;

type
  TEnviarEmail = class
    private

    public
      function EnviarEmail(pDocument: TXMLDocument; pPessoa: TPessoa;
                pEndereco: TEndereco): Boolean;

  end;

implementation

{ TEnviarEmail }

function TEnviarEmail.EnviarEmail(pDocument: TXMLDocument; pPessoa: TPessoa;
  pEndereco: TEndereco): Boolean;
var
  xSmtp: TIdSMTP;
  xIdMsg: TIdMessage;
  xIdText: TIdText;
  xIdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
  xMensagem: TFrmMensagens;
begin
  try
    xSmtp := TIdSMTP.Create(nil);
    xMensagem := TFrmMensagens.Create(nil);

//    // Configurando SSL
    xIdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    xIdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    xIdSSLIOHandlerSocket.SSLOptions.Mode  := sslmClient;

    // Carregando dados da mensagem
    xIdMsg := TIdMessage.Create(nil);
    xIdMsg.CharSet                    := 'utf-8';
    xIdMsg.Encoding                   := meMIME;
    xIdMsg.From.Name                  := 'cadastro Info Sistemas';
    xIdMsg.From.Address               := 'testeemail21082021@gmail.com';
    xIdMsg.Priority                   := mpNormal;
    xIdMsg.Subject                    := 'Cadastro Info Sistemas';
    xIdMsg.Recipients.Add;
    xIdMsg.Recipients.EMailAddresses := pPessoa.Email;

    // Carregando XML
    TIdAttachmentFile.Create(xIdMsg.MessageParts, pDocument.ToString);

    // Preenchendo texto
    xIdText := TIdText.Create(xIdMsg.MessageParts);
    xIdText.Body.Add('Parab?ns, o seu cadastro foi efetuado com sucesso.'+#13+
                     'Confira os dados abaixo:  '+#13+
                     'Nome: ' + pPessoa.Nome +#13+
                     'Email: ' + pPessoa.Email +#13+
                     'Identidade: ' + pPessoa.Identidade +#13+
                     'CPF: ' + pPessoa.CPF +#13+
                     'Telefone: ' + pPessoa.Telefone +#13+
                     'Logradouro: ' + pEndereco.Logradouro +#13+
                     'Numero: ' + IntToStr(pEndereco.Numero) +#13+
                     'Complemento: ' + pEndereco.Complemento +#13+
                     'Bairro: ' + pEndereco.Bairro +#13+
                     'Cidade: ' + pEndereco.Cidade +#13+
                     'Estado: ' + pEndereco.Estado +#13+
                     'Pa?s: ' + pEndereco.Pais +#13+
                     'CEP: ' + pEndereco.CEP +#13);

    xIdText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

    // Configurando o Servidor
    xSmtp.IOHandler := xIdSSLIOHandlerSocket;
    xSmtp.UseTLS := utUseImplicitTLS;
    xSmtp.AuthType := satDefault;
    xSmtp.Host := 'smtp.gmail.com';
    xSmtp.AuthType := satSASL;
    xSmtp.Port := 465;
    xSmtp.Username := 'testeemail21082021@gmail.com';
    xSmtp.Password := 'TesteInfoSistemas';

    xSmtp.Connect;
    xSmtp.Authenticate;

    if(xSmtp.Connected)then
    begin
      try
        xSmtp.Send(xIdMsg);
      except on E:Exception do
        begin
          xMensagem.Error('Erro ao tentar enviar: ', E.Message, true, [tcbClose]);
          Result := false;
        end;
      end;
    end;

    Result := true;
  finally
    if(xSmtp.Connected)then
      xSmtp.Disconnect;

    if(xSmtp <> nil)then
      FreeAndNil(xSmtp);

    if(xIdText <> nil)then
      FreeAndNil(xIdText);

    if(xIdMsg <> nil)then
      FreeAndNil(xIdMsg);

    if(xMensagem <> nil)then
      FreeAndNil(xMensagem);

    if(xIdSSLIOHandlerSocket <> nil)then
      FreeAndNil(xIdSSLIOHandlerSocket);

    UnLoadOpenSSLLibrary;
  end;
end;

end.
