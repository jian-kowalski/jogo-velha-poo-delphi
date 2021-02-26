program JogoDaVelha;

uses
  Vcl.Forms,
  uFrmJogo in 'src\view\uFrmJogo.pas' {FrmJogoDaVelha},
  uJogoDaVelha in 'src\classe\uJogoDaVelha.pas',
  uJogada in 'src\classe\uJogada.pas',
  uEnum in 'src\enum\uEnum.pas',
  uJogador in 'src\classe\uJogador.pas',
  uException in 'src\exception\uException.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmJogoDaVelha, FrmJogoDaVelha);
  Application.Run;
end.
