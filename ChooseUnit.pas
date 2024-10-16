unit ChooseUnit;
{uvodni unita pro vyber delky poli hlavni unity NoSVALunit}
interface
uses
  LCLIntf, LCLType, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus, Buttons, FileUtil;
type
  { TForm2 }
  TForm2 = class(TForm)
  Button1: TButton;
  Button2: TButton;
  CheckBox3: TCheckBox;
  CheckBox4: TCheckBox;
  Edit1: TEdit;
  Label13: TLabel;
  Label14: TLabel;
  Label24: TLabel;
  RadioButton1: TRadioButton;
  RadioButton2: TRadioButton;
  RadioButton3: TRadioButton;
  RadioButton4: TRadioButton;
  RadioButton5: TRadioButton;
  RadioButton6: TRadioButton;
  RadioButton7: TRadioButton;
  RadioButton8: TRadioButton;
  RadioButton9: TRadioButton;
  RadioButton10: TRadioButton;
  RadioButton11: TRadioButton;
  RadioButton12: TRadioButton;
  RadioButton13: TRadioButton;
  RadioButton14: TRadioButton;
  Label1: TLabel;
  Label2: TLabel;
  Label3: TLabel;
  Label4: TLabel;
  Label5: TLabel;
  Label6: TLabel;
  Label7: TLabel;
  Label8: TLabel;
  Label9: TLabel;
  Label10: TLabel;
  Label11: TLabel;
  Label12: TLabel;
  Label15: TLabel;
  Label16: TLabel;
  Label17: TLabel;
  Label18: TLabel;
  Label19: TLabel;
  Label20: TLabel;
  Image1: TImage;
  Label21: TLabel;
  Label22: TLabel;
  Label23: TLabel;
  ProgressBar1: TProgressBar;
  RadioGroup1: TRadioGroup;
  RadioGroup2: TRadioGroup;
  RadioGroup3: TRadioGroup;
  CheckBox1: TCheckBox;
  CheckBox2: TCheckBox;
  procedure CheckBox3Change(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure Button1Click(Sender: TObject);
  procedure Button2Click(Sender: TObject);
  procedure RadioButton1Click(Sender: TObject);
  procedure RadioButton2Click(Sender: TObject);
  procedure RadioButton3Click(Sender: TObject);
  procedure RadioButton4Click(Sender: TObject);
  procedure RadioButton5Click(Sender: TObject);
  procedure RadioButton6Click(Sender: TObject);
  procedure RadioButton7Click(Sender: TObject);
  procedure RadioButton8Click(Sender: TObject);
  procedure RadioButton9Click(Sender: TObject);
  procedure RadioButton10Click(Sender: TObject);
  procedure RadioButton11Click(Sender: TObject);
  procedure RadioButton12Click(Sender: TObject);
  procedure RadioButton13Click(Sender: TObject);
  procedure RadioButton14Click(Sender: TObject);
  procedure RadioGroup1Click(Sender: TObject);
  procedure RadioGroup2Click(Sender: TObject);
  procedure RadioGroup3Click(Sender: TObject);
  procedure CheckBox1Click(Sender: TObject);
  procedure CheckBox2Click(Sender: TObject);
  procedure Runsval(Sender: TObject);

private { Private declarations }
public  { Public declarations }
end;

const
  nejmoc  =  22;               {nejvetsi mocnina dvou, musi odpovidat nejvyssimu moznemu supermaxsamples 2^22 = 4194304}

var {promenne s sirsi platnosti}
  Form2           : TForm2;
  maxsamples      : integer;
  supermaxsamples : integer;
  sloupec         : integer;   {timhle urcuju, jestli jsem zvolil one column file nabo Kukovsky file}
  compon          : integer;   {tohle urcuje, jakou komponentu chci zpracovavat, pokud jsem zvolil Kukovsky file, jinak je to nula}
  norec           : integer;   {tim ohodnocuju, jestli zpracovavam zaznam, nebo jenom chci naloadovat krivku}
  sloupcovy       : boolean;
  hydro           : boolean;
  inverindexf     : integer;
  inverindexl     : integer;
  panely          : boolean;
  maxnflt         : integer;
  maxnfltstrg     : string;
  compbox         : Tstrings;

implementation

uses SvalUnit;
{$R *.lfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  filename  : string;
  daticko   : string;
begin
  filename      := '*.exe';               {uzije to jmeno jakehokoli exe souboru v danem adresari}
  DateTimeToString(daticko , 'dd/mm/yy  hh:nn' , FileDateToDateTime(FileAge(filename))); {hodi to cas posledni zmeny tohoto exe souboru}
  Form2.Caption := 'SVAL version:  2023 October 25    ' + daticko;
  sloupec       := 1;                     {defaultni nastaveni}
  norec         := 2;                     {defaultni nastaveni}
  sloupcovy     := false;
  hydro         := false;                 {prepinac, jestli chci delat ukladani ve formatu casu pro vody}
  compbox := TstringList.Create;          {nastavime policka pro vyber pristroje}
  compbox.Add('Z');
  compbox.Add('R');
  compbox.Add('T');
end;

procedure TForm2.CheckBox3Change(Sender: TObject); {kdyz je zaskrtnuto, ze chci delat Bessela}
begin
  if CheckBox3.Checked = true then begin
    Edit1.Enabled:= true;
    NoSVALform.Button54.Enabled := true;
    besseltrue := true;
  end;
  if CheckBox3.Checked = false then begin
    Edit1.Enabled:= false;
    NoSVALform.Button54.Enabled := false;
    besseltrue := false;
  end;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = true then begin        {defaultne je to pro seismiku, ale muzu zvolit :hydro version:}
    hydro                             := true;
    besseltrue                        := false;
    CheckBox2.Checked                 := true;  {vypnu PlotPanel 2}
    NoSVALform.Edit10.Text            := '0.0'; {slope of alpha coefficient - bude nulovy}
    NoSVALform.Edit10.Enabled         := false; {slope of alpha coefficient - nelze ho menit}
    NoSVALform.Edit1.Text             := 'N/A'; {epicentralni vzdalenost - nepotrebuju}
    NoSVALform.Edit1.Enabled          := false; {nelze ji menit}
    RadioGroup1.ItemIndex             := 0;     {smi to byt je jeden sloupec}
    RadioGroup1.Enabled               := false; {nelze to prepnout na 3 sloupce}
    RadioButton8.Checked              := false; {vypnut rezim "no record"}
    RadioButton8.Enabled              := false; {nelze zapnout rezim "no record"}
    NoSVALform.RadioGroup8.Items.Delete(0);     {smazu polozku pro zadavani rychlosti}
    NoSVALform.RadioGroup8.Items.Add('date');   {pridam polozku pro zadavani datumu}
    NoSVALform.RadioGroup8.Items.Exchange(1,0); {prohodim je, takze misto rychlosti ted zadavam datum}
    NoSVALform.Label1.caption := 'EndDt';
    NoSVALform.Label2.caption := 'StrDt';
    NoSVALform.Label1.Left := 61;
    NoSVALform.Label2.Left := 61;
    NoSVALform.Label4.Caption         := '     Date';
    NoSVALform.Edit2.Visible          := false; {neni videt zadavani time intervalu}
    NoSVALform.Edit5.Visible          := false; {neni videt zadavani casu/rychlosti}
    NoSVALform.Edit4.Visible          := false; {neni videt zadavani casu/rychlosti}
    NoSVALform.MaskEdit1.Visible      := true;  {je videt zadavani datumu pro zacatek souboru}
    NoSVALform.MaskEdit2.Visible      := true;  {je videt zadavani datumu pro rozmezi - zacatek}
    NoSVALform.MaskEdit3.Visible      := true;  {je videt zadavani datumu pro rozmeni - konec}
    NoSVALform.Label7.Caption         := 'Smpl int (min)';
    NoSVALform.RadioGroup7.Enabled    := false; {znemozneno N / X}
    NoSVALform.Edit19.Text            := '43000';
    NoSVALform.Edit20.Text            := '43500';
    rozmezivel                        := false;
    hydrovel                          := true;
  end;
  if CheckBox1.Checked = false then begin
    hydro := false;
    CheckBox2.Checked                 := false;     {vypnu PlotPanel 2}
    NoSVALform.Edit10.Text            := '-0.7';
    NoSVALform.Edit10.Enabled         := true;
    NoSVALform.Edit1.Text             := '00.000';  {epicentralni vzdalenost}
    NoSVALform.Edit1.Enabled          := true;      {nelze ji menit}
    RadioGroup1.Enabled               := true;      {lze to prepnout na 3 sloupce}
    RadioButton8.Enabled              := true;      {lze zapnout rezim "no record"}
    NoSVALform.RadioGroup8.Items.Delete(0);         {smazu polozku zadavani datumu}
    NoSVALform.RadioGroup8.Items.Add('vel');        {pridam polozku zadavani rychlosti}
    NoSVALform.RadioGroup8.Items.Exchange(0,1);     {prohodim je, takze misto zadavani datumu muzu zadavat rychlost}
    NoSVALform.Label1.caption := 'Max gr vel';
    NoSVALform.Label2.caption := 'Min gr vel';
    NoSVALform.Label1.Left := 61;
    NoSVALform.Label2.Left := 64;
    NoSVALform.Label4.Caption         := 'Time int (s)';
    NoSVALform.Edit2.Visible          := true;      {je videt zadavani time intervalu}
    NoSVALform.Edit5.Visible          := true;      {je videt zadavani casu/rychlosti}
    NoSVALform.Edit4.Visible          := true;      {je videt zadavani casu/rychlosti}
    NoSVALform.MaskEdit1.Visible      := false;     {neni videt zadavani datumu pro zacatek souboru}
    NoSVALform.MaskEdit2.Visible      := false;     {neni videt zadavani datumu pro zacatek rozmezi}
    NoSVALform.MaskEdit3.Visible      := false;     {neni videt zadavani datumu pro konec rozmezi}
    NoSVALform.Label7.Caption         := 'Smpl frq (Hz)';
    NoSVALform.RadioGroup7.Enabled    := true;      {umozneno N / X}
    NoSVALform.Edit19.Text := '3';
    NoSVALform.Edit20.Text := '50';
    rozmezivel := true;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin               {Run SVAL}
  Runsval(Sender);
end;

procedure TForm2.Runsval(Sender: TObject);
begin               {nastavuju parametry v hlavnim okne podle toho, co jsem vybral v prvnim malem okenku}
  if (sloupec = 3) and (RadioGroup2.ItemIndex = -1) then begin
    showmessage('Please select the component!');
    exit;
  end;
  if (sloupec = 5) and (RadioGroup2.ItemIndex = -1) then begin
    showmessage('Please select the component!');
    exit;
  end;
  NoSVALform.Delky; {zavola proceduru, kde se alokuji delky poli}
  NoSVALform.Show;  {ukaze hlavni okno SVALu}
  ProgressBar1.Position := 0;
  if (sloupec = 3) or (sloupec = 5) then  begin   {pro KUK file}
    NoSVALform.Button7.Enabled := true;           {batch processing funguje jen pro 3 sloupce}
    NoSVALform.Label4.Caption         := 'Time int (s)';
    NoSVALform.Edit2.Visible          := true;    {je videt zadavani time intervalu}
    NoSVALform.MaskEdit1.Visible      := false;   {neni videt zadavani datumu}
    NoSVALform.MaskEdit2.Visible      := false;   {neni videt zadavani datumu}
    NoSVALform.MaskEdit3.Visible      := false;   {neni videt zadavani datumu}
  end;
  if batchproces = false then begin               {predelavam to jen, pokud nejsem v batchprocesingu, abych, pokud v nem jsem, jsem to zachoval i po prepnuti komponenty}
    if maxnflt = 160 then NoSVALform.Edit8.text := '160';
    if maxnflt = 120 then NoSVALform.Edit8.text := '120';
  end;
  if sloupec = 1 then  begin                      {pro jednosloupcovy vstup rozlisim, jestli mam nebo nemam HYDRO version}
    if hydro then begin
      NoSVALform.Edit10.Text            := '0.0'; {slope of alpha coefficient - bude nulovy}
      NoSVALform.Edit10.Enabled         := false; {slope of alpha coefficient - nelze ho menit}
      NoSVALform.Edit1.Text             := 'N/A'; {epicentralni vzdalenost - nepotrebuju}
      NoSVALform.Edit1.Enabled          := false; {nelze ji menit}
      NoSVALform.RadioGroup8.ItemIndex  := 0;     {zadavam defaultne datumove rozmezi}
      NoSVALform.Label4.Caption         := '     Date';
      NoSVALform.Edit2.Visible          := false; {neni videt zadavani time intervalu}
      NoSVALform.MaskEdit1.Visible      := true;  {je videt zadavani datumu}
      if NoSVALform.RadioGroup8.ItemIndex = 0 then begin
        NoSVALform.MaskEdit2.Visible    := true;  {je videt zadavani datumu}
        NoSVALform.MaskEdit3.Visible    := true;  {je videt zadavani datumu}
      end;
      NoSVALform.Label7.Caption         := 'Smpl int (min)';
      NoSVALform.RadioGroup7.Enabled    := false; {znemozneno N / X}
      NoSVALform.Edit19.Text            := '43000';
      NoSVALform.Edit20.Text            := '43500';
    end;
    if hydro = false then begin
      NoSVALform.Edit10.Text            := '-0.7';
      NoSVALform.Edit10.Enabled         := true;
      NoSVALform.Edit1.Text             := '00.000';  {epicentralni vzdalenost}
      NoSVALform.Edit1.Enabled          := true;      {nelze ji menit}
      NoSVALform.RadioGroup8.ItemIndex  := 0;         {zadavam defaultne rychlostni rozmezi}
      NoSVALform.Label4.Caption         := 'Time int (s)';
      NoSVALform.Edit2.Visible          := true;      {je videt zadavani time intervalu}
      NoSVALform.MaskEdit1.Visible      := false;     {neni videt zadavani datumu}
      NoSVALform.MaskEdit2.Visible      := false;     {neni videt zadavani datumu}
      NoSVALform.MaskEdit3.Visible      := false;     {neni videt zadavani datumu}
      NoSVALform.Label7.Caption         := 'Smpl frq (Hz)';
      NoSVALform.RadioGroup7.Enabled    := true;
      NoSVALform.Edit19.Text            := '3';
      NoSVALform.Edit20.Text            := '50';
    end;
    NoSVALform.Button7.Enabled := false;              {batch processing}
    NoSVALform.Edit2.Enabled := true;                 {time interval}
    NoSVALform.Edit3.Enabled := true;                 {sampling frequency}
    NoSVALform.Edit2.Text := '-1.000';
    NoSVALform.Edit3.Text := '0.0';
  end; {if sloupec = 1}
  sloupcovy := true;   {ze jsem to zmacknul, to Run, a to pouziju pro vypis componenty do hlavicky hlavniho SVALoveho okna}
end; {Runsval}

procedure TForm2.RadioButton1Click(Sender: TObject);
begin
  maxsamples      := 1024;
  supermaxsamples := 1024;
  Button1.Enabled := True;             {Analysis}
  NoSVALform.Button13.Enabled := True; {Open data file ...}
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 160;                      {maximal number of filters}
  NoSVALform.Edit8.text := '160';
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
  maxsamples      := 2048;
  supermaxsamples := 2048;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 160;                      {maximal number of filters}
  NoSVALform.Edit8.text := '160';
end;

procedure TForm2.RadioButton3Click(Sender: TObject);
begin
  maxsamples      := 4096;
  supermaxsamples := 4096;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 160;                      {maximal number of filters}
  NoSVALform.Edit8.text := '160';
end;

procedure TForm2.RadioButton4Click(Sender: TObject);
begin
  maxsamples      := 8192;
  supermaxsamples := 8192;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 160;                      {maximal number of filters}
  NoSVALform.Edit8.text := '160';
end;

procedure TForm2.RadioButton5Click(Sender: TObject);
begin
  maxsamples      := 16384;
  supermaxsamples := 16384;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 150;                      {maximal number of filters}
  NoSVALform.Edit8.text := '150';
end;

procedure TForm2.RadioButton6Click(Sender: TObject);
begin
  maxsamples      := 32768;
  supermaxsamples := 32768;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 150;                      {maximal number of filters}
  NoSVALform.Edit8.text := '150';
end;

procedure TForm2.RadioButton7Click(Sender: TObject);
begin
  maxsamples      := 65536;
  supermaxsamples := 65536;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 150;                      {maximal number of filters}
  NoSVALform.Edit8.text := '150';
end;

procedure TForm2.RadioButton9Click(Sender: TObject);
begin
  maxsamples      := 131072;
  supermaxsamples := 131072;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 140;                      {maximal number of filters}
  NoSVALform.Edit8.text := '140';
end;

procedure TForm2.RadioButton10Click(Sender: TObject);
begin
  maxsamples      := 262144;
  supermaxsamples := 262144;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 140;                      {maximal number of filters}
  NoSVALform.Edit8.text := '140';
end;

procedure TForm2.RadioButton11Click(Sender: TObject);
begin
  maxsamples      := 524288;           {posem jsou obe hodnoty stejne a lze je pouzit jak pro Analysis, tak pro FFT}
  supermaxsamples := 524288;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec   := 1;
  maxnflt := 120;                      {maximal number of filters}
  NoSVALform.Edit8.text := '120';
end;

procedure TForm2.RadioButton12Click(Sender: TObject);
begin                                  {jen pro FFT}
  maxsamples      := 1024;             {odsud uz zvysuju jenom hodnotu supermaxsamples, ale maxsamples nechavam malou}
  supermaxsamples := 1048576;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec := 1;
end;

procedure TForm2.RadioButton13Click(Sender: TObject);
begin                                  {jen pro FFT}
  maxsamples      := 1024;
  supermaxsamples := 2097152;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec := 1;
end;

procedure TForm2.RadioButton14Click(Sender: TObject);
begin                                  {jen pro FFT}
  maxsamples      := 1024;
  supermaxsamples := 4194304;
  Button1.Enabled := True;
  NoSVALform.Button13.Enabled := True;
  NoSVALform.Button11.Caption := 'Group';
  norec := 1;
end;

procedure TForm2.RadioButton8Click(Sender: TObject);   {no record}
begin
  maxnflt    := 300;                    {maximal number of filters}
  maxsamples := maxnflt;                {kdyz jakoze nechci zpracovavat zadny zaznam, tak ale presto do tech poli neco dam}
  Button1.Enabled := True;              {protoze nektera pouzivam i pri pocitani z naloadovane disperze, ktera ale nema nikdy vic bodu, nez je maxnflt, protoze vic jich ani nenacitam}
  NoSVALform.Button13.Enabled := False; {Open data file ...}
  NoSVALform.Button22.Enabled := False; {Layers}
  NoSVALform.Button11.Caption := 'Disp';
  norec := 0;
end;

procedure TForm2.Button2Click(Sender: TObject); {button Exit SVAL}
begin                                           {znici to vsechno a zastavi beh programu}
  Application.Terminate;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then begin {tedy je zaskrtnuto "one column file"}
    sloupec := 1;
    compbox.Clear;
    RadioGroup2.Items := compbox;
    Label12.Enabled := False;
    RadioGroup2.Enabled := False;
    compon := 0;     {zakladni nastaveni je, ze je to nula, coz znamena pro 1 column file neznama componenta - pro vice komponent se promenna compon nastavuje pozdeji, az kliknu na danou komponentu}
  end;
  if RadioGroup1.ItemIndex = 1 then begin {tedy je zaskrtnuto "Kuk file"}
    sloupec := 3;
    compbox.Clear;
    compbox.Add('Z');
    compbox.Add('R');
    compbox.Add('T');
    RadioGroup2.Items := compbox;
    Label12.Enabled := True;
    RadioGroup2.Enabled := True;
  end;
  if RadioGroup1.ItemIndex = 2 then begin {tedy je zaskrtnuto "5-component CC file"}
    sloupec := 5;
    compbox.Clear;
    compbox.Add('ZZ');
    compbox.Add('RR');
    compbox.Add('TT');
    compbox.Add('RZ');
    compbox.Add('ZR');
    RadioGroup2.Items := compbox;
    Label12.Enabled := True;
    RadioGroup2.Enabled := True;
  end;
end;

procedure TForm2.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 0 then begin {tedy je zaskrtnuto "Z"}
    compon := 1;
    if batchproces then begin
      NoSVALform.memo1.Clear;
      NoSVALform.PlotPanel1.ClearData;
      NoSVALform.PlotPanel2.ClearData;
      NoSVALform.PlotPanel3.ClearData;
    end;
  end;
  if RadioGroup2.ItemIndex = 1 then begin {tedy je zaskrtnuto "R"}
    compon := 2;
    if batchproces then begin
      NoSVALform.memo1.Clear;
      NoSVALform.PlotPanel1.ClearData;
      NoSVALform.PlotPanel2.ClearData;
      NoSVALform.PlotPanel3.ClearData;
    end;
  end;
  if RadioGroup2.ItemIndex = 2 then begin {tedy je zaskrtnuto "T"}
    compon := 3;
    if batchproces then begin
      NoSVALform.memo1.Clear;
      NoSVALform.PlotPanel1.ClearData;
      NoSVALform.PlotPanel2.ClearData;
      NoSVALform.PlotPanel3.ClearData;
    end;
  end;
  if RadioGroup2.ItemIndex = 3 then begin {tedy je zaskrtnuto "RZ"}
    compon := 4;
    if batchproces then begin
      NoSVALform.memo1.Clear;
      NoSVALform.PlotPanel1.ClearData;
      NoSVALform.PlotPanel2.ClearData;
      NoSVALform.PlotPanel3.ClearData;
    end;
  end;
  if RadioGroup2.ItemIndex = 4 then begin {tedy je zaskrtnuto "ZR"}
    compon := 5;
    if batchproces then begin
      NoSVALform.memo1.Clear;
      NoSVALform.PlotPanel1.ClearData;
      NoSVALform.PlotPanel2.ClearData;
      NoSVALform.PlotPanel3.ClearData;
    end;
  end;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin {zapinani / vypinani nastavovani PlotPanelu - to je tu proto, ze PlotPanel je dost pomala komponenta, takze vypnutim muzu urychlit beh programu pro delsi casove rady}
  if CheckBox2.Checked = true then begin
    panely := false;
  end;
  if CheckBox2.Checked = false then begin
    panely := true;
  end;
end;

procedure TForm2.RadioGroup3Click(Sender: TObject);
begin                                     {vybiram, jestli chci analyzu, nebo jenom FFT}
  if RadioGroup3.ItemIndex = 0 then begin {vybrano "multi" = budu delat kompletni analyzu}
    FFT := false;                         {vypnu moznost nastavit vyssi pocet vzorku}
    RadioButton12.Enabled := false;
    RadioButton13.Enabled := false;
    RadioButton14.Enabled := false;
    Label21.Enabled := false;
    Label22.Enabled := false;
    Label23.Enabled := false;
    NoSVALform.Button6.Enabled := false;
    NoSVALform.Button21.Enabled := false;
    NoSVALform.Button46.Enabled := true;
    NoSVALform.Button47.Enabled := false;
    NoSVALform.Button2.Enabled := false;
    NoSVALform.Edit6.Enabled := true;
    NoSVALform.Edit7.Enabled := true;
    NoSVALform.Edit8.Enabled := true;
    NoSVALform.RadioGroup2.Enabled := true;
    NoSVALform.RadioGroup4.Enabled := true;
    NoSVALform.RadioGroup5.Enabled := false;
    NoSVALform.PlotPanel1.XMarks := false;
    NoSVALform.PlotPanel2.XMarks := false;
    NoSVALform.PlotPanel1.GridColor := ClBlack;
    NoSVALform.PlotPanel1.Enabled := false;
    NoSVALform.PlotPanel2.Enabled := false;
    NoSVALform.PlotPanel3.Enabled := false;
  end; {if RadioGroup3.ItemIndex = 0 - konec pro kompletni analyzu}
  if RadioGroup3.ItemIndex = 1 then begin {vybrano "1 chan" = budu delat jenom FFT}
    FFT := true;                          {umoznim zvolit vyssi pocet vzorku}
    RadioButton12.Enabled := true;
    RadioButton13.Enabled := true;
    RadioButton14.Enabled := true;
    Label21.Enabled := true;
    Label22.Enabled := true;
    Label23.Enabled := true;
    NoSVALform.Edit6.Enabled := false;
    NoSVALform.Edit7.Enabled := false;
    NoSVALform.Edit8.Enabled := false;
    NoSVALform.Edit12.Enabled := false;
    NoSVALform.Edit13.Enabled := false;
    NoSVALform.Edit14.Enabled := false;
    NoSVALform.CheckBox2.Enabled := false; {prepinac konstantni hustoty}
    NoSVALform.Edit15.Enabled := false;
    NoSVALform.CheckBox4.Enabled := false; {prepinac low velocity zone}
    NoSVALform.Edit16.Enabled := false;
    NoSVALform.Edit17.Enabled := false;
    NoSVALform.Edit18.Enabled := false;
    NoSVALform.Button3.Enabled := false;
    NoSVALform.Button5.Enabled := false;
    NoSVALform.Button6.Enabled := false;
    NoSVALform.Button10.Enabled := false;
    NoSVALform.Button11.Enabled := false;
    NoSVALform.Button14.Enabled := false;
    NoSVALform.Button15.Enabled := false;
    NoSVALform.Button16.Enabled := false;
    NoSVALform.Button17.Enabled := false;
    NoSVALform.Button18.Enabled := false;
    NoSVALform.Button19.Enabled := false;
    NoSVALform.Button20.Enabled := false;
    NoSVALform.Button21.Enabled := false;
    NoSVALform.Button23.Enabled := false;
    NoSVALform.Button25.Enabled := false;
    NoSVALform.Button26.Enabled := false;
    NoSVALform.Button27.Enabled := false;
    NoSVALform.Button28.Enabled := false;
    NoSVALform.Button29.Enabled := false;
    NoSVALform.Button32.Enabled := false;
    NoSVALform.Button33.Enabled := false;
    NoSVALform.Button34.Enabled := false;
    NoSVALform.Button36.Enabled := false;
    NoSVALform.Button37.Enabled := false;
    NoSVALform.Button38.Enabled := false;
    NoSVALform.Button39.Enabled := false;
    NoSVALform.Button40.Enabled := false;
    NoSVALform.Button41.Enabled := false;
    NoSVALform.Button46.Enabled := false;
    NoSVALform.Button47.Enabled := false;
    NoSVALform.Button2.Enabled := false;
    NoSVALform.RadioGroup1.Enabled := false;
    NoSVALform.RadioButton1.Enabled := false;
    NoSVALform.RadioButton2.Enabled := false;
    NoSVALform.RadioButton3.Enabled := false;
    NoSVALform.RadioGroup2.Enabled := false;
    NoSVALform.RadioGroup4.Enabled := false;
    NoSVALform.RadioGroup5.Enabled := false;
    NoSVALform.RadioGroup6.Enabled := false;
    NoSVALform.PlotPanel1.XMarks := false;
    NoSVALform.PlotPanel1.GridColor := ClBlack;
    NoSVALform.PlotPanel1.Enabled := false;
    NoSVALform.PlotPanel2.Enabled := false;
    NoSVALform.PlotPanel3.Enabled := false;
    NoSVALform.SpinEdit1.Enabled := false;
    NoSVALform.ComboBox1.Enabled := false;
    NoSVALform.ComboBox2.Enabled := false;
    NoSVALform.ComboBox3.Enabled := false;
    inverindexf := 0;
    inverindexl := 0;
  end; {if RadioGroup3.ItemIndex = 1 - konec pro FFT}
end; {vybrano, zda pobezi analyza nebo jen FFT}

end.
