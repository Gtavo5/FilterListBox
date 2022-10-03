///////////////////////////////////
//  Gustavo Ramos C.             //
//  Octubre 2022                 //
//  https://gustavoramos.com.mx  //
///////////////////////////////////

unit FilterListBox;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Winapi.Messages, System.Types,
  Dialogs, Vcl.Buttons;

type

{ TFilterEdit }

  TFilterButton = class(TSpeedButton)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
  end;

{ TFilterEdit }

  TFilterEdit = class(TEdit)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
  end;

  TPosition = (lpTop, lpBottom);

{ TFilterListBox }

  TFilterListBox = class(TListBox)
  private
    FFilterEdit: TFilterEdit;
    FFilterButton: TFilterButton;
    FEditPosition: TPosition;
    FEditSpacing: Integer;
    FButtonPosition: TPosition;
    FButtonSpacing: Integer;
    FOnItemCountChange: TNotifyEvent;
    FItemsFilterCount: Integer;
    FItemsTotalCount: Integer;
    FConfirmDelete: Boolean;
    ItemsAux: TStringList;
    IsFind: Boolean;
    procedure SetEditPosition(const Value: TPosition);
    procedure SetEditSpacing(const Value: Integer);
    procedure SetButtonPosition(const Value: TPosition);
    procedure SetButtonSpacing(const Value: Integer);
    procedure SetItemsReset(const Value: Boolean);
    procedure SetParent(AParent: TWinControl); override;
    procedure SetName(const Value: TComponentName); override;
    procedure CreateInternalEdit;
    procedure CreateInternalButton;
    procedure KeyUpFind(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ClickFilterButton(Sender: TObject);
    procedure WndProc(var Message: TMessage); override;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;

  protected
    property FilterEdit: TFilterEdit read FFilterEdit;
    property FilterButton: TFilterButton read FFilterButton;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property ItemsFilterCount: Integer read FItemsFilterCount;
    property ItemsTotalCount: Integer read FItemsTotalCount;
    property ItemsReset: Boolean write SetItemsReset;
    property ConfirmDelete: Boolean write FConfirmDelete default False;

  published
    property EditPosition: TPosition read FEditPosition write SetEditPosition default lpTop;
    property EditSpacing: Integer read FEditSpacing write SetEditSpacing default 5;
    property ButtonPosition: TPosition read FButtonPosition write SetButtonPosition default lpTop;
    property ButtonSpacing: Integer read FButtonSpacing write SetButtonSpacing default 5;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TFilterListBox]);
end;

{ TFilterListBox }

