//модуль инженерного калькулятора
unit frmEng;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, About,
  frmHelp;

type

  { TEngineer }

  TEngineer = class(TForm)
    MainMenu1: TMainMenu;
    Memo_en: TMemo;
    M_standart_en: TMenuItem;
    M_about_en: TMenuItem;
    M_base_en: TMenuItem;
    M_calc_en: TMenuItem;
    M_child_en: TMenuItem;
    M_copy_en: TMenuItem;
    M_dark_en: TMenuItem;
    M_EN_en: TMenuItem;
    M_eng_en: TMenuItem;
    M_help_en: TMenuItem;
    M_lang_en: TMenuItem;
    M_light_en: TMenuItem;
    M_mode_en: TMenuItem;
    M_paste_en: TMenuItem;
    M_read_en: TMenuItem;
    M_RUS_en: TMenuItem;
    M_theme_en: TMenuItem;
    procedure M_about_enClick(Sender: TObject);
    procedure M_base_enClick(Sender: TObject);
    procedure M_child_enClick(Sender: TObject);
    procedure M_copy_enClick(Sender: TObject);
    procedure M_dark_enClick(Sender: TObject);
    procedure M_EN_enClick(Sender: TObject);
    procedure M_light_enClick(Sender: TObject);
    procedure M_paste_enClick(Sender: TObject);
    procedure M_read_enClick(Sender: TObject);
    procedure M_RUS_enClick(Sender: TObject);
    procedure M_standart_enClick(Sender: TObject);
  private

  public

  end;

var
  Engineer: TEngineer;

implementation
uses frmMain;

{$R *.lfm}

                                     { TEngineer }
//-----------------------------------------------------------ПЕРЕКЛЮЧЕНИЕ РЕЖИМА
procedure TEngineer.M_base_enClick(Sender: TObject);
begin
   Engineer.Hide();
   Base.Show();
end;
//--------------------------------------------------------------------------ЯЗЫК
//-------------------------------------------------------------------Англилйский
procedure TEngineer.M_EN_enClick(Sender: TObject);
begin
    M_lang_en.Caption := 'English/Русский';
    M_child_en.Caption := 'Сhildren`s';
    M_mode_en.Caption := 'Mode';
    M_calc_en.Caption := 'Calculator';
    M_theme_en.Caption := 'Theme';
    M_dark_en.Caption := 'Dark';
    M_light_en.Caption := 'Light';
    M_copy_en.Caption := 'Copy';
    M_paste_en.Caption := 'Past';
    M_base_en.Caption := 'Base';
    M_eng_en.Caption := 'Engineering';
    M_read_en.Caption := 'Read help';
    M_about_en.Caption := 'About program';
    M_help_en.Caption := 'Help';
end;
//-----------------------------------------------------------------------Русский
procedure TEngineer.M_RUS_enClick(Sender: TObject);
begin
    M_lang_en.Caption := 'Русский/English';
    M_child_en.Caption := 'Детская';
    M_mode_en.Caption := 'Режим';
    M_calc_en.Caption := 'Калькулятор';
    M_theme_en.Caption := 'Тема';
    M_dark_en.Caption := 'Темная';
    M_light_en.Caption := 'Светлая';
    M_copy_en.Caption := 'Копировать';
    M_paste_en.Caption := 'Вставить';
    M_base_en.Caption := 'Базовый';
    M_eng_en.Caption := 'Инженерный';
    M_read_en.Caption := 'Посмотреть справку';
    M_about_en.Caption := 'О программе';
    M_help_en.Caption := 'Справка';
end;
//-----------------------------------------------------------------------СПРАВКА
procedure TEngineer.M_about_enClick(Sender: TObject);
begin
  frmAbout.Show();
end;

procedure TEngineer.M_read_enClick(Sender: TObject);
begin
   Help.Show();
end;
//-------------------------------------------------------------------КАЛЬКУЛЯТОР
//--------------------------------------------------------------------Копировать
procedure TEngineer.M_copy_enClick(Sender: TObject);
begin
   Memo_en.CopyToClipboard;
end;
//----------------------------------------------------------------------Вставить
procedure TEngineer.M_paste_enClick(Sender: TObject);
begin
   Memo_en.PasteFromClipboard;
end;
//_______________________________________________________________ТЕМЫ ОФОРМЛЕНИЯ
//________________________________________________________________________Тёмная
procedure TEngineer.M_dark_enClick(Sender: TObject);
begin
    if M_dark_en.Checked = true then
     Base.Color := clBlack;
end;
//_______________________________________________________________________Светлая
procedure TEngineer.M_light_enClick(Sender: TObject);
begin
  if M_light_en.Checked = true then
     Base.Color := clWhite;
end;
//_______________________________________________________________________Детская
procedure TEngineer.M_child_enClick(Sender: TObject);
begin
  if M_child_en.Checked = true then
     Base.Color := clGreen;
end;
//___________________________________________________________________Стандартная
procedure TEngineer.M_standart_enClick(Sender: TObject);
begin
  if M_standart_en.Checked = true then
     Base.Color := clDefault;
end;
//____________________________________________________________________________//
end.

