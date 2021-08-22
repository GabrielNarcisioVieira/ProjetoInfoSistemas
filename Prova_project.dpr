program Prova_project;

uses
  Vcl.Forms,
  MainView in 'MainView.pas' {Main},
  UPessoa_model in 'Model\UPessoa_model.pas',
  UEndereco_model in 'Model\UEndereco_model.pas',
  UMensagem in 'Components\UMensagem.pas' {FrmMensagens},
  UGetApiData_service in 'Modules\Cadastro\Services\UGetApiData_service.pas',
  UCadastro_controller in 'Modules\Cadastro\Controller\UCadastro_controller.pas',
  UGerarXml in 'Modules\Cadastro\Services\UGerarXml.pas',
  UEnviarEmail_service in 'Modules\Cadastro\Services\UEnviarEmail_service.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TFrmMensagens, FrmMensagens);
  Application.Run;
end.