procedure TFilterListBox.ClickFilterButton(Sender: TObject);
begin
  if ItemIndex <> -1 then
  begin
    if FConfirmDelete then
    begin
      if (MessageDlg('Delete: '+Items.Strings[ItemIndex], mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
        ItemsAux.Delete(ItemsAux.IndexOf(Items[ItemIndex]));
        DeleteSelected;
      end
    end
    else
    begin
      ItemsAux.Delete(ItemsAux.IndexOf(Items[ItemIndex]));
      DeleteSelected;
    end;
  end;
end;

constructor TFilterListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CreateInternalEdit;
  CreateInternalButton;
  ItemsAux:= TStringList.Create;
end;

procedure TFilterListBox.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  SetEditPosition(EditPosition);
  SetButtonPosition(ButtonPosition);
end;

procedure TFilterListBox.SetEditPosition(const Value: TPosition);
begin
  if FFilterEdit = nil then
    Exit;
  FEditPosition:= Value;
  case FEditPosition of
    lpTop:
      FFilterEdit.SetBounds(Left, Top - FFilterEdit.Height - FEditSpacing - 3, Width, FFilterEdit.Height);
    lpBottom:
      FFilterEdit.SetBounds(Left, Top + Height + FEditSpacing + 3, Width, FFilterEdit.Height);
  end;
end;

procedure TFilterListBox.SetButtonPosition(const Value: TPosition);
begin
  if FFilterButton = nil then
    Exit;
  FButtonPosition:= Value;
  case Value of
    lpTop:
      FFilterButton.SetBounds(Left + Width + FButtonSpacing, Top, 25, 25);
    lpBottom:
      FFilterButton.SetBounds(Left + Width + FButtonSpacing, Height + 12, 25, 25);
  end;
end;

procedure TFilterListBox.SetEditSpacing(const Value: Integer);
begin
  FEditSpacing := Value;
  SetEditPosition(FEditPosition);
end;

procedure TFilterListBox.SetItemsReset(const Value: Boolean);
begin
  IsFind:= True;

  if Value then
  begin
    FFilterEdit.Clear;
    Items.Clear;
    Items:= ItemsAux;
  end;

  IsFind:= False;
end;

procedure TFilterListBox.SetButtonSpacing(const Value: Integer);
begin
  FButtonSpacing := Value;
  SetButtonPosition(FButtonPosition);
end;

procedure TFilterListBox.SetName(const Value: TComponentName);
begin
  inherited SetName(Value);
end;

procedure TFilterListBox.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);

  if FFilterEdit <> nil then
  begin
    FFilterEdit.Parent := AParent;
    FFilterEdit.Visible := True;
  end;

  if FFilterButton <> nil then
  begin
    FFilterButton.Parent := AParent;
    FFilterButton.Visible := True;
  end;
end;

procedure TFilterListBox.CreateInternalEdit;
begin
  if Assigned(FFilterEdit) then
    exit;
  FFilterEdit := TFilterEdit.Create(Self);
  FFilterEdit.OnKeyUp := KeyUpFind;
end;

destructor TFilterListBox.Destroy;
begin
  ItemsAux.Free;
  inherited;
end;

procedure TFilterListBox.CreateInternalButton;
begin
  if Assigned(FFilterButton) then
    exit;
  FFilterButton := TFilterButton.Create(Self);
  FFilterButton.OnClick:= ClickFilterButton;
end;

procedure TFilterListBox.KeyUpFind(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: integer;
begin
  IsFind:= True;

  if(Trim(FFilterEdit.Text) = EmptyStr) then
    Items := ItemsAux
  else
  begin
    Items.Clear;
    for i:= 0 to ItemsAux.Count - 1 do
      if(Pos(UpperCase(FFilterEdit.Text), UpperCase(ItemsAux[i])) > 0) then
        Items.AddObject(ItemsAux[i], ItemsAux.Objects[i]);
  end;

  IsFind:= False;
end;

procedure TFilterListBox.WndProc(var Message: TMessage);
var
  OldCount: Integer;
begin
  case Message.Msg of
    LB_ADDSTRING:
    begin
      OldCount := Items.Count;
      inherited;
      if (Message.Result >= 0) and not IsFind then
      begin
      if (OldCount <> Items.Count) then
        ItemsAux.AddObject(Items[Items.count-1], Items.Objects[Items.count-1]);
      end;
      FItemsFilterCount:= Items.Count;
      FItemsTotalCount:= ItemsAux.Count;
    end;

    LB_INSERTSTRING:
    begin
      inherited;
      if (Message.Result >= 0) and not IsFind then
      begin
          ItemsAux.Assign(Items)
      end;
      FItemsFilterCount:= Items.Count;
      FItemsTotalCount:= ItemsAux.Count;
    end;

    LB_DELETESTRING:
    begin
      inherited;
      FItemsFilterCount:= Items.Count;
      FItemsTotalCount:= ItemsAux.Count;
    end;

    LB_RESETCONTENT:
    begin
      inherited;
      FItemsFilterCount:= Items.Count;
      FItemsTotalCount:= ItemsAux.Count;
    end;

  else
    inherited;
  end;
end;

{ TFilterEdit }

constructor TFilterEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetSubComponent(True);
end;

{ TFilterButton }

constructor TFilterButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetSubComponent(True);
  Caption:= ' X ';
  ShowHint:= True;
  Hint:= 'Delete';
end;

end.
