unit UnitCondominio;

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
  UnitPrincipal,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  CRM_DataModule,
  UnitCondominioCad,
  UnitCondonimosCad,
  uFrmPix, //pq da erro no editor?
  D2Bridge.Forms;

type
  TFrmCondominio = class(TFrmPrincipal)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Lbl_Pesquisar: TLabel;
    Edit1: TEdit;
    Btn_Pesquisar: TButton;
    Btn_Novo: TButton;
    Btn_Editar: TButton;
    Btn_Excluir: TButton;
    BtnPagamento: TButton;
    procedure FormShow(Sender: TObject);
    procedure Btn_PesquisarClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure Btn_EditarClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure BtnPagamentoClick(Sender: TObject);
  private
    vFrmCondminioCad : TFrmCondominioCad;
    vFrmPRincipal :TFrmPrincipal;
    vFrmCondonimosCad : TFrmCondonimosCad;
    vFrmPix : TfrmPixVCL;
    procedure ListarCondominios;
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function FrmCondominio:TFrmCondominio;
//function FrmCondonimos:TFrmCondonimos;

implementation

Uses
  CRMWebApp;

{$R *.dfm}

function FrmCondominio:TFrmCondominio;
begin
  result:= TFrmCondominio(TFrmCondominio.GetInstance);
end;

//function FrmCondonimo:TFrmCondonimos;
//begin
//  result:= TFrmCondonimos(TFrmCondonimos.GetInstance);
//end;

procedure TFrmCondominio.BtnPagamentoClick(Sender: TObject);
begin
  inherited;
  if IsD2BridgeContext then
     ShowPopupModal('PopupPix')    //nao abre o form
  else
  begin
    vFrmPix := TfrmPixVCL.Create(Self);
    vFrmPix.ShowModal;
  end;

  ListarCondominios;
end;

procedure TFrmCondominio.Btn_EditarClick(Sender: TObject);
begin
  inherited;
  dm.qryCondominios.Edit;
  vFrmCondminioCad.IdCondominio := Dm.qryCondominios.FieldByName('ID').AsInteger;

  if IsD2BridgeContext then
     ShowPopupModal('PopupCondominioCad')
  else
  begin
    vFrmCondminioCad := TFrmCondominioCad.Create(Self);
    vFrmCondminioCad.ShowModal;
  end;

  ListarCondominios;
end;

procedure TFrmCondominio.Btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Escluir o registro?', mtConfirmation, [mbYes, mbNo], 0) =  mrYes then
  begin
    dm.qryCondominios.Delete;
    ListarCondominios;
  end;
end;

procedure TFrmCondominio.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  dm.qryCondominios.Append;
  vFrmCondminioCad.IdCondominio :=0;

  if IsD2BridgeContext then
     ShowPopupModal('PopupCondominioCad')
  else
  begin
    vFrmCondminioCad := TFrmCondominioCad.Create(Self);
    vFrmCondminioCad.ShowModal;
  end;

  ListarCondominios;
end;

procedure TFrmCondominio.Btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  ListarCondominios;
end;

procedure TFrmCondominio.ExportD2Bridge;
begin
  Image1.Visible:= False;
  inherited;

  Title:= 'Cadastro de Condomínios';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  //Configurações do form popup
  vFrmCondminioCad := TFrmCondominioCad.Create(Self);
  d2bridge.AddNested(vFrmCondminioCad);

  //Configuração do form popup -como funciona quando temos mais de um form popup?
  vFrmPix := TfrmPixVCL.Create(Self);
  d2bridge.AddNested(vFrmPix);

  with D2Bridge.Items.add do
  begin
    With Row.Items.Add do
    begin
      FormGroup(Lbl_Pesquisar.Caption).AddVCLObj(Edit1);
      FormGroup('').AddVCLObj(Btn_Pesquisar, CSSClass.Button.search);
      FormGroup('').AddVCLObj(Btn_Novo, CSSClass.Button.add);
      FormGroup('').AddVCLObj(Btn_Editar, CSSClass.Button.edit);
      FormGroup('').AddVCLObj(Btn_Excluir, CSSClass.Button.delete);
      FormGroup('').AddVCLObj(BtnPagamento, CSSClass.Button.send);
    end;

    With Row.Items.Add do
      VCLObj(DbGrid1);

    With Popup('PopupCondominioCad', 'Cadastro de Condominios').Items.Add do
    Nested(vFrmCondminioCad);

    With Popup('PopupPix', 'Pagamento Pix').Items.Add do
    Nested(vFrmPix);
  end;

end;

procedure TFrmCondominio.ListarCondominios;
begin
  Dm.ListarCondominios(Edit1.Text);
end;

procedure TFrmCondominio.FormShow(Sender: TObject);
begin
  inherited;

  ListarCondominios;
end;

procedure TFrmCondominio.InitControlsD2Bridge(const PrismControl: TPrismControl);
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

procedure TFrmCondominio.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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