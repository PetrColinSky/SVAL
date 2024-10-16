unit SpectrumUnit;
{moje unita na prohlizeni spektralni oblasti}
interface
uses
  LCLIntf, LCLType, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, PlotPanel, StdCtrls, Math, ChooseUnit, SvalUnit, Ucomplex;
type

  { TSpectrumform }

  TSpectrumform = class(TForm)
  Button1: TButton;
  Button2: TButton;
  Button3: TButton;
  Button31: TButton;
  Button32: TButton;
  Button33: TButton;
  Button34: TButton;
  Button4: TButton;
  Button5: TButton;
  Button6: TButton;
  Button7: TButton;
  Button8: TButton;
  Button9: TButton;
  Button10: TButton;
  Button11: TButton;
  Button12: TButton;
  Button13: TButton;
  Button14: TButton;
  Button15: TButton;
  Button16: TButton;
  Button17: TButton;
  Button18: TButton;      
  Button19: TButton;
  Button20: TButton;
  Button21: TButton;
  Button22: TButton;
  Button23: TButton;
  Button24: TButton;
  Button25: TButton;
  Button26: TButton;
  Button27: TButton;
  Button28: TButton;
  Button29: TButton;
  Button30: TButton;
  Edit1: TEdit;
  Edit2: TEdit;
  Label1: TLabel;
  Label2: TLabel;
  Label3: TLabel;
  Label4: TLabel;
  Label5: TLabel;
  Label6: TLabel;
  PlotPanel1: TPlotPanel;
  PlotPanel2: TPlotPanel;
  Memo1: TMemo;
  ComboBox1: TComboBox;
  ComboBox2: TComboBox;
  SaveDialog1: TSaveDialog;
  SaveDialog2: TSaveDialog;
  SaveDialog3: TSaveDialog;
  Image1: TImage;
  procedure Button30Click(Sender: TObject);
  procedure Button31Click(Sender: TObject);
  procedure Button32Click(Sender: TObject);
  procedure Button33Click(Sender: TObject);
  procedure Button34Click(Sender: TObject);
  procedure PredShow;
  procedure Button1Click(Sender: TObject);
  procedure Button2Click(Sender: TObject);
  procedure Button3Click(Sender: TObject);
  procedure Button4Click(Sender: TObject);
  procedure Button5Click(Sender: TObject);
  procedure Button6Click(Sender: TObject);
  procedure Button7Click(Sender: TObject);
  procedure Button8Click(Sender: TObject);
  procedure Button9Click(Sender: TObject);
  procedure Button10Click(Sender: TObject);
  procedure Button11Click(Sender: TObject);
  procedure Button12Click(Sender: TObject);
  procedure Button13Click(Sender: TObject);
  procedure Button14Click(Sender: TObject);
  procedure Button15Click(Sender: TObject);
  procedure Button16Click(Sender: TObject);
  procedure Button17Click(Sender: TObject);
  procedure Button18Click(Sender: TObject);
  procedure Button19Click(Sender: TObject);
  procedure Button20Click(Sender: TObject);
  procedure Button21Click(Sender: TObject);
  procedure Button22Click(Sender: TObject);
  procedure Button23Click(Sender: TObject);
  procedure Button24Click(Sender: TObject);
  procedure Button25Click(Sender: TObject);
  procedure Button26Click(Sender: TObject);
  procedure Button27Click(Sender: TObject);
  procedure Button28Click(Sender: TObject);
  procedure Button29Click(Sender: TObject);
  procedure Combobox1CloseUp(Sender: TObject);
  procedure Combobox2CloseUp(Sender: TObject);
  procedure Charakteristika(Sender: TObject);
  procedure PlotPanel1MouseMove(Sender: TObject; xx, yy: Integer);
  procedure Nastavosux;
private {Private declarations }
public  {Public declarations }
end;

var
  Spectrumform      : TSpectrumform;
  fslctdperiod      : double;
  indexf            : integer;
  fradek            : integer;
  indexfstrg        : string;
  fslctdperiodstrg  : string;
  fslctdfrqstrg     : string;
  fcentralperstrg   : string;
  fcentralfrqstrg   : string;
  fradekstrg        : string;
  upperstrg         : string;
  maxupperstrg      : string;
  arghwmax          : double;

implementation
{$R *.lfm}
var
  xxset             : double;
  mmset             : double;
  nyquist           : double;
  Teigen            : double;            {vlastni perioda pristroje}
  bf                : array of double;   {bessel function}
  corrf             : array of double;   {zhlazovaci cosinove okno}
  ncorrf            : array of double;   {normalizovane zhlazovaci cosinove okno}
  hlfbcorr          : double;
  vlastniindex      : integer;
  nejdelsiindex     : integer;
  xxmax             : integer;
  mmmin             : integer;
  fcara             : integer;
  fcara2            : integer;
  numofnules        : integer;
  numofpoles        : integer;
  frkrokstrg        : string;
  logfrqstrg        : string;
  nyquiststrg       : string;
  messages2         : TStrings;
  instrumentbox     : Tstrings;
  namalovano        : boolean;
  sp                : boolean;
  spectrum          : textfile;
  souborH           : textfile;
  spectrumfiltr     : textfile;
  spectrumcorr      : textfile;
  WX, WY            : Extended;          {pro zapisovani souradnice v PlotPanelu 1}
  frkrok            : double;            {krok ve frekvenci}
  cmplxfreq         : complex;

procedure TSpectrumform.PredShow;
begin
  setlength(bf,supermaxsamples+1);       {bessel function}
  instrumentbox := TstringList.Create;   {nastavime policka pro vyber pristroje}
  instrumentbox.Add('typ A     ');
  instrumentbox.Add('typ B     ');
  instrumentbox.Add('typ C     ');
  instrumentbox.Add('typ D     ');
  instrumentbox.Add('STS1 360s' );
  instrumentbox.Add('STS1 alter' );
  instrumentbox.Add('STS2 120s 1gen' );
  instrumentbox.Add('STS2 120s 2gen' );
  instrumentbox.Add('STS2 120s 3gen' );
  instrumentbox.Add('STS2.5 120s' );
  instrumentbox.Add('STS2 120s +ZERO integ' );
  instrumentbox.Add('STS2 120s -ZERO deriv' );
  instrumentbox.Add('RefTek 151 60s A');
  instrumentbox.Add('RefTek 151 60s Bold');
  instrumentbox.Add('RefTek 151 60s Bnew');
  instrumentbox.Add('RefTek 151B 120s');
  instrumentbox.Add('KS-2000 120s orig');
  instrumentbox.Add('KS-2000 120s IRIS');
  instrumentbox.Add('KS-2000 100s IRIS');
  instrumentbox.Add('KS-2000 60s IRIS');
  instrumentbox.Add('KS-2000 50s IRIS');
  instrumentbox.Add('KS-2000 40s IRIS');
  instrumentbox.Add('KS-2000 30s IRIS');
  instrumentbox.Add('Kirnos SKD 30s');
  instrumentbox.Add('KS-54000');
  instrumentbox.Add('MBB-2 120s');
  instrumentbox.Add('Trillium 240old 240s');
  instrumentbox.Add('Trillium 240new 240s');
  instrumentbox.Add('Trillium 120 P/PA 120s');
  instrumentbox.Add('Trillium 120 Q/QA 120s');
  instrumentbox.Add('Trillium 120 PH 120s');
  instrumentbox.Add('Trillium 40s');
  instrumentbox.Add('Trillium 40s 4+2');
  instrumentbox.Add('Trillium Compact 20s');
  instrumentbox.Add('Trillium Compact 120s');
  instrumentbox.Add('Trillium Compact 120s MANUAL');
  instrumentbox.Add('Guralp CMG-40T 30s Standard');
  instrumentbox.Add('Guralp CMG-40T 30s Alternat');
  instrumentbox.Add('Guralp CMG-40T 30s Pascal');
  instrumentbox.Add('Guralp CMG-40T 30s +Z integ');
  instrumentbox.Add('Guralp CMG-40T 30s -Z deriv');
  instrumentbox.Add('Guralp CMG-40T 60s');
  instrumentbox.Add('Guralp CMG-3ESP 30s');
  instrumentbox.Add('Guralp CMG-3ESP 60s');
  instrumentbox.Add('Guralp CMG-3ESPc 60s');
  instrumentbox.Add('Guralp CMG-3ESP 90s');
  instrumentbox.Add('Guralp CMG-3ESP 100s');
  instrumentbox.Add('Guralp CMG-3ESP 120s');
  instrumentbox.Add('Guralp CMG-3T 10s');
  instrumentbox.Add('Guralp CMG-3T 20s');
  instrumentbox.Add('Guralp CMG-3T 30s');
  instrumentbox.Add('Guralp CMG-3T 60s');
  instrumentbox.Add('Guralp CMG-3T 100s');
  instrumentbox.Add('Guralp CMG-3T 120s');
  instrumentbox.Add('Guralp CMG-3T 360s');
  instrumentbox.Add('Guralp CMG-1T 100s');
  instrumentbox.Add('Guralp CMG-1T 120s');
  instrumentbox.Add('Guralp CMG-1T 360s');
  instrumentbox.Add('LE-3Dlite 1s');
  instrumentbox.Add('LE-3D 5s');
  instrumentbox.Add('LE-3D 20s');
  instrumentbox.Add('VE-53');
  instrumentbox.Add('L-22 3D');
  instrumentbox.Add('SMOL 10s');

  if uzjsemtu = false then begin {pokud jsem tu poprve nebo se spustila mezitim analyza a jsem tu poprve po ni, tak to prenastavim}
    {tento cyklus se take NESPUSTI, kdyz delam jen samotnou FFT, protoze to je uzjsemtu kazdopadne false}
    if filtrujuopravovany = false then begin
      PlotPanel1.ClearData;
      PlotPanel2.ClearData;
      Button1.Enabled   := False;
      Button7.Enabled   := False;
      Button13.Enabled  := False;
      combobox1.enabled := False;
      Button9.Enabled   := False;
      Button10.Enabled  := False;
      Button11.Enabled  := False;
      fradek := 0;
      messages2 := TstringList.Create;
      messages2.Add(' - ready to draw the spectrum');
      memo1.Lines := messages2;
      frkrok := frequency[2]-frequency[1];
      str(frkrok:15:12,frkrokstrg);
      mmmin := 1;
      nyquist := 1/(2*timein);
      str(nyquist:12:8,nyquiststrg);
      fradek := fradek +1;
      str(fradek:4,fradekstrg);
      memo1.Lines.Add(fradekstrg+' | - the Nyquist frequency is '+nyquiststrg+' Hz');
      fradek := fradek +1;
      str(fradek:4,fradekstrg);
      memo1.Lines.Add(fradekstrg+' | - the frequency step is '+frkrokstrg+' Hz');
      fradek := fradek +1;
      str(fradek:4,fradekstrg);
      memo1.Lines.Add(fradekstrg+' | - '+nsamplstrg+' samples of the original record were used (duration of the signal is '+durstrg+' s)');
      fradek := fradek +1;
      str(fradek:4,fradekstrg);
      memo1.Lines.Add(fradekstrg+' | - '+nstrg+' samples were used for FFT');
      str(nhlf,nhlfstrg);
      fradek := fradek +1;
      str(fradek:4,fradekstrg);
      memo1.Lines.Add(fradekstrg+' | - the unique part of spectrum contains '+nhlfstrg+' samples');
      str(frequency[nsampl]:11:7,upperstrg);
      fradek := fradek +1;
      str(fradek:4,fradekstrg);
      memo1.Lines.Add(fradekstrg+' | - the maximal frequency of this spectrum is '+upperstrg+' Hz');
      Edit2.text := nyquiststrg;
      Edit1.text := '0.0';
      fcara     := 0;   {vrstvy kresleni do PlotPanelu 1}
      fcara2    := 0;   {vrstvy kresleni do PlotPanelu 2}
      combobox2.items := instrumentbox;
    end; {konec pro filtrujuopravovany = false}
    if FFT = false then begin {nastavuju to jenom pro filtrovani, kdyz delam samotnou FFT tak ne}
      SpectrumForm.combobox1.items := periodsbox; {zobrazi periody v rolete pro vyber}
      SpectrumForm.combobox1.enabled := true;
      Button9.Enabled := True;
      Button10.Enabled := True;
      Button11.Enabled := True;
    end; {konec nastavovani jenom pro filtrovani}
    indexf := 0;
    sp        := true;  {jestli vykresluju spektrum, je to true, jestli normalizovane spektrum, je to false}
    PlotPanel1.XMarks := false;
    PlotPanel1.YMarks := false;
    uzjsemtu := true;
    namalovano := false; {jakoze jsem nic nenamaloval jeste}
  end; {if uzjsemtu = false}
end; {of procedure PredShow}

procedure TSpectrumform.Combobox1CloseUp(Sender: TObject);
var {vybiram si periodu, jejiz filtrovani chci vykreslovat}
  ok : integer;
begin
  val(combobox1.text,fslctdperiod,cd);{selection of one of the monochromatic filtered-out signals}
  str(fslctdperiod:7:5,fslctdperiodstrg); {vybrana okamzita perioda}
  for ok := 1 to nflt do begin
    if (instper[ok,locmx[ok]] < fslctdperiod+0.00009) and (instper[ok,locmx[ok]] > fslctdperiod-0.00009) then begin
      indexf := ok; {zjistim si index vybrane periody}
    end;
  end;
  if indexf = 0 then begin
    showmessage('No filter selected!');
    exit;
  end;
  str((1/fslctdperiod):7:4,fslctdfrqstrg);      {vybrana okamzita frequence}
  str(indexf,indexfstrg);
  str(period[indexf]:7:4,fcentralperstrg);      {vybrana centralni perioda}
  str((1/period[indexf]):7:4,fcentralfrqstrg);  {vybrana centralni frequence}
  str((log10(1/fslctdperiod)):7:4,logfrqstrg);
  fradek := fradek +1;
  str(fradek:4,fradekstrg);
  memo1.Lines.Add(fradekstrg+' | - you have selected the period '+fslctdperiodstrg+' seconds; it means frequency '+ fslctdfrqstrg+' Hz and filter number '+indexfstrg);
  fradek := fradek +1;
  str(fradek:4,fradekstrg);
  memo1.Lines.Add(fradekstrg+' | - logarithm of the frequency is '+logfrqstrg+' ');
  fradek := fradek +1;
  str(fradek:4,fradekstrg);
  memo1.Lines.Add(fradekstrg+' | - corresponding central period is '+fcentralperstrg+' seconds and central frequency is '+fcentralfrqstrg+' Hz');
  fradek := fradek +1;
  str(fradek:4,fradekstrg);
  memo1.Lines.Add(fradekstrg+' | - ' + jake[indexf]+ ' maximum of this filter was used');
  Button1.Enabled := True;
  Button7.Enabled := True;
  if namalovano then button13.Enabled := true;  {kdyz mam vybrano, jestli delam obycejne nebo normalizovane spektrum}
end;   {konec comboboxu pro vybirani period}

procedure TSpectrumform.Button2Click(Sender: TObject);
var   {kresli cele syrove spektrum}
  i,k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= true;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin {for i := mmmin to trunc((xxmax-mmmin)/spekkraceni) do begin}
    PlotPanel1.AddXY(frequency[i], powfrq[i]/hlfamx, clYellow,fcara);
  end; {of for :i:}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni obycejneho spektra}

