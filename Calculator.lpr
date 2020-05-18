program Calculator;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, FrmMain, About, frmHelp, frmEng
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TBase, Base);
  Application.CreateForm(THelp, Help);
  Application.CreateForm(TAbout, FrmAbout);
  Application.CreateForm(TEngineer, Engineer);
  Application.Run;
end.

