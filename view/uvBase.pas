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
  //удаляем ссылки на себя у родителя
  Self.Parent := nil;
  //помечаем себя как мусор на удаление
  Release;
end;

procedure TvBase.Show(AOwner: TFmxObject);
begin
  Self.Parent := AOwner;
  //пока не используем, задатка на будущее
  Self.TagObject := AOwner;
  //првоеряем родителя на видимость
  if AOwner is TControl then
      TControl(AOwner).Visible := True;
  //делаем себя верхним слоем
  Self.BringToFront;
end;

end.
