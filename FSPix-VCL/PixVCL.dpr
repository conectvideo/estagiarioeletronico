program PixVCL;

uses
  Vcl.Forms,
  uFrmPix in 'uFrmPix.pas' {frmPixVCL};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPixVCL, frmPixVCL);
  Application.Run;
end.
