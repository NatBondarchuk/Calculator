unit FrmMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  Buttons, ExtCtrls, About, frmHelp, math;

type

  { TBase }

  TBase = class(TForm)
    but_0: TSpeedButton;
    but_1: TSpeedButton;
    but_2: TSpeedButton;
    but_3: TSpeedButton;
    but_4: TSpeedButton;
    but_5: TSpeedButton;
    but_6: TSpeedButton;
    but_7: TSpeedButton;
    but_8: TSpeedButton;
    but_9: TSpeedButton;
    but_add: TSpeedButton;
    but_C: TSpeedButton;
    but_CE: TSpeedButton;
    but_cos: TSpeedButton;
    but_ctg: TSpeedButton;
    but_div: TSpeedButton;
    but_eq: TSpeedButton;
    but_fac: TSpeedButton;
    but_lg: TSpeedButton;
    but_ln: TSpeedButton;
    but_mod: TSpeedButton;
    but_per: TSpeedButton;
    but_pow: TSpeedButton;
    but_sin: TSpeedButton;
    but_sq: TSpeedButton;
    but_sqrt: TSpeedButton;
    but_sub: TSpeedButton;
    but_tg: TSpeedButton;
    dot: TSpeedButton;
    Image1: TImage;
    minus: TSpeedButton;
    mult: TSpeedButton;
    SS_2: TSpeedButton;
    SS_3: TSpeedButton;
    SS_4: TSpeedButton;
    SS_5: TSpeedButton;
    SS_6: TSpeedButton;
    SS_7: TSpeedButton;

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
    M_Cosmos: TMenuItem;
    M_Rain: TMenuItem;
    M_copy: TMenuItem;
    M_paste: TMenuItem;
    M_base: TMenuItem;
    M_eng: TMenuItem;
    SS_8: TSpeedButton;
{_________________________________МЕНЮ_________________________________________}
//Темы оформления
    procedure FormPaint(Sender: TObject);
    procedure viewCalc(Sender: TObject);
//Правка
    procedure M_pasteClick(Sender: TObject);
    procedure M_copyClick(Sender: TObject);
//Смена языка интерфейса
    procedure M_RUSClick(Sender: TObject);
    procedure M_ENClick(Sender: TObject);
//Режим калькулятора
    procedure modeCalc(Sender: TObject);
    procedure FormCreate(Sender: TObject);
//Справка и о программе
    procedure M_readClick(Sender: TObject);
    procedure M_aboutClick(Sender: TObject);
{_______________________ОСНОВНОЙ____РЕЖИМ______________________________________}
    //ввод в эдит в клавиатуры
    procedure Edit_baseKeyPress(Sender: TObject; var Key: char);
    procedure ClickBut(Sender: TObject);//чтение цифр с кнопок и ввод в эдит
    procedure dotClick(Sender: TObject);//обработка десятичной точки с кнопки
    procedure ClickAct(Sender: TObject); //забор первого операнда + действия
    procedure but_eqClick(Sender: TObject); //равно
    procedure but_CClick(Sender: TObject); //C
    procedure but_CEClick(Sender: TObject); //CE
    procedure minusClick(Sender: TObject); //смена знака
    procedure but_sqrtClick(Sender: TObject); //корень
    procedure but_sqClick(Sender: TObject); //квадрат
    procedure but_perClick(Sender: TObject); //процент
{_______________________РАСШИРЕННЫЙ___РЕЖИМ____________________________________}
//Арифметика +
    procedure but_powClick(Sender: TObject);//произвольная степень
    procedure but_modClick(Sender: TObject);//модуль
    procedure but_facClick(Sender: TObject);//факториал
//Логарифмы
    procedure but_lgClick(Sender: TObject);//десятичный
    procedure but_lnClick(Sender: TObject);//натуральный
