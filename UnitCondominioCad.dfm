object FrmCondominioCad: TFrmCondominioCad
  Left = 0
  Top = 0
  Caption = 'Cadastro de Condominio'
  ClientHeight = 271
  ClientWidth = 449
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
    Top = 64
    Width = 49
    Height = 15
    Caption = 'Endere'#231'o'
  end
  object Lbl_Cidade: TLabel
    Left = 24
    Top = 104
    Width = 37
    Height = 15
    Caption = 'Cidade'
  end
  object Lbl_Estado: TLabel
    Left = 24
    Top = 144
    Width = 35
    Height = 15
    Caption = 'Estado'
  end
  object Lbl_Cep: TLabel
    Left = 27
    Top = 182
    Width = 21
    Height = 15
    Caption = 'CEP'
  end
  object Edt_Nome: TEdit
    Left = 88
    Top = 21
    Width = 329
    Height = 23
    TabOrder = 0
  end
  object Edt_Endereco: TEdit
    Left = 88
    Top = 61
    Width = 329
    Height = 23
    TabOrder = 1
  end
  object Edt_Cidade: TEdit
    Left = 88
    Top = 101
    Width = 329
    Height = 23
    TabOrder = 2
  end
  object Edt_Estado: TEdit
    Left = 88
    Top = 141
    Width = 81
    Height = 23
    TabOrder = 3
  end
  object Btn_Salvar: TButton
    Left = 248
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = Btn_SalvarClick
  end
  object Btn_Cancelar: TButton
    Left = 342
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = Btn_CancelarClick
  end
  object Edt_Cep: TEdit
    Left = 88
    Top = 179
    Width = 81
    Height = 23
    TabOrder = 6
  end
end
