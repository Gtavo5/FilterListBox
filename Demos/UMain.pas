unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FilterListBox, Vcl.ExtCtrls;

type
  TFrmDemo = class(TForm)
    FilterSpacing: TButton;
    ButtonSpacing: TButton;
    Desing: TGroupBox;
    FillterPosition: TButton;
    ButtonPosition: TButton;
    Items: TGroupBox;
    Total: TLabeledEdit;
    Filter: TLabeledEdit;
    Refresh: TButton;
    Reset: TButton;
    Delete: TCheckBox;
    FilterListBox: TFilterListBox;
    procedure FilterSpacingClick(Sender: TObject);
    procedure ButtonSpacingClick(Sender: TObject);
    procedure FillterPositionClick(Sender: TObject);
    procedure ButtonPositionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure ResetClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDemo: TFrmDemo;

implementation

{$R *.dfm}

procedure TFrmDemo.ButtonPositionClick(Sender: TObject);
begin
  case FilterListBox.ButtonPosition of
    lpTop: FilterListBox.ButtonPosition:= lpBottom;
    lpBottom: FilterListBox.ButtonPosition:= lpTop;
  end;
end;

procedure TFrmDemo.ButtonSpacingClick(Sender: TObject);
begin
  FilterListBox.ButtonSpacing:= FilterListBox.ButtonSpacing + 5;
end;

procedure TFrmDemo.DeleteClick(Sender: TObject);
begin
  FilterListBox.ConfirmDelete:= delete.Checked;
end;

procedure TFrmDemo.FillterPositionClick(Sender: TObject);
begin
  case FilterListBox.EditPosition of
    lpTop: FilterListBox.EditPosition:= lpBottom;
    lpBottom: FilterListBox.EditPosition:= lpTop;
  end;
end;

procedure TFrmDemo.FilterSpacingClick(Sender: TObject);
begin
  FilterListBox.EditSpacing:= FilterListBox.EditSpacing + 5;
end;

procedure TFrmDemo.FormShow(Sender: TObject);
begin
  Total.Text:=  FilterListBox.ItemsTotalCount.ToString;
  Filter.Text:=  FilterListBox.ItemsFilterCount.ToString;
end;

procedure TFrmDemo.RefreshClick(Sender: TObject);
begin
  Total.Text:=  FilterListBox.ItemsTotalCount.ToString;
  Filter.Text:=  FilterListBox.ItemsFilterCount.ToString;
end;

procedure TFrmDemo.ResetClick(Sender: TObject);
begin
  FilterListBox.ItemsReset:= True;
end;

end.
