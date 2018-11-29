unit uvBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls
  ,uInfs
  ;

type
  TvBase = class(TFrame, IFrameBase)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Show(AOwner: TFmxObject); virtual;
    procedure HideR; virtual;
  end;

implementation

{$R *.fmx}

{ TvBase }

procedure TvBase.HideR;
begin
  //������� ������ �� ���� � ��������
  Self.Parent := nil;
  //�������� ���� ��� ����� �� ��������
  Release;
end;

procedure TvBase.Show(AOwner: TFmxObject);
begin
  Self.Parent := AOwner;
  //���� �� ����������, ������� �� �������
  Self.TagObject := AOwner;
  //��������� �������� �� ���������
  if AOwner is TControl then
      TControl(AOwner).Visible := True;
  //������ ���� ������� �����
  Self.BringToFront;
end;

end.