procedure TSpectrumform.Button29Click(Sender: TObject);
var    {kresli zhlazene spektrum}
  i,k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= true;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass  or bandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,3);
  end;
  for i := mmmin to xxmax do begin {for i := mmmin to trunc((xxmax-mmmin)/spekkraceni) do begin}
    if (smpowfrq[i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
      PlotPanel1.AddXY(frequency[i], smpowfrq[i]/hlfamx, RGB(255,0,255) ,fcara);
    end;
  end; {of for :i:}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni zhlazeneho spektra}

procedure TSpectrumform.Button30Click(Sender: TObject);
var {kresli whitened spektrum}
  i,k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= true;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass  or bandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin {for i := mmmin to trunc((xxmax-mmmin)/spekkraceni) do begin}
    if (whitened[i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
      PlotPanel1.AddXY(frequency[i], whitened[i]/hlfamx, RGB(50,255,255) ,fcara);
    end;
  end; {of for :i:}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni whitened spektra}

procedure TSpectrumform.Button31Click(Sender: TObject);
var {maluje realnou cast FILTROVANEHO spektra}
  i, k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin := -1.1;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass  or bandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    PlotPanel1.AddXY(frequency[i], complffre[i]/hlfamx, clGreen,fcara);             {filtrovana realna cast spektra}
  end; {of for :i:}
  if indexf <> 0 then Button13.Enabled := True;                               {Button "Maxima"}
end;

procedure TSpectrumform.Button32Click(Sender: TObject);
var {maluje imaginarni cast FILTROVANEHO spektra}
  i, k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin := -1.1;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass  or bandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    PlotPanel1.AddXY(frequency[i], complffim[i]/hlfamx, clBlue,fcara);
  end; {of for :i:}
  namalovano := true;
  if indexf <> 0 then Button13.Enabled := True;                               {Button "Maxima"}
end;

procedure TSpectrumform.Button33Click(Sender: TObject);
var {maluje realnou cast WHITENED spektra}
  i, k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin := -1.1;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass  or bandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    PlotPanel1.AddXY(frequency[i], whitenedRe[i]/hlfamx, clGreen,fcara);      {whitened realna cast spektra}
  end; {of for :i:}
  if indexf <> 0 then Button13.Enabled := True;                               {Button "Maxima"}
end;

procedure TSpectrumform.Button34Click(Sender: TObject);
  var {maluje imaginarni cast WHITENED spektra}
  i, k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin := -1.1;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass  or bandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    PlotPanel1.AddXY(frequency[i], whitenedIm[i]/hlfamx, clBlue,fcara);
  end; {of for :i:}
  namalovano := true;
  if indexf <> 0 then Button13.Enabled := True;                               {Button "Maxima"}
end;

procedure TSpectrumform.Button28Click(Sender: TObject);
var {maluje fazovou rychlost z Bessel function a dalsi souvisejici veliciny - maluje se tu znova i realna cast spektra, ktera se maluje samostatne i jinym cudlikem}
  i, k, m : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel2.XMarks:=True;
  PlotPanel1.Ymin := -1.1;
  PlotPanel2.Ymin :=  1.0;    {natvrdo minimalni rychlost}
  PlotPanel1.Ymax := 1.1;
  PlotPanel2.Ymax := 5.0;     {natvrdo maximalni rychlost}
  PlotPanel1.GridColor:=clWhite;
  PlotPanel2.GridColor:=clWhite;
  PlotPanel1.YInterval := 1.1;
  PlotPanel2.YInterval := 1.0;
  PlotPanel1.YMarks:= True;
  PlotPanel2.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  PlotPanel2.Xmax:= xxset;
  PlotPanel2.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    PlotPanel1.AddXY(frequency[i], fre[i]/hlfamx, clGreen,fcara);             {puvodni realna cast spektra, stejne jako jinym cudlikem}
  end;{of for :i:}
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    PlotPanel1.AddXY(frequency[i], fresm[i]/hlfamx, RGB(150,150,50),fcara);   {zhlazena realna cast spektra}
  end;{of for :i:}
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmDot,4);
  end;
  for i := mmmin to xxmax do begin
    PlotPanel1.AddXY(frequency[i], fre[i]/hlfamx, clRed,fcara);               {puvodni realna cast spektra, ale teckovane, abych videl primo jednotlive body}
  end;{of for :i:}
  fcara := fcara + 1;                                                         {domaluju k tomu jeste zero crossings}
  with PlotPanel1 do begin
    LayerOptions(fcara,pmDot,3);
  end;
  for m := 1 to maxzerocross do begin
    PlotPanel1.AddXY(zerocross[m], 0, RGB(0,255,255), fcara);                 {zero crossings realne casti}
  end;{of for :i:}
  namalovano := true;
  if indexf <> 0 then Button13.Enabled := True;                               {Button "Maxima"}

  {BESSEL FUNCTION}
  fcara2 := fcara2 + 1;                                                       {maluju disperzni vetve do horniho PlotPanelu spektralniho okna - tmave modre tecky}
  with PlotPanel2 do begin
    LayerOptions(fcara2,pmDot,2);
  end;
  for m := 1 to maxzerocross do begin                                         {pro vsechny nalezene zerocrossings}
    for k := 1 to 50 do begin                                                 {pro vice ruznych moznosti, protoze nevim, ktera nula bessel function patri ke kteremu zerocrossings}
      if (((m+k-10) > 0) and ((m+k-10) < 505)) then begin                     {samotna cvel se pocita ve SvalUnit}
        PlotPanel2.AddXY( zerocross[m] , cvel[m,k] , RGB(0,50,255) , fcara2); {tmave modre tecky - stejne jako v okne pro periody ve SvalUnit}
      end;
    end;
  end;
  fcara2 := fcara2 + 1;                                                       {maluju vybranou disperzni krivku do horniho PlotPanelu spektralniho okna - svetle modra cara}
  with PlotPanel2 do begin                                                    {ta krivka se kompiluje ve SvalUnit}
    LayerOptions(fcara2,pmLine,1);
  end;
  if spadnul1 then begin                                                      {kompilovano podle nejdelsi periody}
    for m := 1 to maxzerocross do begin                                       {pro vsechny nalezene zerocrossings od nejdelsi}
      PlotPanel2.AddXY( zerocross[m], compiledcvel[m], RGB(0,255,250), fcara2); {svetle modra cara - stejne jako v okne pro periody ve SvalUnit}
    end;
  end;
  if spadnul2 then begin                                                      {kompilovano podle druhe nejdelsi periody}
    for m := 2 to maxzerocross do begin                                       {pro vsechny nalezene zerocrossings od druhe nejdelsi}
      PlotPanel2.AddXY( zerocross[m], compiledcvel[m], RGB(0,255,250), fcara2); {svetle modra cara - stejne jako v okne pro periody ve SvalUnit}
    end;
  end;
  {calculating and plotting the Bessel function itself - demonstracni ucely, nic se z ni nepocita, ale jinde se pouzivaji zero crossings pro vypocet fazove rychlosti}
  fcara := fcara + 1;      {vsechny rychlosti pocitam v unite SvalUnit a tady je jenom maluju, ale Bessel function samotnou pocitam tady, protoze neni dal k nicemu potreba}
  with PlotPanel1 do begin {ve SvalUnit to pocitam proto, abych to tam mel, kdyz to potrebuju do BatchProcessingu}
    LayerOptions(fcara,pmLine,2);
  end;
  for i := mmmin to xxmax do begin
    bf[i] := 0;
  end;
  for i := mmmin to xxmax do begin {Bessel function zavisla na vzdalenosti stanic a fazove rychlosti, ktera je tu natvrdo, jako kdyby to nemelo disperzi, pro rychlost 3.5 km/s}
    bf[i] := sqrt((2)/(pi*frequency[i]*(distkm/3.5)*2*pi)) * cos(frequency[i]*(distkm/3.5)*2*pi - (pi/4));
  end;
  for i := mmmin to xxmax do begin
    if ((bf[i] > PlotPanel1.YMin) and (bf[i] < PlotPanel1.YMax)) then begin
      PlotPanel1.AddXY(frequency[i], bf[i], RGB(150,20,150), fcara);          {kreslim teoretickou Bessel function}
    end;
  end; {of for :i:}
end; {konec malovani Bessela a souvisejicich velicin - maluje se tu znova i realna cast spektra}

procedure TSpectrumform.Button27Click(Sender: TObject);
var   {kresli faze spektra a fazove disperzni krivky spoctene z teto faze}
  i, k, j, p : integer;
begin
  sp := true;
  PlotPanel1.XMarks   :=True;
  PlotPanel1.Ymin     := -3.5;   {jakoze -pi}
  PlotPanel1.Ymax     := +3.5;   {jakoez +pi}
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval:= 1.1;
  PlotPanel1.YMarks   := true;
  PlotPanel2.XMarks   :=True;
  PlotPanel2.Ymin     := 1;      {natvrdo minimalni rychlost}
  PlotPanel2.Ymax     := 5;      {natvrdo maximalni rychlost}
  PlotPanel2.GridColor:=clBlack;
  PlotPanel2.YInterval:= 1;
  PlotPanel2.YMarks   := true;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass  or bandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  PlotPanel2.Xmax:= xxset;
  PlotPanel2.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;              {maluju fazi, uz je naposouvana o 2*pi skoky, takze by mela monotonne rust}
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin {for i := mmmin to trunc((xxmax-mmmin)/spekkraceni) do begin}
    PlotPanel1.AddXY(frequency[i], spectralphase[i]/1000, clWhite, fcara); {maluju ji 1000x mensi, aby se mi tam vesla}
  end; {of for :i:}

  {ANALYTICKY SIGNAL}
  {maluju ruzne vetve fazove rychlosti z analytickeho signalu - tmave fialove tecky}
  fcara2 := fcara2 + 1;              {namaluju fazovou rychlost}
  with PlotPanel2 do begin
    LayerOptions(fcara2,pmDot,2);
  end;
  for j := 1 to nflt do begin
    for p := 0 to 2*fazky do begin  {jedu do dvojnasobku fazek, protoze zacinam u minusovych}
      if ((1/instper[j,locmx[j]]) > PlotPanel2.Xmin) and ((1/instper[j,locmx[j]]) < PlotPanel2.Xmax) and (fazovaP[p,j] > PlotPanel2.Ymin) and (fazovaP[p,j] < PlotPanel2.Ymax) then begin
        PlotPanel2.AddXY( ( 1/instper[j,locmx[j]]) , fazovaP[p,j] , RGB(255,0,80) , fcara2); {tmave fialove tecky - stejne jako v okne pro periody ve SvalUnit}
      end;
    end; {for p}
  end; {for j}
  fcara2 := fcara2 + 1;              {namaluju fazovou rychlost}
  with PlotPanel2 do begin
    LayerOptions(fcara2,pmLine,1);
  end;
  for j := 1 to nflt do begin
    if ((1/instper[j,locmx[j]]) > PlotPanel2.Xmin) and ((1/instper[j,locmx[j]]) < PlotPanel2.Xmax) and (fazova[j] > PlotPanel2.Ymin) and (fazova[j] < PlotPanel2.Ymax) then begin
      PlotPanel2.AddXY((1/instper[j,locmx[j]]),fazova[j],RGB(255,0,210), fcara2);   {svetle fialova cara  - stejne jako v okne pro periody ve SvalUnit}
    end;
  end;

  {SPECTRAL PHASE}
  fcara2 := fcara2 + 1;              {namaluju fazovou rychlost z faze spektra pro vsechny mozne vetve}
  with PlotPanel2 do begin
    LayerOptions(fcara2,pmDot,2);
  end;
  for n := 1 to cvelnumspec do begin {pro vice ruznych n - vetve disperznich krivek}
    for i := mmmin to xxmax do begin
      if (frequency[i] > PlotPanel2.Xmin) and (frequency[i] < PlotPanel2.Xmax) and (spectralc[i,n] > PlotPanel2.Ymin) and (spectralc[i,n] < PlotPanel2.Ymax) then begin
        PlotPanel2.AddXY(frequency[i], spectralc[i,n], RGB(0,100,30), fcara2); {tmave zelene tecky - stejne jako v okne pro periody ve SvalUnit}
      end;
    end; {for i}
  end; {for n}
  fcara2 := fcara2 + 1;              {namaluju vyslednou kompilovanou fazovou rychlost z faze spektra}
  with PlotPanel2 do begin
    LayerOptions(fcara2,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if (frequency[i] > PlotPanel2.Xmin) and (frequency[i] < PlotPanel2.Xmax) and (compiledspectralc[i] > PlotPanel2.Ymin) and (compiledspectralc[i] < PlotPanel2.Ymax) then begin
      PlotPanel2.AddXY( frequency[i] , compiledspectralc[i] , RGB(0,255,30) , pp3); {jedle zelena cara - stejne jako v okne pro periody ve SvalUnit}
    end;
  end;

  namalovano := true;
  if indexf <> 0 then Button13.Enabled := True;        {Button "Maxima"}
end; {konec kresleni faze spektra a fazove disperzni krivky spoctene z teto faze}

procedure TSpectrumform.Button1Click(Sender: TObject);
var {kresli filtrovany spektrum a gaussovsky zvon}
  i,k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  PlotPanel1.AddXY((1/fslctdperiod),PlotPanel1.Ymax,RGB(255,255,0),fcara); {kresli okamzitou frequenci maxima}
  PlotPanel1.AddXY((1/fslctdperiod),PlotPanel1.Ymin,RGB(255,255,0),fcara);
  fcara := fcara + 1;
    with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  PlotPanel1.AddXY((1/period[indexf]),PlotPanel1.Ymax,clWhite,fcara); {kresli puvodni centralni frequenci}
  PlotPanel1.AddXY((1/period[indexf]),PlotPanel1.Ymin,clWhite,fcara);
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara +1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if (ww[indexf,i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
      PlotPanel1.AddXY(frequency[i], filtpowfrq[indexf,i]/hlfamx, clRed,fcara);
    end;
  end;
  fcara := fcara +1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if (ww[indexf,i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
      PlotPanel1.AddXY(frequency[i], ww[indexf,i]/hlfamx, clBlue,fcara);
    end;
  end;
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec vykreslovani filtrovaneho spektra a gaussovskeho zvonu}

procedure TSpectrumform.Button4Click(Sender: TObject);
var   {kresli normalizovane spektrum}
  i,k : integer;
begin
  sp := false;
  PlotPanel1.XInterval:=0.1;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax:=105;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval:=10;
  PlotPanel1.YMarks:=True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= log10(xxset)+0.1;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  if mmset = 0 then mmset := frkrok;
  PlotPanel1.Xmin:= log10(mmset)-0.1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if npowfrq[i] > 0.1 then begin {kreslim jen nenulovou cast}
      PlotPanel1.AddXY(log10(frequency[i]), npowfrq[i], clYellow,fcara);
    end;
  end; {of for :i:}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni normalizovaneho spektra}

procedure TSpectrumform.Button7Click(Sender: TObject);
var   {kresli normalizovane filtrovane spektrum a normalizovany gaussovsky zvon}
  i,k : integer;
begin
  sp := false;
  PlotPanel1.XInterval:=0.1;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax:=105;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval:=10;
  PlotPanel1.YMarks:=True;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  PlotPanel1.AddXY(log10(1/fslctdperiod),PlotPanel1.Ymax,RGB(255,255,0),fcara); {kresli okamzitou frequenci maxima}
  PlotPanel1.AddXY(log10(1/fslctdperiod),PlotPanel1.Ymin,RGB(255,255,0),fcara); {kresli okamzitou frequenci maxima}
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  PlotPanel1.AddXY(log10(1/period[indexf]),PlotPanel1.Ymax,clWhite,fcara); {kresli puvodni centralni frequenci}
  PlotPanel1.AddXY(log10(1/period[indexf]),PlotPanel1.Ymin,clWhite,fcara); {kresli puvodni centralni frequenci}
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= log10(xxset)+0.1;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  if mmset = 0 then mmset := frkrok;
  PlotPanel1.Xmin:= log10(mmset)-0.1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if nww[indexf,i] > 0.1 then begin
      PlotPanel1.AddXY(log10(frequency[i]), nww[indexf,i], clBlue,fcara);
    end;
  end;{of for :i:}
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if nww[indexf,i] > 0.1 then begin
      PlotPanel1.AddXY(log10(frequency[i]), nfiltpowfrq[indexf,i], clRed,fcara);
    end;
  end;
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni normalizovane filtrovane spektrum a normalizovany gaussovsky zvon}

procedure TSpectrumform.Button9Click(Sender: TObject);
var {vykresluje vsechny samotne filtry}
  joj, i, k : integer;
begin
  if sp = true then begin {pro obycejne spektrum}
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:=0;
    PlotPanel1.Ymax := 1.1;
    PlotPanel1.GridColor:=clBlack;
    PlotPanel1.YInterval := 1.1;
    PlotPanel1.YMarks:= True;
    val(Edit2.Text,xxset,cd);
    if xxset > nyquist then begin
      showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
      Edit2.Text := nyquiststrg;
      xxset := nyquist; {opravim to na nyquista}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= xxset;
    PlotPanel1.Xmin:= mmset;
    Nastavosux;
    for i := 1 to n do begin
      if frequency[i] > xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := n downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    for joj := nflt downto 1 do begin
      fcara := fcara + 1;
      with PlotPanel1 do begin
        LayerOptions(fcara,pmLine,1);
      end;
      for i := mmmin to xxmax do begin
        if (ww[joj,i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
          PlotPanel1.AddXY(frequency[i], ww[joj,i]/hlfamx, clBlue,fcara);
        end;
      end;
    end; {of for joj}
  end; {pro sp = true - kdyz je to obycejne spektrum}
  if sp = false then begin {kdyz je to pro normalizovane spektrum}
    PlotPanel1.XInterval:=0.1;
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:=0;
    PlotPanel1.Ymax:=105;
    PlotPanel1.GridColor:=clBlack;
    PlotPanel1.YInterval:=10;
    PlotPanel1.YMarks:=True;
    val(Edit2.Text,xxset,cd);
    if xxset > nyquist then begin
      showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
      Edit2.Text := nyquiststrg;
      xxset := nyquist; {opravim to na nyquista}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= log10(xxset)+0.1;
    for i := 1 to nsampl do begin
      if frequency[i] > xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := nsampl downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    if mmset = 0 then mmset := frkrok;
    PlotPanel1.Xmin:= log10(mmset)-0.1;
    for joj := nflt downto 1 do begin
      fcara := fcara + 1;
      with PlotPanel1 do begin
        LayerOptions(fcara,pmLine,1);
      end;
      for i := mmmin to xxmax do begin
        if nww[joj,i] > 0.1 then begin
          PlotPanel1.AddXY(log10(frequency[i]), nww[joj,i], clBlue,fcara);
        end;
      end; {of for :i:}
    end; {pro joj}
  end; {if sp = false - konec pro normalizovane spektrum}
end; {konec vykreslovani vsech samotnych filtru}

procedure TSpectrumform.Button10Click(Sender: TObject);
var {vykresluje vsechna filtrovana spektra}
  joj, i, k : integer;
begin
  if sp = true then begin {pro obycejnske spektrum}
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:=0;
    PlotPanel1.Ymax := 1.1;
    PlotPanel1.GridColor:=clBlack;
    PlotPanel1.YInterval := 1.1;
    PlotPanel1.YMarks:= true;
    val(Edit2.Text,xxset,cd);
    if xxset > nyquist then begin
      showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
      Edit2.Text := nyquiststrg;
      xxset := nyquist; {opravim to na nyquista}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= xxset;
    PlotPanel1.Xmin:= mmset;
    Nastavosux;
    for i := 1 to n do begin
      if frequency[i] > xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := n downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    for joj := nflt downto 1 do begin
      fcara := fcara + 1;
      with PlotPanel1 do begin
        LayerOptions(fcara,pmLine,1);
      end;
      for i := mmmin to xxmax do begin
        if (ww[joj,i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
          PlotPanel1.AddXY(frequency[i], filtpowfrq[joj,i]/hlfamx, clRed,fcara);
        end;
      end;
    end; {of for joj}
  end; {id sp = true - konec pro obycejne spektrum}
  if sp = false then begin {kdyz je to pro normalizovane spektrum}
    PlotPanel1.XInterval:=0.1;
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:=0;
    PlotPanel1.Ymax:=105;
    PlotPanel1.GridColor:=clBlack;
    PlotPanel1.YInterval:=10;
    PlotPanel1.YMarks:=True;
    val(Edit2.Text,xxset,cd);
    if xxset > nyquist then begin
      showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
      Edit2.Text := nyquiststrg;
      xxset := nyquist; {opravim to na nyquista}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= log10(xxset)+0.1;
    for i := 1 to nsampl do begin
      if frequency[i] > xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := nsampl downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    if mmset = 0 then mmset := frkrok;
    PlotPanel1.Xmin:= log10(mmset)-0.1;
    for joj := nflt downto 1 do begin
      fcara := fcara + 1;
      with PlotPanel1 do begin
        LayerOptions(fcara,pmLine,1);
      end;
      for i := mmmin to xxmax do begin
        if nww[joj,i] > 0.1 then begin
          PlotPanel1.AddXY(log10(frequency[i]), nfiltpowfrq[joj,i], clRed,fcara);
        end;
      end;
    end; {pro joj}
  end; {id sp = false - konec pro normalizovane spektrum}
end; {konec vykreslovani vsech filtrovanych spekter}

procedure TSpectrumform.Button11Click(Sender: TObject);
var {vykresluje samotne jednotkove filtry}
  joj, i, k : integer;
begin
  if sp = true then begin {pro obycejnske spektrum}
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:=0;
    PlotPanel1.Ymax := 1.1;
    PlotPanel1.GridColor:=clBlack;
    PlotPanel1.YInterval := 1.1;
    PlotPanel1.YMarks:= true;
    val(Edit2.Text,xxset,cd);
    if xxset > nyquist then begin
      showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
      Edit2.Text := nyquiststrg;
      xxset := nyquist; {opravim to na nyquista}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= xxset;
    PlotPanel1.Xmin:= mmset;
    Nastavosux;
    for i := 1 to n do begin
      if frequency[i] > xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := n downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    for joj := nflt downto 1 do begin
      fcara := fcara + 1;
      with PlotPanel1 do begin
        LayerOptions(fcara,pmLine,1);
      end;
      for i := mmmin to xxmax do begin
        if (ww[joj,i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
          PlotPanel1.AddXY(frequency[i], www[joj,i]*(hlfamx/2)/hlfamx, clBlue,fcara);
        end;
      end;
    end; {of for joj}
  end; {if sp = true - pro obycejnske spektrum}
  if sp = false then begin {pro normalizovane}
    PlotPanel1.XInterval:=0.1;
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:=0;
    PlotPanel1.Ymax:=105;
    PlotPanel1.GridColor:=clBlack;
    PlotPanel1.YInterval:=10;
    PlotPanel1.YMarks:=True;
    val(Edit2.Text,xxset,cd);
    if xxset > nyquist then begin
      showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
      Edit2.Text := nyquiststrg;
      xxset := nyquist; {opravim to na nyquista}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= log10(xxset)+0.1;
    for i := 1 to nsampl do begin
      if frequency[i] > xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := nsampl downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    if mmset = 0 then mmset := frkrok;
    PlotPanel1.Xmin:= log10(mmset)-0.1;
    for joj := nflt downto 1 do begin
      fcara := fcara + 1;
      with PlotPanel1 do begin
        LayerOptions(fcara,pmLine,1);
      end;
      for i := mmmin to xxmax do begin
        if nww[joj,i] > 0.1 then begin
          PlotPanel1.AddXY(log10(frequency[i]), nwww[joj,i], clBlue,fcara);
        end;
      end; {of for :i:}
    end; {pro joj}
  end; {if sp = false - konec pro normalizovane}
end; {konec kresleni samotnych jednotkovych filtru}

procedure TSpectrumform.Button6Click(Sender: TObject);
begin {puli rozsah Y osy}
  PlotPanel1.Ymax := PlotPanel1.Ymax / 2;
end;

procedure TSpectrumform.Button5Click(Sender: TObject);
begin {zdvojnasobuje rozsah osy Y}
  PlotPanel1.Ymax := PlotPanel1.Ymax * 2;
end;

procedure TSpectrumform.Button8Click(Sender: TObject);
begin {meni rozsah osy X podle aktualniho nastaveni}
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if sp = true then begin
    PlotPanel1.Xmax := xxset;
    PlotPanel1.Xmin := mmset;
    PlotPanel2.Xmax := xxset;
    PlotPanel2.Xmin := mmset;
    Nastavosux;
  end;
  if sp = false then begin
    PlotPanel1.Xmax :=  log10(xxset)+0.1;
    PlotPanel2.Xmax :=  log10(xxset)+0.1;
    if mmset = 0 then mmset := frkrok;
    PlotPanel1.Xmin:= log10(mmset)-0.1;
    PlotPanel2.Xmin:= log10(mmset)-0.1;
  end;
end;

procedure TSpectrumform.Button3Click(Sender: TObject);
begin {maze graf}
  PlotPanel1.ClearData;
  PlotPanel2.ClearData;
end;

procedure TSpectrumform.Button12Click(Sender: TObject);
var {uklada spektrum}
  i : integer;
  nazvisko      : string;
  nazviskocorr  : string;
begin
  if (bandpass = false) then begin             {kdyz jsem to nefiltroval cele}
    showmessage('Raw spectra will be saved but no bandpass filtered spektra are available');
  end;
  if bandpass then begin                      {kdyz jsem to filtroval cele}
    showmessage('Both raw and bandpass filtered spectra will be saved');
  end;
  if korigovaljsem then begin {pokud jsem spocetl korigovana spektra, mohu je ukladat}
    showmessage('Also the instrument-corrected spectra will be saved in the separate file');
  end;
  SaveDialog1.Execute;
  if length(SaveDialog1.FileName) < 1 then exit;
  nazvisko := SaveDialog1.FileName;
  nazvisko := nazvisko + '.dat';
  assignfile(spectrum,nazvisko);
  rewrite(spectrum);
  if (bandpass = false) then begin             {kdyz jsem to nefiltroval cele}
    //writeln(spectrum,'             frequency       period[s]           period[h]              RealPart         ImaginaryPart         AmpliSpectrum        NormalizAmpSpc       AmpliSpectrum-1');
    writeln(spectrum,'       frequency        RealPart   ImaginaryPart   AmpliSpectrum  NormalizAmpSpc AmpliSpectrum-1');
    for i := 1 to nhlf do begin {pro pulku toho, co slo do Fouriera}
      //writeln(spectrum,frequency[i]:22:11,(1/frequency[i]):16:4,((1/frequency[i])/3600):20:7,(fre[i]):22:11,(fim[i]):22:11,powfrq[i]:22:11,npowfrq[i]:22:11,(powfrq[i]/hlfamx):22:11);
      writeln(spectrum,frequency[i]:16:7,(fre[i]):16:7,(fim[i]):16:7,powfrq[i]:16:7,npowfrq[i]:16:7,(powfrq[i]/hlfamx):16:7);
    end;
  end;
  if bandpass then begin                      {kdyz jsem to filtroval cele}
    writeln(spectrum,'             frequency       period[s]           period[h]              RealPart         ImaginaryPart         AmpliSpectrum        NormalizAmpSpc            BandPassRe            BandPassIm        BndPssAmplSpec       NrmBndPssAmpSpc          GaussFilter');
    for i := 1 to nhlf do begin {pro pulku toho, co slo do Fouriera}
      writeln(spectrum,frequency[i]:22:11,(1/frequency[i]):16:4,((1/frequency[i])/3600):20:7,(fre[i]):22:11,(fim[i]):22:11,powfrq[i]:22:11,npowfrq[i]:22:11,complffre[i]:22:11,complffim[i]:22:11,complfiltpowfrq[i]:22:11,complfiltnpowfrq[i]:22:11,wc[i]:22:11);
    end;
  end;
  closefile(spectrum);
  if korigovaljsem then begin {pokud jsem spocetl korigovana spektra, mohu je ukladat}
    nazviskocorr := SaveDialog1.FileName;
    nazviskocorr := nazviskocorr + '.crr';
    assignfile(spectrumcorr,nazviskocorr);
    rewrite(spectrumcorr);
    writeln(spectrumcorr,'       frequency      CorrRealPart  CorrImaginarPart  CorrAmpliSpectrm  CorrNormalizAmpSpc');
    for i := 1 to nhlf do begin {pro pulku toho, co slo do Fouriera}
      writeln(spectrumcorr,frequency[i]:16:5,(CorrFRe[i]):18:5,(CorrFim[i]):18:5,cmod(CorrSpek[i]):18:5,CorrSpeknpowfrq[i]:20:5);
    end;
  closefile(spectrumcorr);
  end;
end; {konec ukladani spektra}

procedure TSpectrumform.Button13Click(Sender: TObject);
begin {vyznacuje vsech pet maxim v danem filtru}
  if sp = true then begin {pro obycejne spektrum}
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    PlotPanel1.AddXY((1/instper[indexf,max1locmx[indexf]]),PlotPanel1.Ymax,RGB(233,183,62 ),fcara); {primarni}
    PlotPanel1.AddXY((1/instper[indexf,max1locmx[indexf]]),PlotPanel1.Ymin,RGB(233,183,62 ),fcara); {primarni}
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max2locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((1/instper[indexf,max2locmx[indexf]]),PlotPanel1.Ymax,RGB(255,33 ,0  ),fcara); {sekundarni}
      PlotPanel1.AddXY((1/instper[indexf,max2locmx[indexf]]),PlotPanel1.Ymin,RGB(255,33 ,0  ),fcara); {sekundarni}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max3locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((1/instper[indexf,max3locmx[indexf]]),PlotPanel1.Ymax,RGB(20 ,255,20 ),fcara); {terciarni}
      PlotPanel1.AddXY((1/instper[indexf,max3locmx[indexf]]),PlotPanel1.Ymin,RGB(20 ,255,20 ),fcara); {terciarni}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max4locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((1/instper[indexf,max4locmx[indexf]]),PlotPanel1.Ymax,RGB(0  ,216,255),fcara); {kvarterni}
      PlotPanel1.AddXY((1/instper[indexf,max4locmx[indexf]]),PlotPanel1.Ymin,RGB(0  ,216,255),fcara); {kvarterni}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max5locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((1/instper[indexf,max5locmx[indexf]]),PlotPanel1.Ymax,RGB(231,90 ,230),fcara); {kvinterni}
      PlotPanel1.AddXY((1/instper[indexf,max5locmx[indexf]]),PlotPanel1.Ymin,RGB(231,90 ,230),fcara); {kvinterni}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max6locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((1/instper[indexf,max6locmx[indexf]]),PlotPanel1.Ymax,RGB(231,90 ,230),fcara); {seste}
      PlotPanel1.AddXY((1/instper[indexf,max6locmx[indexf]]),PlotPanel1.Ymin,RGB(231,90 ,230),fcara); {seste}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max7locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((1/instper[indexf,max7locmx[indexf]]),PlotPanel1.Ymax,RGB(231,90 ,230),fcara); {sedme}
      PlotPanel1.AddXY((1/instper[indexf,max7locmx[indexf]]),PlotPanel1.Ymin,RGB(231,90 ,230),fcara); {sedme}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max8locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((1/instper[indexf,max8locmx[indexf]]),PlotPanel1.Ymax,RGB(231,90 ,230),fcara); {osme}
      PlotPanel1.AddXY((1/instper[indexf,max8locmx[indexf]]),PlotPanel1.Ymin,RGB(231,90 ,230),fcara); {osme}
    end;
  end; {if sp = true - konec pro obycejne spektrum}
  if sp = false then begin {kdyz je to pro normalizovane spektrum}
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    PlotPanel1.AddXY((log10(1/instper[indexf,    max1locmx[indexf]])),PlotPanel1.Ymax,RGB(233,183,62 ),fcara); {primarni}
    PlotPanel1.AddXY((log10(1/instper[indexf,    max1locmx[indexf]])),PlotPanel1.Ymin,RGB(233,183,62 ),fcara); {primarni}
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max2locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((log10(1/instper[indexf,  max2locmx[indexf]])),PlotPanel1.Ymax,RGB(255,33 ,0  ),fcara); {sekundarni}
      PlotPanel1.AddXY((log10(1/instper[indexf,  max2locmx[indexf]])),PlotPanel1.Ymin,RGB(255,33 ,0  ),fcara); {sekundarni}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max3locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((log10(1/instper[indexf,  max3locmx[indexf]])),PlotPanel1.Ymax,RGB(20 ,255,20 ),fcara); {terciarni}
      PlotPanel1.AddXY((log10(1/instper[indexf,  max3locmx[indexf]])),PlotPanel1.Ymin,RGB(20 ,255,20 ),fcara); {terciarni}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max4locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((log10(1/instper[indexf, max4locmx[indexf]])),PlotPanel1.Ymax,RGB(0  ,216,255),fcara); {kvarterni}
      PlotPanel1.AddXY((log10(1/instper[indexf, max4locmx[indexf]])),PlotPanel1.Ymin,RGB(0  ,216,255),fcara); {kvarterni}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max5locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((log10(1/instper[indexf,max5locmx[indexf]])),PlotPanel1.Ymax,RGB(231,90 ,230),fcara); {kvinterni}
      PlotPanel1.AddXY((log10(1/instper[indexf,max5locmx[indexf]])),PlotPanel1.Ymin,RGB(231,90 ,230),fcara); {kvinterni}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max6locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((log10(1/instper[indexf,max6locmx[indexf]])),PlotPanel1.Ymax,RGB(231,90 ,230),fcara); {seste}
      PlotPanel1.AddXY((log10(1/instper[indexf,max6locmx[indexf]])),PlotPanel1.Ymin,RGB(231,90 ,230),fcara); {seste}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max7locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((log10(1/instper[indexf,max7locmx[indexf]])),PlotPanel1.Ymax,RGB(231,90 ,230),fcara); {sedme}
      PlotPanel1.AddXY((log10(1/instper[indexf,max7locmx[indexf]])),PlotPanel1.Ymin,RGB(231,90 ,230),fcara); {sedme}
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    if max8locmx[indexf]<>0 then begin
      PlotPanel1.AddXY((log10(1/instper[indexf,max8locmx[indexf]])),PlotPanel1.Ymax,RGB(231,90 ,230),fcara); {osme}
      PlotPanel1.AddXY((log10(1/instper[indexf,max8locmx[indexf]])),PlotPanel1.Ymin,RGB(231,90 ,230),fcara); {osme}
    end;
  end; {if sp = false - pro normalizovane spektrum}
end; {konec vyznacovani vsech peti maxim}

procedure TSpectrumform.Button14Click(Sender: TObject);
var {maluje realnou cast spektra}
  i, k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin := -1.1;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    PlotPanel1.AddXY(frequency[i], fre[i]/hlfamx, clGreen,fcara);             {puvodni realna cast spektra}
  end; {of for :i:}
  if indexf <> 0 then Button13.Enabled := True;                               {Button "Maxima"}
end; {konec malovani realne casti spektra}

procedure TSpectrumform.Button15Click(Sender: TObject);
var {maluje imaginarni cast spektra}
  i, k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin := -1.1;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    PlotPanel1.AddXY(frequency[i], fim[i]/hlfamx, clBlue,fcara);
  end; {of for :i:}
  namalovano := true;
  if indexf <> 0 then Button13.Enabled := True;                               {Button "Maxima"}
end; {konec malovani imaginarni casti spektra}

procedure TSpectrumform.Button16Click(Sender: TObject);
var {kresli kompletne filtrovany spektrum a protazeny gaussovsky zvon}
  i,k : integer;
  actperminstrg : string;
  actpermaxstrg : string;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass  or bandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  if ema = false then begin
    str((1/frequency[trunc(nfmax)]):10:0,actpermaxstrg);
  end;
  str((1/frequency[trunc(nfmin)]):10:0,actperminstrg);
  radek := radek +1;
  str(radek:4,radekstrg);
  memo1.Lines.Add(radekstrg+' | -       set minimal period of complete filtering is:    '+perfltminstrg+' s');
  radek := radek +1;
  str(radek:4,radekstrg);
  memo1.Lines.Add(radekstrg+' | -      real minimal period of complete filtering is:  '+actperminstrg+' s');
  if ema = false then begin
    radek := radek +1;
    str(radek:4,radekstrg);
    memo1.Lines.Add(radekstrg+' | -       set maximal period of complete filtering is:    '+perfltmaxstrg+' s');
    radek := radek +1;
    str(radek:4,radekstrg);
    memo1.Lines.Add(radekstrg+' | -      real maximal period of complete filtering is:  '+actpermaxstrg+' s');
  end;
  {nakreslim puvodne zadane periody - ty nejsou zaokrouhlene na zadny vzorek}
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  PlotPanel1.AddXY(1/perfltmin, 0  , clWhite,fcara);
  PlotPanel1.AddXY(1/perfltmin, 1.1, clWhite,fcara);
  if ema = false then begin
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    PlotPanel1.AddXY(1/perfltmax, 0  , clWhite,fcara);
    PlotPanel1.AddXY(1/perfltmax, 1.1, clWhite,fcara);
  end;
  {nakreslim hranice toho filtru, kde je nejvyssi - to uz ukazuje na vzorek, kam filtr dosahl a obecne to je tedy trosku jine nez bila cara vyse}
  if ema = false then begin
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    PlotPanel1.AddXY(frequency[trunc(nfmax)], 0  , clBlue,fcara);
    PlotPanel1.AddXY(frequency[trunc(nfmax)], 1.1, clBlue,fcara);
  end;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  PlotPanel1.AddXY(frequency[trunc(nfmin)], 0  , clBlue,fcara);
  PlotPanel1.AddXY(frequency[trunc(nfmin)], 1.1, clBlue,fcara);
  if ema = false then begin
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    for i := mmmin to xxmax do begin
      if (wc[i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
        if i <= nfmax then begin
          PlotPanel1.AddXY(frequency[i], wcw[i]/hlfamx, clBlue,fcara);
        end;
      end;
    end;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    for i := mmmin to xxmax do begin
      if (wc[i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
        if i >= nfmin then begin
          PlotPanel1.AddXY(frequency[i], wcw[i]/hlfamx, clBlue,fcara);
        end;
      end; {of if}
    end; {for :i:}
  end;
  if ema = true then begin
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    for i := mmmin to xxmax do begin
      if (wc[i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
        PlotPanel1.AddXY(frequency[i], wcw[i]/hlfamx, clBlue,fcara);
      end;
    end;
  end;
  fcara := fcara + 1; {nakreslim filtrovane spektrum}
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if (wc[i]) > malynki then begin {aby to nevykreslovalo malinky hodnoty}
      PlotPanel1.AddXY(frequency[i], complfiltpowfrq[i]/hlfamx, clRed,fcara);
    end;
  end;
  namalovano := true;
end; {konec kresleni kompletne filtrovaneho spektra}

procedure TSpectrumform.Combobox2CloseUp(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to numofpoleszeros do begin
    pol[i] := 0;
    nul[i] := 0;
  end;
  if batchproces = false then begin   {pokud to delam rucne, tedy nejsem v batch processing}
    instrument := combobox2.text;     {nactu do stringu instrument hodnotu toho, na co jsem kliknul}
  end;                                {pokud to delam batch processingem, tak v te promenne instrument uz mam pristroj zadany konkretnim prirazenim ze souboru z promenne KUKsensor}
  {prirazeni zobrazovaneho typu pristroje do promenne pro zvoleni charakteristiky}
  {typ pristroje cteny ze souboru je ten kratsi}
  {takze po tomhle prirazeni bude jedno, jestli se typ pristroje cetl ze souboru, nebo z roll-down menu, protoze z toho roll-down menu se to priradi, aby to odpovidalo tomu ze souboru}
  {vsechny nazvy instrumentu ale musi mit 10 znaku s tim, ze ty, kde nic neni, jsou mezery - na tech 10 znaku se to cte ze souboru}
  if  (instrument = 'STS1 360s')              then instrument := 'STS1      ';
  if  (instrument = 'STS2 120s 1gen')         then instrument := 'STS2      ';
  if  (instrument = 'STS2 120s 2gen')         then instrument := 'STS2-2g   ';
  if  (instrument = 'STS2 120s 3gen')         then instrument := 'STS2-3g   ';
  if  (instrument = 'STS2.5 120s')            then instrument := 'STS25     ';
  if  (instrument = 'RefTek 151 60s A')       then instrument := 'RT60A     ';
  if  (instrument = 'RefTek 151 60s Bold')    then instrument := 'RT60Bold  ';
  if  (instrument = 'RefTek 151 60s Bnew')    then instrument := 'RT60Bnew  ';
  if  (instrument = 'RefTek 151B 120s')       then instrument := 'RT120     ';
  if  (instrument = 'KS-2000 120s orig')      then instrument := 'KS2000    ';
  if  (instrument = 'KS-2000 120s IRIS')      then instrument := 'KS2000-120';
  if  (instrument = 'KS-2000 100s IRIS')      then instrument := 'KS2000-100';
  if  (instrument = 'KS-2000 60s IRIS')       then instrument := 'KS2000-060';
  if  (instrument = 'KS-2000 50s IRIS')       then instrument := 'KS2000-050';
  if  (instrument = 'KS-2000 40s IRIS')       then instrument := 'KS2000-040';
  if  (instrument = 'KS-2000 30s IRIS')       then instrument := 'KS2000-030';
  if  (instrument = 'KS-36000')               then instrument := 'KS36000   ';
  if  (instrument = 'KS-54000')               then instrument := 'KS54000   ';
  if  (instrument = 'MBB-2 120s')             then instrument := 'MBB2      ';
  if  (instrument = 'Kirnos SKD 30s')         then instrument := 'Kskd30    ';
  if  (instrument = 'Trillium 240old 240s')   then instrument := 'T240old   ';
  if  (instrument = 'Trillium 240new 240s')   then instrument := 'T240new   ';
  if  (instrument = 'Trillium 120 P/PA 120s') then instrument := 'T120      ';
  if  (instrument = 'Trillium 120 Q/QA 120s') then instrument := 'T120Q     ';
  if  (instrument = 'Trillium 120 PH 120s')   then instrument := 'T120PH    ';
  if  (instrument = 'Trillium 40s')           then instrument := 'T40       ';
  if  (instrument = 'Trillium 40s 4+2')       then instrument := 'T40alter  ';
  if  (instrument = 'Trillium Compact 120s')  then instrument := 'Tcom120   ';
  if  (instrument = 'Trillium Compact 120s MANUAL')  then instrument := 'Tcom120man';
  if  (instrument = 'Trillium Compact 20s')   then instrument := 'T20       ';
  if  (instrument = 'Guralp CMG-3T 10s')      then instrument := 'G10       ';
  if  (instrument = 'Guralp CMG-3T 20s')      then instrument := 'G20       ';
  if  (instrument = 'Guralp CMG-40T 30s Standard') or
      (instrument = 'Guralp CMG-3ESP 30s')         or
      (instrument = 'Guralp CMG-3T 30s')           then instrument := 'G30       ';
  if  (instrument = 'Guralp CMG-40T 30s Alternat') then instrument := 'G30alter  ';
  if  (instrument = 'Guralp CMG-40T 30s Pascal')   then instrument := 'G30pascal ';
  if  (instrument = 'Guralp CMG-40T 60s')     or
      (instrument = 'Guralp CMG-3ESP 60s')    or
      (instrument = 'Guralp CMG-3ESPc 60s')   or
      (instrument = 'Guralp CMG-3T 60s')      then instrument := 'G60       ';
  if  (instrument = 'Guralp CMG-3ESP 90s')    then instrument := 'G90       ';
  if  (instrument = 'Guralp CMG-3ESP 100s')   or
      (instrument = 'Guralp CMG-3T 100s')     or
      (instrument = 'Guralp CMG-1T 100s')     then instrument := 'G100      ';
  if  (instrument = 'Guralp CMG-3ESP 120s')   or
      (instrument = 'Guralp CMG-3T 120s')     or
      (instrument = 'Guralp CMG-1T 120s')     then instrument := 'G120      ';
  if  (instrument = 'Guralp CMG-3T 360s')     or
      (instrument = 'Guralp CMG-1T 360s')     then instrument := 'G360      ';
  if  (instrument = 'LE-3Dlite 1s')           then instrument := 'LE3D1     ';
  if  (instrument = 'LE-3D 5s')               then instrument := 'LE3D5     ';
  if  (instrument = 'LE-3D 20s')              then instrument := 'LE3D20    ';
  if  (instrument = 'VE-53')                  then instrument := 'VE53      ';
  if  (instrument = 'L-22 3D')                then instrument := 'L22       ';
  if  (instrument = 'SMOL 10s')               then instrument := 'SMOL10    ';

  if instrument = 'STS1      ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech, prepoctu je na hertzy}
    {z clanku: Fels, J.-F. and Berger, J., 1994: Parametric analysis and calibration of the STS-1 seismometer of the IRIS/IDA Seismographic Network
               BULLETIN OF THE SEISMOLOGICAL SOCIETY OF AMERICA, Vol. 84, No. 5, pp: 1580-1592 }
    Afactor := 10000000;
{   pol[ 1] := VarComplexCreate(  -0.0019705201 /(2*pi),  -0.0019655449 /(2*pi));
    pol[ 2] := VarComplexCreate(  -0.0019705201 /(2*pi),   0.0019655449 /(2*pi));
    pol[ 3] := VarComplexCreate(  -0.023710732  /(2*pi),   0.0                 );
    pol[ 4] := VarComplexCreate(  -0.024949887  /(2*pi),   0.0                 );
    pol[ 5] := VarComplexCreate(  -6.513840     /(2*pi),  -8.6397277    /(2*pi));
    pol[ 6] := VarComplexCreate(  -6.513840     /(2*pi),   8.6397277    /(2*pi));
    pol[ 7] := VarComplexCreate( -12.5          /(2*pi),   0.0          /(2*pi));
    pol[ 8] := VarComplexCreate( -70.0          /(2*pi),   0.0          /(2*pi));
    pol[ 9] := VarComplexCreate( -48.3          /(2*pi), -12.93         /(2*pi));
    pol[10] := VarComplexCreate( -48.3          /(2*pi),  12.93         /(2*pi));
    pol[11] := VarComplexCreate( -35.33553      /(2*pi), -35.33553      /(2*pi));
    pol[12] := VarComplexCreate( -35.33553      /(2*pi),  35.33553      /(2*pi));
    pol[13] := VarComplexCreate( -12.93         /(2*pi), -48.3          /(2*pi));
    pol[14] := VarComplexCreate( -12.93         /(2*pi),  48.3          /(2*pi));
    nul[1] := VarComplexCreate(   0.0                  ,  0.0           );
    nul[2] := VarComplexCreate(   0.0                  ,  0.0           );
    nul[3] := VarComplexCreate(  -0.024271845 /(2*pi)  ,  0.0           );
    nul[4] := VarComplexCreate(  -0.024271845 /(2*pi)  ,  0.0           );
    nul[5] := VarComplexCreate( -12.76        /(2*pi)  ,  0.0           );
    numofnules := 5;
    numofpoles := 14;}
    {poly a nuly podle IRIS stranky http://www.iris.edu/NRL/sensors/streckeisen/RESP.XX.NS088..BHZ.STS1.360.2400
    s doplnenim podle Honzy Zednika - telefonicka konzultace, precetl mi to z manualu}
    pol[1].re :=    -0.01234134 /(2*pi); //  0.00196
    pol[1].im :=    +0.01234134 /(2*pi);
    pol[2].re :=    -0.01234134 /(2*pi);
    pol[2].im :=    -0.01234134 /(2*pi);
    pol[3].re :=   -39.18       /(2*pi);  // 6.23569
    pol[3].im :=   +49.12       /(2*pi);
    pol[4].re :=   -39.18       /(2*pi);
    pol[4].im :=   -49.12       /(2*pi);
    nul[1].re :=     0.0;
    nul[1].im :=     0.0;
    nul[2].re :=     0.0;
    nul[2].im :=     0.0;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 360; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro STS1}

  if instrument = 'STS1 alter' then begin
    Afactor := 10000000;
    {podle Tommaso, co dostal pro stanici TRI}
    pol[1].re :=    -0.0123412 /(2*pi); //  0.00196
    pol[1].im :=    +0.0123415 /(2*pi);
    pol[2].re :=    -0.0123412 /(2*pi);
    pol[2].im :=    -0.0123415 /(2*pi);
    pol[3].re :=   -19.5878    /(2*pi);  // 6.23569
    pol[3].im :=   +24.5617    /(2*pi);
    pol[4].re :=   -19.5878    /(2*pi);
    pol[4].im :=   -24.5617    /(2*pi);
    nul[1].re :=     0.0;
    nul[1].im :=     0.0;
    nul[2].re :=     0.0;
    nul[2].im :=     0.0;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 360; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro STS1alter}

  if instrument = 'STS2      ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech, prepoctu je na hertzy
    viz http://www.passcal.nmt.edu/instrumentation/Sensor/Response/sts2.html}
    Afactor := 10000000;
    pol[1].re :=   -0.03701 /(2*pi);   // = 0.00589032 HZ == 169.7699 sec,,, alter: 0,035647 rad == 0.00567 Hz == 176.2612 sec
    pol[1].im :=   +0.03701 /(2*pi);
    pol[2].re :=   -0.03701 /(2*pi);
    pol[2].im :=   -0.03701 /(2*pi);
    pol[3].re := -251.3     /(2*pi);
    pol[3].im :=   -0.0            ;
    pol[4].re := -131.0     /(2*pi);
    pol[4].im := +467.3     /(2*pi);
    pol[5].re := -131.0     /(2*pi);
    pol[5].im := -467.3     /(2*pi);
    nul[1].re :=    0.0            ;
    nul[1].im :=    0.0            ;
    nul[2].re :=    0.0            ;
    nul[2].im :=    0.0            ;
    numofnules := 2;
    numofpoles := 5;
    Teigen := 120; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro STS2 120s}

  if instrument = 'STS2-2g   ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech, prepoctu je na hertzy
    viz https://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes#sts2_gen2}
    Afactor := 10000000;
    pol[1].re :=   -6910.0   /(2*pi);
    pol[1].im :=   +9210.0   /(2*pi);
    pol[2].re :=   -6910.0   /(2*pi);
    pol[2].im :=   -9210.0   /(2*pi);
    pol[3].re :=   -6230.0   /(2*pi);
    pol[3].im :=       0.0          ;
    pol[4].re :=   -4940.0   /(2*pi);
    pol[4].im :=   +4710.0   /(2*pi);
    pol[5].re :=   -4940.0   /(2*pi);
    pol[5].im :=   -4710.0   /(2*pi);
    pol[6].re :=   -1390.0   /(2*pi);
    pol[6].im :=       0.0          ;
    pol[7].re :=    -557.0   /(2*pi);
    pol[7].im :=     +60.1   /(2*pi);
    pol[8].re :=    -557.0   /(2*pi);
    pol[8].im :=     -60.1   /(2*pi);
    pol[9].re :=     -98.4   /(2*pi);
    pol[9].im :=    +443.0   /(2*pi);
    pol[10].re :=    -98.4   /(2*pi);
    pol[10].im :=   -443.0   /(2*pi);
    pol[11].re :=    -11.0   /(2*pi);
    pol[11].im :=      0.0          ;
    pol[12].re :=     -0.037 /(2*pi);
    pol[12].im :=     +0.037 /(2*pi);
    pol[13].re :=     -0.037 /(2*pi);
    pol[13].im :=     -0.037 /(2*pi);
    pol[14].re :=   -255.0   /(2*pi);
    pol[14].im :=      0.0          ;
    nul[1].re :=       0.0          ;
    nul[1].im :=       0.0          ;
    nul[2].re :=       0.0          ;
    nul[2].im :=       0.0          ;
    nul[3].re :=   -5910.0   /(2*pi);       //  940.606
    nul[3].im :=   +3410.0   /(2*pi);       //  542.718
    nul[4].re :=   -5910.0   /(2*pi);
    nul[4].im :=   -3410.0   /(2*pi);
    nul[5].re :=    -684.0   /(2*pi);       //  108.862
    nul[5].im :=    +176.0   /(2*pi);       //   28.0113
    nul[6].re :=    -684.0   /(2*pi);
    nul[6].im :=    -176.0   /(2*pi);
    nul[7].re :=    -555.0   /(2*pi);       //  88.331
    nul[7].im :=       0.0          ;
    nul[8].re :=    -295.0   /(2*pi);       //  46.9507
    nul[8].im :=       0.0          ;
    nul[9].re :=     -10.8   /(2*pi);       //   1.71887
    nul[9].im :=       0.0          ;
    numofnules := 9;
    numofpoles := 14;
    Teigen := 120; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro STS2 120s 2 generation}

  if instrument = 'STS2-3g   ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech, prepoctu je na hertzy
    viz https://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes#sts2_gen3}
    Afactor := 10000000;
    pol[1].re :=   -13300.0   /(2*pi);     // =  2116.76074
    pol[1].im :=        0.0          ;
    pol[2].re :=   -10500.0   /(2*pi);     // =  1671.12690
    pol[2].im :=   +10100.0   /(2*pi);     // =  1607.46492
    pol[3].re :=   -10500.0   /(2*pi);
    pol[3].im :=   -10100.0   /(2*pi);
    pol[4].re :=     -520.0   /(2*pi);     // =  82.7605704
    pol[4].im :=        0.0          ;
    pol[5].re :=     -375.0   /(2*pi);     // =  59.6831036
    pol[5].im :=        0.0          ;
    pol[6].re :=      -97.3   /(2*pi);     // =  15.4857759
    pol[6].im :=     +401.0   /(2*pi);     // =  63.8211321
    pol[7].re :=      -97.3   /(2*pi);
    pol[7].im :=     -401.0   /(2*pi);
    pol[8].re :=      -15.6   /(2*pi);     // =  2.48281711
    pol[8].im :=        0.0          ;
    pol[9].re :=       -0.037 /(2*pi);     // =  0.00588873
    pol[9].im :=       +0.037 /(2*pi);
    pol[10].re :=      -0.037 /(2*pi);
    pol[10].im :=      -0.037 /(2*pi);
    pol[11].re :=    -255.0   /(2*pi);     // =  40.5845104
    pol[11].im :=       0.0          ;
    nul[1].re :=        0.0          ;
    nul[1].im :=        0.0          ;
    nul[2].re :=        0.0          ;
    nul[2].im :=        0.0          ;
    nul[3].re :=     -463.0   /(2*pi);     // =  73.6887386
    nul[3].im :=     +431.0   /(2*pi);     // =  68.5957804
    nul[4].re :=     -463.0   /(2*pi);
    nul[4].im :=     -431.0   /(2*pi);
    nul[5].re :=     -177.0   /(2*pi);     // =  28.1704249
    nul[5].im :=        0.0          ;
    nul[6].re :=      -15.2   /(2*pi);     // =  2.41915513
    nul[6].im :=        0.0          ;
    numofnules := 6;
    numofpoles := 11;
    Teigen := 120; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro STS2 120s 3 generation}

  if instrument = 'STS25     ' then begin
    {Poles and zeros from dataless SEED files for permanent stations SQTA, WATA, MOTA}
    Afactor := 10000000;
    pol[1].re :=   -0.03702/(2*pi);
    pol[1].im :=   +0.03702/(2*pi);
    pol[2].re :=   -0.03702/(2*pi);
    pol[2].im :=   -0.03702/(2*pi);
    pol[3].re :=  -16.041  /(2*pi);
    pol[3].im :=   +0.0           ;
    pol[4].re :=  -16.041  /(2*pi);
    pol[4].im :=   +0.0           ;
    pol[5].re := -327.354  /(2*pi);
    pol[5].im :=  -74.1416 /(2*pi);
    pol[6].re := -327.354  /(2*pi);
    pol[6].im :=  +74.1416 /(2*pi);
    pol[7].re := -973.894  /(2*pi);
    pol[7].im :=    0.0           ;
    nul[1].re :=    0.0           ;
    nul[1].im :=    0.0           ;
    nul[2].re :=    0.0           ;
    nul[2].im :=    0.0           ;
    nul[3].re :=  -15.708  /(2*pi);
    nul[3].im :=    0.0           ;
    nul[4].re :=  -15.708  /(2*pi);
    nul[4].im :=    0.0           ;
    nul[5].re := -630.203  /(2*pi);
    nul[5].im :=    0.0           ;
    nul[6].re := -556.062  /(2*pi);
    nul[6].im := -936.195  /(2*pi);
    nul[7].re := -556.062  /(2*pi);
    nul[7].im := +936.195  /(2*pi);
    nul[8].re := -973.894  /(2*pi);
    nul[8].im :=    0.0           ;
    numofnules := 8;
    numofpoles := 7;
    Teigen := 120; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro STS2.5 120s}

  if instrument = 'STS2 120s +ZERO integ' then begin
    {integrace STS2, tedy vyrabim displacement}
    Afactor := 10000000;
    pol[1].re :=   -0.03701/(2*pi);
    pol[1].im :=   +0.03701/(2*pi);
    pol[2].re :=   -0.03701/(2*pi);
    pol[2].im :=   -0.03701/(2*pi);
    pol[3].re := -251.3    /(2*pi);
    pol[3].im :=    0.0           ;
    pol[4].re := -131.0    /(2*pi);
    pol[4].im := +467.3    /(2*pi);
    pol[5].re := -131.0    /(2*pi);
    pol[5].im := -467.3    /(2*pi);
    nul[1].re :=    0.0           ;
    nul[1].im :=    0.0           ;
    nul[2].re :=    0.0           ;
    nul[2].im :=    0.0           ;
    nul[3].re :=    0.0           ;
    nul[3].im :=    0.0           ;
    numofnules := 3;
    numofpoles := 5;
    Teigen := 120; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro STS2 - integrace}

  if instrument = 'STS2 120s -ZERO deriv' then begin
    {derivace STS2, tedy vyrabim acceleration}
    Afactor := 10000000;
    pol[1].re :=   -0.03701/(2*pi);
    pol[1].im :=   +0.03701/(2*pi);
    pol[2].re :=   -0.03701/(2*pi);
    pol[2].im :=   -0.03701/(2*pi);
    pol[3].re := -251.3    /(2*pi);
    pol[3].im :=    0.0           ;
    pol[4].re := -131.0    /(2*pi);
    pol[4].im := +467.3    /(2*pi);
    pol[5].re := -131.0    /(2*pi);
    pol[5].im := -467.3    /(2*pi);
    nul[1].re :=    0.0           ;
    nul[1].im :=    0.0           ;
    numofnules := 1;
    numofpoles := 5;
    Teigen := 120; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro STS2 - derivace}

  if instrument = 'RT60A     ' then begin
    Afactor := 10000000;
    pol[1].re :=    -0.07403687 /(2*pi);
    pol[1].im :=    +0.07405923 /(2*pi);
    pol[2].re :=    -0.07403687 /(2*pi);
    pol[2].im :=    -0.07405923 /(2*pi);
    pol[3].re :=  -180.3307     /(2*pi);
    pol[3].im :=  +189.9224     /(2*pi);
    pol[4].re :=  -180.3307     /(2*pi);
    pol[4].im :=  -189.9224     /(2*pi);
    pol[5].re :=   -20.95807    /(2*pi);
    pol[5].im :=     0.0               ;
    pol[6].re :=  -772.03       /(2*pi);
    pol[6].im :=     0.0               ;
    nul[1].re :=     0.0               ;
    nul[1].im :=     0.0               ;
    nul[2].re :=     0.0               ;
    nul[2].im :=     0.0               ;
    nul[3].re :=   -18.17998    /(2*pi);
    nul[3].im :=     0.0               ;
    numofnules := 3;
    numofpoles := 6;
    Teigen := 60; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro RT 60 s A - stary typ}

  if instrument = 'RT60Bold  ' then begin
    Afactor := 10000000;
    pol[1].re :=    -0.07405 /(2*pi);    // 0.01178
    pol[1].im :=    +0.07405 /(2*pi);
    pol[2].re :=    -0.07405 /(2*pi);
    pol[2].im :=    -0.07405 /(2*pi);
    pol[3].re :=  -177.72    /(2*pi);    // 28.28
    pol[3].im :=  +177.72    /(2*pi);
    pol[4].re :=  -177.72    /(2*pi);
    pol[4].im :=  -177.72    /(2*pi);
    nul[1].re :=     0.0            ;
    nul[1].im :=     0.0            ;
    nul[2].re :=     0.0            ;
    nul[2].im :=     0.0            ;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 60; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro RT 60 s B - starsi typ modelu B}

  if instrument = 'RT60Bnew  ' then begin
    Afactor := 10000000;
    pol[1].re :=    -0.07405 /(2*pi);   // 0.01178
    pol[1].im :=    +0.07405 /(2*pi);
    pol[2].re :=    -0.07405 /(2*pi);
    pol[2].im :=    -0.07405 /(2*pi);
    pol[3].re :=  -222.14    /(2*pi);   // 35.35
    pol[3].im :=  +222.14    /(2*pi);
    pol[4].re :=  -222.14    /(2*pi);
    pol[4].im :=  -222.14    /(2*pi);
    nul[1].re :=     0.0;
    nul[1].im :=     0.0;
    nul[2].re :=     0.0;
    nul[2].im :=     0.0;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 60; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro RT 60 s B - novejsi typ modelu B}

  if instrument = 'RT120     ' then begin
    Afactor := 10000000;
    pol[1].re :=    -0.03702 /(2*pi);   // 0.01178
    pol[1].im :=    +0.03702 /(2*pi);
    pol[2].re :=    -0.03702 /(2*pi);
    pol[2].im :=    -0.03702 /(2*pi);
    pol[3].re :=  -177.72    /(2*pi);   // 35.35
    pol[3].im :=  +177.72    /(2*pi);
    pol[4].re :=  -177.72    /(2*pi);
    pol[4].im :=  -177.72    /(2*pi);
    nul[1].re :=     0.0;
    nul[1].im :=     0.0;
    nul[2].re :=     0.0;
    nul[2].im :=     0.0;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro RT 60 s B - novejsi typ modelu B}

  if instrument = 'KS2000    ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle manualu, ci poslala Lili}
    Afactor := 10000000;
    pol[1].re :=    -0.0444 /(2*pi);
    pol[1].im :=    +0.0444 /(2*pi);
    pol[2].re :=    -0.0444 /(2*pi);
    pol[2].im :=    -0.0444 /(2*pi);
    pol[3].re :=  -222.0    /(2*pi);
    pol[3].im :=  +222.0    /(2*pi);
    pol[4].re :=  -222.0    /(2*pi);
    pol[4].im :=  -222.0    /(2*pi);
    nul[1].re :=     0.0           ;
    nul[1].im :=     0.0           ;
    nul[2].re :=     0.0           ;
    nul[2].im :=     0.0           ;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro KS-2000}

  if instrument = 'KS2000-120' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle IRIS}
    Afactor := 10000000;
    pol[1].re :=    -0.036 /(2*pi);
    pol[1].im :=    +0.038 /(2*pi);
    pol[2].re :=    -0.036 /(2*pi);
    pol[2].im :=    -0.038 /(2*pi);
    pol[3].re :=  -222.0    /(2*pi);
    pol[3].im :=  +222.0    /(2*pi);
    pol[4].re :=  -222.0    /(2*pi);
    pol[4].im :=  -222.0    /(2*pi);
    nul[1].re :=     0.0           ;
    nul[1].im :=     0.0           ;
    nul[2].re :=     0.0           ;
    nul[2].im :=     0.0           ;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro KS-2000-120}

  if instrument = 'KS2000-100' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle IRIS}
    Afactor := 10000000;
    pol[1].re :=    -0.043 /(2*pi);
    pol[1].im :=    +0.046 /(2*pi);
    pol[2].re :=    -0.043 /(2*pi);
    pol[2].im :=    -0.046 /(2*pi);
    pol[3].re :=  -222.0    /(2*pi);
    pol[3].im :=  +222.0    /(2*pi);
    pol[4].re :=  -222.0    /(2*pi);
    pol[4].im :=  -222.0    /(2*pi);
    nul[1].re :=     0.0           ;
    nul[1].im :=     0.0           ;
    nul[2].re :=     0.0           ;
    nul[2].im :=     0.0           ;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 100; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro KS-2000-100}

  if instrument = 'KS2000-060' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle IRIS}
    Afactor := 10000000;
    pol[1].re :=    -0.072 /(2*pi);
    pol[1].im :=    +0.076 /(2*pi);
    pol[2].re :=    -0.072 /(2*pi);
    pol[2].im :=    -0.076 /(2*pi);
    pol[3].re :=  -222.0    /(2*pi);
    pol[3].im :=  +222.0    /(2*pi);
    pol[4].re :=  -222.0    /(2*pi);
    pol[4].im :=  -222.0    /(2*pi);
    nul[1].re :=     0.0           ;
    nul[1].im :=     0.0           ;
    nul[2].re :=     0.0           ;
    nul[2].im :=     0.0           ;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 60; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro KS-2000-060}

  if instrument = 'KS2000-050' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle IRIS}
    Afactor := 10000000;
    pol[1].re :=    -0.086 /(2*pi);
    pol[1].im :=    +0.092 /(2*pi);
    pol[2].re :=    -0.086 /(2*pi);
    pol[2].im :=    -0.092 /(2*pi);
    pol[3].re :=  -222.0    /(2*pi);
    pol[3].im :=  +222.0    /(2*pi);
    pol[4].re :=  -222.0    /(2*pi);
    pol[4].im :=  -222.0    /(2*pi);
    nul[1].re :=     0.0           ;
    nul[1].im :=     0.0           ;
    nul[2].re :=     0.0           ;
    nul[2].im :=     0.0           ;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 50; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro KS-2000-050}

  if instrument = 'KS2000-040' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle IRIS}
    Afactor := 10000000;
    pol[1].re :=    -0.107 /(2*pi);
    pol[1].im :=    +0.115 /(2*pi);
    pol[2].re :=    -0.107 /(2*pi);
    pol[2].im :=    -0.115 /(2*pi);
    pol[3].re :=  -222.0    /(2*pi);
    pol[3].im :=  +222.0    /(2*pi);
    pol[4].re :=  -222.0    /(2*pi);
    pol[4].im :=  -222.0    /(2*pi);
    nul[1].re :=     0.0           ;
    nul[1].im :=     0.0           ;
    nul[2].re :=     0.0           ;
    nul[2].im :=     0.0           ;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 40; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro KS-2000-040}

  if instrument = 'KS2000-030' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle IRIS}
    Afactor := 10000000;
    pol[1].re :=    -0.143 /(2*pi);
    pol[1].im :=    +0.153 /(2*pi);
    pol[2].re :=    -0.143 /(2*pi);
    pol[2].im :=    -0.153 /(2*pi);
    pol[3].re :=  -222.0    /(2*pi);
    pol[3].im :=  +222.0    /(2*pi);
    pol[4].re :=  -222.0    /(2*pi);
    pol[4].im :=  -222.0    /(2*pi);
    nul[1].re :=     0.0           ;
    nul[1].im :=     0.0           ;
    nul[2].re :=     0.0           ;
    nul[2].im :=     0.0           ;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 30; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro KS-2000-030}

  if instrument = 'Kskd30    ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle dseed filu pro stanici ZST}
    Afactor := 10000000;
    pol[1].re :=   -0.0175 /(2*pi);
    pol[1].im :=    0.0    /(2*pi);
    pol[2].re :=   -0.222  /(2*pi);
    pol[2].im :=   +0.22823/(2*pi);
    pol[3].re :=   -0.222  /(2*pi);
    pol[3].im :=   -0.22823/(2*pi);
    pol[4].re :=  -45.241  /(2*pi);
    pol[4].im :=  +31.9386 /(2*pi);
    pol[5].re :=  -45.241  /(2*pi);
    pol[5].im :=  -31.9386 /(2*pi);
    pol[6].re :=  -30.749  /(2*pi);
    pol[6].im :=  +56.7246 /(2*pi);
    pol[7].re :=  -30.749  /(2*pi);
    pol[7].im :=  -56.7246 /(2*pi);
    pol[8].re :=  -50.603  /(2*pi);
    pol[8].im :=  +11.4722 /(2*pi);
    pol[9].re :=  -50.603  /(2*pi);
    pol[9].im :=  -11.4722 /(2*pi);
    nul[1].re :=    0.0           ;
    nul[1].im :=    0.0           ;
    nul[2].re :=    0.0           ;
    nul[2].im :=    0.0           ;
    nul[3].re :=    0.0           ;
    nul[3].im :=    0.0           ;
    numofnules := 3;
    numofpoles := 9;
    Teigen := 20; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Kskd30}

  if instrument = 'MBB2      ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech, prepoctu je na hertzy
    viz http://ds.iris.edu/NRL/sensors/metrozet/RESP.XX.NS480..BHZ.MBB2.120.750}
    Afactor := 10000000;
    pol[1].re :=    -0.037 /(2*pi);   // = 0.00589032 HZ == 169.7699 sec,,, alter: 0,035647 rad == 0.00567 Hz == 176.2612 sec
    pol[1].im :=    +0.037 /(2*pi);
    pol[2].re :=    -0.037 /(2*pi);
    pol[2].im :=    -0.037 /(2*pi);
    pol[3].re :=  -190.0   /(2*pi);
    pol[3].im :=  -620.0   /(2*pi);
    pol[4].re :=  -190.0   /(2*pi);
    pol[4].im :=  +620.0   /(2*pi);
    pol[5].re := -2000.0   /(2*pi);
    pol[5].im := -3000.0   /(2*pi);
    pol[6].re := -2000.0   /(2*pi);
    pol[6].im := +3000.0   /(2*pi);
    nul[1].re :=     0.0          ;
    nul[1].im :=     0.0          ;
    nul[2].re :=     0.0          ;
    nul[2].im :=     0.0          ;
    numofnules := 2;
    numofpoles := 6;
    Teigen := 120; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro MBB2 120s}

  if instrument = 'KS54000   ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle e-mailu, co poslal Klaus Stammler 4.4.2011}
    Afactor := 10000000;
    pol[1].re :=  -89.85    /(2*pi);
    pol[1].im :=    0.0     /(2*pi);
    pol[2].re :=  -18.43    /(2*pi);
    pol[2].im :=  +18.91    /(2*pi);
    pol[3].re :=  -18.43    /(2*pi);
    pol[3].im :=  -18.91    /(2*pi);
    pol[4].re :=   -0.01234 /(2*pi);
    pol[4].im :=   +0.01234 /(2*pi);
    pol[5].re :=   -0.01234 /(2*pi);
    pol[5].im :=   -0.01234 /(2*pi);
    pol[6].re :=   -0.004219/(2*pi);
    pol[6].im :=    0.0     /(2*pi);
    nul[1].re :=    0.0            ;
    nul[1].im :=    0.0            ;
    nul[2].re :=    0.0            ;
    nul[2].im :=    0.0            ;
    nul[3].re :=    0.0            ;
    nul[3].im :=    0.0            ;
    numofnules := 3;
    numofpoles := 6;
    Teigen := 333; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro KS-54000}

  if instrument = 'KS36000   ' then begin {je to nejake divne, jen pro posunuti a zmena nuly nepomuze, radsi to nepouzivam}
    {zadavam poly a nuly pro pristrojovou charakteristiku podle stranky}
    {http://www.fdsn.org/station_book/IU/GRFO/grfo.amp.html}
    {nicmene Klaus Stammler mi potvrdil, ze na GRFo je KS-54000}
    Afactor := 10000000;
    pol[1].re  :=   -4.65  ;
    pol[1].im  :=   +3.46  ;
    pol[2].re  :=   -4.65  ;
    pol[2].im  :=   -3.46  ;
    pol[3].re  :=   -0.118 ;
    pol[3].im  :=   +0.0   ;
    pol[4].re  :=  -40.7   ;
    pol[4].im  :=   +0.0   ;
    pol[5].re  := -100.0   ;
    pol[5].im  :=   +0.0   ;
    pol[6].re  :=   -0.15  ;
    pol[6].im  :=   +0.0   ;
    pol[7].re  := -264.0   ;
    pol[7].im  :=   +0.0   ;
    pol[8].re  :=   -3.93  ;
    pol[8].im  :=   +0.0   ;
    pol[9].re  :=   -0.282 ;
    pol[9].im  :=   +0.0   ;
    pol[10].re :=   -0.201 ;
    pol[10].im :=   +0.241 ;
    pol[11].re :=   -0.201 ;
    pol[11].im :=   -0.241 ;
    pol[12].re :=   -0.134 ;
    pol[12].im :=   +0.1   ;
    pol[13].re :=   -0.134 ;
    pol[13].im :=   -0.1   ;
    pol[14].re :=   -0.0251;
    pol[14].im :=   +0.0   ;
    pol[15].re :=   -0.00924;
    pol[15].im :=   +0.0   ;
    pol[16].re :=   -0.855 ;
    pol[16].im :=   +0.255 ;
    pol[17].re :=   -0.855 ;
    pol[17].im :=   -0.255 ;
    pol[18].re :=   -0.542 ;
    pol[18].im :=   +0.683 ;
    pol[19].re :=   -0.542 ;
    pol[19].im :=   -0.683 ;
    nul[1].re  :=   -0.126 ;
    nul[1].im  :=   +0.0   ;
    nul[2].re  :=  -50.1   ;
    nul[2].im  :=   +0.0   ;
    nul[3].re  :=    0.0   ;
    nul[3].im  :=   +1.05  ;
    nul[4].re  :=    0.0   ;
    nul[4].im  :=   -1.05  ;
    nul[5].re  :=    0.0   ;
    nul[5].im  :=   +0.0   ;
    nul[6].re  :=    0.0   ;
    nul[6].im  :=   +0.0   ;
    nul[7].re  :=    0.0   ;
    nul[7].im  :=   +0.0   ;
    nul[8].re  :=    0.0   ;
    nul[8].im  :=   +0.0   ;
    nul[9].re  :=    0.0   ;
    nul[9].im  :=   +0.0   ;
    nul[10].re :=    0.0   ;
    nul[10].im :=   +0.0   ;
    numofnules := 10;
    numofpoles := 19;
    Teigen := 50; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro KS-36000}

  if instrument = 'T240old   ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle stranek}
    {https://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes#t240gen1}
    Afactor := 10000000;
    pol[1].re :=     -0.01813 /(2*pi);
    pol[1].im :=     +0.01803 /(2*pi);
    pol[2].re :=     -0.01813 /(2*pi);
    pol[2].im :=     -0.01803 /(2*pi);
    pol[3].re :=   -124.9     /(2*pi); //  19.878
    pol[3].im :=     +0.0            ;
    pol[4].re :=   -197.5     /(2*pi); //  31.433
    pol[4].im :=   +256.1     /(2*pi); //  40.7595
    pol[5].re :=   -197.5     /(2*pi);
    pol[5].im :=   -256.1     /(2*pi);
    pol[6].re :=   -569.0     /(2*pi);
    pol[6].im :=  +1150.0     /(2*pi);
    pol[7].re :=   -569.0     /(2*pi);
    pol[7].im :=  -1150.0     /(2*pi);
    nul[1].re :=      0.0            ;
    nul[1].im :=     +0.0            ;
    nul[2].re :=      0.0            ;
    nul[2].im :=     +0.0            ;
    nul[3].re :=    -90.0     /(2*pi);
    nul[3].im :=     +0.0            ;
    nul[4].re :=   -164.2     /(2*pi);
    nul[4].im :=     +0.0            ;
    nul[5].re :=  -3203.0     /(2*pi);
    nul[5].im :=     +0.0            ;
    numofnules := 5;
    numofpoles := 7;
    Teigen := 240; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium 240old 240s}

  if instrument = 'T240new   ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle stranek}
    {https://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes#t240gen2}
    Afactor := 10000000;
    pol[1].re :=     -0.0177 /(2*pi);
    pol[1].im :=     +0.0176 /(2*pi);
    pol[2].re :=     -0.0177 /(2*pi);
    pol[2].im :=     -0.0176 /(2*pi);
    pol[3].re :=   -126.7    /(2*pi);
    pol[3].im :=     +0.0           ;
    pol[4].re :=   -192.0    /(2*pi);
    pol[4].im :=   +259.1    /(2*pi);
    pol[5].re :=   -192.0    /(2*pi);
    pol[5].im :=   -259.1    /(2*pi);
    pol[6].re :=   -557.7    /(2*pi);
    pol[6].im :=  +1143.0    /(2*pi);
    pol[7].re :=   -557.7    /(2*pi);
    pol[7].im :=  -1143.0    /(2*pi);
    nul[1].re :=      0.0           ;
    nul[1].im :=     +0.0           ;
    nul[2].re :=      0.0           ;
    nul[2].im :=     +0.0           ;
    nul[3].re :=    -91.66   /(2*pi);
    nul[3].im :=     +0.0           ;
    nul[4].re :=   -160.1    /(2*pi);
    nul[4].im :=     +0.0           ;
    nul[5].re :=  -3207.0    /(2*pi);
    nul[5].im :=     +0.0           ;
    numofnules := 5;
    numofpoles := 7;
    Teigen := 240; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium 240new 240s}

  if instrument = 'T120      ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle stranek}
    {http://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes#t120pa}
    Afactor := 10000000;
    pol[1].re :=    -0.03852 /(2*pi); // = 0.0061306
    pol[1].im :=    +0.03658 /(2*pi);
    pol[2].re :=    -0.03852 /(2*pi);
    pol[2].im :=    -0.03658 /(2*pi);
    pol[3].re :=  -178.0     /(2*pi);
    pol[3].im :=     0.0            ;
    pol[4].re :=  -135.0     /(2*pi);
    pol[4].im :=  +160.0     /(2*pi);
    pol[5].re :=  -135.0     /(2*pi);
    pol[5].im :=  -160.0     /(2*pi);
    pol[6].re :=  -671.0     /(2*pi);
    pol[6].im := +1154.0     /(2*pi);
    pol[7].re :=  -671.0     /(2*pi);
    pol[7].im := -1154.0     /(2*pi);
    nul[1].re :=     0.0            ;
    nul[1].im :=     0.0            ;
    nul[2].re :=     0.0            ;
    nul[2].im :=     0.0            ;
    nul[3].re :=   -90.0     /(2*pi); // =  14.3239
    nul[3].im :=     0.0            ;
    nul[4].re :=  -160.7     /(2*pi); // =  25.4648
    nul[4].im :=     0.0            ;
    nul[5].re := -3108.0     /(2*pi); // = 494.6536
    nul[5].im :=     0.0            ;
    numofnules := 5;
    numofpoles := 7;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium 120 P/PA 120s}

  if instrument = 'T120Q     ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v hertzech podle dataless SEEDu pro french Z3 stanice}
    Afactor := -10000000;
    pol[1].re :=      -0.0058273 ;        // *2*pi = -0.03661400 // xml = -0.036614
    pol[1].im :=      +0.0058981 ;        // *2*pi = +0.03705885 // xml = +0.037059
    pol[2].re :=      -0.0058273 ;
    pol[2].im :=      -0.0058981 ;
    pol[3].re :=      -5.1805    ;
    pol[3].im :=       0.0       ;
    pol[4].re :=     -22.6       ;
    pol[4].im :=       0.0       ;
    pol[5].re :=     -57.9324    ;
    pol[5].im :=     +64.2986    ;
    pol[6].re :=     -57.9324    ;
    pol[6].im :=     -64.2986    ;
    pol[7].re :=    -200.535     ;
    pol[7].im :=       0.0       ;
    pol[8].re :=    -779.859     ;
    pol[8].im :=    +828.242     ;
    pol[9].re :=    -779.859     ;
    pol[9].im :=    -828.242     ;
    pol[10].re :=  -1130.0       ;
    pol[10].im :=   +270.563     ;
    pol[11].re :=  -1130.0       ;
    pol[11].im :=   -270.563     ;
    nul[1].re :=      0.0        ;
    nul[1].im :=      0.0        ;
    nul[2].re :=      0.0        ;
    nul[2].im :=      0.0        ;
    nul[3].re :=     -5.03407    ;        // *2*pi =  -31.62999465 // xml =  -31,63
    nul[3].im :=      0.0        ;
    nul[4].re :=    -25.4648     ;        // *2*pi = -160.000057   // xml = -160,00
    nul[4].im :=      0.0        ;
    nul[5].re :=    -55.7042     ;        // *2*pi = -349.999810   // xml = -350,00
    nul[5].im :=      0.0        ;
    nul[6].re :=    505.635      ;        // *2*pi = 3176.998402   // xml = -3177,0    TADY SE TO LISI ZNAMENKEM
    nul[6].im :=      0.0        ;
    numofnules := 6;
    numofpoles := 11;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium 120Q/QA}

  if instrument = 'T120PH    ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle dataless stanice FR.LBL ze stranek RESIF a zkontrolovanu podle NRL IRIS}
    {T120PH ma uplne stejnou charakteristiku jako T120Q/QA, viz vyse}
    Afactor := 10000000;
    pol[1].re :=      -0.036614 /(2*pi); {= -0.0058273}
    pol[1].im :=      +0.037059 /(2*pi);
    pol[2].re :=      -0.036614 /(2*pi);
    pol[2].im :=      -0.037059 /(2*pi);
    pol[3].re :=     -32.55     /(2*pi);
    pol[3].im :=       0.0             ;
    pol[4].re :=    -142.0      /(2*pi);
    pol[4].im :=       0.0             ;
    pol[5].re :=    -364.0      /(2*pi);
    pol[5].im :=    +404.0      /(2*pi);
    pol[6].re :=    -364.0      /(2*pi);
    pol[6].im :=    -404.0      /(2*pi);
    pol[7].re :=   -1260.0      /(2*pi);
    pol[7].im :=       0.0             ;
    pol[8].re :=   -4900.0      /(2*pi);
    pol[8].im :=   +5204.0      /(2*pi);
    pol[9].re :=   -4900.0      /(2*pi);
    pol[9].im :=   -5204.0      /(2*pi);
    pol[10].re :=  -7100.0      /(2*pi);
    pol[10].im :=  +1700.0      /(2*pi);
    pol[11].re :=  -7100.0      /(2*pi);
    pol[11].im :=  -1700.0      /(2*pi); {= -270.563}
    nul[1].re :=       0.0             ;
    nul[1].im :=       0.0             ;
    nul[2].re :=       0.0             ;
    nul[2].im :=       0.0             ;
    nul[3].re :=    -31.63      /(2*pi);
    nul[3].im :=      0.0              ;
    nul[4].re :=   -160.0       /(2*pi);
    nul[4].im :=      0.0              ;
    nul[5].re :=   -350.0       /(2*pi);
    nul[5].im :=      0.0              ;
    nul[6].re :=  -3177.0       /(2*pi);
    nul[6].im :=      0.0              ;
    numofnules := 6;
    numofpoles := 11;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium 120s Posthole}

  if instrument = 'Tcom120   ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle stranek}
    {http://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes#tcompact}
    Afactor := 10000000;
    pol[1].re :=    -0.03691 /(2*pi);  {= -0.00587 Hz }
    pol[1].im :=    -0.03712 /(2*pi);
    pol[2].re :=    -0.03691 /(2*pi);
    pol[2].im :=    +0.03712 /(2*pi);
    pol[3].re :=  -371.2     /(2*pi);  {= -59.08 Hz}
    pol[3].im :=     0.0            ;
    pol[4].re :=  -373.9     /(2*pi);  {= -59.51 Hz}
    pol[4].im :=  +475.5     /(2*pi);  {= +75.68 Hz}
    pol[5].re :=  -373.9     /(2*pi);
    pol[5].im :=  -475.5     /(2*pi);
    pol[6].re :=  -588.4     /(2*pi);  {= -93.65 Hz}
    pol[6].im := +1508.0     /(2*pi);  {= 240.006 Hz}
    pol[7].re :=  -588.4     /(2*pi);
    pol[7].im := -1508.0     /(2*pi);
    nul[1].re :=     0.0            ;
    nul[1].im :=     0.0            ;
    nul[2].re :=     0.0            ;
    nul[2].im :=     0.0            ;
    nul[3].re :=  -434.1     /(2*pi);  {= -69.09 Hz}
    nul[3].im :=     0.0            ;
    numofnules := 3;
    numofpoles := 7;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium Compact 120s}

  if instrument = 'Tcom120man' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle stranek}
    {http://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes#tcompact}
    Afactor := 10000000;
    pol[1].re :=      -0.03691 /(2*pi); {= -}
    pol[1].im :=      +0.03702 /(2*pi);
    pol[2].re :=      -0.03691 /(2*pi);
    pol[2].im :=      -0.03702 /(2*pi);
    pol[3].re :=    -343.0     /(2*pi);
    pol[3].im :=       0.0             ;
    pol[4].re :=    -370.0      /(2*pi);
    pol[4].im :=    +467.0             ;
    pol[5].re :=    -370.0      /(2*pi);
    pol[5].im :=    -467.0      /(2*pi);
    pol[6].re :=    -836.0      /(2*pi);
    pol[6].im :=   +1522.0      /(2*pi);
    pol[7].re :=    -836.0      /(2*pi);
    pol[7].im :=   -1522.0             ;
    pol[8].re :=   -4900.0      /(2*pi);
    pol[8].im :=   +4700.0      /(2*pi);
    pol[9].re :=   -4900.0      /(2*pi);
    pol[9].im :=   -4700.0      /(2*pi);
    pol[10].re :=  -6900.0      /(2*pi);
    pol[10].im :=      0.0      /(2*pi);
    pol[11].re := -15000.0      /(2*pi);
    pol[11].im :=      0.0      /(2*pi); {= -270.563}
    nul[1].re :=       0.0             ;
    nul[1].im :=       0.0             ;
    nul[2].re :=       0.0             ;
    nul[2].im :=       0.0             ;
    nul[3].re :=    -392.0      /(2*pi);
    nul[3].im :=      0.0              ;
    nul[4].re :=  -1960.0       /(2*pi);
    nul[4].im :=      0.0              ;
    nul[5].re :=  -1490.0       /(2*pi);
    nul[5].im :=  +1740.0              ;
    nul[6].re :=  -1490.0       /(2*pi);
    nul[6].im :=  -1740.0              ;
    numofnules := 6;
    numofpoles := 11;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium Compact 120s MANUAL primo od Nanometrics}

  if instrument = 'T40       ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle stranek}
    {http://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes#t40}
    Afactor := 10000000;
    pol[1].re :=    -241.0    /(2*pi);
    pol[1].im :=    -178.0    /(2*pi);
    pol[2].re :=    -241.0    /(2*pi);
    pol[2].im :=    +178.0    /(2*pi);
    pol[3].re :=     -53.5    /(2*pi);
    pol[3].im :=    -719.0    /(2*pi);
    pol[4].re :=     -53.5    /(2*pi);
    pol[4].im :=    +719.0    /(2*pi);
    pol[5].re :=     -86.3    /(2*pi);
    pol[5].im :=       0.0    /(2*pi);
    pol[6].re :=      -0.1103 /(2*pi);
    pol[6].im :=      +0.111  /(2*pi);
    pol[7].re :=      -0.1103 /(2*pi);
    pol[7].im :=      -0.111  /(2*pi);
    nul[1].re :=       0.0           ;
    nul[1].im :=       0.0           ;
    nul[2].re :=       0.0           ;
    nul[2].im :=       0.0           ;
    nul[3].re :=     -68.8    /(2*pi);
    nul[3].im :=       0.0           ;
    nul[4].re :=    -323.0    /(2*pi);
    nul[4].im :=       0.0           ;
    nul[5].re :=   -2530.0    /(2*pi);
    nul[5].im :=       0.0           ;
    numofnules := 5;
    numofpoles := 7;
    Teigen := 40; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium 40s}

  if instrument = 'T40alter  ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle XML pro francouzske stanice, kde se tenhle set PaZ dost vyskytuje}
    Afactor := 10000000;
    pol[1].re :=    -0.1111  /(2*pi);
    pol[1].im :=    +0.1111  /(2*pi);
    pol[2].re :=    -0.1111  /(2*pi);
    pol[2].im :=    -0.1111  /(2*pi);
    pol[3].re :=  -172.79    /(2*pi);
    pol[3].im :=  +262.37    /(2*pi);
    pol[4].re :=  -172.79    /(2*pi);
    pol[4].im :=  -262.37    /(2*pi);
    nul[1].re :=       0.0          ;
    nul[1].im :=       0.0          ;
    nul[2].re :=       0.0          ;
    nul[2].im :=       0.0          ;
    numofnules := 2;
    numofpoles := 4;
    Teigen := 40; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium 40s}

  if instrument = 'T20       ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v radianech podle stranek}
    {https://ds.iris.edu/NRL/sensors/nanometrics/RESP.XX.NS348..BHZ.TrilliumCompact.20.753}
    Afactor := 10000000;
    pol[1].re :=      -0.2214 /(2*pi); {= 0.03524 Hz}
    pol[1].im :=       0.2221 /(2*pi);
    pol[2].re :=      -0.2214 /(2*pi);
    pol[2].im :=      -0.2221 /(2*pi);
    pol[3].re :=    -343.0    /(2*pi); {= 54.59 Hz}
    pol[3].im :=       0.0           ;
    pol[4].re :=    -370.0    /(2*pi); {= 58.89 Hz}
    pol[4].im :=     467.0    /(2*pi);
    pol[5].re :=    -370.0    /(2*pi);
    pol[5].im :=    -467.0    /(2*pi);
    pol[6].re :=    -836.0    /(2*pi); {= 133.0 Hz}
    pol[6].im :=    1522.0    /(2*pi); {= 242.2 Hz}
    pol[7].re :=    -836.0    /(2*pi);
    pol[7].im :=   -1522.0    /(2*pi);
    pol[8].re :=   -4900.0    /(2*pi);
    pol[8].im :=    4700.0    /(2*pi);
    pol[9].re :=   -4900.0    /(2*pi);
    pol[9].im :=   -4700.0    /(2*pi);
    pol[10].re :=  -6900.0    /(2*pi);
    pol[10].im :=      0.0    /(2*pi);
    pol[11].re := -15000.0    /(2*pi);
    pol[11].im :=      0.0    /(2*pi);
    nul[1].re :=       0.0           ;
    nul[1].im :=       0.0           ;
    nul[2].re :=       0.0           ;
    nul[2].im :=       0.0           ;
    nul[3].re :=    -392.0    /(2*pi);
    nul[3].im :=       0.0           ;
    nul[4].re :=   -1960.0    /(2*pi);
    nul[4].im :=       0.0           ;
    nul[5].re :=   -1490.0    /(2*pi);
    nul[5].im :=    1740.0    /(2*pi);
    nul[6].re :=   -1490.0    /(2*pi);
    nul[6].im :=   -1740.0    /(2*pi);
    numofnules := 6;
    numofpoles := 11;
    Teigen := 20; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Trillium Compact 20s}

  if instrument = 'G10       ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku primo v hertzech podle calibration sheet co poslala Sheila Peacock e-mailem}
    Afactor := 10000000;
    pol[1].re := -505.7964 ;
    pol[1].im := +193.5221 ;
    pol[2].re := -505.7964 ;
    pol[2].im := -193.5221 ;
    pol[3].re :=   -0.04442;    // *2*pi = 0.279
    pol[3].im :=   +0.04442;
    pol[4].re :=   -0.04442;
    pol[4].im :=   -0.04442;
    nul[1].re :=  945.6194 ;
    nul[1].im :=    0.0    ;
    nul[2].re :=    0.0    ;
    nul[2].im :=    0.0    ;
    nul[3].re :=    0.0    ;
    nul[3].im :=    0.0    ;
    numofnules := 3;
    numofpoles := 4;
    Teigen := 10; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 10s}

  if instrument = 'G20       ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku primo v hertzech podle calibration sheet co poslala Sheila Peacock e-mailem}
    Afactor := 10000000;
    pol[1].re := -149.0     ;
    pol[1].im :=    0.0     ;
    pol[2].re :=  -88.0     ;
    pol[2].im :=    0.0     ;
    pol[3].re :=   -0.03535 ;  // *2*pi =  0.222110
    pol[3].im :=   +0.03535 ;
    pol[4].re :=   -0.03535 ;
    pol[4].im :=   -0.03535 ;
    nul[1].re :=  122.4     ;   // *2*pi =  769.06188
    nul[1].im := +116.0     ;
    nul[2].re :=  122.4     ;
    nul[2].im := -116.0     ;
    nul[3].re :=    0.0     ;
    nul[3].im :=    0.0     ;
    nul[4].re :=    0.0     ;
    nul[4].im :=    0.0     ;
    numofnules := 4;
    numofpoles := 4;
    Teigen := 20; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 20s}

  if instrument = 'G30       ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku primo v hertzech podle guralpiho navodu v calibration sheet}
    Afactor := 10000000; {tady musi byt PLUS, klasicky}
    pol[1].re :=   -80.0    ;                     // * 2 * pi = 502.65
    pol[1].im :=     0.0    ;  {-80.05493637}
    pol[2].re :=  -160.0    ;                     // * 2 * pi = 1005.309
    pol[2].im :=     0.0    ;  {-160.7464925}
    pol[3].re :=  -180.0    ;                     // * 2 * pi = 1130.97
    pol[3].im :=     0.0    ;  {-179.8450857}
    pol[4].re :=    -0.02365;                     // * 2 * pi = 0.1485
    pol[4].im :=    +0.02365;  {-0.023714086}
    pol[5].re :=    -0.02365;
    pol[5].im :=    -0.02365;
    nul[1].re :=     0.0    ;
    nul[1].im :=     0.0    ;
    nul[2].re :=     0.0    ;
    nul[2].im :=     0.0    ;
    numofnules := 2;
    numofpoles := 5;
    Teigen := 30; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 30s}

  if instrument = 'G30alter  ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku primo v hertzech podle guralpiho navodu, ktery jsem nasel nekdy na strankach, ale uz ho nemuzu najit znova}
    Afactor := -10000000; {tady musi byt MINUS, je to nejaky system polu a nul, kdy musi byt tahle konstanta zaporna}
    pol[1].re :=   -0.02365;
    pol[1].im :=   +0.02365;
    pol[2].re :=   -0.02365;
    pol[2].im :=   -0.02365;
    pol[3].re :=  -50.0    ;
    pol[3].im :=    0.0    ;
    nul[1].re :=    0.0    ;
    nul[1].im :=    0.0    ;
    nul[2].re :=    0.0    ;
    nul[2].im :=    0.0    ;
    nul[3].re :=  159.0    ;
    nul[3].im :=    0.0    ;
    numofnules := 3;
    numofpoles := 3;
    Teigen := 30; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 30s alternativne}

  if instrument = 'G30pascal ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku v hertzech podle navodu na
    http://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes/#cmg_40t}
    {je to vicemene uplne stejne, jako to, co je v calibration sheet}
    Afactor := 10000000;
    pol[1].re :=   -80.05493637 ;                     // *2*pi =  502.9999
    pol[1].im :=     0.0        ;  {-80.05493637}
    pol[2].re :=  -160.7464925  ;                     // *2*pi = 1009.9999
    pol[2].im :=     0.0        ;  {-160.7464925}
    pol[3].re :=  -179.8450857  ;                     // *2*pi = 1130.0000
    pol[3].im :=     0.0        ;  {-179.8450857}
    pol[4].re :=    -0.023714086;                     // *2*pi = 0.1489999
    pol[4].im :=     0.023714086;  {-0.023714086}
    pol[5].re :=    -0.023714086;
    pol[5].im :=    -0.023714086;
    nul[1].re :=     0.0        ;
    nul[1].im :=     0.0        ;
    nul[2].re :=     0.0        ;
    nul[2].im :=     0.0        ;
    numofnules := 2;
    numofpoles := 5;
    Teigen := 30; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 30s podle Pascalu}

  if instrument = 'Guralp CMG-40T 30s +Z integ' then begin
    {zadavam poly a nuly a pridavam jednu nulu do nul, abych videl, jak se to zmeni}
    {cili tohle by melo byt, ze vyrobim displacement, protoze spektrum vydelim vetsim poctem nul, tedy ho proste vydelim frekvenci a to je integrace v case}
    Afactor := 10000000;
    pol[1].re :=   -80.0    ;
    pol[1].im :=     0.0    ;
    pol[2].re :=  -160.0    ;
    pol[2].im :=     0.0    ;
    pol[3].re :=  -180.0    ;
    pol[3].im :=     0.0    ;
    pol[4].re :=    -0.02365;
    pol[4].im :=    +0.02365;
    pol[5].re :=    -0.02365;
    pol[5].im :=    -0.02365;
    nul[1].re :=     0.0    ;
    nul[1].im :=     0.0    ;
    nul[2].re :=     0.0    ;
    nul[2].im :=     0.0    ;
    nul[3].re :=     0.0    ;
    nul[3].im :=     0.0    ;
    numofnules := 3;
    numofpoles := 5;
    Teigen := 30; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 30s plusZERO}

