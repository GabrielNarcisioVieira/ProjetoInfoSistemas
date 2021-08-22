unit UMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls;

type
   TFrmMensagens = class(TForm)
    imgIconeInterrogacao: TImage;
      private
         { Private declarations }
      public
         function Error(pText: String; pMotivo: String; pMotivoAtivo: Boolean;
                        pButtons: TTaskDialogCommonButtons): TModalResult;

         function Warning(pText: String;
                        pButtons: TTaskDialogCommonButtons): TModalResult;

         function Inform(pText: String;
                        pButtons: TTaskDialogCommonButtons): TModalResult;

         function Confirm(pText: String;
                         pButtons: TTaskDialogCommonButtons): TModalResult;
  end;

var
  FrmMensagens: TFrmMensagens;

implementation

{$R *.dfm}

{ TFrmMensagens }

function TFrmMensagens.Confirm(pText: String;
  pButtons: TTaskDialogCommonButtons): TModalResult;
var
   xMensagem: TTaskDialog;
begin
   xMensagem := nil;
   xMensagem := TTaskDialog.Create(Self);
   try
      xMensagem.Caption := 'Info Sistemas';
      xMensagem.Title := 'Confirmação';
      xMensagem.CustomMainIcon := imgIconeInterrogacao.Picture.Icon;
      xMensagem.Flags := [tfUseHiconMain];
      xMensagem.CommonButtons := pButtons;
      xMensagem.Text := pText;

      if xMensagem.Execute then
      begin
         Result := xMensagem.ModalResult;
      end;
   finally
      if xMensagem <> nil then
         FreeAndNil(xMensagem);
   end;
end;

function TFrmMensagens.Error(pText, pMotivo: String; pMotivoAtivo: Boolean;
  pButtons: TTaskDialogCommonButtons): TModalResult;
var
   xMensagem: TTaskDialog;
begin
   xMensagem := nil;
   xMensagem := TTaskDialog.Create(Self);
   try
      xMensagem.Caption := 'Info Sistemas';
      xMensagem.Title := 'Erro';
      xMensagem.MainIcon := tdiError;
      xMensagem.CommonButtons := pButtons;
      xMensagem.Text := pText;

      if (pMotivoAtivo) then
      begin
         xMensagem.ExpandedText := pMotivo;
         xMensagem.ExpandButtonCaption := 'Clique para ver mais informações.';
      end;

      if xMensagem.Execute then
      begin
         Result := xMensagem.ModalResult;
      end;
   finally
      if xMensagem <> nil then
         FreeAndNil(xMensagem);
   end;
end;

function TFrmMensagens.Inform(pText: String;
  pButtons: TTaskDialogCommonButtons): TModalResult;
var
   xMensagem: TTaskDialog;
begin
   xMensagem := nil;
   xMensagem := TTaskDialog.Create(Self);
   try
      xMensagem.Caption := 'Info Sistemas';
      xMensagem.Title := 'Informação';
      xMensagem.MainIcon := tdiInformation;
      xMensagem.CommonButtons := pButtons;
      xMensagem.Text := pText;

      if xMensagem.Execute then
      begin
         Result := xMensagem.ModalResult;
      end;
   finally
      if xMensagem <> nil then
         FreeAndNil(xMensagem);
   end;
end;


function TFrmMensagens.Warning(pText: String;
  pButtons: TTaskDialogCommonButtons): TModalResult;
var
   xMensagem: TTaskDialog;
begin
   xMensagem := nil;
   xMensagem := TTaskDialog.Create(Self);
   try
      xMensagem.Caption := 'Info Sistemas';
      xMensagem.Title := 'Aviso';
      xMensagem.MainIcon := tdiWarning;
      xMensagem.CommonButtons := pButtons;
      xMensagem.Text := pText;

      if xMensagem.Execute then
      begin
         Result := xMensagem.ModalResult;
      end;
   finally
      if xMensagem <> nil then
         FreeAndNil(xMensagem);
   end;
end;

end.
