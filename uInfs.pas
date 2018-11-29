unit uInfs;

interface
uses
  System.SysUtils
  ,FMX.Types
  ;
const
  //��� ����� ����� �������� ������ ���� ������������ ��������� � �������
  // ������� ������ GUID ��� ��������� � ������� ������ ��� ������ � ���������
  cLoginFB = '{2E1405DA-80C8-4A9B-BABA-1C75E4EB7BE4}';
  cExternalLoginFrame = '{346E8F6C-AF71-4F60-81EA-478FE8EDB7E2}';
  TExternalLoginList : array of string =
   [
      cLoginFB
   ];
   //������ ������� ����� ��� ������ ����������
   cStartFrame = cExternalLoginFrame;
type
  IFrameBase = interface(IInterface)
  ['{26694C2F-B388-4D7D-AA71-EAA134265153}']
    //���������� ����� � ����������
    procedure Show(AOwner: TFmxObject);
    //������ � ������� ����� �� ������
    procedure HideR;
  end;

  IExternalLoginFrame = interface(IInterface)
  [cExternalLoginFrame]
  end;
  //������� ��������� ��� ���� ������� ����� ����� ���������� ����

  IExternalLoginBase = interface(IInterface)
  ['{D8CD1352-DCD1-432F-AA72-6B04D2E59E81}']
    function GetView: TFmxObject;
  end;
  //��������� ��������������� ��� Facebook
  IExternalLoginFB = interface(IExternalLoginBase)
  [cLoginFB]
  end;

implementation

end.
