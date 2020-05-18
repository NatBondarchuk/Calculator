unit About;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TAbout }

  TAbout = class(TForm)
    BitBtn1: TBitBtn;
    Lbl_about_name: TLabel;
    Lbl_About: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FrmAbout: TAbout;

implementation

{$R *.lfm}

{ TAbout }

procedure TAbout.FormCreate(Sender: TObject);
begin
  Lbl_about.Caption := 'Программа создана в рамках выполнения'#13
      + 'ЛР по дисциплине "Основы разработки'#13
      + 'кросс-плфтформенных приложений"'#13#13
      + 'Разработчик: Бондарчук Наталья, 4ПМИ'
end;

procedure TAbout.BitBtn1Click(Sender: TObject);
begin
  FrmAbout.close;
end;

end.