//Тригонометрия
    procedure but_sinClick(Sender: TObject);//синус
    procedure but_cosClick(Sender: TObject);//косинус
    procedure but_tgClick(Sender: TObject);//тангенс
    procedure but_ctgClick(Sender: TObject);//котангенс
//Перевод из деситичной системы счисления в другую
    procedure SS_2Click(Sender: TObject);
    procedure SS_3Click(Sender: TObject);
    procedure SS_4Click(Sender: TObject);
    procedure SS_5Click(Sender: TObject);
    procedure SS_6Click(Sender: TObject);
    procedure SS_7Click(Sender: TObject);
    procedure SS_8Click(Sender: TObject);

  private

  public

  end;
var
  Base: TBase;
implementation

{$R *.lfm}

var
  A, B: double;
  Check_dot, left_0: integer;
  act: string;

{ TBase }
//_________________________________________________________________________ЦИФРЫ
function check_but(X : integer; str : string) : string;
begin
   if X = 10 then
      begin
         if Check_dot = 0 then
            begin
               check_but := str + ',';
               Check_dot := 1;
            end
         else
            check_but := str;
      end
   else
      begin
         if ((str <> '0') and (str <> 'Укажите степень')and (str <> '')) then
            check_but := str + IntToStr(X)
         else check_but := IntToStr(X);
      end;
end;
//Кнопки с цифрами
procedure TBase.ClickBut(Sender: TObject);
begin
  Edit_base.Text := check_but(StrToInt((Sender as TSpeedButton).Caption), Edit_base.Text);
end;
//Запятая
procedure TBase.dotClick(Sender: TObject);
begin
  Edit_base.Text := check_but(10, Edit_base.Text);
end;
//____________________________________________________________________________//
//_______________________________________________________________________БАЗОВЫЙ
//______________________________________________________________________Сложение
procedure TBase.ClickAct(Sender: TObject);
begin
   A := StrToFloat(Edit_base.Text);
   Edit_base.Text := '0';
   act := (Sender as TSpeedButton).Caption;
   Check_dot := 0;
end;
function arifm(x1,x2 : float; act : string) : string;
begin
  if act = '+' then  arifm := FloatToStr(x1 + x2);
  if act = '-' then  arifm := FloatToStr(x1 - x2);
  if act = '/' then  arifm := FloatToStr(x1 / x2);
  if act = '*' then  arifm := FloatToStr(x1 * x2);
  if act = '^' then  arifm := FloatToStr(x1 * x2);
end;

function eq(x1,x2: float; act : string) : string;
begin
   if ((act = '+') or (act = '-') or(act = '*') or(act = '/')) then
      eq := arifm(x1, x2, act);
   if act = '^' then eq := FloatToStr(power(x1,x2));
   act := 'none';
end;
procedure TBase.Edit_baseKeyPress(Sender: TObject; var Key: char);
begin
  case Key of
     '0'..'9': check_but(StrToInt(Key), Edit_base.Text);
     '+', '-', '*', '/', '^':
        begin
           A := StrToFloat(Edit_base.Text);
           act := Key;
           Key := Chr(0);
           Edit_base.Text := '0';
        end;
     '=', #13:
        begin
          if ((FloatToStr(A) <> '') and (Edit_base.Text<>'') and (act<>'none')) then
             begin
                Edit_base.Text := eq(A,StrToFloat(Edit_base.Text),act);
                Key := Chr(0);
             end;
        end;
     ',': //ловим десятичный разделитель
        begin
          Key := DecimalSeparator;
          if pos(DecimalSeparator, Edit_base.Text) <> 0 then
             Key := Chr(0); //запрещаем ввод символа
        end;
  else Key := Chr(0);
     end;
end;

//_________________________________________________________________________Равно
procedure TBase.but_eqClick(Sender: TObject);
begin
   B := StrToFloat(Edit_base.Text);
   Edit_base.Text := eq(A,B,act);
