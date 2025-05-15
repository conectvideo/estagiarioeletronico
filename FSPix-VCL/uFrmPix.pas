unit uFrmPix;

interface

uses
  Winapi.Windows,
  ShellAPI,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  FS.Pix,


  //IdHTTPServer, IdHTTPRequest, IdHTTPResponse, IdContext, pngimage,

  D2Bridge.Forms;

type
  TfrmPixVCL = class(TD2BridgeForm)
    LblChavePix: TLabel;
    btnGenerate: TButton;
    cmbTipo: TComboBox;
    LblTipo: TLabel;
    btnBaixar: TButton;
    LblBneficiario: TLabel;
    edtBeneficiario: TEdit;
    edtValor: TEdit;
    LblValor: TLabel;
    LblCodigoTransferencia: TLabel;
    edtIdentificador: TEdit;
    edtChave: TEdit;
    LblCidadeBeneficiario: TLabel;
    edtCidade: TEdit;
    imgPix: TImage;
    memPayLoad: TMemo;
    LblPayload: TLabel;
    LblBase64: TLabel;
    memImageBase64: TMemo;
    procedure btnGenerateClick(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function frmPixVCL:TfrmPixVCL;

implementation


{$R *.dfm}

function frmPixVCL:TfrmPixVCL;
begin
  result:= TfrmPixVCL(TfrmPixVCL.GetInstance);
end;

procedure TfrmPixVCL.btnBaixarClick(Sender: TObject);
//var
//  vFile: string;
begin
//  vFile := ExtractFileDir(Application.ExeName)+ '\img\' + IntToStr(Random(99999)) + '.bmp';
//  ForceDirectories(ExtractFileDir(Application.ExeName)+ '\img\');
//  imgPix.Picture.SaveToFile(vFile);
//
//  ShellExecute(handle, 'open', PChar(vFile), '', '', SW_SHOWNORMAL);


end;

procedure TfrmPixVCL.btnGenerateClick(Sender: TObject);
var
  Pix: TPix;
  vImgPix: TBitmap;
begin
  Pix := TPix.Create;
  try
    Pix.TipoChave := TTipoChave(cmbTipo.ItemIndex);
    Pix.Chave := edtChave.Text;
    Pix.Cidade := edtCidade.Text;
    Pix.Beneficiario := edtBeneficiario.Text;
    Pix.Valor := StrToFloat(edtValor.Text);
    Pix.Identificador := edtIdentificador.Text;
    memPayLoad.Lines.Text := Pix.GetPayLoad();
    memImageBase64.Lines.Text := Pix.GetImageBase64();
    try
      vImgPix := Pix.GetImage(5);
      imgPix.Picture.Assign(vImgPix);
    finally
      vImgPix.Free;
    end;
  finally
    FreeAndNil(Pix);
  end;
end;

procedure TfrmPixVCL.ExportD2Bridge;
begin
  begin
    inherited;

    Title:= 'Pagamento Pix';

    //TemplateClassForm:= TD2BridgeFormTemplate;
    D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
    D2Bridge.FrameworkExportType.TemplatePageHTMLFile  := '';

    with D2Bridge.Items.add do
    begin
      With row.Items.Add do
      begin
        FormGroup(LblTipo.Caption).AddVCLObj(cmbTipo); //ver como seria o combobox
        FormGroup(LblChavePix.Caption).AddVCLObj(edtChave);
        FormGroup(LblBneficiario.Caption).AddVCLObj(edtBeneficiario);
        FormGroup(LblCidadeBeneficiario.Caption).AddVCLObj(edtCidade);
        FormGroup(LblValor.Caption).AddVCLObj(edtValor);
        FormGroup(LblCodigoTransferencia.Caption).AddVCLObj(edtIdentificador);
        FormGroup(LblPayload.Caption).AddVCLObj(memPayLoad);
        FormGroup(LblBase64.Caption).AddVCLObj(memImageBase64);
        //FormGroup(imgPix.Caption).AddVCLObj(memImageBase64); //como faz com imagem?
        VCLObj(imgPix);
      end;

      with row.Items.Add do
      begin
        FormGroup('').AddVCLObj(btnGenerate, CSSClass.Button.add);
        FormGRoup('').AddVCLObj(btnBaixar, CSSClass.Button.Edit);
      end;
    end;

  end;

end;

procedure TfrmPixVCL.InitControlsD2Bridge(const PrismControl: TPrismControl);
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

procedure TfrmPixVCL.RenderD2Bridge(const PrismControl: TPrismControl;
  var HTMLControl: string);
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
