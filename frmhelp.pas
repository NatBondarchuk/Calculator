unit frmHelp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls;

type

  { THelp }

  THelp = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Help: THelp;

implementation

{$R *.lfm}

{ THelp }

procedure THelp.FormCreate(Sender: TObject);
begin
  Memo1.Caption := #13'Реализованы следующие требования к программному продукту:'#13
+ '   ¤ Интерфейс приложения на 2-х языках (русский и английский).'#13
+ '   ¤ Режимы работы:'#13
+ '     ° Простой (базовые арифметические операции, смена знака, проценты, '#13
+ '        возведение в квадрат, квадратный корень),'#13
+ '     ° Расширенный (функции простого калькулятора, тригонометрические'#13
+ '        функции, возведение в произвольную степень, логарифмы '#13
+ '        (натуральный и десятичный), модуль числа, факториал '#13
+ '        числа, переводв системы счисления (2, 3, 4, 5, 6, 7, 8)).'#13
+ '   ¤ Темы оформления (с использованием фонового изображения основного '#13
+ '        окна и изображений для кнопок). Одна из 3-х тем оформления'#13
+ '        является "Детской".'#13
+ '   ¤ Действующие пункты меню:'#13
+ '       ° Калькулятор: Копировать, Вставить.'#13
+ '       ° Режим: Базовый, расширенный'#13
+ '   ¤ Справка: Справка, О программе'#13

end;

procedure THelp.BitBtn1Click(Sender: TObject);
begin
  Help.Close;
end;

end.