if instrument = 'Guralp CMG-40T 30s -Z deriv' then begin
    {zadavam poly a nuly a odebiram jednu nulu z nul, abych videl, jak se to zmeni}
    {cili tohle by melo byt, ze vyrobim akcelerogram, protoze spektrum vydelim mensim poctem nul, takze ho oproti puvodnimu vlastne vynasobim frekvenci, a to je derivace v case}
    Afactor := 10000000;
    pol[1].re :=   -80.0    ;
    pol[1].im :=     0.0    ;
    pol[2].re :=  -160.0    ;
    pol[2].im :=     0.0    ;
    pol[3].re :=  -180.0    ;
    pol[3].im :=     0.0    ;
    pol[4].re :=    -0.02365;
    pol[4].im :=    +0.02365;
    pol[5].re :=    -0.02365;
    pol[5].im :=    -0.02365;
    nul[1].re :=     0.0    ;
    nul[1].im :=     0.0    ;
    numofnules := 1;
    numofpoles := 5;
    Teigen := 30; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 30s minusZERO}

  if instrument = 'G60       ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku primo v hertzech podle guralpiho alternativniho navodu
    http://www.guralp.com/articles/20060410-technical-alternative-pz/}
    Afactor := 10000000;
    pol[1].re :=   -80.0    ;
    pol[1].im :=     0.0    ;
    pol[2].re :=  -160.0    ;
    pol[2].im :=     0.0    ;
    pol[3].re :=  -180.0    ;
    pol[3].im :=     0.0    ;
    pol[4].re :=    -0.01178;      // * 2 * pi = 0.0740159
    pol[4].im :=    +0.01178;
    pol[5].re :=    -0.01178;
    pol[5].im :=    -0.01178;
    nul[1].re :=     0.0    ;
    nul[1].im :=     0.0    ;
    nul[2].re :=     0.0    ;
    nul[2].im :=     0.0    ;
    numofnules := 2;
    numofpoles := 5;
    Teigen := 60; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 60s}

  if instrument = 'G90       ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku primo v hertzech podle dataless pro stanici A204A, kde jako na jedine je Guralp 90s }
    Afactor := 10000000;
    pol[1].re :=   -0.00761;     // * 2 * pi = 0.04781504
    pol[1].im :=   -0.00761;
    pol[2].re :=   -0.00761;
    pol[2].im :=   +0.00761;
    pol[3].re :=  -80.0    ;
    pol[3].im :=    0.0    ;
    pol[4].re := -160.0    ;
    pol[4].im :=    0.0    ;
    pol[5].re := -180.0    ;
    pol[5].im :=    0.0    ;
    nul[1].re :=    0.0    ;
    nul[1].im :=    0.0    ;
    nul[2].re :=    0.0    ;
    nul[2].im :=    0.0    ;
    numofnules := 2;
    numofpoles := 5;
    Teigen := 90; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralp 90s}

  if instrument = 'G100      ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku primo v hertzech podle guralpiho alternativniho navodu
    http://www.guralp.com/articles/20060410-technical-alternative-pz/}
    Afactor := 10000000;
    pol[1].re :=   -80.0    ;
    pol[1].im :=     0.0    ;
    pol[2].re :=  -160.0    ;
    pol[2].im :=     0.0    ;
    pol[3].re :=  -180.0    ;
    pol[3].im :=     0.0    ;
    pol[4].re :=    -0.00707;    // 0.044422
    pol[4].im :=    +0.00707;
    pol[5].re :=    -0.00707;
    pol[5].im :=    -0.00707;
    nul[1].re :=     0.0    ;
    nul[1].im :=     0.0    ;
    nul[2].re :=     0.0    ;
    nul[2].im :=     0.0    ;
    numofnules := 2;
    numofpoles := 5;
    Teigen := 100; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 100s}

  if instrument = 'G120      ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku primo v hertzech podle guralpiho alternativniho navodu
    http://www.guralp.com/articles/20060410-technical-alternative-pz/}
    Afactor := 10000000;
    pol[1].re :=   -80.0    ;     // * 2 * pi = 502.65
    pol[1].im :=     0.0    ;
    pol[2].re :=  -160.0    ;     // * 2 * pi = 1005.309
    pol[2].im :=     0.0    ;
    pol[3].re :=  -180.0    ;     // * 2 * pi = 1130.97
    pol[3].im :=     0.0    ;
    pol[4].re :=    -0.00589;     // * 2 * pi = 0.037008
    pol[4].im :=    +0.00589;
    pol[5].re :=    -0.00589;
    pol[5].im :=    -0.00589;
    nul[1].re :=     0.0    ;
    nul[1].im :=     0.0    ;
    nul[2].re :=     0.0    ;
    nul[2].im :=     0.0    ;
    numofnules := 2;
    numofpoles := 5;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 120s}

  if instrument = 'G360      ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku primo v hertzech podle guralpiho alternativniho navodu
    http://www.guralp.com/articles/20060410-technical-alternative-pz/}
    Afactor := 10000000;
    pol[1].re :=   -80.0     ;
    pol[1].im :=     0.0     ;
    pol[2].re :=  -160.0     ;
    pol[2].im :=     0.0     ;
    pol[3].re :=  -180.0     ;
    pol[3].im :=     0.0     ;
    pol[4].re :=    -0.001964;  // * 2 * pi = 0.012340
    pol[4].im :=    +0.001964;
    pol[5].re :=    -0.001964;
    pol[5].im :=    -0.001964;
    nul[1].re :=     0.0     ;
    nul[1].im :=     0.0     ;
    nul[2].re :=     0.0     ;
    nul[2].im :=     0.0     ;
    numofnules := 2;
    numofpoles := 5;
    Teigen := 360; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {konec pro Guralpy 360s}

  if instrument = 'LE3D1     ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku}
    {podle Lenartzich stranek: http://www.lennartz-electronic.de/MamboV4.5.2/index.php?option=com_content&task=view&id=72&Itemid=59}
    Afactor := 300000000;
    pol[1].re :=  -4.444 /(2*pi);
    pol[1].im :=  +4.444 /(2*pi);
    pol[2].re :=  -4.444 /(2*pi);
    pol[2].im :=  -4.444 /(2*pi);
    pol[3].re :=  -1.083 /(2*pi);
    pol[3].im :=   0.0          ;
    nul[1].re :=   0.0          ;
    nul[1].im :=   0.0          ;
    nul[2].re :=   0.0          ;
    nul[2].im :=   0.0          ;
    nul[3].re :=   0.0          ;
    nul[3].im :=   0.0          ;
    numofnules := 3;
    numofpoles := 3;
    Teigen := 1; {zadavam vlastni periodu pristroje, vycetl jsem ji z clanku Hanzlova a spol o JETE}
    Charakteristika(Sender);
  end; {konec pro LE-3D 1s}

  if instrument = 'LE3D5     ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku }
    {podle Lenartzich stranek: http://www.lennartz-electronic.de/MamboV4.5.2/index.php?option=com_content&task=view&id=74&Itemid=68}
    Afactor := 10000000;
    pol[1].re := -0.888 /(2*pi);
    pol[1].im := +0.888 /(2*pi);
    pol[2].re := -0.888 /(2*pi);
    pol[2].im := -0.888 /(2*pi);
    pol[3].re := -0.220 /(2*pi);
    pol[3].im :=  0.0          ;
    nul[1].re :=  0.0          ;
    nul[1].im :=  0.0          ;
    nul[2].re :=  0.0          ;
    nul[2].im :=  0.0          ;
    nul[3].re :=  0.0          ;
    nul[3].im :=  0.0          ;
    numofnules := 3;
    numofpoles := 3;
    Teigen := 5; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro Lenartz 5s}

  if instrument = 'LE3D20    ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku }
    {podle Lenartzich stranek: http://www.lennartz-electronic.de/MamboV4.5.2/index.php?option=com_content&task=view&id=75&Itemid=55}
    Afactor := 10000000;
    pol[1].re := -0.22  /(2*pi);
    pol[1].im := +0.235 /(2*pi);
    pol[2].re := -0.22  /(2*pi);
    pol[2].im := -0.235 /(2*pi);
    pol[3].re := -0.23  /(2*pi);
    pol[3].im :=  0.0          ;
    nul[1].re :=  0.0          ;
    nul[1].im :=  0.0          ;
    nul[2].re :=  0.0          ;
    nul[2].im :=  0.0          ;
    nul[3].re :=  0.0          ;
    nul[3].im :=  0.0          ;
    numofnules := 3;
    numofpoles := 3;
    Teigen := 20; {zadavam vlastni periodu pristroje}
    Charakteristika(Sender);
  end; {konec pro Lenartz 20s}

  if instrument = 'VE53      ' then begin
    {zadavam poly a nuly pro pristrojovou charakteristiku z manualu k pristroji od firmy GeoSIG}
    Afactor := 300000000;
    pol[1].re :=    -1.317 / (2*pi);
    pol[1].im :=     0.0           ;
    pol[2].re :=  -606.4   / (2*pi);
    pol[2].im :=     0.0           ;
    pol[3].re :=    -3.665 / (2*pi);
    pol[3].im :=    +5.141 / (2*pi);
    pol[4].re :=    -3.665 / (2*pi);
    pol[4].im :=    -5.141 / (2*pi);
    pol[5].re :=    -0.196 / (2*pi);
    pol[5].im :=     0.0           ;
    pol[6].re := -1471.0   / (2*pi);
    pol[6].im :=     0.0           ;
    nul[1].re :=     0.0           ;
    nul[1].im :=     0.0           ;
    nul[2].re :=     0.0           ;
    nul[2].im :=     0.0           ;
    nul[3].re :=     0.0           ;
    nul[3].im :=     0.0           ;
    nul[4].re :=     0.0           ;
    nul[4].im :=     0.0           ;
    numofnules := 4;
    numofpoles := 6;
    Teigen := 1; {zadavam vlastni periodu pristroje, vycetl jsem ji z clanku Hanzlova a spol o JETE}
    Charakteristika(Sender);
  end; {konec pro VE-53}

  if instrument = 'L22       ' then begin
    {zadavam poly a nuly v radianech podle}
    {http://www.passcal.nmt.edu/content/instrumentation/sensors/sensor-comparison-chart/poles-and-zeroes#l22_3d}
    Afactor := 300000000;
    pol[1].re :=  -8.89 / (2*pi);
    pol[1].im :=  +8.89 / (2*pi);
    pol[2].re :=  -8.89 / (2*pi);
    pol[2].im :=  -8.89 / (2*pi);
    nul[1].re :=   0.0          ;
    nul[1].im :=   0.0          ;
    nul[2].re :=   0.0          ;
    nul[2].im :=   0.0          ;
    numofnules := 2;
    numofpoles := 2;
    Teigen := 4; {odhadnuto z charakteristiky, je to neco kratkoperiodickeho}
    Charakteristika(Sender);
  end; {konec pro L-22 3D}

  if instrument = 'SMOL10    ' then begin
  {zadavam pristroj podle PaZ od Renaty, duben 2018}
    Afactor := 300000000;
    pol[1].re :=    -0.1480300 / (2*pi);
    pol[1].im :=     0.1480300 / (2*pi);
    pol[2].re :=    -0.1480300 / (2*pi);
    pol[2].im :=    -0.1480300 / (2*pi);   // ==    0.023559 Hz
    pol[3].re :=  -391.9552    / (2*pi);   // ==  -62.3816 Hz
    pol[3].im :=   850.6930    / (2*pi);   // == +135.392  Hz
    pol[4].re :=  -391.9552    / (2*pi);   // ==  -62.3816 Hz
    pol[4].im :=  -850.6930    / (2*pi);   // == -135.392  Hz
    pol[5].re := -2199.115     / (2*pi);   // == -350.0    Hz
    pol[5].im :=     0.0      ;
    pol[6].re :=  -471.2389    / (2*pi);   // ==  -75.0    Hz
    pol[6].im :=     0.0      ;
    nul[1].re :=     0.0      ;
    nul[1].im :=     0.0      ;
    nul[2].re :=     0.0      ;
    nul[2].im :=     0.0      ;
    numofnules := 2;
    numofpoles := 6;
    Teigen := 10;
    Charakteristika(Sender);
  end; {SMOL 10 s}

  if instrument = 'typ A     ' then begin
    {podle word souboru od Renaty - kveten 2019 - stejny jako T4V50}
    Afactor := 585800000;
    pol[1].re :=    -0.0623816;
    pol[1].im :=  +135.392;
    pol[2].re :=    -0.0623816;
    pol[2].im :=  -135.392;
    pol[3].re :=    -0.0707;
    pol[3].im :=    +0.0707;
    pol[4].re :=    -0.0707;
    pol[4].im :=    -0.0707;
    pol[5].re :=  -350.0;
    pol[5].im :=     0.0      ;
    pol[6].re :=   -75.0;
    pol[6].im :=     0.0      ;
    nul[1].re :=     0.0      ;
    nul[1].im :=     0.0      ;
    nul[2].re :=     0.0      ;
    nul[2].im :=     0.0      ;
    numofnules := 2;
    numofpoles := 6;
    Teigen := 0.001;
    Charakteristika(Sender);
  end; {typ A}

  if instrument = 'typ B     ' then begin
    {podle word souboru od Renaty - kveten 2019}
    Afactor := 585800000;
    pol[1].re :=    -0.02356;
    pol[1].im :=    +0.02356;
    pol[2].re :=    -0.02356;
    pol[2].im :=    -0.02356;
    pol[3].re :=   -62.3816;
    pol[3].im :=  +135.392;
    pol[4].re :=   -62.3816;
    pol[4].im :=  -135.392;
    pol[5].re :=  -350.0;
    pol[5].im :=     0.0      ;
    pol[6].re :=   -75.0;
    pol[6].im :=     0.0      ;
    nul[1].re :=     0.0      ;
    nul[1].im :=     0.0      ;
    nul[2].re :=     0.0      ;
    nul[2].im :=     0.0      ;
    numofnules := 2;
    numofpoles := 6;
    Teigen := 30;
    Charakteristika(Sender);
  end; {typ B}

  if instrument = 'typ C     ' then begin
    {podle word souboru od Renaty - kveten 2019}
    Afactor := 2304000;
    pol[1].re :=    -0.02365;
    pol[1].im :=    +0.02365;
    pol[2].re :=    -0.02365;
    pol[2].im :=    -0.02365;
    pol[3].re := -180.0     ;
    pol[3].im :=    0.0     ;
    pol[4].re := -160.0     ;
    pol[4].im :=    0.0     ;
    pol[5].re :=  -80.0     ;
    pol[5].im :=    0.0     ;
    nul[1].re :=    0.0     ;
    nul[1].im :=    0.0     ;
    nul[2].re :=    0.0     ;
    nul[2].im :=    0.0     ;
    numofnules := 2;
    numofpoles := 6;
    Teigen := 0.001;
    Charakteristika(Sender);
  end; {typ C}

  if instrument = 'typ D     ' then begin
    {podle manualu od Lucia - primo word dokument od Guralpu - stejny jako word od Renaty kevet 2019}
    Afactor := 2304000;
    pol[1].re :=   -0.00589 ;
    pol[1].im :=   +0.00589 ;
    pol[2].re :=   -0.00589 ;
    pol[2].im :=   -0.00589 ;
    pol[3].re := -180.0     ;
    pol[3].im :=    0.0     ;
    pol[4].re := -160.0     ;
    pol[4].im :=    0.0     ;
    pol[5].re :=  -80.0     ;
    pol[5].im :=    0.0     ;
    nul[1].re :=    0.0     ;
    nul[1].im :=    0.0     ;
    nul[2].re :=    0.0     ;
    nul[2].im :=    0.0     ;
    numofnules := 2;
    numofpoles := 5;
    Teigen := 120; {instrument eigenperiod in seconds}
    Charakteristika(Sender);
  end; {typ D}

end; {konec procedurky napocitavani spektralnich prenosovych charakteristik}

procedure TSpectrumform.Charakteristika(Sender : TObject);
var {pocita instrumentalni charakteristiku pristroje, potrebuje znat poly a nuly a jejich pocet}
  i,p,k         : integer;
  hamplmax      : double;
  hphasmax      : double;
  hamplmaxstrg  : string;
  arghwmaxstrg  : string;
  hhlfb         : double;
  phlfb         : double;
  vlastnifreq   : double;
begin
  hamplmax := 0;                                          {vynuluju maximum amplitudy}
  hphasmax := 0;                                          {vynuluju maximum amplitudy}
  arghwmax := 0;
  for i  := 0 to supermaxsamples do begin
    Hch[i].Re  := 0.0;
    Hch[i].Im  := 0.0;
    Corrfre[i] := 0.0;
    Corrfim[i] := 0.0;
  end;
  for i  := 1 to supermaxsamples do begin                 {udelam to pro vsechna :i:, abych mel tu charakteristiku co nejdelsi a mohl se podivat i na vysoke freqence}
    Nch.Re  := 1.0;             {pocatecni nastaveni citatele}
    Nch.Im  := 0.0;
    Dch.Re  := 1.0;             {pocatecni nastaveni jmenovatele}
    Dch.Im  := 0.0;
    for p := 1 to numofnules do begin                     {citatel je Numerator neboli N jako Nahore}
      cmplxfreq.Re := 0;
      cmplxfreq.Im := frequency[i];
      Nch := Nch * (cmplxfreq - nul[p]);
    end;
    for p := 1 to numofpoles do begin                     {jmenovatel je Denominator neboli D jako Dole}
      cmplxfreq.Re := 0;
      cmplxfreq.Im := frequency[i];
      Dch := Dch * (cmplxfreq - pol[p]);
    end;
    if Dch = 0 then begin
      Dch := malynki;
    end;
    Hch[i]   := ( Nch / Dch )*Afactor{*(frequency[i]*2*pi*icko)};  {prenosova charakteristika}
    Hampl[i] := cmod(Hch[i]){/Afactor};          {absolutni hodnota charakteristiky, tedy amplitudova prenosova charakteristika}
    if Hch[i].Re = 0 then begin
      Hch[i].Re := malynki2;
    end;
    if Hch[i].Im = 0 then begin
      Hch[i].Im := malynki2;
    end;
    Hphas[i] := ArcTan( Hch[i].Im / Hch[i].Re {* Afactor}  ); {faze prenosove chrakteristiky}
    if Hampl[i] > hamplmax then hamplmax := Hampl[i];     {hledani maxima amplitudove charakteristiky}
    if Hphas[i] > hphasmax then hphasmax := Hphas[i];     {hledani maxima phasove charakteristiky}
  end;
  for i  := 1 to supermaxsamples do begin
    hhlfb := Hampl[i]/hamplmax;	                    {"hhlfb" je pomer aktualni Hampl k te nejvetsi}
    phlfb := Hphas[i]/hphasmax;	                    {"phlfb" je pomer aktualni Hphas k te nejvetsi}
    if phlfb < 0 then phlfb := 0;
    {pro nejvetsi amplitudu je hlfb = 1 a tedy npowfrq = 100, pro npowfrq = 0 musi byt log(b)= -5}
    {a tedy musi b=10e-5, tedy minimalni amplituda je 100000krat mensi nez maximalni amplituda}
    nHampl[i] := (20.0*log10(hhlfb+1.0e-10)+100.0); {log pomeru max a min amplitudy je tedy 5, a tedy rozsah je 100db}
    nHphas[i] := (20.0*log10(phlfb+1.0e-10)+100.0);
    if(nHampl[i] < 0) then nHampl[i] := 0;          {zaopatrime i pripadne zaporne hodnoty}
    if(nHphas[i] < 0) then nHphas[i] := 0;          {zaopatrime i pripadne zaporne hodnoty}
    Hampl[i] := (Hampl[i]/hamplmax)*(hlfamx/2);     {normuju to pro klasicke zobrazeni spektra}
  end;
  for i  := 2 to supermaxsamples do begin
    if frequency[i] > nyquist then break;
    if ((Hphas[i] - Hphas[i-1]) > (pi/8)) then begin
      for k := 1 to i-1 do begin
        Hphas[k] := Hphas[k] + pi; {delam, aby to bylo porad kladne pro dlouhe vlny}
      end;
    end;
  end;
  for i  := 1 to supermaxsamples do begin
    Hphas[i] := (Hphas[i]/(pi/2))*(hlfamx/2);       {normuju to pro klasicke zobrazeni spektra}
  end;
  for i  := 1 to supermaxsamples do begin
    if Hphas[i] > arghwmax then arghwmax := Hphas[i];
  end;
  {vlastni oprava spektra zaznamu na pristroj}
  for i := 1 to nsampl do begin                     {tohle delam uz jenom pro uzitecne hodnoty indexu :i:}
    Hch[i].Im := -Hch[i].Im;                        {obracim znamenko imaginarni casti transfer function}
    CmplxSpek[i].Re := fre[i];
    CmplxSpek[i].Im := fim[i];               {vytvarim complexni spektrum - puvodni hrube}
    CorrSpek[i]  := (CmplxSpek[i] / Hch[i])*hamplmax{*Afactor} ;  {opravene komplexni spektrum - puvodni hrube delim prenosovou charakteristikou}
    Corrfre[i]   := CorrSpek[i].Re;
    Corrfim[i]   := CorrSpek[i].Im;
  end;
  {zhladime nizke frekvence, abysme vyloucili prevladani divne dlouhych vln}
  vlastnifreq := 1 / Teigen; {vlastni frequence}
  for i := 1 to supermaxsamples-1 do begin
    if (frequency[i] < vlastnifreq) and (frequency[i+1] > vlastnifreq) then begin
      vlastniindex := i;     {tady mam index i, kteremu prislusi vlastni perioda pristroje}
    end;
  end; {of for :i:}

  for i := 1 to supermaxsamples-1 do begin
    if (frequency[i] < 1/300) and (frequency[i+1] > 1/300) then begin {nahulvata pocitam s tim, ze nechci delsi vlny nez 300 sekund}
      nejdelsiindex := i;     {tady mam index i, kteremu prislusi nejdelsi vlna, jakou uvazuju}
    end;
  end; {of for :i:}

  vlastniindex := trunc(vlastniindex/2); {najdu desetinnovy nebo ctvrtinovy (puvodne polovicni) takovy index}
  setlength(corrf,vlastniindex+1);
  setlength(ncorrf,vlastniindex+1);
  if vlastniindex > nejdelsiindex then begin                    {zhladim to, jenom kdyz mam kam}
    for i := nejdelsiindex to vlastniindex do begin             {zhladim to mezi tou nejdelsi natvrdo nastavenou periodou a dvojnasobkem te vlastni periody, je to tak nejak od oka}
      corrf[i] := 0.5*(1.0 - cos(pi*(i-nejdelsiindex)/(vlastniindex-nejdelsiindex)));   {this is the smoothing cosine window}
      CorrSpek[i].Re  := CorrSpek[i].Re*corrf[i];
      CorrSpek[i].Im  := CorrSpek[i].Im*corrf[i];
      CorrFRe[i]   := CorrFRe[i]*corrf[i];
      CorrFIm[i]   := CorrFIm[i]*corrf[i];
    end;
  end;
  for i := 1 to nejdelsiindex do begin
    CorrSpek[i].Re  := 0; {prvni vzorky spektra vynuluju}
    CorrSpek[i].Im  := 0;
    CorrFRe[i]   := 0;    {taky se muze stat, ze tam diky malemu poctu vzorku neni na to zhlazeni misto}
    CorrFIm[i]   := 0;
  end;
  for i := 1 to nhlf do begin
   CorrSpekAmpl[i] := cmod(CorrSpek[i]); {vyrobim si amplitudove spektrum, ktere bude double a ne complexni}
  end;
  NoSVALform.Whit(Sender, CorrSpekAmpl,Corrfre,Corrfim);              {zavolam procedurku na whitening spektra a jako vstup ji dam to powfrq spektrum, vysledkem tedy bude whitened corrected spektrum}
  {driv jsem tady pouzival nove maximum hlfamxcorr, ale je lepsi normovat i corrigovane spectrum podle puvodniho hlfamx, cimz sice}
  for i := 1 to nhlf do begin              {vyjde nekde vetsi nez 100 dB, ale je to v poradku vzhledem k puvodnimu}
    hlfbcorr := cmod(CorrSpek[i])/hlfamx;  {"hlfb" je pomer aktualni amplitudy k te nejvetsi}
    {pro nejvetsi amplitudu je hlfb = 1 a tedy npowfrq = 100, pro npowfrq = 0 musi byt log(b)= -5}
    {a tedy musi b=10e-5, tedy minimalni amplituda je 100000krat mensi nez maximalni amplituda}
    CorrSpeknpowfrq[i] := (20.0*log10(hlfbcorr+1.0e-10)+100.0);	{"npowfrq" = "Normalizovana POWer FReQuency", tohle pak vykresluju jako normalizovane spektrum}
    {log pomeru max a min amplitudy je tedy 5, a tedy rozsah je 100db}
    if(CorrSpeknpowfrq[i] < 0) then CorrSpeknpowfrq[i] := 0;    {zaopatrime i pripadne zaporne hodnoty}
  end;
  korigovaljsem := true;
  Button17.Enabled := true;
  Button18.Enabled := true;
  Button19.Enabled := true;
  Button20.Enabled := true;
  Button21.Enabled := true;
  Button23.Enabled := true;
  Button24.Enabled := true;
  fradek := fradek +1;
  str(fradek:4,fradekstrg);
  memo1.Lines.Add(fradekstrg+' | - correction for ' + instrument + ' applied');
  str(hamplmax:14:10,hamplmaxstrg);
  fradek := fradek +1;
  str(fradek:4,fradekstrg);
  memo1.Lines.Add(fradekstrg+' | - Maximum of  | H(w) |  is '+ hamplmaxstrg);
  str(arghwmax:14:10,arghwmaxstrg);
  fradek := fradek +1;
  str(fradek:4,fradekstrg);
  memo1.Lines.Add(fradekstrg+' | - Maximum of  | Arg H(w) |  is '+ arghwmaxstrg);
end;  {konec procedury na pocitani charakteristik pristroju}

procedure TSpectrumform.Button17Click(Sender: TObject);
var {kresli amplitudovou chrakteristiku pristroje}
  i,k : integer;
begin
  if sp = true then begin {pro obycejne spektrum}
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:=0;
    PlotPanel1.Ymax := 1.1;
    PlotPanel1.GridColor:=clBlack;
    PlotPanel1.YInterval := 1.1;
    PlotPanel1.YMarks:= True;
    val(Edit2.Text,xxset,cd); {tady nevyzaduju maximalni hranici jako nyquista, protoze se muzu chtit podivat na to prenosovou charakteristiku i dal}
    if xxset > frequency[supermaxsamples] then begin
      str(frequency[supermaxsamples]:7:3,maxupperstrg);
      showmessage('The upper plot frequency range will be set to '+maxupperstrg+' Hz, what is the maximal possible frequency range');
      Edit2.Text := maxupperstrg;
      xxset := frequency[supermaxsamples]; {opravim to na tu nejvyssi moznou frequenci, na kterou mam jeste pole}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= xxset;
    PlotPanel1.Xmin:= mmset;
    Nastavosux;
    for i := 1 to supermaxsamples do begin
      if frequency[i] >= xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := supermaxsamples downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    for i := mmmin to xxmax do begin
      PlotPanel1.AddXY(frequency[i], Hampl[i]/hlfamx, clWhite,fcara);
    end;
    fcara := fcara + 1; {nakreslim, kde se nachazi vlastni perioda zvoleneho pristroje}
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    PlotPanel1.AddXY(1/Teigen,PlotPanel1.Ymax,RGB(255,0,255),fcara); {vlastni perioda}
    PlotPanel1.AddXY(1/Teigen,PlotPanel1.Ymin,RGB(255,0,255),fcara); {vlastni perioda}
  end; {pro sp = true - kdyz je to obycejne spektrum}
  if sp = false then begin {kdyz je to pro normalizovane spektrum}
    PlotPanel1.XInterval:=0.1;
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:=0;
    PlotPanel1.Ymax:=105;
    PlotPanel1.GridColor:=clBlack;
    PlotPanel1.YInterval:=10;
    PlotPanel1.YMarks:=True;
    val(Edit2.Text,xxset,cd);
    if xxset > nyquist then begin
      showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
      Edit2.Text := nyquiststrg;
      xxset := nyquist; {opravim to na nyquista}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= log10(xxset)+0.1;
    for i := 1 to nsampl do begin
      if frequency[i] > xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := nsampl downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    if mmset = 0 then mmset := frkrok;
    PlotPanel1.Xmin:= log10(mmset)-0.1;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    for i := mmmin to xxmax do begin
      if nHampl[i] > 0 then begin
      PlotPanel1.AddXY(log10(frequency[i]), nHampl[i], clWhite,fcara);
      end;
    end;{of for :i:}
    fcara := fcara + 1; {nakreslim, kde se nachazi vlastni perioda zvoleneho pristroje}
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    PlotPanel1.AddXY(log10(1/Teigen),PlotPanel1.Ymax,RGB(255,0,255),fcara); {vlastni perioda}
    PlotPanel1.AddXY(log10(1/Teigen),PlotPanel1.Ymin,RGB(255,0,255),fcara); {vlastni perioda}
  end; {if sp = false - konec pro normalizovane spektrum}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni amplitudove charakteristiky}

procedure TSpectrumform.Button23Click(Sender: TObject);
var {kresli fazovou chrakteristiku pristroje}
  i,k : integer;
begin
  if sp = true then begin {pro obycejne spektrum}
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:= -0.5;
    PlotPanel1.Ymax:= arghwmax/hlfamx; {hlfamx*1.1;}
    PlotPanel1.GridColor:=clWhite;
    PlotPanel1.YInterval:= 1/8;
    PlotPanel1.YMarks:= True;
    val(Edit2.Text,xxset,cd); {tady nevyzaduju maximalni hranici jako nyquista, protoze se muzu chtit podivat na to prenosovou charakteristiku i dal}
    if xxset > frequency[supermaxsamples] then begin
      str(frequency[supermaxsamples]:7:3,maxupperstrg);
      showmessage('The upper plot frequency range will be set to '+maxupperstrg+' Hz, what is the maximal possible frequency range');
      Edit2.Text := maxupperstrg;
      xxset := frequency[supermaxsamples]; {opravim to na tu nejvyssi moznou frequenci, na kterou mam jeste pole}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= xxset;
    PlotPanel1.Xmin:= mmset;
    Nastavosux;
    for i := 1 to supermaxsamples do begin
      if frequency[i] >= xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := supermaxsamples downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    fcara := fcara + 1;
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    for i := mmmin to xxmax do begin
      PlotPanel1.AddXY(frequency[i], Hphas[i]/hlfamx, clRed  ,fcara );
    end;
    fcara := fcara + 1; {nakreslim, kde se nachazi vlstni perioda pristroje}
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    PlotPanel1.AddXY(1/Teigen,PlotPanel1.Ymax,RGB(255,0,255),fcara); {vlastni perioda}
    PlotPanel1.AddXY(1/teigen,PlotPanel1.Ymin,RGB(255,0,255),fcara); {vlastni perioda}
  end; {pro sp = true - kdyz je to obycejne spektrum}
  if sp = false then begin {kdyz je to pro normalizovane spektrum}
    PlotPanel1.XInterval:=0.1;
    PlotPanel1.XMarks:=True;
    PlotPanel1.Ymin:=0;
    PlotPanel1.Ymax:=105;
    PlotPanel1.GridColor:=clBlack;
    PlotPanel1.YInterval:=10;
    PlotPanel1.YMarks:=True;
    val(Edit2.Text,xxset,cd);
    if xxset > nyquist then begin
      showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
      Edit2.Text := nyquiststrg;
      xxset := nyquist; {opravim to na nyquista}
    end;
    val(Edit1.Text,mmset,cd);
    PlotPanel1.Xmax:= log10(xxset)+0.1;
    for i := 1 to nsampl do begin
      if frequency[i] > xxset then begin
        xxmax := i; {nastavim horni index pro vykreslovani}
        break;
      end;
    end;
    for k := nsampl downto 1 do begin
      if frequency[k] <= mmset then begin
        mmmin := k; {nastavim dolni index pro vykreslovani}
        break;
      end;
    end;
    if mmset = 0 then mmmin := 1;
    if mmset = 0 then mmset := frkrok;
    PlotPanel1.Xmin:= log10(mmset)-0.1;
    fcara := fcara + 1; {nakreslim, kde se nachazi vlastni perioda zvoleneho pristroje}
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    for i := mmmin to xxmax do begin
      if nHphas[i] > 0 then begin
        PlotPanel1.AddXY(log10(frequency[i]), nHphas[i], clRed,fcara);
      end;
    end;{of for :i:}
    fcara := fcara + 1; {nakreslim, kde se nachazi vlastni perioda zvoleneho pristroje}
    with PlotPanel1 do begin
      LayerOptions(fcara,pmLine,1);
    end;
    PlotPanel1.AddXY(log10(1/Teigen),PlotPanel1.Ymax,RGB(255,0,255),fcara); {vlastni perioda}
    PlotPanel1.AddXY(log10(1/Teigen),PlotPanel1.Ymin,RGB(255,0,255),fcara); {vlastni perioda}
  end; {if sp = false - konec pro normalizovane spektrum}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni fazove charakteristiky}

procedure TSpectrumform.Button18Click(Sender: TObject);
var   {kresli cele opravene spektrum}
  i,k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= true;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  if batchbandpass  or bandpass then begin {kdyz vykresluju bandpass pri batch processingu}
    xxset := (1/perfltmin)*2;
  end;
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to nsampl do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := nsampl downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin {for i := mmmin to trunc((xxmax-mmmin)/spekkraceni) do begin}
    PlotPanel1.AddXY(frequency[i], cmod(CorrSpek[i])/hlfamx, clRed,fcara);
  end;{of for :i:}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
  {vykreslim cosinove zhlazovaci okno spektra}
  fcara := fcara + 1;
   with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,2);
  end;
  for i := 1 to vlastniindex do begin {kreslim zhlazovaci cosinove okno, ktere normuju tak, aby v nejvyssim miste bylo stejne velke jako puvodni opravene spektrum}
    PlotPanel1.AddXY(frequency[i], corrf[i]*(cmod(CorrSpek[vlastniindex]))/hlfamx, clBlue,fcara);
  end;{of for :i:}
