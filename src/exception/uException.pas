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
  Message := 'Nome do Jogador não informado!';
end;

end.
