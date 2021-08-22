unit MainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  Tmain_view = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main_view: Tmain_view;

implementation

{$R *.dfm}

end.
