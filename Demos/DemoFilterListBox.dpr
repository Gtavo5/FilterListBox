program DemoFilterListBox;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FrmDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmDemo, FrmDemo);
  Application.Run;
end.