end; {konec kresleni opraveneho spektra}

procedure TSpectrumform.Button24Click(Sender: TObject);
var   {kresli cele opravene spektrum normalizovane}
  i,k : integer;
begin
  sp := false;
  PlotPanel1.XInterval:=0.1;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax:=105;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval:=10;
  PlotPanel1.YMarks:=True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= log10(xxset)+0.1;
  for i := 1 to nsampl do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := nsampl downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  if mmset = 0 then mmset := frkrok;
  PlotPanel1.Xmin:= log10(mmset)-0.1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin {for i := mmmin to trunc((xxmax-mmmin)/spekkraceni) do begin}
    PlotPanel1.AddXY(log10(frequency[i]), CorrSpeknpowfrq[i], clRed,fcara);
  end; {of for :i:}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
  {vykreslim cosinove zhlazovaci okno spektra}
  for i := 1 to vlastniindex do begin
    if CorrSpeknpowfrq[i] <> 0 then begin
      ncorrf[i]  := (20.0*log10(corrf[i] + 1.0e-10)+100); {normalizovany pusobici filtr}
    end;
  end;
  fcara := fcara + 1;
   with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,2);
  end;
  for i := 1 to vlastniindex do begin {kreslim zhlazovaci cosinove okno, ktere normuju tak, aby v nejvyssim miste bylo stejne velke jako puvodni opravene spektrum}
    PlotPanel1.AddXY(log10(frequency[i]), ncorrf[i], clBlue,fcara);
  end; {of for :i:}
