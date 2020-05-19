unit FrmMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  About, frmHelp, frmEng;

type

  { TBase }

  TBase = class(TForm)
    but_1: TButton;
    minus: TButton;
    but_0: TButton;
    dot: TButton;
    but_div: TButton;
    mult: TButton;
    but_sub: TButton;
    but_add: TButton;
    but_eq: TButton;
    but_sqrt: TButton;
    but_sq: TButton;
    but_2: TButton;
    but_C: TButton;
    but_CE: TButton;
    but_per: TButton;
    but_3: TButton;
    but_4: TButton;
    but_5: TButton;
    but_6: TButton;
    but_8: TButton;
    but_7: TButton;
    but_9: TButton;
    Edit_base: TEdit;
    MainMenu1: TMainMenu;
    M_standart: TMenuItem;
    M_read: TMenuItem;
    M_about: TMenuItem;
    M_help: TMenuItem;
    M_RUS: TMenuItem;
    M_EN: TMenuItem;
    M_lang: TMenuItem;
    M_child: TMenuItem;
    M_mode: TMenuItem;
    M_calc: TMenuItem;
    M_theme: TMenuItem;
    M_dark: TMenuItem;
    M_light: TMenuItem;
    M_copy: TMenuItem;
    M_paste: TMenuItem;
    M_base: TMenuItem;
    M_eng: TMenuItem;
    procedure but_1Click(Sender: TObject);
    procedure but_2Click(Sender: TObject);
    procedure but_3Click(Sender: TObject);
    procedure but_4Click(Sender: TObject);
    procedure but_5Click(Sender: TObject);
    procedure but_6Click(Sender: TObject);
    procedure but_7Click(Sender: TObject);
    procedure but_8Click(Sender: TObject);
    procedure but_9Click(Sender: TObject);
    procedure but_0Click(Sender: TObject);
    procedure dotClick(Sender: TObject);
    procedure but_addClick(Sender: TObject); //вычитание
    procedure but_subClick(Sender: TObject);  //сложение
    procedure but_divClick(Sender: TObject);  // деление
    procedure multClick(Sender: TObject);  // уножение
    procedure but_eqClick(Sender: TObject); //равно
    procedure but_sqrtClick(Sender: TObject); //корень
    procedure but_sqClick(Sender: TObject); //квадрат
    procedure but_CClick(Sender: TObject); //C
    procedure but_CEClick(Sender: TObject); //CE
    procedure but_perClick(Sender: TObject); //процент
    procedure minusClick(Sender: TObject); //смена знака
    procedure M_aboutClick(Sender: TObject);
    procedure M_childClick(Sender: TObject);
    procedure M_copyClick(Sender: TObject);
    procedure M_darkClick(Sender: TObject);
    procedure M_ENClick(Sender: TObject);
    procedure M_engClick(Sender: TObject);
    procedure M_lightClick(Sender: TObject);
    procedure M_pasteClick(Sender: TObject);
    procedure M_readClick(Sender: TObject);
    procedure M_RUSClick(Sender: TObject);
    procedure M_standartClick(Sender: TObject);
  private

  public

  end;
var
  Base: TBase;

implementation

{$R *.lfm}

var
  A, B: double;
  C, D: integer;

{ TBase }
//___________________________________________________________________КАЛЬКУЛЯТОР
procedure TBase.M_copyClick(Sender: TObject);
begin
  Edit_base.CopyToClipboard;
end;
procedure TBase.M_pasteClick(Sender: TObject);
begin
  Edit_base.PasteFromClipboard;
end;
//____________________________________________________________________________//

//_____________________________________________________________РЕЖИМ: инженерный
procedure TBase.M_engClick(Sender: TObject);
begin
    Base.Width := 400;
    Edit_base.Width := 380;
end;
//____________________________________________________________________________//

