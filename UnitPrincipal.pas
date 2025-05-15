unit UnitPrincipal;

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
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage,
  uFrmPix, //pq da erro aqui no editor?
  D2Bridge.Forms; //Declare D2Bridge.Forms always in the last unit

type
  TFrmPrincipal = class(TD2BridgeForm)
    MainMenu1: TMainMenu;
    Module11: TMenuItem;
    AppModule21: TMenuItem;
    CoreModules1: TMenuItem;
    CoreModule11: TMenuItem;
    CoreModule21: TMenuItem;
    Desconectar1: TMenuItem;
    Condomnios1: TMenuItem;
    Inquilinos1: TMenuItem;
    Condonimos: TMenuItem;
    Condomnio1: TMenuItem;
    Funcionrios1: TMenuItem;
    Blocos1: TMenuItem;
    reasComuns1: TMenuItem;
    rea1: TMenuItem;
    Reservas1: TMenuItem;
    Bancos1: TMenuItem;
    Bancos2: TMenuItem;
    Contas1: TMenuItem;
    ProprietriosporCondominio1: TMenuItem;
    Proprietrios1: TMenuItem;
    funcionrios2: TMenuItem;
    Pessoas1: TMenuItem;
    Funcionrios3: TMenuItem;
    reasComuns2: TMenuItem;
    Blocos2: TMenuItem;
    Inquilinos2: TMenuItem;
    Inquilinos3: TMenuItem;
    Bancos3: TMenuItem;
    Bancos4: TMenuItem;
    reas1: TMenuItem;
    reas2: TMenuItem;
    Contas3: TMenuItem;
    Agncias1: TMenuItem;
    Contas2: TMenuItem;
    Image1: TImage;
    BancodeDados1: TMenuItem;
    procedure Module11Click(Sender: TObject);
    procedure Condomnio1Click(Sender: TObject);
//    procedure CondonimosClick(Sender: TObject);
    //procedure FormCreate(Sender: TObject);
  private

  public

  protected
   procedure ExportD2Bridge; override;
   procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
   procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

Function FrmPrincipal: TFrmPrincipal;

implementation

Uses
   CRMWebApp, UnitCondominio, UnitCondonimos;

Function FrmPrincipal: TFrmPrincipal;
begin
 Result:= TFrmPrincipal(TFrmPrincipal.GetInstance);
end;

{$R *.dfm}

{ TForm1 }

procedure TFrmPrincipal.Condomnio1Click(Sender: TObject);
begin
  if FrmCondominio = nil then
     TFrmCondominio.CreateInstance;

  FrmCondominio.ShowModal;
end;

//procedure TFrmPrincipal.CondonimosClick(Sender: TObject);
//begin
//  if FrmCondonimos = nil then
//     TFrmCondonimos.CreateInstance;
//
//  TFrmCondonimos.ShowModal;
//end;

procedure TFrmPrincipal.ExportD2Bridge;
begin
 inherited;

 Title:= 'Gerenciador de Condomínios';
 SubTitle:= '';

 //TemplateClassForm:= TD2BridgeFormTemplate;
 D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
 D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';


 //Export yours Controls
 with D2Bridge.Items.add do
 begin
    //SideMenu(MainMenu1);
    SideMenu(MainMenu1).HTMLStyle := 'background-color: #4682B4;';
    //VCLObj(image1);
    //Row.Items.Add.VCLObj(Image1).HTMLStyle := 'width: 150px; height: auto; align-self: flex-start; margin: 10px;';
    //Row.Items.Add.VCLObj(Image1).HTMLStyle := 'width: 150px; height: auto; margin: 10px auto;';
    //Row.Items.Add.VCLObj(Image1).HTMLStyle := 'width: 100%; height: 100%; object-fit: cover; margin: 0;';
    //Row.Items.Add.VCLObj(Image1).HTMLStyle := 'width: 100%; height: auto; margin: 10px 0;';
    Row.Items.Add.VCLObj(Image1).HTMLStyle :=
      'width: 100%; height: auto; max-height: 600px; object-fit: contain; margin: 10px auto;';

 end;

end;

//procedure TFrmPrincipal.FormCreate(Sender: TObject);
//var
//  D2BridgeLayout: TD2BridgeLayout;
//begin
//  D2BridgeLayout := TD2BridgeLayout.Create(Self);
//  try
//    D2BridgeLayout.TemplateLogo := '<img src="img/logo.png" style="max-height:40px;">';
//  finally
//    D2BridgeLayout.Free;
//  end;
//end;

procedure TFrmPrincipal.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

 //Menu example
 {
  if PrismControl.VCLComponent = MainMenu1 then
   PrismControl.AsMainMenu.Title:= 'AppTeste'; //or in SideMenu use asSideMenu

  if PrismControl.VCLComponent = MainMenu1 then
   PrismControl.AsMainMenu.Image.URL:= 'https://d2bridge.com.br/images/LogoD2BridgeTransp.png'; //or in SideMenu use asSideMenu

  //GroupIndex example
  if PrismControl.VCLComponent = MainMenu1 then
   with PrismControl.AsMainMenu do  //or in SideMenu use asSideMenu
   begin
    MenuGroups[0].Caption:= 'Principal';
    MenuGroups[1].Caption:= 'Services';
    MenuGroups[2].Caption:= 'Items';
   end;

  //Chance Icon and Propertys MODE 1 *Using MenuItem component
  PrismControl.AsMainMenu.MenuItemFromVCLComponent(Abrout1).Icon:= 'fa-solid fa-rocket';

  //Chance Icon and Propertys MODE 2 *Using MenuItem name
  PrismControl.AsMainMenu.MenuItemFromName('Abrout1').Icon:= 'fa-solid fa-rocket';
 }

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

procedure TFrmPrincipal.Module11Click(Sender: TObject);
begin
 FrmPrincipal.Show;
end;

procedure TFrmPrincipal.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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
