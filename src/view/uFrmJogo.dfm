object FrmJogoDaVelha: TFrmJogoDaVelha
  Left = 0
  Top = 0
  Caption = 'Jogo Da Velha'
  ClientHeight = 427
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object pnJogo: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 327
    Align = alClient
    Enabled = False
    TabOrder = 10
  end
  object bt_A1: TButton
    Left = 0
    Top = 4
    Width = 100
    Height = 100
    TabOrder = 0
    OnClick = OnCliqueJogar
  end
  object bt_A3: TButton
    Left = 262
    Top = 0
    Width = 100
    Height = 100
    TabOrder = 1
    OnClick = OnCliqueJogar
  end
  object bt_A2: TButton
    Left = 131
    Top = 0
    Width = 100
    Height = 100
    TabOrder = 2
    OnClick = OnCliqueJogar
  end
  object bt_c2: TButton
    Left = 131
    Top = 219
    Width = 100
    Height = 100
    TabOrder = 3
    OnClick = OnCliqueJogar
  end
  object bt_B1: TButton
    Left = 0
    Top = 110
    Width = 100
    Height = 100
    TabOrder = 4
    OnClick = OnCliqueJogar
  end
  object bt_B2: TButton
    Left = 131
    Top = 110
    Width = 100
    Height = 100
    TabOrder = 5
    OnClick = OnCliqueJogar
  end
  object bt_B3: TButton
    Left = 262
    Top = 110
    Width = 100
    Height = 100
    TabOrder = 6
    OnClick = OnCliqueJogar
  end
  object bt_c1: TButton
    Left = 0
    Top = 219
    Width = 100
    Height = 100
    TabOrder = 7
    OnClick = OnCliqueJogar
  end
  object bt_c3: TButton
    Left = 262
    Top = 219
    Width = 100
    Height = 100
    TabOrder = 8
    OnClick = OnCliqueJogar
  end
  object pnJogador: TPanel
    Left = 0
    Top = 327
    Width = 370
    Height = 100
    Align = alBottom
    TabOrder = 9
    object lbJogador1: TLabel
      Left = 16
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Jogador X'
    end
    object lbJogador2: TLabel
      Left = 16
      Top = 48
      Width = 50
      Height = 13
      Caption = 'Jogador O'
    end
    object eb_jogador_x: TEdit
      Left = 106
      Top = 8
      Width = 239
      Height = 21
      TabOrder = 0
    end
    object eb_jogador_o: TEdit
      Left = 106
      Top = 40
      Width = 239
      Height = 21
      TabOrder = 1
    end
    object btIniciar: TButton
      Left = 270
      Top = 67
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 2
      OnClick = btIniciarClick
    end
  end
end