end; {konec kresleni normalizovaneho opraveneho spektra}

procedure TSpectrumform.Button19Click(Sender: TObject);
var   {kresli realnou cast opraveneho komplexniho spektra}
  i,k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin := -1.1;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to nsampl do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := nsampl downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin {for i := mmmin to trunc((xxmax-mmmin)/spekkraceni) do begin}
    PlotPanel1.AddXY(frequency[i], CorrFRe[i]/hlfamx, RGB(0,255,0),fcara);
  end;{of for :i:}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni realne casti opraveneho komplexniho spektra}

procedure TSpectrumform.Button20Click(Sender: TObject);
var   {kresli imaginarni cast opraveneho komplexniho spektra}
  i,k : integer;
begin
  sp := true;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin := -1.1;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval := 1.1;
  PlotPanel1.YMarks:= True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= xxset;
  PlotPanel1.Xmin:= mmset;
  Nastavosux;
  for i := 1 to nsampl do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := nsampl downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin {for i := mmmin to trunc((xxmax-mmmin)/spekkraceni) do begin}
    PlotPanel1.AddXY(frequency[i], CorrFIm[i]/hlfamx, clSkyBlue,fcara);
  end;{of for :i:}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni imaginarni casti opraveneho komplexniho spektra}

procedure TSpectrumform.Button21Click(Sender: TObject);
var {spousti analyzu korigovaneho zaznamu}
  i : integer;
