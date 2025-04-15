unit CRM_DataModule;

{ Copyright 2025 / 2026 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Vcl.Dialogs;

type
  TDm = class(TDataModule)
    FDConnection2: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryCondominios: TFDQuery;
    DataSource1: TDataSource;

  private

    { Private declarations }
  public
    procedure ListarCondominios(Busca: string);
    class procedure CreateInstance;
  end;

function Dm:TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

Uses
  D2Bridge.Instance, CRMWebApp;

{$R *.dfm}

class procedure TDm.CreateInstance;
begin
 D2BridgeInstance.CreateInstance(self);
end;

function Dm:TDm;
begin
 result:= TDm(D2BridgeInstance.GetInstance(TDm));
end;

Procedure TDm.ListarCondominios(Busca: string);
begin
  qryCondominios.Active := False;
  qryCondominios.SQL.clear;
  qryCondominios.SQL.Add('select * from condominios');

  if busca <> '' then
  begin
    qryCondominios.SQL.Add('where nome like :nome');
    qryCondominios.ParamByName('nome').Value := '%' + busca + '%';
  end;

  qryCondominios.SQL.Add('order by Id Asc');

  qryCondominios.Active:= true;
end;

end.
