object FrmCondominio: TFrmCondominio
  Left = 0
  Top = 0
  Caption = 'FrmCondominio'
  ClientHeight = 478
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 994
    Height = 429
    Align = alClient
    DataSource = Dm.DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 237
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Width = 250
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 49
    Align = alTop
    TabOrder = 1
    object Lbl_Pesquisar: TLabel
      Left = 24
      Top = 16
      Width = 50
      Height = 15
      Caption = 'Pesquisar'
    end
    object Edit1: TEdit
      Left = 80
      Top = 13
      Width = 289
      Height = 23
      TabOrder = 0
    end
    object Btn_Pesquisar: TButton
      Left = 368
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = Btn_PesquisarClick
    end
    object Btn_Novo: TButton
      Left = 488
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 2
      OnClick = Btn_NovoClick
    end
    object Btn_Editar: TButton
      Left = 569
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 3
      OnClick = Btn_EditarClick
    end
    object Btn_Excluir: TButton
      Left = 650
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = Btn_ExcluirClick
    end
    object BtnPagamento: TButton
      Left = 872
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Pagamento'
      TabOrder = 5
      OnClick = BtnPagamentoClick
    end
  end
end
