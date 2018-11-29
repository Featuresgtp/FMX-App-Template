unit uvExternalLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uvBase
  ,ModuleManager, uInfs, FMX.Layouts
  ;

type
  TvExternalLogin = class(TvBase, IExternalLoginFrame, IFrameBase)
    lytBody: TLayout;
  private
    procedure LoadLoginOptions;
    procedure Resize;
  public
    procedure Show(AOwner: TFmxObject); override;
  end;
const
  cWidthDef = 50;
  cMarginTopDef = 5;
  cAlignDef = TAlignLayout.Top;

implementation

{$R *.fmx}

{ TvExternalLogin }

procedure TvExternalLogin.LoadLoginOptions;
var
  s: string;
  inf: IExternalLoginBase;
  view: TFmxObject;
begin
  for s in TExternalLoginList do
    if TModuleManager.Instance.SupportsModule(TGuid.Create(s), inf) then
      inf.GetView.Parent := lytBody;
  Resize;
end;

procedure TvExternalLogin.Resize;
var
  lControl: TControl;
  lSize: Single;
begin
  lSize := 0;
  //настраиваем положение и размер для каждого метода входа
  for lControl in lytBody.Controls do
  begin
    lControl.Align := cAlignDef;
    lControl.Width := cWidthDef;
    lControl.Margins.Top := cMarginTopDef;
    lSize := lSize + cWidthDef + cMarginTopDef;
  end;
  //задаем размер контейнеру
  lytBody.Width := lSize;
end;

procedure TvExternalLogin.Show(AOwner: TFmxObject);
begin
  LoadLoginOptions;
  inherited;
end;

initialization
  //регистрируем себя в менеджере
  TModuleManager.Instance.RegisterModule(IExternalLoginFrame, TvExternalLogin, nil, false);

end.