begin
  for i := 1 to nsampl do begin         {nahradim puvodni casti spektra temi opravenymi a pustim filtrovani}
    fre[i] := Corrfre[i];
    fim[i] := Corrfim[i];
  end;
  filtrujuopravovany := true;
  NoSVALform.Button12Click(Sender);     {poustim vyrobu korigovaneho puvodniho seismogramu, protoze kdyz uz to filtruju s korekci, tak ten korigovany puvodni asi taky budu chtit ulozit}
  NoSVALform.Button12.Enabled := true;  {aktivuju cudlik pro vykreslovani opraveneho seismogramu}
  if FFT = false then begin
    NoSVALform.Pokracovani;             {spousti druhou pulku analyzy, ve ktere se pouziji i opravene filtry}
  end;
end; {konec spousteni analyzy korigovaneho zaznamu}

procedure TSpectrumform.Button22Click(Sender: TObject);
var {kresli normalizovany kompletne filtrovany spektrum a protazeny gaussovsky zvon}
  i,k : integer;
begin
  sp := false;
  PlotPanel1.XInterval:=0.1;
  PlotPanel1.XMarks:=True;
  PlotPanel1.Ymin:=0;
  PlotPanel1.Ymax:=105;
  PlotPanel1.GridColor:=clBlack;
  PlotPanel1.YInterval:=10;
  PlotPanel1.YMarks:=True;
  val(Edit2.Text,xxset,cd);
  if xxset > nyquist then begin
    showmessage('It has no sense to plot the frequencies higher then the Nyquist one. The upper plot frequency range will be set to '+nyquiststrg+' Hz, what is the Nyquist frequency for used sampling rate.');
    Edit2.Text := nyquiststrg;
    xxset := nyquist; {opravim to na nyquista}
  end;
  val(Edit1.Text,mmset,cd);
  PlotPanel1.Xmax:= log10(xxset)+0.1;
  for i := 1 to n do begin
    if frequency[i] > xxset then begin
      xxmax := i; {nastavim horni index pro vykreslovani}
      break;
    end;
  end;
  for k := n downto 1 do begin
    if frequency[k] <= mmset then begin
      mmmin := k; {nastavim dolni index pro vykreslovani}
      break;
    end;
  end;
  if mmset = 0 then mmmin := 1;
  if mmset = 0 then mmset := frkrok;
  PlotPanel1.Xmin:= log10(mmset)-0.1;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if nwc[i] > 0.1 then begin {aby to nevykreslovalo malinky hodnoty}
      if i <= nfmax then begin
        PlotPanel1.AddXY(log10(frequency[i]), nwc[i], clBlue,fcara);
      end;
    end;
  end;
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if nwc[i] > 0.1 then begin {aby to nevykreslovalo malinky hodnoty}
      if i >= nfmin then begin
        PlotPanel1.AddXY(log10(frequency[i]), nwc[i], clBlue,fcara);
      end;
    end; {of if}
  end;{for :i:}
  fcara := fcara + 1;
  with PlotPanel1 do begin
    LayerOptions(fcara,pmLine,1);
  end;
  for i := mmmin to xxmax do begin
    if npowfrq[i] > 0.1 then begin {kreslim jen nenulovou cast}
      PlotPanel1.AddXY(log10(frequency[i]), complfiltnpowfrq[i], clRed,fcara);
    end;
  end;{of for :i:}
  namalovano := true;
  if indexf<>0 then Button13.Enabled := True;
