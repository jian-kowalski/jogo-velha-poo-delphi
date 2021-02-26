unit uJogada;

interface

uses
  uEnum;

type
  TJogada = class
  private
    FtJogada_1,
    FtJogada_2,
    FtJogada_3: tSimboloJogada;
  public
    constructor Create(AtJogada_1, AtJogada_2, AtJogada_3: tSimboloJogada);
    function TestarSeGanhou: Boolean;
    function TestarSeDeuVelha: Boolean;
  end;

implementation

{ TJogada }

constructor TJogada.Create(AtJogada_1, AtJogada_2, AtJogada_3: tSimboloJogada);
begin
  FtJogada_1 := AtJogada_1;
  FtJogada_2 := AtJogada_2;
  FtJogada_3 := AtJogada_3;
end;

function TJogada.TestarSeDeuVelha: Boolean;
begin
  if tjVazia in [FtJogada_1, FtJogada_2, FtJogada_3]  then
    Result := False
  else
    Result := True;
end;

function TJogada.TestarSeGanhou: Boolean;
begin
  Result := False;
  if tjVazia in [FtJogada_1, FtJogada_2, FtJogada_3]  then
    Exit(False);

  if FtJogada_1 <>  FtJogada_2 then
    Exit(False);

  if FtJogada_1 = FtJogada_3 then
    Result := True;
end;

end.
