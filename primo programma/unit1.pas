unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var giorno, euro, totale: integer;
begin
  Randomize;
  Memo1.Clear;
  totale := 0;

  // Ciclo FOR: esegue esattamente 7 iterazioni
  for giorno := 1 to 7 do
  begin
    euro := Random(5) + 1; // Numero casuale tra 1 e 5
    totale := totale + euro;
    Memo1.Lines.Add('Giorno ' + IntToStr(giorno) + ': +' + IntToStr(euro) + ' euro');
  end;

  Memo1.Lines.Add('In una settimana: ' + IntToStr(totale) + ' euro');
end;

procedure TForm1.Button2Click(Sender: TObject);
var giorni, euro, totale, prezzo: integer;
begin
  Randomize;
    prezzo := StrToInt(Edit2.Text);
    Memo1.Clear;
    totale := 0;
    giorni := 0;

    // Ciclo WHILE: continua finché il totale accumulato non raggiunge il prezzo
    while totale < prezzo do
    begin
      euro := Random(5) + 1;
      totale := totale + euro;
      giorni := giorni + 1; // Incrementa il contatore dei giorni
      Memo1.Lines.Add('Giorno ' + IntToStr(giorni) + ': ho ' + IntToStr(totale) + ' euro');
    end;

    // Stampa dei risultati finali
    Memo1.Lines.Add('Per ' + Edit1.Text + ' ti servono ' + IntToStr(giorni) + ' giorni');
    Memo1.Lines.Add('Cioè ' + IntToStr(giorni div 7) + ' settimane e ' + IntToStr(giorni mod 7) + ' giorni');
end;

procedure TForm1.Button3Click(Sender: TObject);
var giorni, euro, totale, prezzo: integer;
begin
  Randomize;
    prezzo := StrToInt(Edit2.Text);
    Memo1.Clear;
    totale := 0;
    giorni := 0;

    while totale < prezzo do
    begin
      euro := Random(5) + 1;
      totale := totale + euro;
      giorni := giorni + 1;

      // Controllo del Sabato: ogni 7 giorni aggiunge 10 euro
      if giorni mod 7 = 0 then
      begin
        totale := totale + 10;
        Memo1.Lines.Add('Sabato: paghetta +10 euro!');
      end;
    end;

    Memo1.Lines.Add('Con la paghetta per ' + Edit1.Text + ' ti servono ' + IntToStr(giorni) + ' giorni');
    Memo1.Lines.Add('Cioè ' + IntToStr(giorni div 7) + ' settimane e ' + IntToStr(giorni mod 7) + ' giorni');
end;

end.

