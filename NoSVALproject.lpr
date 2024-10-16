program NoSVALproject;

  {autor: Petr Kolinsky, KG MFF UK a USMH AV CR a UniWien
   pouziva programy, unity, procedury a subroutiny, ktere vymysleli a napsali Jirka Malek, USMH AV CR a Oldrich Novotny, KG MFF UK
   v roce 2017 byl cely program preveden do prostredi Lazarus}

uses
  Forms, plot, Interfaces,
  ChooseUnit   in 'ChooseUnit.pas'   {Form2},
  SvalUnit     in 'SvalUnit.pas'     {NoSVALform},
  SpectrumUnit in 'SpectrumUnit.pas' {SpectrumForm},
  InverUnit    in 'InverUnit.pas'    {Form1},
  PrumetUnit   in 'PrumetUnit.pas'   {nema zadny formular},
  BatchUnit    in 'BatchUnit.pas';   {BatchForm}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TNoSVALform, NoSVALform);
  Application.CreateForm(TSpectrumform, Spectrumform);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TBatchform, Batchform);
  Application.Run;
end.
