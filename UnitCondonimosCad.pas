unit UnitCondonimosCad;

{ Copyright 2025 / 2026 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Mask,
  D2Bridge.Forms;

type
  TFrmCondonimosCad = class(TD2BridgeForm)
    Lbl_Nome: TLabel;
    Lbl_Endereco: TLabel;
    Lbl_Cidade: TLabel;
    Lbl_Estado: TLabel;
    Edt_Nome: TEdit;
    Edt_Endereco: TEdit;
    Edt_Cidade: TEdit;
    Edt_Estado: TEdit;
    Btn_Salvar: TButton;
    Btn_Cancelar: TButton;
    Lbl_Cep: TLabel;
    Edt_Cep: TEdit;
    Lbl_Bairro: TLabel;
    Edt_Bairro: TEdit;
    Lbl_Numero: TLabel;
    Edt_Numero: TEdit;
    Lbl_Complemento: TLabel;
    Edt_Complemento: TEdit;
    MaskEdit1: TMaskEdit;
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdCondonimos: integer;
    { Private declarations }
  public
    Property IdCondonimos: integer  read FIdCondonimos write FIdCondonimos;
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function FrmCondonimosCad :TFrmCondonimosCad;

implementation

Uses
  CRMWebApp, CRM_DataModule;

{$R *.dfm}

function FrmCondonimosCad:TFrmCondonimosCad;
begin
  result:= TFrmCondonimosCad(TFrmCondonimosCad.GetInstance);
end;

procedure TFrmCondonimosCad.Btn_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCondonimosCad.Btn_SalvarClick(Sender: TObject);
begin
  dm.qryCondominios.FieldByName('nome').Value        := Edt_nome.Text;
  dm.qryCondominios.FieldByName('endereco').Value    := Edt_Endereco.Text;
  dm.qryCondominios.FieldByName('numero').Value      := Edt_Numero.Text;
  dm.qryCondominios.FieldByName('complemento').Value := Edt_Complemento.Text;
  dm.qryCondominios.FieldByName('bairro').Value      := Edt_Bairro.Text;
  dm.qryCondominios.FieldByName('cidade').Value      := Edt_Cidade.Text;
  dm.qryCondominios.FieldByName('estado').Value      := Edt_estado.Text;
  dm.qryCondominios.FieldByName('cep').Value         := Edt_cep.Text;
  dm.qryCondominios.Post;

  Close;
end;

procedure TFrmCondonimosCad.ExportD2Bridge;
begin
  inherited;

  Title:= 'Cadastro de Condomínios';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  with D2Bridge.Items.add do
  begin
    With row.Items.Add do
    begin
      FormGroup(Lbl_Nome.Caption).AddVCLObj(Edt_Nome);
      FormGroup(Lbl_Endereco.Caption).AddVCLObj(Edt_Endereco);
      FormGroup(Lbl_Numero.Caption).AddVCLObj(Edt_Numero);
      FormGroup(Lbl_Complemento.Caption).AddVCLObj(Edt_Complemento);
      FormGroup(Lbl_Bairro.Caption).AddVCLObj(Edt_Bairro);
      FormGroup(Lbl_Cidade.Caption).AddVCLObj(Edt_Cidade);
      FormGroup(Lbl_Estado.Caption).AddVCLObj(Edt_Estado);
      FormGroup(Lbl_Cep.Caption).AddVCLObj(Edt_Cep);
      //FormGroup('Telefone', MaskEdit1.Text).AddVCLObj(MaskEdit1); //como usar um maskedit para que saia dentro dele e nao acima dele o text
    end;

    with row.Items.Add do
    begin
      FormGroup('').AddVCLObj(Btn_Salvar, CSSClass.Button.add);
      FormGRoup('').AddVCLObj(Btn_Cancelar, CSSClass.Button.Edit);
    end;
  end;


end;

procedure TFrmCondonimosCad.FormShow(Sender: TObject);
begin
  if IdCondonimos > 0 then
  begin
    Edt_Nome.Text        := Dm.qryCondominios.FieldByName('nome').AsString;
    Edt_Endereco.Text    := Dm.qryCondominios.FieldByName('endereco').AsString;
    Edt_Numero.Text      := Dm.qryCondominios.FieldByName('numero').AsString;
    Edt_Complemento.Text := Dm.qryCondominios.FieldByName('complemento').AsString;
    Edt_Bairro.Text      := Dm.qryCondominios.FieldByName('bairro').AsString;
    Edt_Cidade.Text      := Dm.qryCondominios.FieldByName('cidade').AsString;
    Edt_Estado.Text      := Dm.qryCondominios.FieldByName('estado').AsString;
    Edt_Cep.Text         := Dm.qryCondominios.FieldByName('cep').AsString;
  end
  else
  begin
    Edt_Nome.Text        := '';
    Edt_Endereco.Text    := '';
    Edt_Numero.Text      := '';
    Edt_Complemento.Text := '';
    Edt_Bairro.Text      := '';
    Edt_Cidade.Text      := '';
    Edt_Estado.Text      := '';
    Edt_Cep.Text         := '';
  end;
end;


procedure TFrmCondonimosCad.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

 //Change Init Property of Prism Controls
 {
  if PrismControl.VCLComponent = Edit1 then
   PrismControl.AsEdit.DataType:= TPrismFieldType.PrismFieldTypeInteger;

  if PrismControl.IsDBGrid then
  begin
   PrismControl.AsDBGrid.RecordsPerPage:= 10;
   PrismControl.AsDBGrid.MaxRecords:= 2000;
  end;
 }
end;

procedure TFrmCondonimosCad.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
begin
 inherited;

 //Intercept HTML
 {
  if PrismControl.VCLComponent = Edit1 then
  begin
   HTMLControl:= '</>';
  end;
 }
end;

end.