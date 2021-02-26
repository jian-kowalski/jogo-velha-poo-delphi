unit uJogoDaVelha;

interface

uses
  System.Generics.Collections, uJogada, uJogador, uEnum;

type
  TJogoDaVelha = class
  private
    FoJogador_X: TJogador;
    FoJogador_O: TJogador;
    FoJogadorAtual: TJogador;
    FoListaDeJogadas: TList<TJogada>;
    procedure ExibirMessagemVencedor;
    procedure ExibirMessagemDeuVelha;
    function GetJogadorAtual: TJogador;
  public
    constructor Create(AoJogadorX, AoJogadorO: TJogador);
    destructor Destroy; override;
    function TestarSeTemUmVencedor: Boolean;
    function TestarSeDeuVelha: Boolean;
    procedure AdicionarJogada(AoJogada: TJogada);
    function Jogar: tSimboloJogada;

  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils;

{ TJogoDaVelha }

procedure TJogoDaVelha.AdicionarJogada(AoJogada: TJogada);
begin
  FoListaDeJogadas.Add(AoJogada);
end;

constructor TJogoDaVelha.Create(AoJogadorX, AoJogadorO: TJogador);
begin
  FoListaDeJogadas := TList<TJogada>.Create;
  FoJogador_X := AoJogadorX;
  FoJogador_O := AoJogadorO;
end;

destructor TJogoDaVelha.Destroy;
begin
  if Assigned(FoListaDeJogadas) then
    FreeAndNil(FoListaDeJogadas);

  if Assigned(FoJogador_X) then
    FreeAndNil(FoJogador_X);

  if Assigned(FoJogador_O) then
    FreeAndNil(FoJogador_O);

  inherited;
end;

procedure TJogoDaVelha.ExibirMessagemDeuVelha;
begin
  ShowMessage('Parabéns, deu velha!!!' );
end;

procedure TJogoDaVelha.ExibirMessagemVencedor;
begin
  ShowMessage('Parabéns ' + FoJogadorAtual.Nome + '!!!' );
end;

function TJogoDaVelha.GetJogadorAtual: TJogador;
begin
  if FoJogadorAtual = FoJogador_X then
    Result := FoJogador_O
  else
    Result := FoJogador_X;
end;

function TJogoDaVelha.Jogar: tSimboloJogada;
begin
  FoJogadorAtual := GetJogadorAtual;
  Result := FoJogadorAtual.Simbolo;
end;

function TJogoDaVelha.TestarSeDeuVelha: Boolean;
var
  oJogada: TJogada;
begin
   Result := False;
  for oJogada in FoListaDeJogadas do
    begin
    Result := True;
    if not oJogada.TestarSeDeuVelha then
      Exit(False);
  end;

  if Result then  //Deu Velha, ele ta true
    ExibirMessagemDeuVelha;
end;

function TJogoDaVelha.TestarSeTemUmVencedor: Boolean;
var
  oJogada: TJogada;
begin
  Result := False;
  try
    for oJogada in FoListaDeJogadas do
      begin
      if oJogada.TestarSeGanhou then
        begin
        ExibirMessagemVencedor;
        Exit(True);
      end;
    end;

    if TestarSeDeuVelha then
      Exit(True);
  finally
    FoListaDeJogadas.Clear;
  end;
end;

end.