//_______________________________________________________________ТЕМЫ ОФОРМЛЕНИЯ
//________________________________________________________________________Тёмная
procedure TBase.M_darkClick(Sender: TObject);
begin
  if M_dark.Checked = true then
     Base.Color := clBlack;
end;
//_______________________________________________________________________Светлая
procedure TBase.M_lightClick(Sender: TObject);
begin
  if M_light.Checked = true then
     Base.Color := clWhite;
end;
//_______________________________________________________________________Детская
procedure TBase.M_childClick(Sender: TObject);
begin
  if M_child.Checked = true then
     Base.Color := clGreen;
end;
//___________________________________________________________________Стандартная
procedure TBase.M_standartClick(Sender: TObject);
begin
  if M_standart.Checked = true then
     Base.Color := clDefault;
end;
//____________________________________________________________________________//

//_______________________________________________________________ЯЗЫК ИНТЕРФЕЙСА
//____________________________________________________________________Английский
procedure TBase.M_ENClick(Sender: TObject);
begin
    M_lang.Caption := 'English/Русский';
    M_child.Caption := 'Сhildren`s';
    M_mode.Caption := 'Mode';
    M_calc.Caption := 'Calculator';
    M_theme.Caption := 'Theme';
    M_dark.Caption := 'Dark';
    M_light.Caption := 'Light';
    M_copy.Caption := 'Copy';
    M_paste.Caption := 'Past';
    M_base.Caption := 'Base';
    M_eng.Caption := 'Engineering';
    M_read.Caption := 'Read help';
    M_about.Caption := 'About program';
    M_help.Caption := 'Help';
end;
//_______________________________________________________________________Русский
procedure TBase.M_RUSClick(Sender: TObject);
begin
    M_lang.Caption := 'Русский/English';
    M_child.Caption := 'Детская';
    M_mode.Caption := 'Режим';
    M_calc.Caption := 'Калькулятор';
    M_theme.Caption := 'Тема';
    M_dark.Caption := 'Темная';
    M_light.Caption := 'Светлая';
    M_copy.Caption := 'Копировать';
    M_paste.Caption := 'Вставить';
    M_base.Caption := 'Базовый';
    M_eng.Caption := 'Инженерный';
    M_read.Caption := 'Посмотреть справку';
    M_about.Caption := 'О программе';
    M_help.Caption := 'Справка';
end;
//____________________________________________________________________________//

//_______________________________________________________________________СПРАВКА
//______________________________________________________________Смотреть справку
procedure TBase.M_readClick(Sender: TObject);
begin
    Help.Show();
end;
//___________________________________________________________________О программе
procedure TBase.M_aboutClick(Sender: TObject);
begin
  FrmAbout.show();
end;
//____________________________________________________NUMS________________КНОПКИ
//0
procedure TBase.but_0Click(Sender: TObject);
begin
   if Edit_base.Text <> '0' then
     Edit_base.Text := Edit_base.Text + '0';
end;
//1
procedure TBase.but_1Click(Sender: TObject);
begin
   if Edit_base.Text = '0' then
     Edit_base.Text := '1'
  else Edit_base.Text := Edit_base.Text + '1';
end;
//2
procedure TBase.but_2Click(Sender: TObject);
begin
  if Edit_base.Text = '0' then
     Edit_base.Text := '2'
  else Edit_base.Text := Edit_base.Text + '2';
end;
//3
procedure TBase.but_3Click(Sender: TObject);
begin
     if Edit_base.Text = '0' then
        Edit_base.Text := '3'
     else Edit_base.Text := Edit_base.Text + '3';
end;
//4
procedure TBase.but_4Click(Sender: TObject);
begin
     if Edit_base.Text = '0' then
        Edit_base.Text := '4'
     else Edit_base.Text := Edit_base.Text + '4';
end;
//5
procedure TBase.but_5Click(Sender: TObject);
begin
      if Edit_base.Text = '0' then
         Edit_base.Text := '5'
      else Edit_base.Text := Edit_base.Text + '5';