end; {konec kresleni normalizovaneho Range Filterovaneho spektra}

procedure TSpectrumform.PlotPanel1MouseMove(Sender: TObject; xx, yy: Integer);
var {vypisuje souradnice do PlotPanelu1}
  Test    : boolean;
  dny     : double;
  hodiny  : double;
  minuty  : double;
  sekundy : double;
begin
  Test := PlotPanel1.ConvertS2W(xx,yy,WX,WY);
  if Test = false then begin
    Label1.visible := false;
    Label4.visible := false;
    Label5.visible := false;
    Label6.visible := false;
  end
  else begin
    Label1.visible := true;
    Label4.visible := true;
    Label5.visible := true;
    Label6.visible := true;
  end;
  Label1.Caption := FloatToStrF( WX ,ffFixed,18,10)+'  Hz';
  if WX <> 0 then begin
    if (1/WX) > 86400 then begin {dny, hodiny, minuty, sekundy}
      dny     := Int((1/WX) / 86400);
      hodiny  := Int(((1/WX) - dny*86400) / 3600);
      minuty  := Int(((1/WX) - dny*86400 - hodiny*3600) / 60) ;
      sekundy :=      (1/WX) - dny*86400 - hodiny*3600 - minuty*60;
      Label6.Caption := FloatToStrF(dny,ffFixed,4,0)+ '  d  ' + FloatToStrF(hodiny,ffFixed,4,0)+ '  h  ' + FloatToStrF(minuty,ffFixed,4,0)+ '  m  ' + FloatToStrF(sekundy,ffFixed,6,2) + '  s';
    end
    else if (1/WX) > 3600 then begin {hodiny, minuty, sekundy}
      hodiny  := Int((1/WX) / 3600);
      minuty  := Int(((1/WX) - hodiny*3600) / 60) ;
      sekundy := (1/WX) - hodiny*3600 - minuty*60;
      Label6.Caption := FloatToStrF(hodiny,ffFixed,4,0)+ '  h  ' + FloatToStrF(minuty,ffFixed,4,0)+ '  m  ' + FloatToStrF(sekundy,ffFixed,6,2) + '  s';
    end
    else if (1/WX) > 60 then begin {minuty, sekundy}
      minuty  := Int((1/WX) / 60);
      sekundy := (1/WX) - minuty*60;
      Label6.Caption := FloatToStrF(minuty,ffFixed,4,0)+ '  m  ' + FloatToStrF(sekundy,ffFixed,6,2) + '  s';
    end
    else if (1/WX) > 0 then begin {sekundy}
      Label6.Caption := FloatToStrF((1/WX),ffFixed,8,2)+'  s';
    end;
    Label4.Caption := FloatToStrF((1/WX),ffFixed,8,2)+'  s'; {zobrazuje vzdy sekundy, at jich je kolik chce}
  end;
  Label5.Caption:= FloatToStrF(   WY ,ffFixed,18,10)+'  Ampl';
