program FMXAppTemplate;

uses
  System.StartUpCopy,
  FMX.Forms,
  uvMain in 'view\uvMain.pas' {vMain},
  uInfs in 'uInfs.pas',
  ModuleManager in 'utils\ModuleManager.pas',
  uvFacebook in 'view\externalLogin\uvFacebook.pas' {vFacebook: TFrame},
  uvBase in 'view\uvBase.pas' {vBase: TFrame},
  uvExternalLogin in 'view\uvExternalLogin.pas' {vExternalLogin: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TvMain, vMain);
  Application.Run;
end.
