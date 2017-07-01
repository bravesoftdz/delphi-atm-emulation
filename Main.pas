unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls,Contnrs,bnkClass, ExtCtrls, Buttons;

type
  TMains = class(TForm)
    sg: TStringGrid;
    btnRegist: TButton;
    edPass: TLabeledEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ��������: TBitBtn;
    btnClose: TBitBtn;
    procedure btnRegistClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ��������Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
  end;

var
  Mains: TMains;
  List : TObjectList;

implementation

uses Registration, Operation;

{$R *.dfm}

procedure TMains.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TMains.btnRegistClick(Sender: TObject);
begin
 Registrat.ShowModal;
end;

procedure TMains.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if Assigned(List) then FreeAndNil(List);
end;

procedure TMains.FormCreate(Sender: TObject);
begin
 List := TObjectList.Create;
 With sg do begin
  Cells[0,0] := '��`�';
  Cells[1,0] := '������';
  Cells[2,0] := '���';
  Cells[3,0] := '�����';
  Cells[4,0] := '������';
  Cells[5,0] := '����/���';
 end;
end;

procedure TMains.��������Click(Sender: TObject);
begin
 if List.Count <= 0 then
 begin
  ShowMessage('�� ������������ ������� �����������');
  Exit;
 end;

 if TCard(List.Items[0]).Name = '' then
  begin
   ShowMessage('������� ���� ��� ��������');
   Exit;
 end;

 if edPass.Text = '' then
 begin
  ShowMessage('������ ������ ��� ��������');
  Exit;
 end;

 if edPass.Text = TCard(List.Items[sg.Row - 1]).Password then
  Operat.Show
 else
  ShowMessage('������ �������� ������!');
end;

initialization


finalization


end.