end;
//_____________________________________________________________Квадратный корень
procedure TBase.but_sqrtClick(Sender: TObject);
begin
     A := StrToFloat(Edit_base.Text);
     Edit_base.Text := FloatToStr(sqrt(A));
     act := 'none';
end;
//_______________________________________________________________________Квадрат
procedure TBase.but_sqClick(Sender: TObject);
begin
    A := StrToFloat(Edit_base.Text);
    Edit_base.Text := FloatToStr(A*A);
    act := 'none';
end;
//_______________________________________________________________________Очистка
procedure TBase.but_CClick(Sender: TObject);
begin
    Edit_base.Text := '0';
    A := 0;
    B := 0;
    act := 'none';
    Check_dot := 0;
end;
//___________________________________________________Очистка последнего значения
procedure TBase.but_CEClick(Sender: TObject);
begin
   Edit_base.Text := '0';
   Check_dot := 0;
end;
//______________________________________________________________________Проценты
procedure TBase.but_perClick(Sender: TObject);
begin
   B := StrToFloat(Edit_base.Text);
   Edit_base.Text := FloatToStr(A/100*B);
   act := 'none';
end;
//___________________________________________________________________Смена знака
procedure TBase.minusClick(Sender: TObject);
begin
   A := StrToFloat(Edit_base.Text);
   Edit_base.Text := FloatToStr((-1)*A);
   act := 'none';
end;
//___________________________________________________________________РАСШИРЕННЫЙ
function change_SS(x: float; y : integer): string;  //перевод СС
var  num: string;
     x_1: integer;
begin
   if Check_dot = 0 then
      begin
       x_1 := trunc(x);
       num:='';
       while ((x_1 div y) >= 1) do
          begin
             num := IntToStr(x_1 mod y) + num;
             x_1 := x_1 div y;
          end;
       change_SS := intTostr(x_1)+num;
      end
   else change_SS := 'Только для целых чисел';