end;
//6
procedure TBase.but_6Click(Sender: TObject);
begin
     if Edit_base.Text = '0' then
        Edit_base.Text := '6'
     else Edit_base.Text := Edit_base.Text + '6';
end;
//7
procedure TBase.but_7Click(Sender: TObject);
begin
     if Edit_base.Text = '0' then
        Edit_base.Text := '7'
     else Edit_base.Text := Edit_base.Text + '7';
end;
//8
procedure TBase.but_8Click(Sender: TObject);
begin
     if Edit_base.Text = '0' then
        Edit_base.Text := '8'
     else Edit_base.Text := Edit_base.Text + '8';
end;
//9
procedure TBase.but_9Click(Sender: TObject);
begin
     if Edit_base.Text = '0' then
        Edit_base.Text := '9'
     else Edit_base.Text := Edit_base.Text + '9';
end;
//Запятая
procedure TBase.dotClick(Sender: TObject);
begin
  if D = 0 then
  begin
     if Edit_base.Text <> '' then
        begin
           Edit_base.Text := Edit_base.Text + ',';
           D := 1;
        end
     else
       begin
          Edit_base.Text := '0,';
          D := 1;
       end;
  end;
end;
//____________________________________________________________________________//
//___________________________________________________ЗНАКИ________________КНОПКИ
//______________________________________________________________________Сложение
procedure TBase.but_addClick(Sender: TObject);
begin
     A := StrToFloat(Edit_base.Text);
     Edit_base.Text := '0';
     C:=1;
end;
//_____________________________________________________________________Вычитание
procedure TBase.but_subClick(Sender: TObject);
begin
     A := StrToFloat(Edit_base.Text);
     Edit_base.Text := '0';
     C:=2;
end;
//_______________________________________________________________________Деление
procedure TBase.but_divClick(Sender: TObject);
begin
     A := StrToFloat(Edit_base.Text);
     Edit_base.Text := '0';
     C:=3;
end;
//______________________________________________________________________Уножение
procedure TBase.multClick(Sender: TObject);
begin
     A := StrToFloat(Edit_base.Text);
     Edit_base.Text := '0';
     C:=4;
end;
//_________________________________________________________________________Равно
procedure TBase.but_eqClick(Sender: TObject);
begin
     B := StrToFloat(Edit_base.Text);
     if C = 1 then  Edit_base.Text := FloatToStr(A + B);
     if C = 2 then  Edit_base.Text := FloatToStr(A - B);
     if C = 3 then  Edit_base.Text := FloatToStr(A / B);
     if C = 4 then  Edit_base.Text := FloatToStr(A * B);
end;
//_____________________________________________________________Квадратный корень
procedure TBase.but_sqrtClick(Sender: TObject);
begin
     A := StrToFloat(Edit_base.Text);
     Edit_base.Text := FloatToStr(sqrt(A));
     C := 5;
end;
//_______________________________________________________________________Квадрат
procedure TBase.but_sqClick(Sender: TObject);
begin
    A := StrToFloat(Edit_base.Text);
    Edit_base.Text := FloatToStr(A*A);
    C := 5;
end;
//_______________________________________________________________________Очистка
procedure TBase.but_CClick(Sender: TObject);
begin
    Edit_base.Text := '0';
    A := 0;
    B := 0;
    C := 0;
    D := 0;
end;
//___________________________________________________Очистка последнего значения
procedure TBase.but_CEClick(Sender: TObject);
begin
   Edit_base.Text := '0';
end;
//______________________________________________________________________Проценты
procedure TBase.but_perClick(Sender: TObject);
begin
   B := StrToFloat(Edit_base.Text);
   Edit_base.Text := FloatToStr(A/100*B);
   C := 5;
end;
//___________________________________________________________________Смена знака
procedure TBase.minusClick(Sender: TObject);
begin
   A := StrToFloat(Edit_base.Text);
   Edit_base.Text := FloatToStr((-1)*A);
   C := 5;
end;






end.

