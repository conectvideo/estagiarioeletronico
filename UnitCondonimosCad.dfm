object FrmCondonimosCad: TFrmCondonimosCad
  Left = 0
  Top = 0
  Caption = 'Cadastro de Moradores'
  ClientHeight = 294
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Lbl_Nome: TLabel
    Left = 24
    Top = 24
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Lbl_Endereco: TLabel
    Left = 24
    Top = 53
    Width = 49
    Height = 15
    Caption = 'Endere'#231'o'
  end
  object Lbl_Cidade: TLabel
    Left = 24
    Top = 169
    Width = 37
    Height = 15
    Caption = 'Cidade'
  end
  object Lbl_Estado: TLabel
    Left = 24
    Top = 198
    Width = 35
    Height = 15
    Caption = 'Estado'
  end
  object Lbl_Cep: TLabel
    Left = 27
    Top = 227
    Width = 21
    Height = 15
    Caption = 'CEP'
  end
  object Lbl_Bairro: TLabel
    Left = 24
    Top = 82
    Width = 31
    Height = 15
    Caption = 'Bairro'
  end
  object Lbl_Numero: TLabel
    Left = 23
    Top = 111
    Width = 44
    Height = 15
    Caption = 'N'#250'mero'
  end
  object Lbl_Complemento: TLabel
    Left = 24
    Top = 141
    Width = 77
    Height = 15
    Caption = 'Complemento'
  end
  object Edt_Nome: TEdit
    Left = 108
    Top = 21
    Width = 329
    Height = 23
    TabOrder = 0
  end
  object Edt_Endereco: TEdit
    Left = 108
    Top = 50
    Width = 329
    Height = 23
    TabOrder = 1
  end
  object Edt_Cidade: TEdit
    Left = 108
    Top = 166
    Width = 329
    Height = 23
    TabOrder = 2
  end
  object Edt_Estado: TEdit
    Left = 108
    Top = 195
    Width = 81
    Height = 23
    TabOrder = 3
  end
  object Btn_Salvar: TButton
    Left = 256
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = Btn_SalvarClick
  end
  object Btn_Cancelar: TButton
    Left = 350
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = Btn_CancelarClick
  end
  object Edt_Cep: TEdit
    Left = 108
    Top = 224
    Width = 81
    Height = 23
    TabOrder = 6
  end
  object Edt_Bairro: TEdit
    Left = 108
    Top = 79
    Width = 329
    Height = 23
    TabOrder = 7
  end
  object Edt_Numero: TEdit
    Left = 108
    Top = 108
    Width = 113
    Height = 23
    TabOrder = 8
  end
  object Edt_Complemento: TEdit
    Left = 108
    Top = 137
    Width = 329
    Height = 23
    TabOrder = 9
  end
  object MaskEdit1: TMaskEdit
    Left = 224
    Top = 200
    Width = 117
    Height = 23
    EditMask = '!\(999\)000-0000;1;_'
    MaxLength = 13
    TabOrder = 10
    Text = '(   )   -    '
  end
end
