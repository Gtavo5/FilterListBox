object FrmDemo: TFrmDemo
  Left = 0
  Top = 0
  Caption = 'FrmDemo'
  ClientHeight = 481
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Desing: TGroupBox
    Left = 311
    Top = 24
    Width = 178
    Height = 201
    Caption = 'Desing'
    TabOrder = 0
    object FilterSpacing: TButton
      Left = 26
      Top = 16
      Width = 136
      Height = 25
      Caption = 'FilterSpacing'
      TabOrder = 0
      OnClick = FilterSpacingClick
    end
    object ButtonSpacing: TButton
      Left = 26
      Top = 47
      Width = 136
      Height = 25
      Caption = 'ButtonSpacing'
      TabOrder = 1
      OnClick = ButtonSpacingClick
    end
    object FillterPosition: TButton
      Left = 24
      Top = 78
      Width = 137
      Height = 25
      Caption = 'FillterPosition'
      TabOrder = 2
      OnClick = FillterPositionClick
    end
    object ButtonPosition: TButton
      Left = 24
      Top = 109
      Width = 137
      Height = 25
      Caption = 'ButtonPosition'
      TabOrder = 3
      OnClick = ButtonPositionClick
    end
    object Delete: TCheckBox
      Left = 24
      Top = 171
      Width = 129
      Height = 17
      Caption = 'Confirm delete item'
      TabOrder = 4
      OnClick = DeleteClick
    end
    object ButtonVisible: TButton
      Left = 24
      Top = 140
      Width = 137
      Height = 25
      Caption = 'ButtonVisible'
      TabOrder = 5
      OnClick = ButtonVisibleClick
    end
  end
  object Items: TGroupBox
    Left = 311
    Top = 248
    Width = 178
    Height = 201
    Caption = 'Items'
    TabOrder = 1
    object Total: TLabeledEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'Total'
      ReadOnly = True
      TabOrder = 0
    end
    object Filter: TLabeledEdit
      Left = 16
      Top = 88
      Width = 121
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'Filter'
      TabOrder = 1
    end
    object Refresh: TButton
      Left = 40
      Top = 123
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 2
      OnClick = RefreshClick
    end
    object Reset: TButton
      Left = 40
      Top = 154
      Width = 75
      Height = 25
      Caption = 'Reset'
      TabOrder = 3
      OnClick = ResetClick
    end
  end
  object FilterListBox: TFilterListBox
    Left = 24
    Top = 40
    Width = 217
    Height = 369
    ItemHeight = 13
    Items.Strings = (
      'answer'#9
      'add'#9
      'answer'#9
      'apologise'#9
      'arrest'#9
      'arrive'#9
      'ask'#9
      'attack'#9
      'be'#9
      'become'#9
      'begin'#9
      'believe'#9
      'boil'#9
      'book'#9
      'borrow'#9
      'break'#9
      'bring'#9
      'build'#9
      'buy'#9
      'carry'#9
      'catch'#9
      'change'#9
      'chop'#9
      'clean'#9
      'climb'#9
      'collect'#9
      'come'#9
      'compose'#9
      'cook'#9
      'copy'#9
      'cut'#9
      'dance'#9
      'describe'
      'destroy'#9
      'die'#9
      'discover'
      'discuss'#9
      'do'#9
      'draw'#9
      'dream'#9
      'drink'#9
      'drive'#9
      'dye'#9
      'eat'#9
      'enjoy'
      'explode'
      'extinguish'
      'fall'#9
      'feed'#9
      'feel'#9
      'fight'#9
      'find'#9
      'fly'#9
      'forget'
      'freeze'
      'fry'#9
      'give'
      'go'#9
      'grow'
      'happen'#9
      'hate'#9
      'have'#9
      'hear'#9
      'help'#9
      'hire'#9
      'hope'#9
      'hunt'#9
      'hurt'#9
      'imagine'#9
      'invent'#9
      'invite'#9
      'jump'#9
      'keep'#9
      'kill'#9
      'know'#9
      'leave'#9
      'lend'#9
      'lie'#9
      'lie'#9
      'lift'#9
      'like'#9
      'listen'#9
      'live'#9
      'look'#9
      'lose'#9
      'love'#9
      'make'#9
      'meet'#9
      'miss'#9
      'offer'#9
      'open'#9
      'pack'#9
      'pass'#9
      'pay'#9
      'peel'#9
      'phone'#9
      'plan'#9
      'play'#9
      'pour'#9
      'prefer'#9
      'prepare'#9
      'push'#9
      'put'#9
      'rain'#9
      'read'#9
      'reduce'#9
      'remember'
      'rent'#9
      'rescue'#9
      'return'#9
      'ring'#9
      'run'#9
      'save'#9
      'say'#9
      'scream'#9
      'search'#9
      'see'#9
      'sell'#9
      'send'#9
      'shine'#9
      'shoot'#9
      'shut'#9
      'sing'#9
      'sit'#9
      'skate'#9
      'ski'#9
      'sleep'#9
      'smell'#9
      'snore'#9
      'speak'#9
      'spend'#9
      'start'#9
      'stay'#9
      'steal'#9
      'stop'#9
      'study'#9
      'survive'#9
      'swim'#9
      'take'#9
      'talk'#9
      'teach'#9
      'tell'#9
      'thank'#9
      'think'#9
      'throw'#9
      'touch'#9
      'try'#9
      'understand'#9
      'use'#9
      'visit'#9
      'wait'#9
      'walk'#9
      'want'#9
      'warn'#9
      'wash'#9
      'watch'#9
      'wear'
      'win'#9
      'work'#9
      'write')
    TabOrder = 2
    EditSpacing = 0
    ButtonPosition = lpBottom
    ButtonSpacing = 0
  end
end
