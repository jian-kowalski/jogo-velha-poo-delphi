unit uFrmJogo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uJogoDaVelha, uJogada, uEnum;

type
  TFrmJogoDaVelha = class(TForm)
    bt_A1: TButton;
    bt_A3: TButton;
    bt_A2: TButton;
    bt_c2: TButton;
    bt_B1: TButton;
    bt_B2: TButton;
    bt_B3: TButton;
    bt_c1: TButton;
    bt_c3: TButton;
    pnJogador: TPanel;
    lbJogador1: TLabel;
    lbJogador2: TLabel;
    eb_jogador_x: TEdit;
    eb_jogador_o: TEdit;
    pnJogo: TPanel;
    btIniciar: TButton;
    procedure OnCliqueJogar(Sender: TObject);
    procedure btIniciarClick(Sender: TObject);
  private
    FoJogo: TJogoDaVelha;
    function SimboloJogada(AcSimbolo: String): tSimboloJogada;
    procedure IniciarJogo;
    procedure AdicionarJogadas;
    procedure LimparComponentes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmJogoDaVelha: TFrmJogoDaVelha;

implementation

uses
  uJogador;

{$R *.dfm}

procedure TFrmJogoDaVelha.AdicionarJogadas;
begin
  FoJogo.AdicionarJogada(
    TJogada.Create(
      SimboloJogada(bt_a1.Caption),
      SimboloJogada(bt_a2.Caption),
      SimboloJogada(bt_a3.Caption)
    )
  );

  FoJogo.AdicionarJogada(
    TJogada.Create(
      SimboloJogada(bt_b1.Caption),
      SimboloJogada(bt_b2.Caption),
      SimboloJogada(bt_b3.Caption)
    )
  );

  FoJogo.AdicionarJogada(
    TJogada.Create(
      SimboloJogada(bt_c1.Caption),
      SimboloJogada(bt_c2.Caption),
      SimboloJogada(bt_c3.Caption)
    )
  );

  FoJogo.AdicionarJogada(
    TJogada.Create(
      SimboloJogada(bt_a1.Caption),
      SimboloJogada(bt_b1.Caption),
      SimboloJogada(bt_c1.Caption)
    )
  );

  FoJogo.AdicionarJogada(
    TJogada.Create(
      SimboloJogada(bt_a2.Caption),
      SimboloJogada(bt_b2.Caption),
      SimboloJogada(bt_c2.Caption)
    )
  );

  FoJogo.AdicionarJogada(
    TJogada.Create(
      SimboloJogada(bt_a3.Caption),
      SimboloJogada(bt_b3.Caption),
      SimboloJogada(bt_c3.Caption)
    )
  );

  FoJogo.AdicionarJogada(
    TJogada.Create(
      SimboloJogada(bt_a1.Caption),
      SimboloJogada(bt_b2.Caption),
      SimboloJogada(bt_c3.Caption)
    )
  );

  FoJogo.AdicionarJogada(
    TJogada.Create(
      SimboloJogada(bt_a3.Caption),
      SimboloJogada(bt_b2.Caption),
      SimboloJogada(bt_c1.Caption)
    )
  );
end;

function TFrmJogoDaVelha.SimboloJogada(AcSimbolo: String): tSimboloJogada;
begin
  Result := tjVazia;
  if AcSimbolo = 'X'  then
    EXit(tjXis);
  if AcSimbolo = 'O' then
    Exit(tjBola);
end;

procedure TFrmJogoDaVelha.btIniciarClick(Sender: TObject);
begin
  IniciarJogo;
end;

procedure TFrmJogoDaVelha.IniciarJogo;
var
  oJogador_X: TJogador;
  oJogador_O: TJogador;
begin
  oJogador_X := TJogador.Create;
  oJogador_X.Nome    := eb_jogador_x.Text;
  oJogador_X.Simbolo := tSimboloJogada.tjXis;

  oJogador_O := TJogador.Create;
  oJogador_O.Nome    := eb_jogador_o.Text;
  oJogador_O.Simbolo := tSimboloJogada.tjBola;


  FoJogo := TJogoDaVelha.Create(oJogador_X, oJogador_O);
end;

procedure TFrmJogoDaVelha.LimparComponentes;
var
  i: Integer;
begin
  for i := FrmJogoDaVelha.ComponentCount -1 downto 0 do
  begin
    if (FrmJogoDaVelha.Components[i] is TButton) and
      (TButton(FrmJogoDaVelha.Components[i]).Name <> 'btIniciar') then
      TButton(FrmJogoDaVelha.Components[i]).Caption := EmptyStr;
  end;
end;

procedure TFrmJogoDaVelha.OnCliqueJogar(Sender: TObject);
var
  tSimbolo: tSimboloJogada;
begin
  if not Assigned(FoJogo) then
    Exit;

  if TButton(Sender).Caption <> EmptyStr then
    Exit;

  tSimbolo := FoJogo.Jogar;
  if tSimbolo = tSimboloJogada.tjBola then
    TButton(Sender).Caption := 'O'
  else
    TButton(Sender).Caption := 'X';
  AdicionarJogadas;

  if FoJogo.TestarSeTemUmVencedor then
    LimparComponentes;
end;

end.
