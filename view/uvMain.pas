unit uvMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs
  ,ModuleManager, uInfs
  ;

type
  TvMain = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vMain: TvMain;

implementation

{$R *.fmx}

procedure TvMain.FormCreate(Sender: TObject);
var
  lStartFrame: IFrameBase;
begin
  if TModuleManager.Instance.SupportsModule(TGuid.Create(cStartFrame), TInterfaceFakeHelper.Guid<IFrameBase>, lStartFrame) then
    lStartFrame.Show(Self);
end;

end.
