unit uvFacebook;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants
  ,System.IOUtils
  ,FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls
  ,FMX.TMSCloudBase, FMX.TMSCloudBaseFMX,
  FMX.TMSCloudCustomFacebook, FMX.TMSCloudFacebook, FMX.Controls.Presentation,
  FMX.TMSButton
  ,ModuleManager, uInfs
  ;

type
  //также наследуемся от IExternalLoginBase для избегания ошибок приведения типов
  TvFacebook = class(TFrame, IExternalLoginFB, IExternalLoginBase)
    btnFBLogin: TTMSFMXButton;
    tmscloudFB: TTMSFMXCloudFaceBook;
    procedure btnFBLoginClick(Sender: TObject);
    procedure tmscloudFBReceivedAccessToken(Sender: TObject);
  private
  public
    function GetView: TFmxObject;
  end;

implementation

{$R *.fmx}

{ TvFacebook }

procedure TvFacebook.btnFBLoginClick(Sender: TObject);
var
  acc: boolean;
begin
  if tmscloudFB.App.Key.IsEmpty then
  begin
    ShowMessage('Please provide a valid application ID for the client component');
    Exit;
  end;
  tmscloudFB.Connect;
end;

function TvFacebook.GetView: TFmxObject;
begin
  //инициализируем место хранения токена
  tmscloudFB.PersistTokens.Key := TPath.Combine(TPath.GetDocumentsPath, 'facebook.ini');
  tmscloudFB.PersistTokens.Section := 'tokens';
  Result := Self;
end;

procedure TvFacebook.tmscloudFBReceivedAccessToken(Sender: TObject);
begin
  tmscloudFB.SaveTokens;
  tmscloudFB.GetUserInfo;
  //в следующем добаим фрейм профиля и вынесем всю обработку отдельно
  ShowMessage('Login success for : ' +
    tmscloudFB.Profile.FirstName + ' ' + tmscloudFB.Profile.LastName);
end;

initialization
    TModuleManager.Instance.RegisterModule(IExternalLoginFB, TvFacebook, nil, false);

end.