end; {konec vypisovani souradnic do PlotPanelu}

procedure TSpectrumform.Nastavosux;
begin    {nastavuje labely na ose X pro ruzne rozsahy teto osy}
  if                                     ((xxset-mmset) >  100.01    ) then PlotPanel1.XInterval :=   20        ;
  if ((xxset-mmset) <=  100.01     ) and ((xxset-mmset) >   50.01    ) then PlotPanel1.XInterval :=   10        ;
  if ((xxset-mmset) <=   50.01     ) and ((xxset-mmset) >   20.01    ) then PlotPanel1.XInterval :=    5        ;
  if ((xxset-mmset) <=   20.01     ) and ((xxset-mmset) >   10.01    ) then PlotPanel1.XInterval :=    2        ;
  if ((xxset-mmset) <=   10.01     ) and ((xxset-mmset) >    5.01    ) then PlotPanel1.XInterval :=    1        ;
  if ((xxset-mmset) <=    5.01     ) and ((xxset-mmset) >    2.01    ) then PlotPanel1.XInterval :=    0.5      ;
  if ((xxset-mmset) <=    2.01     ) and ((xxset-mmset) >    1.01    ) then PlotPanel1.XInterval :=    0.2      ;
  if ((xxset-mmset) <=    1.01     ) and ((xxset-mmset) >    0.51    ) then PlotPanel1.XInterval :=    0.1      ;
  if ((xxset-mmset) <=    0.51     ) and ((xxset-mmset) >    0.21    ) then PlotPanel1.XInterval :=    0.05     ;
  if ((xxset-mmset) <=    0.21     ) and ((xxset-mmset) >    0.11    ) then PlotPanel1.XInterval :=    0.02     ;
  if ((xxset-mmset) <=    0.11     ) and ((xxset-mmset) >    0.051   ) then PlotPanel1.XInterval :=    0.01     ;
  if ((xxset-mmset) <=    0.051    ) and ((xxset-mmset) >    0.021   ) then PlotPanel1.XInterval :=    0.005    ;
  if ((xxset-mmset) <=    0.021    ) and ((xxset-mmset) >    0.011   ) then PlotPanel1.XInterval :=    0.002    ;
  if ((xxset-mmset) <=    0.011    ) and ((xxset-mmset) >    0.0051  ) then PlotPanel1.XInterval :=    0.001    ;
  if ((xxset-mmset) <=    0.0051   ) and ((xxset-mmset) >    0.0021  ) then PlotPanel1.XInterval :=    0.0005   ;
  if ((xxset-mmset) <=    0.0021   ) and ((xxset-mmset) >    0.0011  ) then PlotPanel1.XInterval :=    0.0002   ;
  if ((xxset-mmset) <=    0.0011   ) and ((xxset-mmset) >    0.00051 ) then PlotPanel1.XInterval :=    0.0001   ;
  if ((xxset-mmset) <=    0.00051  ) and ((xxset-mmset) >    0.00021 ) then PlotPanel1.XInterval :=    0.00005  ;
  if ((xxset-mmset) <=    0.00021  ) and ((xxset-mmset) >    0.00011 ) then PlotPanel1.XInterval :=    0.00002  ;
  if ((xxset-mmset) <=    0.00011  ) and ((xxset-mmset) >    0.000051) then PlotPanel1.XInterval :=    0.00001  ;
  if ((xxset-mmset) <=    0.000051 ) and ((xxset-mmset) >    0.000021) then PlotPanel1.XInterval :=    0.000005 ;
  if ((xxset-mmset) <=    0.000021 ) and ((xxset-mmset) >    0.000011) then PlotPanel1.XInterval :=    0.000002 ;
  if ((xxset-mmset) <=    0.000011 )                                   then PlotPanel1.XInterval :=    0.000001 ;
  if                                     ((xxset-mmset) >  100.01    ) then PlotPanel2.XInterval :=   20        ;
  if ((xxset-mmset) <=  100.01     ) and ((xxset-mmset) >   50.01    ) then PlotPanel2.XInterval :=   10        ;
  if ((xxset-mmset) <=   50.01     ) and ((xxset-mmset) >   20.01    ) then PlotPanel2.XInterval :=    5        ;
  if ((xxset-mmset) <=   20.01     ) and ((xxset-mmset) >   10.01    ) then PlotPanel2.XInterval :=    2        ;
  if ((xxset-mmset) <=   10.01     ) and ((xxset-mmset) >    5.01    ) then PlotPanel2.XInterval :=    1        ;
  if ((xxset-mmset) <=    5.01     ) and ((xxset-mmset) >    2.01    ) then PlotPanel2.XInterval :=    0.5      ;
  if ((xxset-mmset) <=    2.01     ) and ((xxset-mmset) >    1.01    ) then PlotPanel2.XInterval :=    0.2      ;
  if ((xxset-mmset) <=    1.01     ) and ((xxset-mmset) >    0.51    ) then PlotPanel2.XInterval :=    0.1      ;
  if ((xxset-mmset) <=    0.51     ) and ((xxset-mmset) >    0.21    ) then PlotPanel2.XInterval :=    0.05     ;
  if ((xxset-mmset) <=    0.21     ) and ((xxset-mmset) >    0.11    ) then PlotPanel2.XInterval :=    0.02     ;
  if ((xxset-mmset) <=    0.11     ) and ((xxset-mmset) >    0.051   ) then PlotPanel2.XInterval :=    0.01     ;
  if ((xxset-mmset) <=    0.051    ) and ((xxset-mmset) >    0.021   ) then PlotPanel2.XInterval :=    0.005    ;
  if ((xxset-mmset) <=    0.021    ) and ((xxset-mmset) >    0.011   ) then PlotPanel2.XInterval :=    0.002    ;
  if ((xxset-mmset) <=    0.011    ) and ((xxset-mmset) >    0.0051  ) then PlotPanel2.XInterval :=    0.001    ;
  if ((xxset-mmset) <=    0.0051   ) and ((xxset-mmset) >    0.0021  ) then PlotPanel2.XInterval :=    0.0005   ;
  if ((xxset-mmset) <=    0.0021   ) and ((xxset-mmset) >    0.0011  ) then PlotPanel2.XInterval :=    0.0002   ;
  if ((xxset-mmset) <=    0.0011   ) and ((xxset-mmset) >    0.00051 ) then PlotPanel2.XInterval :=    0.0001   ;
  if ((xxset-mmset) <=    0.00051  ) and ((xxset-mmset) >    0.00021 ) then PlotPanel2.XInterval :=    0.00005  ;
  if ((xxset-mmset) <=    0.00021  ) and ((xxset-mmset) >    0.00011 ) then PlotPanel2.XInterval :=    0.00002  ;
  if ((xxset-mmset) <=    0.00011  ) and ((xxset-mmset) >    0.000051) then PlotPanel2.XInterval :=    0.00001  ;
  if ((xxset-mmset) <=    0.000051 ) and ((xxset-mmset) >    0.000021) then PlotPanel2.XInterval :=    0.000005 ;
  if ((xxset-mmset) <=    0.000021 ) and ((xxset-mmset) >    0.000011) then PlotPanel2.XInterval :=    0.000002 ;
  if ((xxset-mmset) <=    0.000011 )                                   then PlotPanel2.XInterval :=    0.000001 ;
end;     {konec nastavovani labelu na ose X}

procedure TSpectrumform.Button25Click(Sender: TObject);
var {pro ukladani vybraneho filtru - zvonu i filtrovaneho spektra}
  i : integer;
  nazviskofiltr : string;
begin
  SaveDialog2.Execute;
  if length(SaveDialog2.FileName) < 1 then exit;
  nazviskofiltr := SaveDialog2.FileName;
  nazviskofiltr := nazviskofiltr + '.dat';
  assignfile(spectrumfiltr,nazviskofiltr);
  rewrite(spectrumfiltr);
  writeln(spectrumfiltr,'             frequency       period[s]         FiltrSpectrum                  Zvon');
  for i := 1 to nhlf do begin {pro pulku toho, co slo do Fouriera}
    writeln(spectrumfiltr,frequency[i]:22:11,(1/frequency[i]):16:4,filtpowfrq[indexf,i]:22:11,ww[indexf,i]:22:11);
  end;
  closefile(spectrumfiltr);
end; {konec ukladani vybraneho filtru}

procedure TSpectrumform.Button26Click(Sender: TObject);
var {ukladam prenosovou charakteristiku}
  nazevH : string;
  i : integer;
begin
  SaveDialog3.Execute;
  if length(SaveDialog3.FileName) < 1 then exit;
  nazevH := SaveDialog3.FileName;
  nazevH := nazevH + '.dat';
  assignfile(souborH,nazevH);
  rewrite(souborH);
  writeln(souborH,'             frequency       period[s]           period[h]                 Hampl                 Hphas                nHampl                nHphas');
  for i := 1 to nhlf do begin {pro pulku toho, co slo do Fouriera}
    writeln(souborH,frequency[i]:22:11,(1/frequency[i]):16:4,((1/frequency[i])/3600):20:7,(Hampl[i]/(hlfamx/2)):22:11,(Hphas[i]):22:11,nHampl[i]:22:11,nHphas[i]:22:11);
  end;
  closefile(souborH);
end;  {konec ukladani prenosove charakteristiky}


begin {zacatek tela unity}
      {konec tela unity}
end.