end;
{||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
{--------------------------------СИСТЕМЫ СЧИСЛЕНИЯ-----------------------------}
{||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}
//_______________________________________________________________Перевод в 01 СС
procedure TBase.SS_2Click(Sender: TObject);
begin
   Edit_base.Text := change_SS(StrTOFloat(Edit_base.Text), 2);
end;
//______________________________________________________________Перевод в 012 СС
procedure TBase.SS_3Click(Sender: TObject);
begin
    Edit_base.Text := change_SS(StrTOFloat(Edit_base.Text), 3);
end;
//_____________________________________________________________Перевод в 0123 СС
procedure TBase.SS_4Click(Sender: TObject);
begin
    Edit_base.Text := change_SS(StrTOFloat(Edit_base.Text), 4);
end;
//____________________________________________________________Перевод в 01234 СС
procedure TBase.SS_5Click(Sender: TObject);
begin
   Edit_base.Text := change_SS(StrTOFloat(Edit_base.Text), 5);
end;
//____________________________________________________________Перевод в 01245 СС
procedure TBase.SS_6Click(Sender: TObject);
begin
   Edit_base.Text := change_SS(StrTOFloat(Edit_base.Text), 6);
end;
//___________________________________________________________Перевод в 012456 СС
procedure TBase.SS_7Click(Sender: TObject);
begin
   Edit_base.Text := change_SS(StrTOFloat(Edit_base.Text), 7);
end;
//__________________________________________________________Перевод в 0124567 СС
procedure TBase.SS_8Click(Sender: TObject);
begin
   Edit_base.Text := change_SS(StrTOFloat(Edit_base.Text), 8);
end;
//_____________________________________________________________________Факториал
procedure TBase.but_facClick(Sender: TObject);
var A_int, fact: integer;
    i: integer;
begin
   A := StrToFloat(Edit_base.Text);
   A_int := trunc(A);
   if ((A  >= 0) and (A - A_int = 0)) then
      begin
         fact := 1;
         for i := 1 to A_int do
             fact := fact * i;
         Edit_base.Text := IntToStr(fact);
      end
   else
     begin
       Edit_base.Text := 'ERROR';
     end;
end;
//________________________________________________________________________Модуль
procedure TBase.but_modClick(Sender: TObject);
begin
   A := StrToFloat(Edit_base.Text);
   if A < 0 then
      Edit_base.Text := FloatToStr(abs(A))
   else
      Edit_base.Text := FloatToStr(A);
end;
//__________________________________________________________Произвольная степень
procedure TBase.but_powClick(Sender: TObject);
begin
    A := StrToFloat(Edit_base.Text);
    Edit_base.Text := 'Укажите степень';
    act := '^';
end;
//__________________________________________________________Натуральный логарифм
procedure TBase.but_lnClick(Sender: TObject);
begin
   A := StrToFloat(Edit_base.Text);
   Edit_base.Text := FloatToStr(ln(A));
end;
//___________________________________________________________Десятичный логарифм
procedure TBase.but_lgClick(Sender: TObject);
begin
   A := StrToFloat(Edit_base.Text);
   Edit_base.Text := FloatToStr(log10(A));
end;
//________________________________________________________________________Sin(x)
procedure TBase.but_sinClick(Sender: TObject);
begin
    A := StrToFloat(Edit_base.Text);
    Edit_base.Text := FloatToStr(sin(A));
end;
//________________________________________________________________________Cos(x)
procedure TBase.but_cosClick(Sender: TObject);
begin
    A := StrToFloat(Edit_base.Text);
    Edit_base.Text := FloatToStr(cos(A));
end;
//_________________________________________________________________________tg(x)
procedure TBase.but_tgClick(Sender: TObject);
begin
    A := StrToFloat(Edit_base.Text);
    Edit_base.Text := FloatToStr(tan(A));
end;
//________________________________________________________________________Ctg(x)
procedure TBase.but_ctgClick(Sender: TObject);
begin
    A := StrToFloat(Edit_base.Text);
    Edit_base.Text := FloatToStr(cot(A));
end;

{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
________________________________ДЕКОР___________________________________________

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}

//___________________________________________________________________КАЛЬКУЛЯТОР
procedure TBase.M_copyClick(Sender: TObject);
begin
  Edit_base.CopyToClipboard;
end;
procedure TBase.M_pasteClick(Sender: TObject);
begin
  Edit_base.PasteFromClipboard;
end;
//_________________________________________________________________РЕЖИМЫ_РАБОТЫ
procedure TBase.modeCalc(Sender: TObject);
var ViewBut: boolean;
begin
    if (((Sender as TMenuItem).Caption = 'Обычный') or
    ((Sender as TMenuItem).Caption = 'Базовый') or
    ((Sender as TMenuItem).Caption = 'Base')) then
       begin
            left_0 := 30;
            ViewBut := false;
            Base.Width := 300;
            Edit_base.Width := 245;
       end
    else
        begin
           left_0 := 240;
           ViewBut := true;
           Base.Width := 510;
           Edit_base.Width := 455;
        end;
    but_fac.Visible := ViewBut;
    but_pow.Visible := ViewBut;
    but_sin.Visible := ViewBut;
    but_cos.Visible := ViewBut;
    but_tg.Visible  := ViewBut;
    but_ctg.Visible := ViewBut;
    but_ln.Visible  := ViewBut;
    but_lg.Visible  := ViewBut;
    but_mod.Visible := ViewBut;
    SS_8.Visible    := ViewBut;
    SS_7.Visible    := ViewBut;
    SS_6.Visible    := ViewBut;
    SS_5.Visible    := ViewBut;
    SS_4.Visible    := ViewBut;
    SS_3.Visible    := ViewBut;
    SS_2.Visible    := ViewBut;
    but_sq.left     := left_0;
    but_C.left      := left_0;
    but_sqrt.left   := left_0;
    but_CE.left     := left_0;
    but_per.left    := left_0;

    but_7.left      := left_0 + 50;
    but_4.left      := left_0 + 50;
    but_1.left      := left_0 + 50;
    minus.left      := left_0 + 50;

    but_5.left      := left_0 + 100;
    but_2.left      := left_0 + 100;
    but_8.left      := left_0 + 100;
    but_0.left      := left_0 + 100;
    but_div.left    := left_0 + 100;

    but_9.left      := left_0 + 150;
    but_3.left      := left_0 + 150;
    but_6.left      := left_0 + 150;
    dot.left        := left_0 + 150;
    mult.left       := left_0 + 150;

    but_sub.left    := left_0 + 200;
    but_add.left    := left_0 + 200;
    but_eq.left     := left_0 + 200;
end;
procedure TBase.FormCreate(Sender: TObject);
begin
   modeCalc(M_base);
   viewCalc(M_rain);
end;
procedure TBase.FormPaint(Sender: TObject);
begin
 Edit_Base.SelStart := 5;
end;
//____________________________________________________________________________//
procedure TBase.viewCalc(Sender: TObject);
var ColorBut, ColorText: Tcolor;
    NameFont: string;
begin
    if M_standart.Checked = true then
       begin
         ColorText := clBlack;
         ColorBut := clDefault;
         ColorText := clDefault;
         Image1.Picture := nil;
         NameFont := 'Book Antiqua'
       end;
    if M_Cosmos.Checked = true then
       begin
         ColorText := clWhite;
         ColorBut := $00583827;
         Image1.Picture.LoadFromFile('cosmos.jpg');
         NameFont := 'MV Boli'
       end;
    if M_Rain.Checked = true then
       begin
         ColorText := $00F1ECE0;
         ColorBut := $00A9865F;
         Image1.Picture.LoadFromFile('rain.jpg');
         NameFont := 'Monotype Corsiva'
       end;
    if M_child.Checked = true then
       begin
         ColorText := clWhite;
         ColorBut := $001AA4F7;
         Image1.Picture.LoadFromFile('child.jpg');
         NameFont := 'Broadway'
       end;
    but_0.Color := ColorBut;
    but_1.Color := ColorBut;
    but_2.Color := ColorBut;
    but_3.Color := ColorBut;
    but_4.Color := ColorBut;
    but_5.Color := ColorBut;
    but_6.Color := ColorBut;
    but_7.Color := ColorBut;
    but_8.Color := ColorBut;
    but_9.Color := ColorBut;
    but_add.Color := ColorBut;
    but_C.Color := ColorBut;
    but_CE.Color := ColorBut;
    but_cos.Color := ColorBut;
    but_ctg.Color := ColorBut;
    but_div.Color := ColorBut;
    but_eq.Color := ColorBut;
    but_fac.Color := ColorBut;
    but_lg.Color := ColorBut;
    but_ln.Color := ColorBut;
    but_mod.Color := ColorBut;
    but_per.Color := ColorBut;
    but_pow.Color := ColorBut;
    but_sin.Color := ColorBut;
    but_sq.Color := ColorBut;
    but_sqrt.Color := ColorBut;
    but_sub.Color := ColorBut;
    but_tg.Color := ColorBut;
    dot.Color:= ColorBut;
    minus.Color := ColorBut;
    mult.Color := ColorBut;
    SS_2.Color := ColorBut;
    SS_3.Color := ColorBut;
    SS_4.Color := ColorBut;
    SS_5.Color := ColorBut;
    SS_6.Color := ColorBut;
    SS_7.Color := ColorBut;
    SS_8.Color := ColorBut;
    but_0.font.Color := ColorText;
    but_1.font.Color := ColorText;
    but_2.font.Color := ColorText;
    but_3.font.Color := ColorText;
    but_4.font.Color := ColorText;
    but_5.font.Color := ColorText;
    but_6.font.Color := ColorText;
    but_7.font.Color := ColorText;
    but_8.font.Color := ColorText;
    but_9.font.Color := ColorText;
    but_add.font.Color := ColorText;
    but_C.font.Color := ColorText;
    but_CE.font.Color := ColorText;
    but_cos.font.Color := ColorText;
    but_ctg.font.Color := ColorText;
    but_div.font.Color := ColorText;
    but_eq.font.Color := ColorText;
    but_fac.font.Color := ColorText;
    but_lg.font.Color := ColorText;
    but_ln.font.Color := ColorText;
    but_mod.font.Color := ColorText;
    but_per.font.Color := ColorText;
    but_pow.font.Color := ColorText;
    but_sin.font.Color := ColorText;
    but_sq.font.Color := ColorText;
    but_sqrt.font.Color := ColorText;
    but_sub.font.Color := ColorText;
    but_tg.font.Color := ColorText;
    dot.font.Color := ColorText;
    minus.font.Color := ColorText;
    mult.font.Color := ColorText;
    SS_2.font.Color := ColorText;
    SS_3.font.Color := ColorText;
    SS_4.font.Color := ColorText;
    SS_5.font.Color := ColorText;
    SS_6.font.Color := ColorText;
    SS_7.font.Color := ColorText;
    SS_8.font.Color := ColorText;
    but_0.Font.Name := NameFont;
    but_1.Font.Name := NameFont;
    but_2.Font.Name := NameFont;
    but_3.Font.Name := NameFont;
    but_4.Font.Name := NameFont;
    but_5.Font.Name := NameFont;
    but_6.Font.Name := NameFont;
    but_7.Font.Name := NameFont;
    but_8.Font.Name := NameFont;
    but_9.Font.Name := NameFont;
    but_add.Font.Name := NameFont;
    but_C.Font.Name := NameFont;
    but_CE.Font.Name := NameFont;
    but_cos.Font.Name := NameFont;
    but_ctg.Font.Name := NameFont;
    but_div.Font.Name := NameFont;
    but_eq.Font.Name := NameFont;
    but_fac.Font.Name := NameFont;
    but_lg.Font.Name := NameFont;
    but_ln.Font.Name := NameFont;
    but_mod.Font.Name := NameFont;
    but_per.Font.Name := NameFont;
    but_pow.Font.Name := NameFont;
    but_sin.Font.Name := NameFont;
    but_sq.Font.Name := NameFont;
    but_sqrt.Font.Name := NameFont;
    but_sub.Font.Name := NameFont;
    but_tg.Font.Name := NameFont;
    dot.Font.Name := NameFont;
    minus.Font.Name := NameFont;
    mult.Font.Name := NameFont;
    SS_2.Font.Name := NameFont;
    SS_3.Font.Name := NameFont;
    SS_4.Font.Name := NameFont;
    SS_5.Font.Name := NameFont;
    SS_6.Font.Name := NameFont;
    SS_7.Font.Name := NameFont;
    SS_8.Font.Name := NameFont;
end;

//_______________________________________________________________ТЕМЫ ОФОРМЛЕНИЯ
//_______________________________________________________________ЯЗЫК ИНТЕРФЕЙСА
//____________________________________________________________________Английский
procedure TBase.M_ENClick(Sender: TObject);
begin
    M_lang.Caption := 'EN/RU';
    M_child.Caption := 'Сhildren`s';
    M_mode.Caption := 'Mode';
    M_calc.Caption := 'Calculator';
    M_theme.Caption := 'Theme';
    M_Cosmos.Caption := 'Cosmos';
    M_Rain.Caption := 'Rain';
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
    M_lang.Caption := 'EN/RU';
    M_child.Caption := 'Детская';
    M_mode.Caption := 'Режим';
    M_calc.Caption := 'Калькулятор';
    M_theme.Caption := 'Тема';
    M_Cosmos.Caption := 'Космос';
    M_Rain.Caption := 'Дождь';
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
end.

