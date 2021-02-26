unit uException;

interface

uses
  System.SysUtils;

type
  ExceptionNomeNaoInformado = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ ExceptionNomeNaoInformado }

constructor ExceptionNomeNaoInformado.Create;
begin
  Message := 'Nome do Jogador n�o informado!';
end;

end.
