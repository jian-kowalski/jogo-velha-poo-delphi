unit uJogador;

interface

uses
  uEnum;

type
  TJogador = class
  private
    Fnome: String;
    FtSimbolo: tSimboloJogada;
    function GetNome: String;
    procedure SetNome(const Value: String);
    procedure SetSimbolo(const Value: tSimboloJogada);
    function GetSimbolo: tSimboloJogada;

  public
    property Nome: String read GetNome write SetNome;
    property Simbolo: tSimboloJogada read GetSimbolo write SetSimbolo;
  end;

implementation

uses
  System.SysUtils, uException;

{ TJogador }

function TJogador.GetNome: String;
begin
  Result := Fnome;
end;

function TJogador.GetSimbolo: tSimboloJogada;
begin
  Result := FtSimbolo;
end;

procedure TJogador.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise ExceptionNomeNaoInformado.Create;
  Fnome := Value;
end;

procedure TJogador.SetSimbolo(const Value: tSimboloJogada);
begin
  FtSimbolo := Value;
end;

end.
