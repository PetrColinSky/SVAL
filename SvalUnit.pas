unit SvalUnit;
              {zakladni unita cele frekvencne - casove analyzy Petr Kolinsky 2002 - 2022}
interface     {postavena na principu programu SVAN a SVAM a na FORTRANske verzi programu SVAL}
uses          {ovsem kompletne predelana, rozdelena do procedur a s mnoha vychytavkami}
  LCLIntf, LCLType, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Math, ExtCtrls,
  PlotPanel, Spin, Menus, Buttons, maskedit, ComCtrls, FileUtil, StrUtils, ChooseUnit, Ucomplex;

type
  arrayoffour1procedure = array of single;
  { TNoSVALform }
  TNoSVALform = class(TForm)
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
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;{oznacuje fixed pozici orezavani}
    Label37: TLabel;{oznacuje fixed pozici orezavani}
    Label38: TLabel;{oznacuje fixed pozici orezavani}
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
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
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    Button37: TButton;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    Button41: TButton;
    Button42: TButton;
    Button43: TButton;
    Button44: TButton;
    Button45: TButton;
    Button46: TButton;
    Button47: TButton;
    Button48: TButton;
    Button49: TButton;
    Button50: TButton;
    Button51: TButton;
    Button52: TButton;
    Button53: TButton;
    Button54: TButton;
    Button55: TButton;
    Button56: TButton;
    PlotPanel1: TPlotPanel;
    PlotPanel2: TPlotPanel;
    PlotPanel3: TPlotPanel;
    PlotPanel4: TPlotPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    RadioGroup8: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    OpenDialog3: TOpenDialog;
    OpenDialog4: TOpenDialog;
    OpenDialog5: TOpenDialog;
    OpenDialog6: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    SaveDialog3: TSaveDialog;
    SaveDialog4: TSaveDialog;
    SaveDialog5: TSaveDialog;
    SaveDialog6: TSaveDialog;
    Memo1: TMemo;
    Timer1: TTimer;
    Timer2: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    SpinEdit1: TSpinEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
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
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button38Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure Button41Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure Button43Click(Sender: TObject);
    procedure Button44Click(Sender: TObject);
    procedure Button45Click(Sender: TObject);
    procedure Button46Click(Sender: TObject);
    procedure Button47Click(Sender: TObject);
    procedure Button48Click(Sender: TObject);
    procedure Button49Click(Sender: TObject);
    procedure Button50Click(Sender: TObject);
    procedure Button51Click(Sender: TObject);
    procedure Button52Click(Sender: TObject);
    procedure Button53Click(Sender: TObject); {pocitani a malovani fazove disperze}
    procedure Button54Click(Sender: TObject);
    procedure Button55Click(Sender: TObject);
    procedure Button56Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure RadioGroup4Click(Sender: TObject);
    procedure RadioGroup5Click(Sender: TObject);
    procedure RadioGroup6Click(Sender: TObject);
    procedure RadioGroup7Click(Sender: TObject);
    procedure RadioGroup8Click(Sender: TObject);
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure ComboBox2CloseUp(Sender: TObject);
    procedure ComboBox3CloseUp(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure PlotPanel1MouseMove(Sender: TObject; Shift: TShiftState; xxx, yyy: integer); {hlasi to, ze to Shift neni pouzito, ale musi to tam byt, jinak to nefunguje}
    procedure PlotPanel3MouseMove(Sender: TObject; Shift: TShiftState; xx, yy: integer);
    procedure PlotPanel4MouseMove(Sender: TObject; Shift: TShiftState; xxxx, yyyy: integer);
    procedure PlotPanel3Click(Sender: TObject);
    procedure PlotPanel4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure Delky;
    procedure Pokracovani;
    procedure Ulozharmoniku;
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: boolean; NewValue: smallint; Direction: TUpDownDirection);
    procedure UpDown2ChangingEx(Sender: TObject; var AllowChange: boolean; NewValue: smallint; Direction: TUpDownDirection);
    procedure Vyrobjmeno;
    procedure Ukazcarky;
    procedure Ukazrychlosti;
    procedure MalujLoaded;
    procedure CtiDinar; {pouzita jak pro Dinar tak pro KTB}
    procedure Zbatchokna(Sender: TObject);
    procedure Posunnapisu(Sender: TObject);
    procedure Vsechnytri(Sender: TObject);
    procedure Switchpolar(Sender: TObject);
    procedure Davka(Sender: TObject);
    procedure Whit(Sender: TObject; vstupspek: array of double; vstupRe: array of double; vstupIm: array of double);
    procedure Najdinasazeni(Sender: TObject; vstupsighledej: array of double);
  private   {Private declarations }
  public    {Public declarations }
  end;

const
  pi                  = 3.1415926535897; {the PI number}
  chybaHu             = 0.05;            {chyba pro hustotu}
  numofpoleszeros     = 20;              {maximalni pocet polu a maximalni pocet nul pri zadavani pristrojove charakteristiky}
  malynki             = 0.00000001;      {pro ne/vykreslovani malinkych hodnot ve spektru}
  malynki2            = 0.000001;        {odrazeni od nuly pro komplexni charakteristiku pristroju}
  maxnumoflayers      = 100;             {pocet vrstev pro inverzi - bylo tady 100        /////////////////////////////////////////////////////////////////////////////////////////}
  maxnumofinversions  = 101;             {pocet behu batch inverzi - bylo tady 99   /////////////////////////////////////////////////////////////////////////////////////////}
  maxnumoffitperiod   = 500;             {pocet bodu fitovane disperzni krivky - bylo tady 50000 ///////////////////////////////////////////////////////////////////////////////////////////}
  normampli           = 5;               {normalizace amplitudy pro ukladani batch bandpass filtrovanych zaznamu, pocet vyjadruje rozmer v km na ose vzdalenosti}
  maxhrmampl          = 9999999;         {maximalni amplituda pro normalizovane hrm signaly}
  fazky               = 40;              {pocet vetvi fazove rychlosti smerem na jednu stranu, pouzije ho to na kazdou stranu, tedy do plus i do minus}
  cvelnum             = 80;              {pocet vetvi fazove rychlosti z Bessel function}
  cvelnumspec         = 30;              {pocet vetvi fazove rychlosti z faze spectra}
  pocetbesselu        = 505;             {maximalni pocet zeros of Bessel function nacitanych ze svlastniho souboru}
  pocetstanic         = 6600;            {maximalni pocet stanic pro zapamatovavani si jejich jmen}
  batchstanic         = 6600;             {pocet stanic v batchi pro nastaveni nejakych poli, standardne je tu 700, pro realana OMV data bylo 4800 a pro synteticka davam 6600}
  maxloadinver        = 309;             {maximalni pocet bodu pro batch inverzi - Dinar a KTB}

var {promenne s sirsi platnosti}
  NoSVALform                    : TNoSVALform;
  maxzerocross                  : integer;                           {celkovy pocet zero crossings}
  nacetflip                     : integer;
  zerocross                     : array[1..pocetbesselu] of double;  {zero crossings of the real part of the spectrum, predpokladam, ze jich neni vic nez 500}
  zerocrosslabel                : array[1..pocetbesselu] of integer;
  besselzero                    : array[1..pocetbesselu] of double;  {zeros of the Bessel function J0, separate file}
  besselzerolabel               : array[1..pocetbesselu] of integer;
  cvel                          : array[1..pocetbesselu, 1..cvelnum + 1] of double;
  compiledcvel                  : array[1..pocetbesselu] of double;
  frequency                     : array of double;                   {hodnota frekvence v HZ}
  period                        : array of double;                   {central periods}
  refper                        : array of double;                   {nactene referencni periody}
  refgrpvel                     : array of double;                   {nactene referencni rychlosti}
  fazova                        : array of double;                   {selected phase velocities}
  sirkafiltru                   : array of double;                   {prislusna sirka filtru}
  dilekHz                       : double;
  instper                       : array of array of double;          {instantaneous period slightly varies with respect to time}
  max1locmx                     : array of integer;                  {ordinal number representing the sample of the amplitude maximum of given quasimonochromatic signal / primary maximum}
  max2locmx                     : array of integer;                  {ordinal number representing the second (lower) amplitude maximum of given quasimonochromatic signal}
  max3locmx                     : array of integer;                  {ordinal number representing the third (lower) amplitude maximum of given quasimonochromatic signal}
  max4locmx                     : array of integer;                  {ordinal number representing the fourth (lower) amplitude maximum of given quasimonochromatic signal}
  max5locmx                     : array of integer;                  {ordinal number representing the fifth (lower) amplitude maximum of given quasimonochromatic signal}
  max6locmx                     : array of integer;
  max7locmx                     : array of integer;
  max8locmx                     : array of integer;
  Nlocmx                        : array of array of integer;
  Noznaceni                     : array of array of string;
  locmx1oznaceni                : array of string;
  locmx2oznaceni                : array of string;               {oznaceni jakeho typu je sekundarni maximum}
  locmx3oznaceni                : array of string;
  locmx4oznaceni                : array of string;
  locmx5oznaceni                : array of string;
  locmx6oznaceni                : array of string;
  locmx7oznaceni                : array of string;
  locmx8oznaceni                : array of string;
  locmxoznaceni                 : array of string;  {oznacuje, jakeho typu je konkretni maximum}
  powfrq                        : array of double;  {amplitude power spectrum of processed signal}
  smpowfrq                      : array of double;  {amplitude power spectrum of processed signal}
  whitened                      : array of double;  {amplitude power spectrum of processed signal}
  whitenedRe                    : array of double;  {amplitude power spectrum of processed signal}
  whitenedIm                    : array of double;  {amplitude power spectrum of processed signal}
  spectralphase                 : array of double;  {amplitude power spectrum of processed signal}
  spectralc                     : array of array of double;  {fazova rychlost spoctena z faze spektra}
  compiledspectralc             : array of double;
  filtpowfrq                    : array of array of double;  {amplitude spectrum filtered in given central period}
  npowfrq                       : array of double;  {100 dB normalized amplitude power spectrum of processed signal}
  CorrSpeknpowfrq               : array of double;  {100 dB normalized amplitude power spectrum of corrected signal}
  ww                            : array of array of double;  {auxiliary: for demonstration: weighting function forcing on selected period}
  www                           : array of array of double;  {auxiliary: for demonstration: weighting function forcing on selected period, but maji jednotkovou velikost}
  nww                           : array of array of double;  {100 dB normalizovany filtr}
  nwww                          : array of array of double;  {100 dB normalizovany filtr se stejnou velikosti}
  wc                            : array of double;  {weighting function forcing on whole spectrum}
  wcw                           : array of double;  {weighting function forcing on whole spectrum, actual height}
  nwc                           : array of double;  {100 dB normalizovany filtr pusobici na cele spektrum}
  nfiltpowfrq                   : array of array of double;  {100 dB normalizovany filtrovany spektrum pro dany filtr}
  Hch                           : array of complex;          {prenosova chrakteristika}
  CorrSpek                      : array of complex;          {opravene komplexni spektrum}
  CmplxSpek                     : array of complex;          {hrube komplexni spektrum}
  Nch                           : complex;                   {citatel prenosove charakteristiky}
  Dch                           : complex;                   {jmenovatel prenosove charakteristiky}
  pol                           : array[1..numofpoleszeros] of complex;
  nul                           : array[1..numofpoleszeros] of complex;
  Hampl                         : array of double;           {amplituda prenosove charakteristik}
  Hphas                         : array of double;           {phase prenosove charakteristik}
  nHampl                        : array of double;           {amplituda prenosove charakteristik}
  nHphas                        : array of double;           {phase prenosove charakteristik}
  CorrFRe                       : array of double;           {opravena realna cast komplexniho spektra}
  CorrFIm                       : array of double;           {opravena imaginarni cast komplexniho spektra}
  CorrSpekAmpl                  : array of double;           {asolutni hodnota opraveneneho spektra}
  CorrSRe                       : array of double;           {realna cast opraveneho signalu (na pristroj) v casove oblasti}
  CorrSIm                       : array of double;           {realna cast opraveneho signalu (na pristroj) v casove oblasti}
  LTA                           : array of double;
  STA                           : array of double;
  EnVCorrS                      : array of double;           {realna cast opraveneho signalu (na pristroj) v casove oblasti}
  cper                          : array of double;
  cper2                         : array of double;
  ca                            : array of double;
  chybaL                        : array of double;
  chybaR                        : array of double;
  DD                            : array[1..30] of double;    {tloustky jednotlivych vrstev}
  midD                          : array[1..30] of double;    {hloubky stredu jednotlivych vrstev}
  pip                           : array[1..maxnumoflayers] of double;
  loadper                       : array of double;           {periody z disperze natazene odjinud}
  loadgrvel                     : array of double;           {grupove rychlosti z disperze natazene odjinud}
  loadper2                      : array of double;           {periody z disperze natazene odjinud - druha krivka}
  loadgrvel2                    : array of double;           {grupove rychlosti z disperze natazene odjinud - druha krivka}
  prumtperiod                   : array[1..maxnumoffitperiod] of double;
  prumuvelocity                 : array[1..maxnumoffitperiod] of double;
  prumuvelocity2                : array[1..maxnumoffitperiod] of double;
  locmx                         : array of integer;          {final dispersion curve indexes}
  nahradnimax                   : array of integer;
  refi                          : array of integer;          {final dispersion curve indexes}
  jake                          : array of string;           {zapamatuje si to, jake maximum se vzalo pro dany filtr}
  fre                           : array of double;           {the real part of a spectrum of the signal}
  fresm                         : array of double;           {smoothed real part of a spectrum of the signal}
  fim                           : array of double;           {the imaginary part of a spectrum of the signal}
  xfre                          : array of double;           {the real part of a spectrum of the signal for the bandpass filtering}
  xfim                          : array of double;           {the imaginary part of a spectrum of the signal for the bandpass filtering}
  moje                          : array of double;
  maxmono                       : array of double;
  maxmonox                      : array of double;
  Afactor                       : double;
  complffre                     : array of double;           {double part of a spectrum completely filtered}
  complffim                     : array of double;           {imaginary part of a spectrum completelyfiltered}
  complfiltpowfrq               : array of double;           {amplitude spectrum completely filtered}
  complfiltnpowfrq              : array of double;           {kompletne filtrovane normalizovane spketrum}
  fazovaP                       : array of array of double;  {vetve fazove rychlosti z analytickeho signalu}
  Binter                        : array[1..maxnumoflayers] of extended;
  Bdinar                        : array[1..maxnumoflayers] of extended; {startovaci rychlost S-vln pro Dinar i pro KTB}
  B                             : array[1..maxnumoflayers] of extended;
  A                             : array[1..maxnumoflayers] of extended;
  R                             : array[0..maxnumoflayers] of extended;
  setPVSV                       : array[1..maxnumoflayers] of extended;
  eskai                         : array[1..maxnumoflayers] of integer;
  distkm                        : double;                    {epicantral distance in kilometers}
  permax                        : double;                    {maximal period to be computed}
  origpermax                    : double;                    {maximal period to be computed - nastavena z okenka, protoze permax muzu menit}
  permin                        : double;                    {minimal period to be computed}
  hlfamx                        : double;                    {an actual maximum of the amplitude power spectrum}
  perfltmax                     : double;                    {maximalni perioda celkoveho filtrovani}
  perfltmin                     : double;                    {minimalni perioda celkoveho filtrovani}
  cstart                        : double;
  ffirst                        : double;
  offirst                       : double;
  ffirst2                       : double;
  flast                         : double;
  oflast                        : double;
  flast2                        : double;
  dur                           : double;                    {duration of processed signal}
  hlayers                       : double;                    {hloubky postupne vsech vrstev}
  hlayers2                      : double;
  depth                         : double;
  dropoff                       : double;
  dropofffirst                  : double;
  densitystep                   : double;
  setvelocitys                  : extended;
  setdensity                    : double;
  poklesS                       : double;                    {o kolik muze klesat  Sv v dalsich vrstvach}
  narustS                       : double;                    {o kolik muze stoupat Sv v dalsich vrstvach}
  narustP                       : double;                    {o kolik muze stoupat i kleasat PvSv v dalsich vrstvach}
  hustotypokles                 : double;                    {o kolik muze klesat  hustota v dlasich vrstvach}
  hustotynarust                 : double;                    {o kolik muze stoupat hustota v dlasich vrstvach}
  fstep                         : double;
  slctdperiod                   : double;
  timein                        : double;                    {sampling time interval}
  timeinspek                    : double;
  hloubkykrok                   : double;                    {krok pro malovani struktur v PlotPanelu4}
  hustpart                      : double;
  hustnorm                      : double;
  LovePART                      : double;
  Lovenorm                      : double;
  RaylPART                      : double;
  Raylnorm                      : double;
  nsampl                        : integer;                   {number of processed samples}
  nsamplspek                    : integer;                   {number of processed samples}
  ityprl                        : integer;
  numofdat                      : integer;
  numoflay                      : integer;                   {pocet vrstev bez poloprostoru}
  numofpar                      : integer;
  trefa                         : integer;
  pocitadlo                     : integer;
  niterace                      : integer;
  radek                         : integer;
  prumnft                       : integer;
  nflt                          : integer;                   {actual number of filters}
  nfltorig                      : integer;
  n                             : integer;                   {actual number of samples entering the FFT}
  nspek                         : integer;                   {actual number of samples entering the FFT}
  nakt                          : integer;
  nhlf                          : integer;                   {half of the "n" - number of FFT bodu}
  eska, husto, pecka            : integer;                   {pocitadlo vykreslovani vrstev hustot, esek a pecek}
  pp3                           : integer;                   {pro vykreslovani modelove disperzni krivky do plotpanelu 3}
  miss1                         : integer;                   {pocitadlo vrstev misfit funkce}
  miss2                         : integer;                   {pocitadlo vrstev misfit funkce}
  miss3                         : integer;                   {pocitadlo vrstev misfit funkce}
  miss4                         : integer;                   {pocitadlo vrstev misfit funkce}
  nfmin                         : extended;
  nfmax                         : extended;
  puvodnieska                   : integer;
  delkarenaty                   : integer;
  cd                            : integer;
  durstrg                       : string;
  nsamplstrg                    : string;
  numofparstrg                  : string;
  numofdatstrg                  : string;
  pocitadlostrg                 : string;
  niteracestrg                  : string;
  radekstrg                     : string;
  jstrg                         : string;
  dropoffstrg                   : string;
  dropofffirststrg              : string;
  slctdperiodstrg               : string;
  nstrg                         : string;
  nspekstrg                     : string;
  naktstrg                      : string;
  nhlfstrg                      : string;
  zacatekstrg                   : string;
  konecstrg                     : string;
  maxsamplesstrg                : string;
  supermaxsamplesstrg           : string;
  hustnormstrg                  : string;
  Lovenormstrg                  : string;
  Raylnormstrg                  : string;
  vzdastrg                      : string;
  instrument                    : string;
  jmenostanice                  : string;
  forflip                       : array[1..pocetstanic] of string;
  refcaption                    : string;
  Messages                      : TStrings;
  periodsbox                    : TStrings;
  uzjsemtu                      : boolean;
  uzjsemvni                     : boolean;
  FFT                           : boolean;
  usegroup                      : boolean;
  nahrada                       : boolean;
  nahrada2                      : boolean;
  joint                         : boolean;                   {je to true, kdyz jsem nacetl dve disperzni krivky najednou}
  filtrujuopravovany            : boolean;
  interaktivni                  : boolean;
  bandpass                      : boolean;
  korigovaljsem                 : boolean;
  menise                        : boolean;
  firstfix                      : boolean;
  lvz                           : boolean;
  removeoffset                  : boolean;
  epicfromfile                  : boolean;
  batchproces                   : boolean;
  prorenatu                     : boolean;
  alphacheck                    : boolean;
  spadnul1, spadnul2            : boolean;
  actperfltmin                  : integer;
  actperfltmax                  : integer;
  perfltmaxstrg                 : string;
  perfltminstrg                 : string;
  hydrodatum                    : double;
  hydrozacat                    : double;
  hydrokonec                    : double;
  batchinver                    : boolean;
  numofbatchinver               : integer;
  ibpstrg                       : string;
  ibp                           : integer;
  jaky                          : integer;
  hhalfspace                    : double;                    {hloubka horni hranice poloprostoru}
  prumernabatch                 : boolean;
  bfdRed                        : integer;
  bfdGreen                      : integer;
  bfdBlue                       : integer;
  batchprumerS                  : array[1..maxnumoflayers] of double;  {prumerna struktura po setu inverzi}
  batchprumerP                  : array[1..maxnumoflayers] of double;  {prumerna struktura po setu inverzi}
  batchprumerH                  : array[1..maxnumoflayers] of double;  {prumerna struktura po setu inverzi}
  batchvzdaprum                 : double;                              {prumerny misfit po setu inverzi}
  batchvzda                     : array[1..maxnumofinversions] of double; {soucet misfitu vsech inverzi pri barch inverzi}
  jenjedna                      : boolean;
  greenvzda                     : double;
  minprumuvelocity              : array[1..maxnumoffitperiod] of double;
  maxprumuvelocity              : array[1..maxnumoffitperiod] of double;
  lay                           : integer;                             {pro vykreslovani vrstev}
  fitvelocbatch                 : array[1..maxnumoffitperiod, 1..maxnumofinversions] of double; {pole vsech fitovanych krivek, prvni index je perioda, druhy index je poradi inverze}
  prumfit                       : array[1..maxnumoffitperiod] of double;
  odchylkafit                   : array[1..maxnumoffitperiod] of double;
  zavorkafit                    : array[1..maxnumoffitperiod] of double;
  skok                          : boolean;
  rozmezivel                    : boolean;
  hydrovel                      : boolean;
  ema                           : boolean;
  zemy                          : boolean;
  POLAR                         : boolean;
  POLARflip                     : boolean;
  POLARflipZT                   : boolean;
  taper                         : boolean;
  reference                     : boolean;
  fixedcut                      : boolean;
  PREMlimit                     : boolean;
  superbatchyesno               : boolean;
  yesno                         : boolean;
  harmoniky                     : boolean;
  trcyesno                      : boolean;
  syrovkyyes                    : boolean;
  batchdisperze                 : boolean;
  kolikjichchci                 : integer;
  corrbatchyes                  : boolean;
  spektrayesno                  : boolean;
  batchbandpass                 : boolean;
  demoyes                       : boolean;
  allthreeyes                   : boolean;
  savewave                      : boolean;                    {jestli chci ukladat vybrane wavegroups pri batch processingu}
  fliprec                       : boolean;
  besseltrue                    : boolean;
  savewhole                     : boolean;                    {jestli chci v batchi ulozit bandpass filtrovany zaznam}
  doublebandpass                : boolean;
  savecorrected                 : boolean;
  saverdg                       : boolean;
  chcesnormalizovany            : word;
  Dinar                         : boolean;
  KTB                           : boolean;
  prvniDinar                    : boolean; {pouzito i pro KTB}
  nodestrg                      : string;
  pocetdisperzi                 : integer;
  loadingf                      : textfile;
  posilamnacombo2               : boolean;
  posilamnacombo3               : boolean;
  nodelatistrg, nodelongstrg    : string;
  cestakdisperzi                : string;
  zacS, zacR, zacP              : integer;  {pro vykreslovani startovaciho modelu}
  clicks, chos                  : integer;  {pro vykreslovani vrstev}
  subarrayname                  : string[5];
  fromPhaseCorr                 : boolean;
  fromArrayCorr                 : boolean;
  loadnflt                      : integer;  {loaded number of filters}

implementation {promenne jen pro tuhle unitu}

uses SpectrumUnit, InverUnit, BatchUnit;
{$R *.lfm}
var
  filterbox                     : TStrings;
  loadperiodsbox                : TStrings;
  ee                            : integer;
  ks                            : integer;
  proccount                     : integer;
  jcyc                          : integer;  {used in cycles - varies during the cycle run}
  nstart                        : integer;  {an ordinal number of the first processed sample}
  nlast                         : integer;  {an ordinal number of the last processed sample}
  loadnflt2                     : integer;  {loaded number of filters}
  nw                            : integer;  {number of samples smoothed by the cosine window}
  unwanted                      : integer;  {auxiliary array for not-required beginning of the record}
  n2pow                         : integer;  {an argument of the exponential 2**n2pow}
  supern2pow                    : integer;  {an argument of the exponential 2**n2pow}
  n2powspek                     : integer;  {an argument of the exponential 2**n2pow}
  nffl                          : integer;  {auxiliary number of filters}
  nqp                           : integer;  {number of periods in the processed signal, rounded off and incremented of 1}
  nfc                           : integer;  {central frequency entering the procedure "filter"}
  maxnumofmax                   : integer;  {maximal number of local maxima in one of the the quasi-monochromatic filtered signals}
  index                         : integer;
  clickindex                    : integer;
  maxindex                      : integer;
  cfs                           : integer;  {Counter of drawning of Filtered Sesimogram}
  crych                         : integer;
  pp1                           : integer;
  skladej                       : integer;
  spodniindex                   : integer;
  spodniindex1                  : integer;
  spodniindex2                  : integer;
  horniindex                    : integer;
  horniindex1                   : integer;
  horniindex2                   : integer;
  spodnejsi                     : integer;  {pro vykreslovani upravenych mezi}
  hornejsi                      : integer;  {pro vykreslovani upravenych mezi}
  kraceni                       : integer;  {kolikrat budu kratit pocet sampliku pro vykreslovani v PlotPanelech}
  pocet1                        : integer;  {pocitadlo primarnich maxim}
  pocet2                        : integer;
  pocet3                        : integer;
  pocet4                        : integer;
  pocet5                        : integer;
  pocet6                        : integer;
  pocet7                        : integer;
  pocet8                        : integer;
  kuki, vybr                    : integer;
  filesamplesnumber             : integer;
  pocitadlofile                 : integer;
  pocetnavic                    : integer;  {pocet, o kolik je hlavicka KUKu delsi, nez 8 radek}
  misto                         : integer;
  misto2                        : integer;
  pozice                        : integer;
  posledni                      : integer;
  kolikatysuper                 : integer;
  aktualnijev                   : integer;
  totalbatchstations            : integer;
  nacetadresaru                 : integer;
  pocetblbejch                  : integer;
  winlen                        : integer;
  pulwinlen                     : integer;
  prvniodraz, posledniodraz     : integer;
  LTAlen, STAlen                : integer;
  selectedindex                 : integer;
  kresgrveli                    : array[1..30] of integer;
  uppersampl                    : array of integer;  {index of upper sample for keeping the original filtered quasimonochromatic signal}
  lowersampl                    : array of integer;  {index of lower sample for keeping the original filtered quasimonochromatic signal}
  Nuppersampl                   : array of integer;
  Nlowersampl                   : array of integer;
  upperzerosampl                : array of integer;  {index of upper sample - all other sample above this one will be zero}
  lowerzerosampl                : array of integer;  {index of lower sample - all other sample under this one will be zero}
  POLuppersampl                 : array of integer;  {index of upper sample for keeping the original filtered quasimonochromatic signal}
  POLlowersampl                 : array of integer;  {index of lower sample for keeping the original filtered quasimonochromatic signal}
  POLupperzerosampl             : array of integer;  {index of upper sample - all other sample above this one will be zero}
  POLlowerzerosampl             : array of integer;  {index of lower sample - all other sample under this one will be zero}
  numofmax                      : array of integer;  {number of local maxima in given filtered signal}
  nf                            : array of integer;  {step in frequency}
  zeroposition                  : array of integer;  {position (time) of zero double part in monochromatic signal}
  zeroposition1                 : array of integer;
  zeroposition2                 : array of integer;
  zeroposition3                 : array of integer;  {position (time) of zero double part in monochromatic signal}
  zeroposition4                 : array of integer;  {position (time) of zero double part in monochromatic signal}
  zeropositionStation           : array of array of integer;  {position of the zero crossing for all stations}
  zeropositionStation1          : array of array of integer;  {position of the zero crossing for all stations}
  zeropositionStation2          : array of array of integer;  {position of the zero crossing for all stations}
  zeropositionStation3          : array of array of integer;  {position of the zero crossing for all stations}
  zeropositionStation4          : array of array of integer;  {position of the zero crossing for all stations}
  seclocmx                      : array of array of integer;  {dynamic array - ordinal number representing the sample of any of the local maxima in given filter}
  numfilt                       : array of integer;          {auxiliary variable for controlling the nuber of useful filters}
//  maxfazeindex                  : array of integer;
//  minfazeindex                  : array of integer;
  nstarthlp                     : double;
  nlasthlp                      : double;
  timedist                      : double;  {time interval between the origin time and the beginning of the record}
  timedisthlp                   : double;  {auxiliary time interval if the record starts befor the origin time}
  sigmaxi                       : double;  {amplitude maximum of the processed signal}
  sigmini                       : double;  {amplitude minimum of the processed signal}
  f                             : double;  {amplitude of cosine window for smoothing the edges of original signal}
  fe                            : double;  {amplitude of cosine window for smoothing of parts of the quasimonochromatic signals}
  g                             : double;  {power factor for computing the multiplicative step gamma}
  gamma                         : double;  {the multiplicative step between central periods}
  per                           : double;  {value of period in second used in cycle for computing the central periods}
  fsigmx                        : double;  {maximum of actual filtered seismogram}
  amx                           : double;  {an actual maximum of the spectrogram}
  amin                          : double;  {an actual minimum of normalized spectrogram}
  namx                          : double;  {an actual maximum of normalized spectrogram / pro kontrolu, melo by to vyjit neco jako 100.00}
  br                            : double;  {ratio: amp[j,i] / amx}
  hlfb                          : double;  {ratio: powfrq[i] / hlfamx}
  hlfbw                         : double;
  hlfbww                        : double;
  hlfbwc                        : double;
  scalefactor                   : double;  {multiplicative factor used for scaling of the amplitude of filtered seismogram}
  alphaabs                      : double;
  alphadir                      : double;
  plotsigmaxi                   : double;
  hlpseclocamp                  : double;
  original01                    : double;
  original02                    : double;
  grvelmin                      : double;  {jen hodnota posledni urcene rychlosti v celem spektrogramu}
  grvelmax                      : double;  {jen hodnota prvni urcene rychlosti v celem spektrogramu}
  loadgrvelmax                  : double;
  loadgrvelmin                  : double;
  loadgrvelmax1                 : double;
  loadgrvelmin1                 : double;
  loadgrvelmax2                 : double;
  loadgrvelmin2                 : double;
  minrozdil                     : double;
  minrozdil1                    : double;
  minrozdil2                    : double;
  spodnikrit                    : double;
  hornikrit                     : double;
  minderivace                   : double;
  maxderivace                   : double;
  alphamin                      : double;
  alphamax                      : double;
  minclickedper                 : double;
  minclickedvel                 : double;
  minjointload                  : double;
  maxjointload                  : double;
  zacatekSVAL                   : double;
  konecSVAL                     : double;
  trvaniSVAL                    : double;
  KUKdistkm                     : double;
  KUKtimedist                   : double;
  KUKlat                        : double;
  KUKlon                        : double;
  bazi                          : double;
  KUKsampling                   : double;
  prumer                        : double;
  complsigmaxi                  : double;
  clickedperfaz                 : double;   {nakliknuta perioda}
  clickedvelfaz                 : double;   {nakliknuta rychlost}
  orizka                        : double;
  maxsmpowfrq                   : double;
  corrsigmaxi                   : double;
  maxik                         : double;
  rozdilselected                : double;
  optperiod                     : double;
  KUKdistkmStation              : array of double;
  KUKlatStation                 : array of double;
  KUKlonStation                 : array of double;
  druhyradekstrgStation         : array of string;
  sre                           : array of double;   {double part of an input signal}
  sreZ                          : array of double;   {double part of an input signal}
  sreR                          : array of double;   {double part of an input signal}
  sreT                          : array of double;   {double part of an input signal}
  sreRZ                         : array of double;   {double part of an input signal}
  sreZR                         : array of double;   {double part of an input signal}
  rawsre                        : array of double;   {double part of an input signal}
  sim                           : array of double;   {imaginary part of an input signal / zero in case of seismograms}
  rawsim                        : array of double;   {imaginary part of an input signal / zero in case of seismograms}
  loc1amp                       : array of double;   {amplitude of the maximum of the quasimonochromatic signal}
  loc2amp                       : array of double;   {amplitude of the second (lower) amplitude maximum of given quasimonochromatic signal}
  loc3amp                       : array of double;   {amplitude of the third (lower) amplitude maximum of given quasimonochromatic signal}
  loc4amp                       : array of double;   {amplitude of the fourth (lower) amplitude maximum of given quasimonochromatic signal}
  loc5amp                       : array of double;   {amplitude of the fifth (lower) amplitude maximum of given quasimonochromatic signal}
  loc6amp                       : array of double;
  loc7amp                       : array of double;
  loc8amp                       : array of double;
  alpha                         : array of double;           {coefficient alpha used in exponent of the Gaussian filtering}
  complfsre                     : array of double;           {real part of a completely filtered}
  complfsim                     : array of double;           {imag part of a completely filtered}
  vyrovnany                     : array of double;           {real AGCed completely filtered}
  complamp                      : array of double;           {envelope of bandpass filtered signal}
  zhlazena                      : array of double;           {zhlazena envelope of bandpass filtered signal}
  complphase                    : array of double;           {faze completne filtrovaneho signalu}
  anphasegroup                  : array of double;           {faze v case grupoveho maxima pro vsechny filtry}
  anphaseMAX                    : array of double;           {faze v case grupoveho maxima pro vsechny filtry, ale neopravovana}
  zerophasetime                 : array of double;           {cas hypoteticke nulove faze ziskany z faze pod maximem obalky}
  filtered                      : array of double;           {fitlered seismogram}
  uppdiff                       : array of double;           {derivation of the monochromatic signal in the inflection point above (later time) the maximum}
  lowdiff                       : array of double;           {derivation of the monochromatic signal in the inflection point under (former time) the maximum}
  grvel                         : array of double;           {group velocity - used for imaging the dispersion curve}
  batchgrvel                    : array of double;           {group velocity - prumerna z batche}
  batchinstper                  : array of double;           {perioda - prumerna z batche}
  SVALtime                      : array of double;           {time measured from origin}
  SVALtimeSPEK                  : array of double;           {time measured from origin}
  rozdil                        : array of double;           {rozdil sousednich period filtru pro inverzi}
  rozdil2                       : array of double;           {rozdil sousednich period filtru pro inverzi}
  clickedper1                   : array of double;           {nakliknuta perioda}
  clickedvel1                   : array of double;           {nakliknuta rychlost}
  clickedper2                   : array of double;           {nakliknuta perioda}
  clickedvel2                   : array of double;           {nakliknuta rychlost}
  clickedper3                   : array of double;           {nakliknuta perioda}
  clickedvel3                   : array of double;           {nakliknuta rychlost}
  clickedper4                   : array of double;           {nakliknuta perioda}
  clickedvel4                   : array of double;           {nakliknuta rychlost}
  clickedper5                   : array of double;           {nakliknuta perioda}
  clickedvel5                   : array of double;           {nakliknuta rychlost}
  clickedper6                   : array of double;           {nakliknuta perioda}
  clickedvel6                   : array of double;           {nakliknuta rychlost}
  clickedper7                   : array of double;           {nakliknuta perioda}
  clickedvel7                   : array of double;           {nakliknuta rychlost}
  clickedper8                   : array of double;           {nakliknuta perioda}
  clickedvel8                   : array of double;           {nakliknuta rychlost}
  SVALtimeStation               : array of array of double;  {time of the maximum energy for all stations}
  grvelStation                  : array of array of double;  {time of the maximum energy for all stations}
  lowerlocamp                   : array of array of double;  {dynamic array - an amplitude of any of lower amplitude maxima of given quasimonochromatic signal}
  errormax                      : array of array of double;   {chyba maxima}
  ffre                          : array of array of double;  {double part of a spectrum filtered in given central period}
  ffim                          : array of array of double;  {imaginary part of a spectrum filtered in given central period}
  fsre                          : array of array of double;  {double part of a filtered (quasimonochromatic) signal / double part of the truncated and smoothed filtered signal}
  fsim                          : array of array of double;  {imaginary part of a filtered (quasimonochromatic) signal}
  corrfsre                      : array of array of double;  {korigovany filtrovany realnana cast signalu v case}
  fxsre                         : array of array of double;  {double part of a filtered (quasimonochromatic) signal (the same as the fsre, but fsre will be truncated)}
  fxsim                         : array of array of double;  {double part of a filtered (quasimonochromatic) signal (the same as the fsim, but fsim will be truncated)}
  amp                           : array of array of double;  {for choosed filter: an envelope of quasimonochromatic signal / array: spectrogram}
  famp                          : array of array of double;  {for choosed filter: an envelope of energy peak of (truncated) quasimonochromatic signal / array: fitlered spectrogram}
  namp                          : array of array of double;  {for choosed filter: normalized quasimonochromatic signal / array: normalized spectrogram}
  fnamp                         : array of array of double;  {for choosed filter: an normalized envelope of energy peak of quasimonochromatic signal / array: normalized filtered spectrogram}
  xnamp                         : array of array of double;  {pomocne normalizovana amplituda orezaneho spektrogramu}
  anphase                       : array of array of double;  {phase of the analytical signal for computing the instantaneous frequency of the maximum of selected monochromatic signal}
  derphase                      : array of array of double;  {derivation of "anphase" with respect to time}
  instfreq                      : array of array of double;  {instantaneous frequency}
  derivace                      : array of array of double;  {derivace obalky kazdeho monochromatickeho signalu v kazdem bode te obalky}
  cinput                        : arrayoffour1procedure;     {dynamic array - used as an input for FFT and inverse FFT}
  WX, WY                        : extended; {pro zapisovani souradnice v PlotPanelu 3 - spektrogram}
  WXXX, WYYY                    : extended; {pro zapisovani souradnice v PlotPanelu 4 - struktura}
  distkmstrg                    : string;
  timediststrg                  : string;
  samplingstrg                  : string;
  nstartstrg                    : string;
  nlaststrg                     : string;
  perminstrg                    : string;
  permaxstrg                    : string;
  nfltstrg                      : string;
  nwstrg                        : string;
  alphaabsstrg                  : string;
  alphadirstrg                  : string;
  proccountstrg                 : string;
  n2powstrg                     : string;
  n2powspekstrg                 : string;
  gammastrg                     : string;
  periodstrg                    : string;
  filterstrg                    : string;
  indexstrg                     : string;
  centralperstrg                : string;
  zeropositionperiodstrg        : string;
  centralfrqstrg                : string;
  startvelocitystrg             : string;
  ffirststrg                    : string;
  flaststrg                     : string;
  svalcstartstrg                : string;
  inverindexfstrg               : string;
  inverindexlstrg               : string;
  minrozdilstrg                 : string;
  spodnikritstrg                : string;
  hornikritstrg                 : string;
  spodniindexstrg               : string;
  horniindexstrg                : string;
  fstepstrg                     : string;
  amxstrg                       : string;
  aminstrg                      : string;
  namxstrg                      : string;
  part1, part2                  : string;
  partcomponent                 : string;
  partdir, partpocitad          : string;
  kracenistrg                   : string;
  pocet1strg                    : string;
  pocet2strg                    : string;
  pocet3strg                    : string;
  pocet4strg                    : string;
  pocet5strg                    : string;
  pocet6strg                    : string;
  pocet7strg                    : string;
  pocet8strg                    : string;
  loadperiodstrg                : string;
  trvaniSVALstrg                : string;
  filesamplesnumberstrg         : string;
  truemaxgrpstrg                : string;
  truemingrpstrg                : string;
  druhyradekstrg                : string;
  tretiradekstrg                : string;
  patyradekstrg                 : string;
  sestyradekstrg                : string;
  sedmyradekstrg                : string;
  osmyradekstrg                 : string;
  KUKdistkmstrg                 : string;
  KUKtimediststrg               : string;
  KUKlatstrg                    : string;
  KUKlonstrg                    : string;
  bazistrg                      : string;
  KUKsamplingstrg               : string;
  unwantedstrg                  : string;
  jmenofilu                     : string;
  jmenoposledniho               : string;
  jmenouloz                     : string;
  cesta                         : string;
  cestamanu                     : string;
  dispfilename                  : string;
  supercesta                    : string;
  pocitadlofilestrg             : string;
  ridges                        : string;
  dots                          : string;
  dots1                         : string;
  dots2                         : string;
  dots3                         : string;
  dots4                         : string;
  dots5                         : string;
  dots6                         : string;
  dots7                         : string;
  dots8                         : string;
  dotsPERcas                    : string;
  dotsPERcasBEZ1                : string;
  dotsALL                       : string;
  dispALLphase                  : string;
  dispALLphaseS                 : string;
  dispALLdiffgrvel              : string;
  dispALLgroup                  : string;
  dispALLampli                  : string;
  redsts                        : string;
  redlab                        : string;
  yellowsts                     : string;
  yellowlab                     : string;
  phaseALLstrg                  : string;
  groupALLstrg                  : string;
  casik                         : string;
  casikSPEK                     : string;
  hrm                           : string;
  adr                           : string;
  pocetblbejchstrg              : string;
  dohromady                     : string;
  rr                            : string;       {used for unwanted part of record}
  KUKsensor                     : string[10];
  nic                           : string[2];
  prvniradekstrg                : string[17];
  adresar                       : array of string;
  eventstations                 : integer;
  redstationN                   : integer;
  yellowstationN                : integer;
  blbyjmeno                     : array[1..pocetstanic] of string;
  oznaceni                      : array of array of string;  {dynamic array - oznaceni, jakeho typu je given quasimonochromatic signal}
  signal                        : textfile;     {input file:  signal to be processed}
  referencefile                 : textfile;     {soubor s referencni disperzni krivkou pro truncatingovani}
  dat                           : textfile;
  trc                           : textfile;     {output file: 3 columns: log-period / group velocity / truncated normalized amplitude}
  dispersion                    : textfile;     {output file: dispersion curve - 2 columns: period / group velocity}
  dispersionX                   : textfile;     {output file: dispersion curve - 2 columns: period / group velocity}
  wavegroupfile                 : textfile;     {output file: selected wavegroup}
  stationbpsfile                : textfile;
  stationeqzfile                : textfile;
  dispersionXrdg                : textfile;     {output file: eight ridges of the spectrogram}
  dispersionXdot                : textfile;     {output file: all ridges of the spectrogram}
  dispersionXdotALL             : textfile;     {output file: all ridges of the spectrogram}
  ALLdispersionsPHASE           : textfile;     {output file: all dispersion curves from BATCH}
  ALLdispersionsAMPLI           : textfile;     {output file: all amplitudes from BATCH}
  ALLdispersionsSELECT          : textfile;
  ALLdispersionsDIFFGRVEL       : textfile;
  ALLdispersionsGROUP           : textfile;     {output file: all dispersion curves from BATCH}
  redstation                    : textfile;
  redlabel                      : textfile;
  yellowstation                 : textfile;
  yellowlabel                   : textfile;
  averbatchdispfile             : textfile;
  dotsmax1                      : textfile;
  dotsmax2                      : textfile;
  dotsmax3                      : textfile;
  dotsmax4                      : textfile;
  dotsmax5                      : textfile;
  dotsmax6                      : textfile;
  dotsmax7                      : textfile;
  dotsmax8                      : textfile;
  dotsmaxPERcas                 : textfile;
  dotsmaxPERcasBEZ1             : textfile;
  filteredseism                 : textfile;     {output file: filtered seismogram - 2 colums: time from origin / filtered amplitude of selected period}
  filteredseismHYDRO            : textfile;
  filteredseismASG              : textfile;
  filteredseismDAT              : textfile;
  filteredseismPHS              : textfile;
  phaseALL                      : textfile;
  groupALL                      : textfile;
  aallbez                       : textfile;
  aallvyr                       : textfile;
  monochrom                     : textfile;
  monochromX                    : textfile;
  fliplist                      : textfile;
  //  monochromXX               : textfile;   {pro ukladani okamzitych fazi, nekde dole je vykomentovana procedurka pro toto}
  monochromCPL                  : textfile;
  sirky                         : textfile;
  structure                     : textfile;
  strucgraf                     : textfile;
  modelovani                    : textfile;
  modeldisp                     : textfile;
  layers                        : textfile;
  harmonics                     : textfile;
  seznam                        : textfile;
  bessel                        : textfile;
  useloaded                     : boolean;
  usefiltered                   : boolean;
  filtrange                     : boolean;
  layload                       : boolean;
  allbods                       : boolean;
  nasilne                       : boolean;
  nasel                         : boolean;
  zarad                         : boolean;
  truncx                        : boolean;
  zbatche                       : boolean;
  vynuceneukonceni              : boolean;
  logiksezavrel                 : boolean;
  zacatekblbe                   : boolean;
  konecblbe                     : boolean;
  puvodno                       : boolean;
  chcichyby                     : boolean;
  prvnihlavicka                 : boolean;
  prvnihlavickasavewhole        : boolean;
  grupka                        : boolean;
  jeblba                        : boolean;
  zmacknulbandpass              : boolean;
  udelalopraveny                : boolean;
  prvnidoublebandpass           : boolean;
  syrovky                       : word;
  trcyesnovalue                 : word;
  notvalidfile                  : boolean;
  nenulovy                      : boolean;
  uztubyl                       : boolean;
  skippedfile                   : integer;
  loadnfltstrg                  : string;

procedure TNoSVALform.Delky;
begin  {nastavovani poli s sirsi platnosti}
  Form2.ProgressBar1.Min := 0;
  Form2.ProgressBar1.Max := (maxnflt * 23 + 55);   {nastavuju pocet elementarnich kousicku, o ktere se posouva progress bar}
  setlength(frequency, supermaxsamples + 1);       {hodnota frekvence v HZ}
  setlength(maxmono, maxnflt + 1);
  setlength(maxmonox, maxnflt + 1);
  setlength(period, maxnflt + 1);
  setlength(refper, maxnflt + 1);
  setlength(refgrpvel, maxnflt + 1);
  setlength(fazova, maxnflt + 1);
  setlength(sirkafiltru, maxnflt + 1);
  setlength(max1locmx, maxnflt + 1);
  setlength(max2locmx, maxnflt + 1);
  setlength(max3locmx, maxnflt + 1);
  setlength(max4locmx, maxnflt + 1);
  setlength(max5locmx, maxnflt + 1);
  setlength(max6locmx, maxnflt + 1);
  setlength(max7locmx, maxnflt + 1);
  setlength(max8locmx, maxnflt + 1);
  setlength(Nlocmx, 9, maxnflt + 1);
  setlength(Noznaceni, 9, maxnflt + 1);
  setlength(locmx1oznaceni, maxnflt + 1);
  setlength(locmx2oznaceni, maxnflt + 1);
  setlength(locmx3oznaceni, maxnflt + 1);
  setlength(locmx4oznaceni, maxnflt + 1);
  setlength(locmx5oznaceni, maxnflt + 1);
  setlength(locmx6oznaceni, maxnflt + 1);
  setlength(locmx7oznaceni, maxnflt + 1);
  setlength(locmx8oznaceni, maxnflt + 1);
  setlength(locmxoznaceni, maxnflt + 1);
  setlength(cper, maxnflt + 1);
  setlength(cper2, maxnflt + 1);
  setlength(ca, maxnflt + 1);
  setlength(chybaL, maxnflt + 1);
  setlength(chybaR, maxnflt + 1);
  setlength(loadper, maxnflt + 1);
  setlength(loadgrvel, maxnflt + 1);
  setlength(loadper2, maxnflt + 1);
  setlength(loadgrvel2, maxnflt + 1);
  setlength(locmx, maxnflt + 1);
  setlength(nahradnimax, maxnflt + 1);
  setlength(refi, maxnflt + 1);
  setlength(anphasegroup, maxnflt + 1);
  setlength(anphaseMAX, maxnflt + 1);
  setlength(zerophasetime, maxnflt + 1);
  setlength(jake, maxnflt + 1);
  setlength(uppersampl, maxnflt + 1);
  setlength(lowersampl, maxnflt + 1);
  setlength(POLuppersampl, maxnflt + 1);
  setlength(POLlowersampl, maxnflt + 1);
  setlength(Nuppersampl, maxnflt + 1);
  setlength(Nlowersampl, maxnflt + 1);
  setlength(errormax, 9, maxnflt + 1);
  setlength(upperzerosampl, maxnflt + 1);
  setlength(lowerzerosampl, maxnflt + 1);
  setlength(POLupperzerosampl, maxnflt + 1);
  setlength(POLlowerzerosampl, maxnflt + 1);
  setlength(numofmax, maxnflt + 1);
  setlength(nf, maxnflt + 1);
  setlength(zeroposition, maxnflt + 1);
  setlength(zeroposition1, maxnflt + 1);
  setlength(zeroposition2, maxnflt + 1);
  setlength(zeroposition3, maxnflt + 1);
  setlength(zeroposition4, maxnflt + 1);
  setlength(zeropositionStation , maxnflt + 1, batchstanic);
  setlength(zeropositionStation1, maxnflt + 1, batchstanic);
  setlength(zeropositionStation2, maxnflt + 1, batchstanic);
  setlength(zeropositionStation3, maxnflt + 1, batchstanic);
  setlength(zeropositionStation4, maxnflt + 1, batchstanic);
  setlength(SVALtimeStation , maxnflt + 1, batchstanic);
  setlength(grvelStation , maxnflt + 1, batchstanic);
  setlength(KUKdistkmStation, batchstanic);
  setlength(KUKlatStation, batchstanic);
  setlength(KUKlonStation, batchstanic);
  setlength(druhyradekstrgStation, batchstanic);
//  setlength(maxfazeindex, maxnflt + 1);
//  setlength(minfazeindex, maxnflt + 1);
  setlength(loc1amp, maxnflt + 1);
  setlength(loc2amp, maxnflt + 1);
  setlength(loc3amp, maxnflt + 1);
  setlength(loc4amp, maxnflt + 1);
  setlength(loc5amp, maxnflt + 1);
  setlength(loc6amp, maxnflt + 1);
  setlength(loc7amp, maxnflt + 1);
  setlength(loc8amp, maxnflt + 1);
  setlength(numfilt, maxnflt + 1);
  setlength(alpha, maxnflt + 1);
  setlength(uppdiff, maxnflt + 1);
  setlength(lowdiff, maxnflt + 1);
  setlength(rozdil, maxnflt + 1);
  setlength(rozdil2, maxnflt + 1);
  setlength(clickedper1, maxnflt + 1);
  setlength(clickedvel1, maxnflt + 1);
  setlength(clickedper2, maxnflt + 1);
  setlength(clickedvel2, maxnflt + 1);
  setlength(clickedper3, maxnflt + 1);
  setlength(clickedvel3, maxnflt + 1);
  setlength(clickedper4, maxnflt + 1);
  setlength(clickedvel4, maxnflt + 1);
  setlength(clickedper5, maxnflt + 1);
  setlength(clickedvel5, maxnflt + 1);
  setlength(clickedper6, maxnflt + 1);
  setlength(clickedvel6, maxnflt + 1);
  setlength(clickedper7, maxnflt + 1);
  setlength(clickedvel7, maxnflt + 1);
  setlength(clickedper8, maxnflt + 1);
  setlength(clickedvel8, maxnflt + 1);
  setlength(instper, maxnflt + 1, maxsamples + 1);          {instantaneous period slightly varies with respect to time}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(powfrq, supermaxsamples + 1);                   {amplitude power spectrum of processed signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(smpowfrq, supermaxsamples + 1);                 {amplitude power spectrum of processed signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(whitened, supermaxsamples + 1);                 {amplitude power spectrum of processed signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(whitenedRe, supermaxsamples + 1);               {amplitude power spectrum of processed signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(whitenedIm, supermaxsamples + 1);               {amplitude power spectrum of processed signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(spectralphase, supermaxsamples + 1);            {fazove spectrum of processed signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(spectralc, supermaxsamples + 1, cvelnumspec + 1);       {fazova rychlost spoctena z faze spektra}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(compiledspectralc, supermaxsamples + 1);        {kompilovana fazova rychlost spoctena z faze spektra}
  Form2.ProgressBar1.StepBy(1);
  setlength(ww, maxnflt + 1, maxsamples + 1);               {auxiliary: for demonstration: weighting function forcing on selected period}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(wc, supermaxsamples + 1);                       {weighting function forcing on whole spectrum}
  Form2.ProgressBar1.StepBy(1);
  setlength(www, maxnflt + 1, maxsamples + 1);              {auxiliary: for demonstration: weighting function forcing on selected period, but maji jednotkovou velikost}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(wcw, supermaxsamples + 1);                      {weighting function forcing on whole spectrum, actual height}
  Form2.ProgressBar1.StepBy(1);
  setlength(nwc, (trunc(supermaxsamples / 2)) + 1);         {weighting function forcing on whole spectrum, actual height}
  Form2.ProgressBar1.StepBy(1);
  setlength(filtpowfrq, maxnflt + 1, maxsamples + 1);       {amplitude spectrum filtered in given central period}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(complfiltpowfrq, (trunc(supermaxsamples / 2)) + 1);        {amplitude spectrum completely filtered}
  Form2.ProgressBar1.StepBy(1);
  setlength(complfiltnpowfrq, (trunc(supermaxsamples / 2)) + 1);       {amplitude spectrum completely filtered}
  Form2.ProgressBar1.StepBy(1);
  setlength(nww, maxnflt + 1, maxsamples + 1);              {100 dB normalizovany filtr}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(npowfrq, supermaxsamples + 1);                  {100 dB normalized amplitude power spectrum of processed signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(CorrSpeknpowfrq, supermaxsamples + 1);          {100 dB normalized amplitude power spectrum of processed signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(nwww, maxnflt + 1, maxsamples + 1);             {100 dB normalizovany filtr se stejnou velikosti}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(fre, supermaxsamples + 1);                      {real part of a spectrum of the signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(fresm, supermaxsamples + 1);                    {smoothed real part of a spectrum of the signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(xfre, supermaxsamples + 1);                     {the real part of a spectrum of the signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(nfiltpowfrq, maxnflt + 1, maxsamples + 1);      {100 dB normalizovany filtrovany spektrum pro dany filtr}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(fim, supermaxsamples + 1);                      {the imaginary part of a spectrum of the signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(xfim, supermaxsamples + 1);                     {the imaginary part of a spectrum of the signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(Hch, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(Hampl, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(nHampl, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(xnamp, maxnflt + 1, maxsamples + 1);            {pomocne normalizovana amplituda orezaneho spektrogramu}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(Hphas, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(nHphas, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(anphase, maxnflt + 1, maxsamples + 1);          {phase of an analytical signal for computing the instantaneous frequency of the maximum of selected monochromatic signal}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(CorrSpek, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(derphase, maxnflt + 1, maxsamples + 1);         {derivation of "anphase" with respect to time}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(CmplxSpek, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(instfreq, maxnflt + 1, maxsamples + 1);         {instantaneous frequency}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(CorrFRe, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(CorrSpekAmpl, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(derivace, maxnflt + 1, maxsamples + 1);         {derivace obalky kazdeho monochromatickeho signalu v kazdem bode te obalky}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(CorrFIm, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(CorrSRe, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(LTA, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(STA, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(CorrSIm, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(EnvCorrS, supermaxsamples + 1);
  Form2.ProgressBar1.StepBy(1);
  setlength(ffre, maxnflt + 1, maxsamples + 1);             {real part of a spectrum filtered in given central period}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(sre, supermaxsamples + 1);                      {real part of an input signal}
  Form2.ProgressBar1.StepBy(1);
  if (sloupec = 3) or (sloupec = 5) then begin
    setlength(sreZ, supermaxsamples + 1);                   {real part of an input signal}
    Form2.ProgressBar1.StepBy(1);
    setlength(sreR, supermaxsamples + 1);                   {real part of an input signal}
    Form2.ProgressBar1.StepBy(1);
    setlength(sreT, supermaxsamples + 1);                   {real part of an input signal}
    Form2.ProgressBar1.StepBy(1);
  end;
  if sloupec = 5 then begin
    setlength(sreRZ, supermaxsamples + 1);                  {real part of an input signal}
    Form2.ProgressBar1.StepBy(1);
    setlength(sreZR, supermaxsamples + 1);                  {real part of an input signal}
    Form2.ProgressBar1.StepBy(1);
  end;
  setlength(rawsre, supermaxsamples + 1);                   {real part of an input signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(fsre, maxnflt + 1, maxsamples + 1);             {real part of a filtered (quasimonochromatic) signal / real part of the truncated and smoothed filtered signal}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(sim, supermaxsamples + 1);                      {imaginary part of an input signal / zero in case of seismograms}
  Form2.ProgressBar1.StepBy(1);
  setlength(fnamp, maxnflt + 1, maxsamples + 1);            {for choosed filter: an normalized envelope of energy peak of quasimonochromatic signal / array: normalized filtered spectrogram}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(rawsim, supermaxsamples + 1);                   {imaginary part of an input signal / zero in case of seismograms}
  Form2.ProgressBar1.StepBy(1);
  setlength(ffim, maxnflt + 1, maxsamples + 1);             {imaginary part of a spectrum filtered in given central period}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(complffre, supermaxsamples + 1);                {real part of a spectrum completely filtered}
  Form2.ProgressBar1.StepBy(1);
  setlength(fsim, maxnflt + 1, maxsamples + 1);             {imaginary part of a filtered (quasimonochromatic) signal}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(complffim, supermaxsamples + 1);                {imaginary part of a spectrum completelyfiltered}
  Form2.ProgressBar1.StepBy(1);
  setlength(corrfsre, maxnflt + 1, maxsamples + 1);         {korigovany filtrovany realna cast signalu}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(complfsre, supermaxsamples + 1);                {real part of a completely filtered signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(complfsim, supermaxsamples + 1);                {imaginary part of a completely filtered signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(vyrovnany, supermaxsamples + 1);                {real part of a completely filtered signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(fxsre, maxnflt + 1, maxsamples + 1);            {real part of a filtered (quasimonochromatic) signal (the same as the fsre, but fsre will be changed)}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(fxsim, maxnflt + 1, maxsamples + 1);            {real part of a filtered (quasimonochromatic) signal (the same as the fsre, but fsre will be changed)}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(filtered, supermaxsamples + 1);                 {fitlered seismogram}
  Form2.ProgressBar1.StepBy(1);
  setlength(amp, maxnflt + 1, maxsamples + 1);              {for choosed filter: an envelope of quasimonochromatic signal / array: spectrogram}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(complamp, supermaxsamples + 1);                 {an envelope of bandpass filtered signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(zhlazena, supermaxsamples + 1);                 {an envelope of bandpass filtered signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(complphase, supermaxsamples + 1);               {phase of bandpass filtered signal}
  Form2.ProgressBar1.StepBy(1);
  setlength(famp, maxnflt + 1, maxsamples + 1);             {for choosed filter: an envelope of energy peak of (truncated) quasimonochromatic signal / array: fitlered spectrogram}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(grvel, supermaxsamples + 1);                    {group velocity - used for imaging the dispersion curve}
  Form2.ProgressBar1.StepBy(1);
  setlength(batchgrvel, supermaxsamples + 1);               {group velocity - used for imaging the dispersion curve}
  Form2.ProgressBar1.StepBy(1);
  setlength(batchinstper, supermaxsamples + 1);             {group velocity - used for imaging the dispersion curve}
  Form2.ProgressBar1.StepBy(1);
  if norec = 0 then begin
    setlength(grvel, maxsamples + 1);                       {group velocity - used for imaging the dispersion curve}
    Form2.ProgressBar1.StepBy(1);
  end;
  setlength(namp, maxnflt + 1, maxsamples + 1);             {for choosed filter: normalized quasimonochromatic signal / array: normalized spectrogram}
  Form2.ProgressBar1.StepBy(maxnflt);
  setlength(SVALtime, supermaxsamples + 1);                 {time measured from origin}
  Form2.ProgressBar1.StepBy(1);
  setlength(SVALtimeSPEK, supermaxsamples + 1);             {time measured from origin}
  Form2.ProgressBar1.StepBy(1);
  str(maxsamples, maxsamplesstrg);
  str(supermaxsamples, supermaxsamplesstrg);
  str(maxnflt: 6, maxnfltstrg);
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  if norec = 1 then begin {nacitam record}
    if FFT = False then begin
      memo1.Lines.Add(radekstrg + ' | - program SVAL is set for multichannel filtering of ' + maxsamplesstrg + ' samples');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - maximal number of filters is: ' + maxnfltstrg);
    end;
    if FFT then begin
      memo1.Lines.Add(radekstrg + ' | - program SVAL is set for one channel FFT of ' + supermaxsamplesstrg + ' samples');
    end;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    if sloupec = 1 then begin
      memo1.Lines.Add(radekstrg + ' | - one column file is expected');
    end;
    if sloupec = 3 then begin
      memo1.Lines.Add(radekstrg + ' | - KUK file is expected');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      if compon = 1 then memo1.Lines.Add(radekstrg + ' | - Z component will be used');
      if compon = 2 then memo1.Lines.Add(radekstrg + ' | - R (N) component will be used');
      if compon = 3 then memo1.Lines.Add(radekstrg + ' | - T (E) component will be used');
    end;
    if sloupec = 5 then begin
      memo1.Lines.Add(radekstrg + ' | - CC 5-component file is expected');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      if compon = 1 then memo1.Lines.Add(radekstrg + ' | - ZZ component will be used');
      if compon = 2 then memo1.Lines.Add(radekstrg + ' | - RR component will be used');
      if compon = 3 then memo1.Lines.Add(radekstrg + ' | - TT component will be used');
      if compon = 4 then memo1.Lines.Add(radekstrg + ' | - RZ component will be used');
      if compon = 5 then memo1.Lines.Add(radekstrg + ' | - ZR component will be used');
    end;
  end; {if norec = 1, nacitam record, tedy data}
  if norec = 0 then begin
    memo1.Lines.Add(radekstrg + ' | - program SVAL is set to process loaded dispersion curves only...');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - ... no records can be processed');
  end;
end; {konec procedury Delky na nastavovani velikosti dynamickych poli}

procedure four1(Data: arrayoffour1procedure; nn: integer; isign: integer);
{computes the FFT - written according to the Numerical Recipes Book for FORTRAN and translated for PASCAL}
{isign = + - 1: forward / inverse FFT}
var
  jjj                             : integer;
  iii, m, mmax                    : integer; {indexes controlling the cycles}
  nfft                            : integer; {length of the FFT data array}
  istep                           : integer; {step of the cycle}
  tempi, tempr                    : single;
  theta, wi, wpi, wpr, wr, wtemp  : extended;
  Riii, Ristep                    : extended;
begin
  nfft := 2 * nn;
  jjj := 1;
  for iii := 1 to trunc(nfft / 2) do begin  {complicated indexes resulted by translation from FORTRAN source code}
    if (jjj > (2 * iii - 1)) then begin        {FORTRAN "i" = PASCAL "2*iii-1"}
      tempr := Data[jjj];
      tempi := Data[jjj + 1];
      Data[jjj] := Data[2 * iii - 1];
      Data[jjj + 1] := Data[2 * iii];
      Data[2 * iii - 1] := tempr;
      Data[2 * iii] := tempi;
    end;
    m := trunc(nfft / 2);
    while ((m >= 2) and (jjj > m)) do begin
      jjj := jjj - m;
      m := trunc(m / 2);
    end;
    jjj := jjj + m;
  end; {pro "iii"}
  mmax := 2;
  while nfft > mmax do begin
    istep := 2 * mmax;
    theta := 6.28318530717959 / (isign * mmax);
    wpr := -2 * power(sin(0.5 * theta), 2);
    wpi := sin(theta);
    wr := 1.0;
    wi := 0.0;
    for m := 1 to trunc(mmax / 2) do begin {complicated indexes resulted by translation from FORTRAN source code}
      for iii := (2 * m - 1) to (trunc(nfft / istep) + (2 * m - 2)) do begin {FORTRAN "i" = PASCAL "iii*istep-(2*m-1)*(istep-1)"}
        Riii := iii;
        {delam z integeru extended, aby se to mohlo ponasobit do vyssich cisel, protoze jinak to pretejkalo}
        Ristep := istep;
        jjj := (trunc(Riii * Ristep) - (2 * m - 1) * (trunc(Ristep) - 1)) + mmax;
        {FORTRAN "m" = PASCAL "2*m-1"}
        tempr := wr * Data[jjj] - wi * Data[jjj + 1];
        tempi := wr * Data[jjj + 1] + wi * Data[jjj];
        Data[jjj] := Data[(trunc(Riii * Ristep) - (2 * m - 1) * (trunc(Ristep) - 1))] - tempr;
        Data[jjj + 1] := Data[(trunc(Riii * Ristep) - (2 * m - 1) * (trunc(Ristep) - 1)) + 1] - tempi;
        Data[(trunc(Riii * Ristep) - (2 * m - 1) * (trunc(Ristep) - 1))] :=
        Data[(trunc(Riii * Ristep) - (2 * m - 1) * (trunc(Ristep) - 1))] + tempr;
        Data[(trunc(Riii * Ristep) - (2 * m - 1) * (trunc(Ristep) - 1)) + 1] :=
        Data[(trunc(Riii * Ristep) - (2 * m - 1) * (trunc(Ristep) - 1)) + 1] + tempi;
      end;
      wtemp := wr;
      wr := wr * wpr - wi * wpi + wr;
      wi := wi * wpr + wtemp * wpi + wi;
    end;
    mmax := istep;
  end;{of while cycle}
end;{of the procedure four1 for computing the FFT}

procedure filter(nfcf: integer; al: double; jf: integer);
{it is called for central frequency "nfcf"}
{and returns the filtered spectrum "ffre" (real part) and "ffim" (imaginary part)}
{al: coefficient alpha in the exponent of the Gaussian filter - zde závisí jen na periodě}
var
  n2                   : integer;                      {half of a number of the samples entering the FFT}
  imx                  : integer;                      {range of the filtering}
  nq                   : integer;                      {descending index}
  nq1                  : integer;                      {ascending index}
  kk                   : integer;                      {index controlling the loop}
  sq                   : double;                       {part of the Gaussian exponent}
  q                    : double;                       {Gaussian exponent}
  w                    : array of double;              {Gaussian weighting function}
  pokk                 : double;
  vyskapod, vyskanad   : double;
begin {of the procedure filter}
  setlength(w, maxsamples + 1);
  n2 := trunc(n / 2);
  imx := max(n2 - nfcf, nfcf);
  {the bigger interval is selected as a range of the filter}
  sq := -al / (nfcf * nfcf);
  {al závislý na periodě dělen čtvercem centrální frekvence, tedy stále je sq nezávislé na vzorkování}
  {this loop goes from 1 to corresponding index "imx" of central frequency}
  for kk := 1 to imx do begin {"i" means different values of frequency (dimensionless)}
    pokk := kk;
    q := sq * (pokk * pokk);
    {the difference between "capital omega" and "male omega" is presented by index "kk" what goes to both sides from the index of central frequency}
    {tady ten exponent "q" ale uz zavisi na vzorkovani, nicméně filtry jsou nakoenc stejně široké pro danou frekvenci bez ohledu na počet vzorků}
    {akorát pro horší vzorkování se použije většinou méně filtrů}
    w[kk] := exp(q);
    {vypocet w[kk] jsem prehodil 11.3.2016: napred spoctu vsechny w[kk] podle vsech q, a PAK teprve kontroluju, jestli to q je moc male, tak w[kk] upravim na nulu}
    if (q < -8.0) then begin
      w[kk] := 0.0; {if the exponent "q" is lower than -8, the weighting function is "w" = 0}
    end;
  end;
  ffre[jf, nfcf] := fre[nfcf];  {the values of the spectrum for the central frequency are kept}
  ffim[jf, nfcf] := fim[nfcf];
  ww[jf, nfcf] := 1.0;
  for kk := 1 to imx do begin
    nq := nfcf - kk;
    nq1 := nfcf + kk;
    if (nq > 0) then begin {goes from central frequency to lower frequencies}
      ffre[jf, nq] := fre[nq] * w[kk]; {"fre" and "fim" are the input values of the filter}
      ffim[jf, nq] := fim[nq] * w[kk];
      {"ffre" and "ffim" are the output values of the filter}
      ww[jf, nq] := w[kk];
    end; {of if}
    if (nq1 <= n2) then begin
      ffre[jf, nq1] := fre[nq1] * w[kk]; {goes from central frequency to higher frequencies}
      ffim[jf, nq1] := fim[nq1] * w[kk];
      ww[jf, nq1] := w[kk];
    end; {of if}
  end; {of for}
  dilekHz := (2) / (n * timein) - (1) / (n * timein);
  for kk := 1 to imx do begin
    nq := nfcf - kk;
    if (nq > 0) then begin               {goes from central frequency to lower frequencies}
      if w[kk] < 0.5 then begin          {jakmile spadnu pod pulku vysky filtru}
        sirkafiltru[jf] := kk * dilekHZ; {to je sirka filtru ve vzorku pod pulkou}
        vyskapod := 0.5 - w[kk];
        vyskanad := w[kk - 1] - 0.5;
        break;                           {a vyskocim z cyklu, protoze dal me to nezajima}
      end; {if}
    end; {if}
  end; {kk}
  if ((vyskapod + vyskanad) <> 0) then begin
    sirkafiltru[jf] := (sirkafiltru[jf] - (vyskapod * dilekHZ) / (vyskapod + vyskanad)) * 2;
  end;
  if ((vyskapod + vyskanad) = 0) then begin
    sirkafiltru[jf] := 0;
  end;
end; {of the procedure filter}

procedure completefilter(nfmin: extended; nfmax: extended; almin: double; almax: double);
{vraci kompletne zfiltrovane spektrum ve zvolenem oboru, tedy prenasobuje puvodni spektrum nejakou vahou}
{almin: coefficient alpha in exponent of Gaussian filter}
{almax: coefficient alpha in exponent of Gaussian filter}
var
  n2                : integer;        {half of a number of the samples entering the FFT}
  kk                : integer;        {index controlling the loop}
  sqmin, sqmax      : double;         {part of the Gaussian exponent}
  qc                : double;         {Gaussian exponent}
begin {of the procedure completefilter}
  for kk := 1 to supermaxsamples do begin       {vynuluju}
    wc[kk] := 0;
  end;
  n2 := trunc(n / 2);
  sqmin := -almin / (nfmin * nfmin);
  sqmax := -almax / (nfmax * nfmax);
  for kk := 1 to (trunc(nfmax) - 1) do begin      {"i" means different values of frequency (dimensionless)}
    qc := sqmax * ((nfmax - kk) * (nfmax - kk));  {the difference between "capital omega" and "male omega" is presented by index "kk"}
    wc[kk] := exp(qc);
  end;
  for kk := trunc(nfmax) to trunc(nfmin) do begin
    wc[kk] := 1.0;
  end;
  for kk := (trunc(nfmin) + 1) to n2 do begin     {"i" means different values of frequency (dimensionless)}
    qc := sqmin * ((kk - nfmin) * (kk - nfmin));  {the difference between "capital omega" and "male omega" is presented by index "kk"}
    wc[kk] := exp(qc);
  end;
  for kk := 1 to n2 do begin
    if wc[kk] < malynki then wc[kk] := 0;         {pokud je to hodne male, udelam z toho natvrdo nulu, aby tam nestrasily nesmyslne male hodnoty}
    complffre[kk] := xfre[kk] * wc[kk];           {"xfre" and "xfim" are the input values of the filter}
    complffim[kk] := xfim[kk] * wc[kk];           {"complffre" and "complffim" are the output values of the bandpass filter}
  end;
end; {of the procedure completefilter}

procedure completeEMA(nfmin: extended);
{vraci EMA filtrovane spektrum}
var
  n2       : integer;            {half of a number of the samples entering the FFT}
  kk       : integer;            {index controlling the loop}
begin {of the procedure completeEMA}
  n2 := trunc(n / 2);
  for kk := 1 to n2 do begin
    wc[kk] := 1 / (nfmin + kk);
  end;
  for kk := 1 to n2 do begin
    complffre[kk] := xfre[kk] * wc[kk];    {"xfre" and "xfim" are the input values of the filter}
    complffim[kk] := xfim[kk] * wc[kk];    {"complffre" and "complffim" are the output values of the EMA filter}
  end;
end; {of the procedure completeEMA}

procedure TNoSVALform.Whit(Sender: TObject; vstupspek: array of double; vstupRe: array of double; vstupIm: array of double);
var
  j, k           : integer;
begin {whitened spektrum}
  for j := 1 to n do begin
    smpowfrq[j] := 0;        {cvicne to vynuluju}
  end;
  val(NoSVALform.Edit25.Text, winlen, cd);         {prectu delku zhlazovaciho okna pro spektrum}
  pulwinlen := trunc((winlen - 1) / 2);            {pulka delky zhlazovaciho okna}
  for j := 1 to pulwinlen do begin                 {prvni kousek zhlazeneho se bude rovnat puvodnimu}
    smpowfrq[j] := vstupspek[j];
  end;
  for j := nhlf - pulwinlen to nhlf do begin       {posledni kousek zhlazeneho se bude rovnat puvodnimu}
    smpowfrq[j] := vstupspek[j];
  end;
  for j := pulwinlen + 1 to nhlf - pulwinlen - 1 do begin            {a vnitrni cast zhladim}
    for k := 1 to winlen do begin                                    {v delce toho zhlaovaciho okna}
      smpowfrq[j] := smpowfrq[j] + vstupspek[j - pulwinlen + k - 1]; {sectu vzorky pres okno}
    end; {for k}
    smpowfrq[j] := smpowfrq[j] / winlen;                             {a vydelim je delkou okna, tedy delam klouzavy prumer}
  end; {for j}
  maxsmpowfrq := 0;
  for j := 1 to nhlf do begin                                        {najdu maximum toho zhlazeneho spektra}
    if smpowfrq[j] > maxsmpowfrq then maxsmpowfrq := smpowfrq[j];
  end;
  for j := 1 to nhlf do begin                                        {whitened spectrum}
    if smpowfrq[j] > malynki then begin
      whitened[j] := vstupspek[j] / smpowfrq[j] * maxsmpowfrq;       {a pomoci toho smoothed spektra udelam whitened spektrum}
      whitenedRe[j] := vstupRe[j] / smpowfrq[j] * maxsmpowfrq;
      whitenedIm[j] := vstupIm[j] / smpowfrq[j] * maxsmpowfrq;
    end;
    if smpowfrq[j] <= malynki then begin
      whitened[j] := 0;
      whitenedRe[j] := 0;
      whitenedIm[j] := 0;
    end;
  end;
  if zmacknulbandpass then begin         {pokud jsem to sem poslal z Bandpass cudliku, tak zhladim konce whitened spektra stejne, jako byly zhlazene konce bandpass filtru}
    for j := 1 to nhlf do begin          {a to pomoci okna wc, ktere ma uz spoctene z procedury completefilter}
      whitened[j] := whitened[j] * wc[j];
      whitenedRe[j] := whitenedRe[j] * wc[j];
      whitenedIm[j] := whitenedIm[j] * wc[j];
    end;
  end;
end; {procedure whit}

procedure TNoSVALform.Button1Click(Sender: TObject); {Analysis - the main SVAL computation}
var
  i, m, k             : integer;  {used in cycles}
  j                   : integer;  {used in cycles}
  jj                  : integer;  {used in cycles}
  zvetsit             : word;
  dfreq               : double;
  dfre                : double;
  maxzerocrossstrg    : string;
  nacetzeros          : integer;
  nacetzerosstrg      : string;
  cestakbessel        : string;
  kolikstrg           : string;
  origpermaxstrg      : string;
begin
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - analysis starts at ' + DateTimeToStr(Now));
  zacatekSVAL := Time;
  Timer1.Enabled := False;        {aby neblikal bodik na disperzni krivce}
  Timer2.Enabled := False;
  for i := 1 to supermaxsamples do begin
    complfsre[i] := 0;
    complfsim[i] := 0;
  end;
  if nahrada = False then begin     {pokud je to bez nahrazenych bodu, bezi komplet analyza}
    for i := 1 to maxnflt do begin  {nulovani poli pro opetovne pousteni analyzy}
      uppersampl[i] := 0;
      lowersampl[i] := 0;
      upperzerosampl[i] := 0;
      lowerzerosampl[i] := 0;
      numofmax[i] := 0;
      nf[i] := 0;
      zeroposition[i] := 0;
      zeroposition1[i] := 0;
      zeroposition2[i] := 0;
      zeroposition3[i] := 0;
      zeroposition4[i] := 0;
      period[i] := 0;
      sirkafiltru[i] := 0;
      max1locmx[i] := 0;
      max2locmx[i] := 0;
      max3locmx[i] := 0;
      max4locmx[i] := 0;
      max5locmx[i] := 0;
      max6locmx[i] := 0;
      max7locmx[i] := 0;
      max8locmx[i] := 0;
      locmx[i] := 0;
      nahradnimax[i] := 0;
      refi[i] := 0;
      loc1amp[i] := 0.0;
      loc2amp[i] := 0.0;
      loc3amp[i] := 0.0;
      loc4amp[i] := 0.0;
      loc5amp[i] := 0.0;
      loc6amp[i] := 0.0;
      loc7amp[i] := 0.0;
      loc8amp[i] := 0.0;
      numfilt[i] := 0;
      alpha[i] := 0.0;
      uppdiff[i] := 0.0;
      lowdiff[i] := 0.0;
    end;                        {konec nulovani poli}
    proccount := proccount + 1; {pocitadlo, po kolikate analyza bezi}
    str(proccount, proccountstrg);
    if proccount = 1 then begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the process runs for the ' + proccountstrg + ' st time');
    end;
    if proccount = 2 then begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the process runs for the ' + proccountstrg + ' nd time');
    end;
    if proccount = 3 then begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the process runs for the ' + proccountstrg + ' rd time');
    end;
    if proccount > 3 then begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the process runs for the ' + proccountstrg + ' th time');
    end;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    if batchproces = False then begin
      memo1.Lines.Add(radekstrg + ' | -  SVAL processes     ' + OpenDialog1.FileName + ' data file');
    end;
    if batchproces then begin
      memo1.Lines.Add(radekstrg + ' | -  SVAL processes     ' + jmenofilu + ' data file');
    end;

    if hydro = False then begin       {nepotrebuju epicentralni vzdalenost}
      distkmstrg := edit1.Text;       {ctu epicentralni vzdalenost}
      val(distkmstrg, distkm, cd);    {epicentral distance in kilometres}
      if distkm = 0.0 then begin
        if batchproces = False then begin
          ShowMessage('Enter the epicentral distance of the record in file: ' + OpenDialog1.FileName);
        end;
        if batchproces then begin
          ShowMessage('Enter the epicentral distance of the record in file: ' + jmenofilu);
        end;
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - analysis was canceled because of zero epicentral distance');
        exit;
      end; {if distkm = 0.0.}
      timediststrg := edit2.Text;
      val(timediststrg, timedist, cd);  {time interval between origin time and the beginning of the record}
    end;
    if hydro = true then begin
      timedist := 0;
    end;
    samplingstrg := edit3.Text;
    val(samplingstrg, timein, cd);   {sampling time interval}
    if timein = 0 then begin
      ShowMessage('Enter the sampling frequency!');
      exit;
    end;
    if hydro = false then begin {bylo zadano v Hz}
      timein := 1 / timein;      {udelam z toho opravdu krok casu v sekundach}
    end;
    if hydro = true then begin {bylo zadano v minutach}
      timein := 60 * timein;
    end;
    if (hydro = false) and (rozmezivel = true) then begin {nemam hydro a mam rychlost}
      nstartstrg := edit4.Text;      {tady to precte hodnotu nejvyssi grupove rychlosti}
      nlaststrg  := edit5.Text;      {tady to precte hodnotu nejmensi grupove rychlosti}
      val(nstartstrg, nstarthlp, cd);{nstarthlp je double pro nejvyssi rychlosti}
      if nstarthlp = 0 then begin
        ShowMessage('Check the time distance / velocity / time range settings!');
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - analysis was canceled because time distance / velocity / time range problems');
        exit;
      end;
      nstarthlp := (distkm / nstarthlp);      {tady se z te rychlosti udela cas prichodu mysleny od origin time, tedy je to nejkratsi cas}
      val(nlaststrg, nlasthlp, cd);           {nlasthlp je double pro nejmensi rychlosti}
      if nlasthlp = 0 then begin
        ShowMessage('Check the time distance / velocity / time range settings!');
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - analysis was canceled because time distance / velocity / time range problems');
        exit;
      end;
      nlasthlp := (distkm / nlasthlp);      {tak se z te rychlosti udela cas prichodu mysleny od origin time, tedy je to nejdelsi cas}
    end; {if hydro = fasle a zaroven rozmezi = true}
    if rozmezivel = False then begin {at uz mam nebo nemam hydro : to, co jsem zadal, byl cas}
      nstartstrg := edit4.Text;      {tady to precte hodnotu nejdelsiho casu}
      nlaststrg  := edit5.Text;      {tady to precte hodnotu nejkratsiho casu}
      val(nstartstrg, nlasthlp, cd); {tak jenom prehodim minimalni a maximalni}
      val(nlaststrg, nstarthlp, cd); {ale uz to je ten cas rovnou, vzdalenost uz k tomu nepotrebuju}
    end;

    if nstarthlp = 0 then begin
      ShowMessage('Zero time leads to infinite velocity, please, set non-zero positive time.');
      exit;
    end;

    if (hydro = True) and (hydrovel = True) then begin  {mam hydro a zaroven datumy}
      hydrodatum := StrToDateTime(MaskEdit1.Text);      {prectu zacatek souboru}
      hydrozacat := StrToDateTime(MaskEdit2.Text);      {prectu zacatek zpracovani}
      hydrokonec := StrToDateTime(MaskEdit3.Text);      {prectu konec zpracovani}
      nstarthlp  := trunc((hydrozacat - hydrodatum) * 86400);   {udelam z dni sekundy}
      nlasthlp   := trunc((hydrokonec - hydrodatum) * 86400);   {udelam z dni sekundy}
    end;
    nstart := round((nstarthlp - timedist) / timein) + 1;   {an ordinal number of the first processed sample}
    if nstart = 0 then nstart := 1;
    nlast  := round(((nlasthlp - timedist) / timein) + 1);  {an ordinal number of the last processed sample}
    {v nstart mam bud cas dany nejvyssi rychlosti, nebo nejmensim casem}
    {v  nlast mam bud cas dany nejmensi rychlosti, nebo nejdelsim casem}
    {zkontroluju delku zaznamu v souboru s maximalni a minimalni grupovou rychlosti}

    if nstarthlp < timedist then begin                    {pokud je pozadovany cas zacatku analyzy mensi, nez cas prvniho vorku, je zadana maximalni rychlost/cas moc velka}
      zacatekblbe := true;

      if batchproces = false then begin {opravim to, jen kdyz nejsem v batchi}
      if rozmezivel = true then begin
        str((distkm / timedist): 7: 3, truemaxgrpstrg);   {string s maximalni rychlosti prislusejici prvnimu skutecnemu vzorku v souboru}
      end;
      if rozmezivel = false then begin
        str(          timedist : 7: 3, truemaxgrpstrg);   {string s minimalnim casem prislusejici prvnimu skutecnemu vzorku v souboru}
      end;
      nstartstrg := truemaxgrpstrg;                       {nstartstrg je tedy string bud s rychlosti nebo s casem}
      if rozmezivel = true then begin                     {pokud to je rychlosti}
        val(nstartstrg, nstarthlp, cd);                   {startovni rychlost se prevede na cislo nstarthlp a je to rychlost}
        nstarthlp := distkm/nstarthlp;                    {a z te rychlosti udelam cas}
      end;
      if rozmezivel = false then begin                    {pokud to je cas}
        val(nstartstrg, nstarthlp, cd);                   {startovni cas se prevede na cislo nstarthlp a je to cas}
      end;                                                {takze nstarthlp je dycky cas, at jsem zadaval cokoli}
      nstart := 1;                                        {at to bylo co to bylo (rychlost nebo cas), prvni vzorek bude proste prvni vzorek v souboru}
      if (hydro = true) and (hydrovel = true) then begin  {mam hydro a zaroven datumy}
        MaskEdit2.Text := MaskEdit1.Text;                 {do okenka se zacatkem zpracovani dam datum a cas prvniho vzorku}
        ShowMessage('Minimal date and time is too low - it was corrected according to the beggining of your record in file');
      end;
      if hydro = false then begin
        if rozmezivel = True then begin
          ShowMessage('Maximal group velocity is too high - it was corrected according to the beggining of your record in file');
        end;
        if rozmezivel = False then begin
          ShowMessage('Minimal group time is too low - it was corrected according to the beggining of your record in file');
        end;
      end; {if hydro = false}
      end; {kdyz nejsem v batchi}

      if batchproces then begin                           {pri batch processing v pripade, ze se to nevlezlo do souboru, skoncim analyzu}
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - analysis was canceled because the set velocity is too big and it is out of the data in the input file');
        vynuceneukonceni := True;                         {to pouziju pro zastaveni batch processing}
        skippedfile := skippedfile + 1;
        exit;
      end;

      if batchproces = false then begin {opravim to, jen kdyz nejsem v batchi}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      if hydro = false then begin
        if rozmezivel = True then begin
          memo1.Lines.Add(radekstrg + ' | - maximal group velocity is too high - it was corrected according to the beggining of your record in file');
        end;
        if rozmezivel = False then begin
          memo1.Lines.Add(radekstrg + ' | - minimal group time is too low - it was corrected according to the beggining of your record in file');
        end;
      end; {if hydro = false}
      if (hydro = True) and (hydrovel = True) then begin  {mam hydro a zaroven datumy}
        memo1.Lines.Add(radekstrg + ' | - minimal date and time is too low - it was corrected according to the beggining of your record in file');
      end;
      end; {kdyz nejsem v batchi}

    end; {pokud byl pozadovany cas / rychlost mensi, nez je zacatek souboru}

    if nlasthlp > ((((filesamplesnumber - 1) * timein) + timedist) + 0.000000001) then begin    {pokud je pozadovany cas konce analyzy vetsi, nez cas posledniho vzorku, je zadana minimalni rychlost/cas prilis mala}
      konecblbe := true;

      if batchproces = false then begin {opravim to, jen kdyz nejsem v batchi}
      if rozmezivel = true then begin                                                           {pokud jsem zadal rychlost}
        str((distkm / (((filesamplesnumber - 1) * timein) + timedist)): 7: 3, truemingrpstrg);  {vyrobim string truemingrpstrg s rychlosti posledniho vzorku}
      end;
      if rozmezivel = false then begin                                                          {pokud jsem zadal cas}
        str((          ((filesamplesnumber - 1) * timein) + timedist ): 7: 3, truemingrpstrg);  {vyrobim string trumingrpstrg s casem posledniho vzorku}
      end;
      nlaststrg := truemingrpstrg;                                                              {nlaststrg je tedy string s rychlosti nebo s casem}
      if rozmezivel = true then begin                                                           {pokud je to rychlost}
        val(nlaststrg, nlasthlp, cd);                                                           {prevedu ji na cislo nlasthlp}
        nlasthlp := (distkm / nlasthlp);                                                        {tady se z te rychlosti udela cas prichodu a ulozi se do te same promenne nlasthlp}
      end;
      if rozmezivel = false then begin                                                          {pokud je to cas}
        val(nlaststrg, nlasthlp, cd);                                                           {tak uz mam tu hodnotu nejvyssiho mozneho casu v cisle nlasthlp}
      end;                                                                                      {a nic neprevadim}
      nlast := filesamplesnumber;
      if (hydro = true) and (hydrovel = true) then begin                                        {mam hydro a zaroven datumy}
        hydrokonec := hydrodatum + (nlasthlp/86400);                                            {koncove datum je pocatecni datum plus pocet sekund v souboru deleny poctem sekund v dnech, protoze datumy jsou ve dnech}
        MaskEdit3.Text := FormatDateTime('dd.mm.yy hh:nn:ss',hydrokonec);                       {nacpu hydrokonec do okenka, abych to videl}
      end;
      if hydro = false then begin
        if rozmezivel = True then begin
          ShowMessage('Minimal group velocity is too small - it was corrected according to the end of your record in file');
        end;
        if rozmezivel = False then begin
          ShowMessage('Maximal group time is too high - it was corrected according to the end of your record in file');
        end;
      end;
      if (hydro = True) and (hydrovel = True) then begin
        ShowMessage('Maximal date and time is too high - it was corrected according to the end of your record in file');
      end;
      end; {kdyz nejsem v batchi}

      if batchproces then begin                                                                 {pri batch processing v pripade, ze se to nevlezlo do souboru, skoncim analyzu}
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - analysis was canceled because the set velocity is too small and it is out of the data in the input file');
        vynuceneukonceni := True;                                                               {to pouziju pro zastaveni batch processing}
        skippedfile := skippedfile + 1;
        exit;
      end;

      if batchproces = false then begin {opravim to, jen kdyz nejsem v batchi}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      if hydro = false then begin
        if rozmezivel = True then begin
          memo1.Lines.Add(radekstrg + ' | - minimal group velocity is too small - it was corrected according to the end of your record in file');
        end;
        if rozmezivel = False then begin
          memo1.Lines.Add(radekstrg + ' | - maximal group time is too high - it was corrected according to the end of your record in file');
        end;
      end;
      if (hydro = True) and (hydrovel = True) then begin
        memo1.Lines.Add(radekstrg + ' | - maximal date and time is too high - it was corrected according to the end of your record in file');
      end;
      end; {kdyz nejsem v batchi}

    end; {pokud byl pozadovany cas nebo rychlost analyzy delsi, nez soubor s daty}

    if batchproces = false then begin
    if zacatekblbe then begin             {opravim cisilka i v okenkach}
      if rozmezivel = true then begin
        edit4.Text := truemaxgrpstrg;
      end;
      if rozmezivel = false then begin
        edit5.Text := truemaxgrpstrg;
      end;
    end;
    if konecblbe then begin
      if rozmezivel = true then begin
        edit5.Text := truemingrpstrg;
      end;
      if rozmezivel = false then begin
        edit4.Text := truemingrpstrg;
      end;
    end;
    end; {jen kdyz to neni super batch}
    Edit4.refresh;
    Edit5.refresh;
    zacatekblbe := False;
    konecblbe := False;
    nsampl := nlast - nstart + 1;        {number of processed samples}
    if nsampl > supermaxsamples then begin
      ShowMessage('Number of samples you have choosen is too small or the group velocity interval you have set is too large. Select some higher option for number of samples or make a narrower group velocity interval.');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - analysis was canceled because of low number of samples choosen or too large group velocity interval');
      vynuceneukonceni := True; {to pouziju pro zastaveni batch processing}
      skippedfile := skippedfile + 1;
      {a musim tady pozavirat vsechny ty soubory, co jsou otevrene}
      if batchproces then begin
        if saverdg then begin
          closefile(dispersionXdotALL);
          closefile(dotsmax1);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax2);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax3);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax4);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax5);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax6);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax7);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax8);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmaxPERcas);     {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmaxPERcasBEZ1); {zavru soubor se vsema teckama ze vsech stanic bez prvniho maxima}
        end;
        if batchdisperze then begin
          closefile(ALLdispersionsAMPLI);
          closefile(ALLdispersionsPHASE);
          closefile(ALLdispersionsGROUP);
          closefile(redstation);
          closefile(redlabel);
          closefile(yellowstation);
          closefile(yellowlabel);
        end;
        if savewave then begin
          closefile(phaseALL);
          closefile(groupALL);
        end;
        if savewhole then begin
          closefile(aallbez);
          closefile(aallvyr);
        end;
      end;
      exit;
    end;
    if FFT = False then begin {dela se jen pro analyzu}
      perminstrg := edit6.Text;
      val(perminstrg, permin, cd);               {minimal period to be computed}
      if ((batchproces = true) and (pocitadlofile > 1)) then begin
        str(origpermax:5:1, origpermaxstrg);
        edit7.Text := origpermaxstrg;
      end;
      permaxstrg := edit7.Text;
      val(permaxstrg, permax, cd);               {maximal period to be computed}
      origpermax := permax;
      //if batchproces = true then begin
        //if permax > distkm/4 then permax := distkm/4; {pokud je permax moc veliky, tak ho opravim, testuju to jenom pro batch proces, abych rucne mohl zadat jakoukoli blbost}
        //str(permax:5:1, permaxstrg);
        //edit7.Text := permaxstrg;
      //end;
      nfltstrg := edit8.Text;
      val(nfltstrg, nflt, cd);                   {actual number of filters}
      if nflt > maxnflt then begin
        if maxnflt = 300 then begin
          Edit8.Text := '300';
          nflt := 300;
        end;
        if maxnflt = 160 then begin
          Edit8.Text := '160';
          nflt := 160;
        end;
        if maxnflt = 150 then begin
          Edit8.Text := '150';
          nflt := 150;
        end;
        if maxnflt = 140 then begin
          Edit8.Text := '140';
          nflt := 140;
        end;
        if maxnflt = 120 then begin
          Edit8.Text := '120';
          nflt := 120;
        end;
        if batchproces = False then begin {hlasku vypisuju jenom pri rucnim zpracovani, pri batch processing ne}
          ShowMessage('Maximal number of filters was corrected to the value of ' + maxnfltstrg);
        end;
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - maximal number of filters was corrected to the value of ' + maxnfltstrg);
      end; {if nflt > maxnflt}
      nfltorig := nflt;
    end;  {konec vyrazeni pro FFT}
    nwstrg := edit9.Text;
    val(nwstrg, nw, cd);  {number of samples smoothed by the cosine window}
    alphadirstrg := edit10.Text;
    val(alphadirstrg, alphadir, cd);
    if alphadir > 0 then begin
      ShowMessage('The slope of the ALPHA coefficient must be negative! (or zero ...)');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - analysis was canceled because of incorrect alpha coefficient value');
      exit;
    end;
    if CheckBox3.Checked = False then begin {pokud delam rucni alfu}
      alphaabsstrg := edit11.Text;
      val(alphaabsstrg, alphaabs, cd);
    end;
    if CheckBox3.Checked = True then begin {pokud chci alfu zavislou na vzdalenosti - to same je jeste v procedure otvirani souboru}
      alphaabs := 0.3759905681 * distkm + 27.4032116;
      str(alphaabs: 5: 1, alphaabsstrg);
      edit11.Text := alphaabsstrg;
    end;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the input parameters entered the process');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - did I understand it well your event has the epicentral distance of ' + distkmstrg + ' km?');
    if timedist > 0 then begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - and that your record starts ' + timediststrg + ' seconds after the origin time?');
    end;
    if timedist < 0 then begin
      timedisthlp := -timedist;
      str(timedisthlp: 6: 3, timediststrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - and that your record starts ' + timediststrg + ' seconds before the origin time?');
    end;
    if timedist = 0 then begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - and that you didn''t notice any time interval between the beginning of the record and the origin time?');
    end;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - and you have really used seismometer with ' + samplingstrg + ' Hz sampling frequency?');
    if usefiltered = False then begin {pokud nechci pouzivat kompletne filtrovany zaznam, nactu ho ze souboru}
      for i := 1 to supermaxsamples do begin {vynuluju to cele}
        sre[i] := 0.0;
      end;
      if (sloupec = 3) or (sloupec = 5) then begin
        for i := 1 to supermaxsamples do begin {vynuluju to cele}
          sreZ[i] := 0.0;
          sreR[i] := 0.0;
          sreT[i] := 0.0;
        end;
      end;
      if batchproces = False then begin
        assignfile(signal, OpenDialog1.FileName);
      end;
      if batchproces then begin
        assignfile(signal, jmenofilu);
      end;
      reset(signal);
      unwanted := nstart - 1;
      //      setlength(rr,unwanted+1);
      //      setlength(rrZ,unwanted+1);
      //      setlength(rrR,unwanted+1);
      //      setlength(rrT,unwanted+1);
      if sloupec = 1 then begin {kdyz to nacitam z jednosloupcoveho souboru bez hlavicky}
        for i := 1 to unwanted do begin
          readln(signal, rr);      {auxiliary loop: "rr" keeps the data only for controling the rows of input file}
        end;
        for i := 1 to nsampl do begin
          readln(signal, sre[i]);  {"sre[i]" contains the required data to be processed}
        end;
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the record to be processed was read from the one column file');
      end; {sloupec = 1}
      if sloupec = 3 then begin {kdyz to nacitam z kukovskeho souboru s hlavickou s tremi sloupci}
        if Form2.RadioGroup2.ItemIndex = -1 then begin
          ShowMessage('Please select the component!');
          exit;
        end;
        readln(signal, unwantedstrg); {ctu 1. radek souboru}
        readln(signal, jmenostanice); {ctu 2. radek, kde je nazev stanice}
        for i := 3 to (8 + pocetnavic) do begin {ctu to jen, abych prelistoval o od 3. do 8. radku hlavicky}
          readln(signal, unwantedstrg);
        end;
        for i := 1 to unwanted do begin
          readln(signal, rr); {auxiliary loop: "rr" keeps the data only for controling the rows of input file}
        end;
        for i := 1 to nsampl do begin
          readln(signal, sreZ[i], sreR[i], sreT[i]); {"sre[i]" contains the required data to be processed}
        end;
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the record to be processed was read from the KUK file');

        if compon = 1 then begin
          if (POLARflip = False) and (POLARflipZT = False) then begin {pokud ma zmacknuto, ze delam Z a POLARflip je porad false, tak nactu Z}
            for i := 1 to nsampl do begin
              sre[i] := sreZ[i];
            end;
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - Z component is to be processed');
            partcomponent := '       Z component';
            NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
          end; {if POLARflip = false}

          if (POLARflip = True) and (POLARflipZT = False) then begin {pokud ma zmacknuto, ze delam Z, ale POLARflip je true, tak tady nactu R}
            for i := 1 to nsampl do begin
              sre[i] := sreR[i];
            end;
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - R component is to be processed for POLARIZATION');
            partcomponent := '       R component POLARIZATION';
            NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
          end; {if POLARflip = true}

          if (POLARflip = False) and (POLARflipZT = True) then begin {pokud ma zmacknuto, ze delam Z, uz jsem udelal R a POLARflipZT je true, tak tady nactu T}
            for i := 1 to nsampl do begin
              sre[i] := sreT[i];
            end;
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - T component is to be processed for POLARIZATION');
            partcomponent := '       T component POLARIZATION';
            NoSVALform.Caption :=  partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
          end; {if POLARflipZT = true}

        end; {if compon = 1, tedy Z}

        if compon = 2 then begin
          if POLARflip = False then begin {pokud ma zmacknuto, ze delam R a POLARflip je porad false, tak nactu R}
            for i := 1 to nsampl do begin
              sre[i] := sreR[i]; {nactu R}
            end;
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - R (N) component is to be processed');
            partcomponent := '       R (N) component';
            NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
          end; {if POLARflip = false}
          if POLARflip then begin {pokud ma zmacknuto, ze delam R, ale POLARflip je true, tak tady nactu T}
            for i := 1 to nsampl do begin
              sre[i] := sreT[i];
            end;
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - T component is to be processed for POLARIZATION');
            partcomponent := '       T component POLARIZATION';
            NoSVALform.Caption :=  partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
          end; {if POLARflip = true}
        end; {if compon = 2}
        if compon = 3 then begin
          if POLARflip = False then begin {pokud ma zmacknuto, ze delam T a POLARflip je porad false, tak nactu T}
            for i := 1 to nsampl do begin
              sre[i] := sreT[i];  {nactu T}
            end;
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - T (E) component is to be processed');
            partcomponent := '       T (E) component';
            NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
          end;  {if POLARflip = false}
          if POLARflip then begin {pokud ma zmacknuto, ze delam T, ale POLARflip je true, tak tady nactu R}
            for i := 1 to nsampl do begin
              sre[i] := sreR[i];
            end;
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - R component is to be processed for POLARIZATION');
            partcomponent := '       R component POLARIZATION';
            NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
          end; {if POLARflip = true}
        end; {if compon = 3}
      end; {sloupec = 3}


      if fliprec then begin            {a tady pripadne otocim slozku, pokud jsem to zaskrtnul pri spusteni Batch Processing}
        for k := 1 to nacetflip do begin
          if jmenostanice = forflip[k] then begin {pokud se jmenostanice, coz je aktualni nazev, shoduje s nejakym v seznamu pro otoceni}
            for i := 1 to nsampl do begin         {pro vsechny vzorky to otocim}
              sre[i] := -sre[i];
            end; {for i}
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - polarity of ' + jmenostanice + ' was flipped');
          end; {if se shoduji}
        end; {for k}
      end; {if fliprec}



      if sloupec = 5 then begin {kdyz to nacitam z CC s hlavickou s peti sloupci}
        if Form2.RadioGroup2.ItemIndex = -1 then begin
          ShowMessage('Please select the component!');
          exit;
        end;
        readln(signal, unwantedstrg); {ctu 1. radek souboru}
        readln(signal, jmenostanice); {ctu 2. radek, kde je nazev stanice}
        for i := 3 to (8 + pocetnavic) do begin {ctu to jen, abych prelistoval o od 3. do 8. radku hlavicky}
          readln(signal, unwantedstrg);
        end;
        for i := 1 to unwanted do begin
          readln(signal, rr);         {auxiliary loop: "rr" keeps the data only for controling the rows of input file}
        end;
        for i := 1 to nsampl do begin
          readln(signal, sreZ[i], sreR[i], sreT[i], sreRZ[i], sreZR[i]);  {"sre[i]" contains the required data to be processed}
        end;
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the record to be processed was read from the 5-comp CC file');
        if compon = 1 then begin
          for i := 1 to nsampl do begin
            sre[i] := sreZ[i];
          end;
          radek := radek + 1;
          str(radek: 4, radekstrg);
          memo1.Lines.Add(radekstrg + ' | - ZZ component is to be processed');
          partcomponent := '       ZZ component';
          NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
        end; {if compon = 1}
        if compon = 2 then begin
          for i := 1 to nsampl do begin
            sre[i] := sreR[i]; {nactu R}
          end;
          radek := radek + 1;
          str(radek: 4, radekstrg);
          memo1.Lines.Add(radekstrg + ' | - RR component is to be processed');
          partcomponent := '       RR component';
          NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
        end; {if compon = 2}
        if compon = 3 then begin
          for i := 1 to nsampl do begin
            sre[i] := sreT[i];  {nactu TT}
          end;
          radek := radek + 1;
          str(radek: 4, radekstrg);
          memo1.Lines.Add(radekstrg + ' | - TT component is to be processed');
          partcomponent := '       TT component';
          NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
        end; {if compon = 3}
        if compon = 4 then begin
          for i := 1 to nsampl do begin
            sre[i] := sreRZ[i];  {nactu RZ}
          end;
          radek := radek + 1;
          str(radek: 4, radekstrg);
          memo1.Lines.Add(radekstrg + ' | - RZ component is to be processed');
          partcomponent := '       RZ component';
          NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
        end; {if compon = 4}
        if compon = 5 then begin
          for i := 1 to nsampl do begin
            sre[i] := sreZR[i];  {nactu ZR}
          end;
          radek := radek + 1;
          str(radek: 4, radekstrg);
          memo1.Lines.Add(radekstrg + ' | - ZR component is to be processed');
          partcomponent := '       ZR component';
          NoSVALform.Caption := partpocitad + part1 + part2 + partdir + partcomponent + refcaption;
        end; {if compon = 5}
      end; {sloupec = 5}
      NoSVALform.Caption := NoSVALform.Caption + '       ' + KUKsensor + refcaption;
      {pridam do hlavicky typ snimace}
      //      setlength(rr,0);
      //      setlength(rrZ,0);
      //      setlength(rrR,0);
      //      setlength(rrT,0);
      str(nstart, nstartstrg);
      str(nlast, nlaststrg);
      prumer := 0;

      {zkontroluju, ze aspon nejaky vzorek je nenulovy}
      nenulovy := false;                         {napred jakoze jsou vsechny nula}
      for i := 1 to nsampl do begin
        if sre[i] <> 0 then nenulovy := true;    {pokud je tam nenulovy vzorek, prepnu si to}
      end;
      if nenulovy = false then begin             {pokud je nenulovy porad false, tedy pokud vsechny vzorky jsou nula}
        skippedfile := skippedfile + 1;
        exit;                                    {tady vyskocim z procedury Analysis, tedy v pripade Batch se vratim do Davka}
      end;

      {tady mam nactena data a muzu z nich odecist stredni hodnotu}
      if removeoffset then begin                   {kdyz jsem zaskrt, ze chci odstranit offset}
        for i := 1 to nsampl do begin
          prumer := prumer + sre[i];               {vyrabim jednoduchy prumer dat v okne vybranem pro analyzu}
        end;
        prumer := prumer / nsampl;
        for i := 1 to nsampl do begin
          sre[i] := sre[i] - prumer; {vystredim to}
        end;
      end; {konec odstranovani offsetu}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the signal input file was used from the ' + nstartstrg + ' th to the ' + nlaststrg + ' th sample');
      if (nw <> 0) then begin                    {if "nw" = 0 it skips this loop}
        if batchproces = false then begin
          if (nw > nsampl / 2.0) then begin
            ShowMessage('Too long smoothing window!');
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - analysis was canceled because of too long smoothing window');
            exit;
          end;
        end; {if batchrpocess = false}
        for i := 1 to nw do begin               {it smooths the edges of processed part of signal}
          f := 0.5 * (1.0 - cos(pi * (i - 1) / nw));    {this is the smoothing cosine window}
          sre[i] := sre[i] * f;                    {it smooths the beginning of the signal}
          sre[nsampl + 1 - i] := sre[nsampl + 1 - i] * f; {it smooths the end of the signal}
        end;
      end;
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - ' + nwstrg + ' samples of both edges of the processed record were smoothed');
      for i := 1 to nsampl do begin
        rawsre[i] := sre[i];        {sem nactu puvodni zaznam, ktery uz nikdy nezmenim, je ale zhlazeny}
      end;
      closefile(signal);
    end; {konec odbocky nacitani zaznamu ze souboru, tedy usefiltered = false}
    if usefiltered then begin       {pokud pouzivam filtrovany, jen to oznamim, nacteny v sre[i] uz je}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the filtered record was set for processing');
    end;
    str(nsampl, nsamplstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - so ' + nsamplstrg + ' samples were used');
    kraceni := 1; {default value == no decimation}
    if Form2.CheckBox4.Checked = True then begin {v prvnim pomocnem okne je boxik, ktery je defaultne zaskrtnuty, takze delam kraceni, ale muzu ho vypnout, a zaznamy jsou pak vykreslene detailneji}
      kraceni := trunc(nsampl / 1000); {pro vykreslovani v PlotPanelu 1 a 2}
      if kraceni = 0 then kraceni := 1;
    end; {if}
    str(kraceni, kracenistrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - image decimation factor is ' + kracenistrg);
    sigmaxi := 0;
    for i := 1 to nsampl do begin
      if (sre[i] > sigmaxi) then begin
        sigmaxi := sre[i]; {finds the amlitude maximum of the processed part of signal}
      end;
    end;
    sigmini := 0;
    for i := 1 to nsampl do begin
      if (sre[i] < sigmini) then begin
        sigmini := sre[i]; {finds the amplitude minimum of the processed signal}
      end;
    end;
    n2pow := trunc(log2(nsampl)) + 1; {exponent of 2 for computing the number of samples to enter FTT - tady zarucuju, ze to n2pow bude dycky vyssi, nez nsampl, to dela ta +1}
    supern2pow := n2pow; {zatim to dam sem, ale posleze to muzu menit}
    {ale bude vyssi, i kdyz nsampl bude zrovna nejaka mocnina dvou, takze to n2pow v tom pripade zase snizim}
    if nsampl = power(2, n2pow - 1) then n2pow := n2pow - 1;  {kdyz zrovna budu zpracovavat pocet vzorku v mocnine dvou, tak dam pro FFT prave tu mocninu dvou a ne 2x vic}
    str(n2pow, n2powstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the power of 2 calculated according to the number of samples is ' + n2powstrg);
    {moznost prodlouzit signal nulama na vyssi mocninou dvou}

    if CheckBox7.Checked then begin {kdyz je zaskrtnuty, tak se to teprve zepta, jestli to chci prodlouzit, a jeste mam moznost rict, ze ne}
      while ((n2pow <= nejmoc) and (trunc(power(2, n2pow)) < supermaxsamples)) do begin
        nakt := trunc(power(2, n2pow));  {"n" - samples entering the FFT}
        str(nakt, naktstrg);

        if uztubyl = false then begin {pokud jsem to v batchprocessingu poprve, zeptam se, jestli to chci prodlouzit}
          zvetsit := MessageDlg('Power of 2 set according to the number of samples is 2^' + n2powstrg + ' = ' + naktstrg + '. Do you want to increase it?', mtConfirmation, [mbYes, mbNo], 0);
          if zvetsit = mrNo then break;
        end;
        if uztubyl = true then begin {pokud uz jsem to byl jednou - plati jen pro batchproces - tak uz se znova neptam}
          zvetsit := mrYes         {a nastavim rovnou, ze je to YES}
        end;
        if zvetsit = mrYes then begin
          n2pow := n2pow + 1;            {zvetsim mocninu o jednicku, tedy prodlouzim to na dvojnasobek}
          str(n2pow, n2powstrg);
          if uztubyl = false then begin {na tohle se zeptatm zase jenom kdyz jsem tu poprve v batchprocessingu}
            if (trunc(power(2, n2pow)) = supermaxsamples) then begin
              ShowMessage('You reached the maximal number 2^' + n2powstrg + ' = ' + supermaxsamplesstrg + '  of samples set in the memory. To continue increasing, set higher option.');
            end;
          end;
        end;
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the power of 2 was increased to the value of ' + n2powstrg);
        if batchproces = true then begin
          uztubyl := true;
        end;
      end;
    end; {if je zaskrtly ChekcBox7 = prolong}

    {a zde by to chtelo pro jistotu prodlouzit to na dvojnasobek pokud pojedu SuperBatch, protoze nevim, jestli prvni stanice je blizko nebo daleko}
    {mozna jen pokud skutecny pocet vzorku bude blizko te mocnine}
    {a pak jeste navic to n2pow drzet konstantni pro vsechny stanice jednoho jevu, abych zarucil, ze jejich spektra budou vzorkovana stejne}
    if superbatchyesno then begin {pokud mam superbatch}
      str(kolikatysuper: 4, kolikstrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - SB: event No. ' + kolikstrg + ' detected');
      totalbatchstations := totalbatchstations + 1;
      eventstations := eventstations + 1;
      if aktualnijev < kolikatysuper then begin {pokud jsem preskocil na novy jev}
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - SB: the first station of a new event');
        if (nsampl > ((4/5)*(trunc(power(2, n2pow))))) then begin   {pokud je pocet realnych vzorku blizko te druhe mocnine}
          if (trunc(power(2, n2pow)) = supermaxsamples) then begin  {pokud uz ale nemam kam zvedat mocninu}
            ShowMessage('You reached the maximal number 2^' + n2powstrg + ' = ' + supermaxsamplesstrg + '  of samples set in the memory. To increase it, set higher memory option in the first SVAL window.');
            exit;
          end
          else begin
            n2pow := n2pow + 1;                   {tak tu mocninu radsi zvednu}
            supern2pow := n2pow;
            str(n2pow, n2powstrg);
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - SB: the power of 2 was increased to the value of ' + n2powstrg + ' to be on the safe side for SuperBatch');
          end; {else}
        end; {if pocet vzorku je nebezpecne blizko}
        aktualnijev := kolikatysuper; {zde si zapamatuju pocitadlo jevu aktualne pro tento cyklus, tedy to aktualni jev updateuju jen kdyz tu budu poprve pro novy jev}
        {tedy po prvni behu se toto aktualnijev aktualizuje na kolikatysuper a timpadem pro stejne kolikatysuper uz se to prodluzovani neprovede, tedy pro vsechny stanice jednoho jevu to udrzim stejne}
        {a teprve az pro dalsi jev se kolikatysuper zvedne, tak to zase udela opravu, ale zase jenom jednou}
      end {if se zmenil jev}
      else begin {pokud jsem tu znova pro ten samy jev, tedy pro jinou stanici tehoz jevu}
        n2pow := supern2pow;                    {tak pouziju to same supern2pow i pro tuto stanici a to bez ohledu na to, jake by bylo jeji prislusne n2pow}
        str(n2pow, n2powstrg);
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - SB: another station of the same event');
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - SB: the power of 2 was used as SuperBatch value of ' + n2powstrg);
      end;
    end; {if to byl superbatch}
    if (n2pow - nejmoc) <= 0 then begin  {maximal "n2pow" could be = nejmoc, coz je konstanta zadana v unite ChooseUnit}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - SVAL uses this value');
    end;
    if (n2pow - nejmoc) > 0 then begin
      n2pow := nejmoc;  {corrected exponent}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - it presents too large input array and therefore the value of power of 2 is too large!');
      str(n2pow, n2powstrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - corrected power of 2 is ' + n2powstrg);
    end;
    n := trunc(power(2, n2pow));   {"n" - samples entering the FFT - pokud jsem pozadoval prodlouzeni, tak v n2pow a tedy i v "n" uz je ten prodlouzeny pocet}
    str(n, nstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the number of samples used for FFT is ' + nstrg);
    dur := timein * (nsampl - 1);
    str(dur: 5: 3, durstrg);
    for i := 1 to nsampl do begin
      SVALtime[i] := (nstart + i - 2) * timein + timedist;
    end;
    str(SVALtime[1]: 8: 4, zacatekstrg);
    str(SVALtime[nsampl]: 8: 4, konecstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - processed part of the signal starts at ' + zacatekstrg + ' s from origin time');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - processed part of the signal ends at    ' + konecstrg + ' s from origin time');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the duration of the input signal is ' + durstrg + ' seconds');
    if FFT = False then begin {nedela se pro samotnou FFT}
      if (permin >= (timein * 4)) then begin
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the minimal period (' + perminstrg + ' s) is o.k.');
      end;
      if (permin < (timein * 2)) then begin {kontroluji, aby "permin" byla vetsi nez dvojnasobek casoveho kroku "timein"}
        permin := timein * 2; {pokud neni, nastavim ji na dvojnasobek tohoto kroku}
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the value of minimal period you have entered (' + perminstrg + ' s) is too small');
        str(permin: 6: 3, perminstrg);
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - corrected minimal period is ' + perminstrg + ' seconds');
      end;
      if (dur <= (permax * 0.5)) then begin {pozaduje se, aby se do doby trvani "dur" vesla aspon 0.5 periody "permax"}
        permax := dur * 2.0;  {pokud se nevesla, opravim "permax" na dvojnasobek "dur"}
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the value of maximal period you have entered (' + permaxstrg + ' s) is too large');
        str(permax: 6: 3, permaxstrg);
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - corrected maximal period is ' + permaxstrg + ' seconds');
      end;
      if (dur > (permax * 0.5)) then begin
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the maximal period (' + permaxstrg + ' s) is o.k.');
      end;
      if (permax < permin) then begin {pokud je "permax" mensi nez "permin",}
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the "minimal" period is greater than the "maximal" one .... I''m sorry, but see you later!');
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - analysis was canceled because of incorrect min / max period values');
        exit; {program terminates}
      end;
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the slope of alpha is ' + alphadirstrg + ' and the intercept point is ' + alphaabsstrg);
      g := 1 / (nflt - 1);
      gamma := power((permax / permin), g);  {faktorem "gamma" nasobim periodu nizsiho filtru abych dostal periodu vyssiho, "gamma" je vzdy vetsi nez 1}
      per := permin;                         {do per nacteme nejprve hodnotu permin (v rozmeru realneho casu)}
      jcyc := 0;                             {hodnotu indexu "j" menim v nasledujicim cyklu}
      nffl := nflt;                          {toto je jen pomocne prechodne oznaceni poctu filtru, ktere se bude menit}
      str(nflt, nfltstrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the original entered maximal number of filters is ' + nfltstrg);
      for i := 1 to nflt do begin            {konam cyklus pres jednotlive filtry:}
        {"nqp" predstavuje, kolik period se mi vejde do signalu, zaokrouhleno a o 1 zvetseno}
        {tedy je to zaohrouhlena frekvence prislusejici dane periode nasobena "dur"}
        nqp := trunc(((n - 1) * timein) / per + 0.5);        {"nqp" je bezrozmerna, "zavorka" i "per" maji rozmer casu}
        if (i <> 1) then begin     {pro jiny nez prvni filtr to leze tudy}
          if (nqp = nf[jcyc]) then begin
            nffl := nffl - 1;      {snizuje se pocet filtru, protoze nova frequency se rovna predesle}
          end;{if if}
          if (nqp <> nf[jcyc]) then begin
            jcyc := jcyc + 1;
            nf[jcyc] := nqp;
            period[jcyc] := ((n - 1) * timein) / nqp; {zde vypocitavam centralni periody}
          end;
        end;{of if}
        if (i = 1) then begin     {pro prvni filtr to skoci rovnou sem}
          jcyc := jcyc + 1;       {do pole "nf(jcyc)" se nacitaji nove a nove "nqp", ktere byly spocteny podle novych}
          nf[jcyc] := nqp;        {a novych "per", ktere byly spocteny ze starych nasobenim "gammou"}
          period[jcyc] := ((n - 1) * timein) / nqp;   {"period(jcyc)" je hodnota "per" az na zaokrouhleni - zde vypocitavam centralni periody}
        end;
        per := per * gamma;       {dostaneme vyssi "per", ktera je "gamma" nasobkem te predchozi}
      end;
      nflt := nffl;  {po skonceni cyklu se nacte do "nflt" opravena hodnotu "nffl"}
      str(nflt, nfltstrg);
      if nflt < nfltorig then begin
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - but the used number of filters is only ' + nfltstrg);
      end;
      if nflt = nfltorig then begin
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - and the number of used filters is the same');
      end;
      str(gamma: 10: 7, gammastrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the Gamma factor is ' + gammastrg);
    end; {konec vyrazeni ktere se nedela pro samotnou FFT}
    {pripravi se vstupni pole pro FFT}
    for i := 1 to n do begin          {do imaginarni casti signalu se vlozi nuly - kdyz jsem pozadoval prodlouzeni, tak ne uz je to prodlouzene}
      sim[i] := 0.0;                  {"sim" = "Signal IMaginarni"}
    end;
    for i := nsampl + 1 to n do begin {do zbytku realneho signalu se take vlozi nuly}
      sre[i] := 0.0;                  {"sre" = "Signal REalny"}
    end;
    setlength(cinput, (2 * supermaxsamples) + 1);
    for i := 0 to ((2 * supermaxsamples)) do begin
      cinput[i] := 0.0;
    end;
    for j := 1 to n do begin  {slozi se vstupni datove pole pro FFT}
      cinput[2 * j - 1] := sre[j];  {"cinput" = "Complex INPUT"}
      cinput[2 * j] := sim[j];
    end;
    four1(cinput, n, +1);  {spocte se spektrum realneho signalu - puvodne tady bylo +1}
    nhlf := trunc(n / 2); {dalsi operace budu delat jenom pro pulku spektra}
    for j := 1 to n do begin    {a opet se rozlozi vystupni datove pole na realnou a imaginarni cast}
      fre[j] := cinput[2 * j - 1] / nhlf;
      {"fre" = "Frekvence (oblast) REalna" - fre by ted melo byt ve skutecnych jednotkach}
      fim[j] := cinput[2 * j] / nhlf;
      {"fim" = "Frekvence (oblast) IMaginarni" - fim by ted melo byt ve skutecnych jednotkach}
    end;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - Fast Fourier Transform was successfully performed');
    for j := 1 to nhlf do begin   {tady bude trochu demonstrace vykreslovani celeho amplitudoveho spektra}
      powfrq[j] := sqrt(fre[j] * fre[j] + fim[j] * fim[j]); {tohle spektrum pak vykresluju jako obycejne, vyse ho delim poctem jedinecnych vzorku}
    end;    {aby to nebyla tak vysoka cisla a melo to fyzikalni rozmer amplitudy}
    {v tuto chvili se z toho nic nepocita, jen to lze nakreslit ve spektralnim okne - jak zhlazenou verzi amplitudoveho spektra, tak vysledne whitened spektrum}
    {ted se znormuje napoctene pole amplitud power spektra}
    hlfamx := 0.0;                   {"hlfamx" nastavime nejprve na nulu a pak do nej vkladame takove "powfrq(i)",}
    for i := 1 to nhlf do begin      { ktere jsou vetsi nez cokoli predchoziho}
      if (powfrq[i] > hlfamx) then begin
        hlfamx := powfrq[i];
      end;
    end;                             {tim mame v "hlfamx" absolutne nejvetsi amplitudu}
    for i := 1 to nhlf do begin
      hlfb := powfrq[i] / hlfamx;   {"hlfb" je pomer aktualni amplitudy k te nejvetsi}
      {pro nejvetsi amplitudu je hlfb = 1 a tedy npowfrq = 100, pro npowfrq = 0 musi byt log(b)= -5}
      {a tedy musi b = 10e-5, tedy minimalni amplituda je 100000krat mensi nez maximalni amplituda}
      npowfrq[i] := (20.0 * log10(hlfb + 1.0e-10) + 100.0);
      {"npowfrq" = "Normalizovana POWer FReQuency", tohle pak vykresluju jako normalizovane spektrum}
      {log pomeru max a min amplitudy je tedy 5, a tedy rozsah je 100db}
      if (npowfrq[i] < 0) then npowfrq[i] := 0; {zaopatrime i pripadne zaporne hodnoty}
    end;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - amplitude power spectrum was normalized');
    //    Whit(Sender, powfrq,fre,fim); {zavolam procedurku na whitening spektra a jako vstup ji dam to powfrq spektrum, vystupem je whitened[j], whitenedRe[j] a whitenedIm[j]}
    {spoctu fazi spektra}
    for j := 1 to nhlf do begin
      spectralphase[j] := arctan2(fim[j], (fre[j] + 0.000000001)); {tady je to po vzorkach, coz jsou frekvence, ale rozmer tu nehraje roli, vysledkem je zubatice se skoky 2*pi}
    end;
    {spoctu si frequence}
    for i := 1 to supermaxsamples do begin        {priradim jednotlivym samplikum jejich frekvenci, delam to pro zbytecne moc :i:, ale pro vykreslovani H(w) se to hodi}
      frequency[i] := (i) / (n * timein);         {nastaveno tak, aby pro i = n/2 mi vysla jako frequence Nyquistova}
    end;{of for :i:}
    if (hydro = false) then begin {vyhybka, pro hydro tohle delat nebudu, nepotrebuju to a seka se to}
      if (FFT = false) then begin {vyhybka, ani pro jen FFT tohle delat nebudu, nepotrebuju to a seka se to}
        fresm[1] := fre[1];                           {zhladim si spektrum}
        fresm[trunc(nhlf / 2)] := fre[trunc(nhlf / 2)];
        for i := 2 to (trunc(nhlf / 2) - 1) do begin  {delam to jen pro pulku spektra, protoze to staci, ale nic to neznamena, muze to jit az do nhlf}
          fresm[i] := (fre[i - 1] + fre[i] + fre[i + 1]) / 3; {klouzavy prumer s oknem = 3 vzorky}
        end;
        m := 1;                                       {zde najdu zero crossings pro fresm[i]}
        for i := 1 to trunc(nhlf / 2) do begin        {delam to jen pro pulku spektra, protoze to staci, ale nic to neznamena, muze to jit az do nhlf}
          if (fresm[i] > 0) and (fresm[i + 1] < 0) then begin {jdu dolu}
            dfreq := frequency[i + 1] - frequency[i];
            dfre := fresm[i + 1] - fresm[i];
            zerocross[m] := frequency[i] + (dfreq / dfre * (-fresm[i]));
            zerocrosslabel[m] := -1;
            maxzerocross := m;
            m := m + 1;
          end;
          if (fresm[i] < 0) and (fresm[i + 1] > 0) then begin {jdu nahoru}
            dfreq := frequency[i + 1] - frequency[i];
            dfre := fresm[i + 1] - fresm[i];
            zerocross[m] := frequency[i] + (dfreq / dfre * (-fresm[i]));
            zerocrosslabel[m] := +1;
            maxzerocross := m;
            m := m + 1;
          end;
        end;
        str(maxzerocross: 4, maxzerocrossstrg);
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - number of zero crossings: ' + maxzerocrossstrg);
        {prectu zeros of the Bessel function of the first kind of 0-th order}
        cestakbessel := '';
        if Form2.CheckBox3.Checked = True then begin
          cestakbessel := Form2.Edit1.Text;
          assignfile(bessel, cestakbessel);      {priradim jmeno souboru s nulama bessel function, je to tak nejak nechutne natvrdo tady ten soubor...}
          reset(bessel);
          nacetzeros := 1;
          repeat
            readln(bessel, besselzero[nacetzeros]);
            if (nacetzeros mod 2) = 1 then besselzerolabel[nacetzeros] := -1; {lichy = negative derivative}
            if (nacetzeros mod 2) = 0 then besselzerolabel[nacetzeros] := +1; {sudy = positive derivative}
            nacetzeros := nacetzeros + 1;
          until EOF(bessel);
          closefile(bessel);
          str((nacetzeros - 1): 5, nacetzerosstrg);
          radek := radek + 1;
          str(radek: 4, radekstrg);
          memo1.Lines.Add(radekstrg + ' | - ' + nacetzerosstrg + ' zeros of the Bessel function were read from the file');
        end;
      end; {if FFT bylo false}
    end; {if hydro bylo false}
    if FFT then begin {kdyz je to jenom pro FFT a nic vic}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - only one channel FFT was performed and then the analysis was canceled');
      uzjsemtu := False;  {aby se vynulovaly hodnoty pro kresleni spektra}
      uzjsemvni := False; {aby se vynulovaly hodnoty pro kresleni inverze}
      Button21.Enabled := True; {abych se mohl podivat na spektrum}
      Button47.Enabled := True; {abych mohl delat bandpass}
      filtrange := True; {jakoze nemam filtrovanou skupinu}
      if panely then begin {kdyz mam zapnute panely, tedy defaultni nastaveni}
        Button6.Enabled := True;  {abych se mohl podivat na puvodni zaznam}
        Button47.Enabled := True; {bandpass}
        Button2.Enabled := False; {bandpass envelope}
        PlotPanel2.Enabled := True;
        PlotPanel2.Xmin := SVALtime[1];
        PlotPanel2.Xmax := SVALtime[nsampl];
        if (dur > 0.0)     then PlotPanel2.XInterval :=    0.10;
        if (dur > 0.1)     then PlotPanel2.XInterval :=    0.25;
        if (dur > 3.0)     then PlotPanel2.XInterval :=    1.0;
        if (dur > 20.0)    then PlotPanel2.XInterval :=    2.0;
        if (dur > 50.0)    then PlotPanel2.XInterval :=    5.0;
        if (dur > 100.0)   then PlotPanel2.XInterval :=   10.0;
        if (dur > 200.0)   then PlotPanel2.XInterval :=   20.0;
        if (dur > 500.0)   then PlotPanel2.XInterval :=   60.0;
        if (dur > 1000.0)  then PlotPanel2.XInterval :=  120.0;
        if (dur > 2000.0)  then PlotPanel2.XInterval :=  240.0;
        if (dur > 5000.0)  then PlotPanel2.XInterval :=  600.0;
        if (dur > 10000.0) then PlotPanel2.XInterval := 1200.0;
        if (dur > 20000.0) then PlotPanel2.XInterval := 2400.0;
        if (dur > 50000.0) then PlotPanel2.XInterval := 6000.0;
        if hydro = false then begin
          PlotPanel2.XMarks := True;
        end;
        PlotPanel2.Ymin := -1.2;
        PlotPanel2.Ymax := 1.2;
        PlotPanel2.YInterval := (1 / 3);
      end; {if panely}
      exit;
    end;
    {konec kusu, ktery se naopak delal jenom pro samotnou FFT, tim skonci analyza pro zaskrnute policko :FFT:}
    {kona se cyklus pro jednotlive filtry (cykly pres filtry jsou vzdy "j" nebo "jj")}
    for jj := 1 to nflt do begin  {napocitavani alfa}
      alpha[jj] := alphaabs + (alphadir * period[jj]); {nehomogenni filtrace}
      if alphacheck = False then begin
        if (alpha[jj] < 0.00001) then begin
          alpha[jj] := 0.00001;
        end;
      end;
      if alphacheck = True then begin
        if (alpha[jj] < 7) then begin
          alpha[jj] := 7;
        end;
      end;
    end;
  end;{konec odbocky pro ::if nahrada = false:: --- zacina na radce 1410, je to dlouha odbocka}
  Button12.Enabled := False; {deaktivuju cudlik na vykreslovani opraveneho seismogramu}
  filtrujuopravovany := False;
  Pokracovani; {pri bezne analyze to skace hned na dalsi proceduru a pokracuje to v praci}
end;           {konci prvni cast hlavni procedury analyzy spoustene cudlikem :ANALYSIS:}

procedure TNoSVALform.Pokracovani;
var
  i             : integer;
  j             : integer;
  k             : integer;
  ii            : integer;
  jj            : integer;
  m             : integer;
  istart        : array of integer;
  ikonec        : array of integer;
  RayPremPer               : array[1..3000] of double;
  RayPremPhase             : array[1..3000] of double;
  RayPremGroup             : array[1..3000] of double;
  RayPrem                  : textfile;
  LovPremPer               : array[1..3000] of double;
  LovPremPhase             : array[1..3000] of double;
  LovPremGroup             : array[1..3000] of double;
  LovPrem                  : textfile;
  hlavicka                 : string;
  maxpremsRay              : integer;
  maxpremsRaystrg          : string;
  maxpremsLov              : integer;
  maxpremsLovstrg          : string;
  minperpremdist           : double;
  hledanyjj                : integer;
  cestakezdroji            : string;
  fastPREM                 : double;
  slowPREM                 : double;
//  finalindex               : integer;
  maxfsre                  : double;
  minfsre                  : double;


begin
  if filtrujuopravovany then begin {pokud jsem spustil cudlikem Filter Corr! filtraci opraveneho spektra}
    memo1.Lines.Add('------------------------------------------------------------------------');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - analysis of CORRECTED spectrum starts at ' + DateTimeToStr(Now));
    zacatekSVAL := Time;
    Timer1.Enabled := False;         {aby neblikal bodik na disperzni krivce}
    Timer2.Enabled := False;
  end;
  if nahrada = False then begin      {pokracovani odbocky}
    for jj := 1 to nflt do begin
      nfc := nf[jj];     {to je konkretni prirazeni jedne centralni frekvence z pole centralnich frekvenci "nf(jj)"}
      filter(nfc, alpha[jj], jj);          {vola se subroutina "filter" pro centralni frekvenci "nfc"}
      for i := 1 to n do begin             {nyni se prevede vyfiltrovane spektrum zpet do casu a slozi se vstupni datove pole pro inverzni FFT}
        cinput[2 * i - 1] := ffre[jj, i];  {"ffre" = "Filtrovana Frekvence (oblast) REalna" (vystup z "filter")}
        cinput[2 * i] := ffim[jj, i];      {"ffim" = "Filtrovana Frekvence (oblast) IMaginarni" (vystup z "filter")}
      end;
      four1(cinput, n, -1);                {spocte se signal (casova oblast) k danemu vyfiltrovanemu spektru}
      for i := 1 to n do begin             {a opet se rozlozi vystupni datove pole na realnou a imaginarni cast}
        fsre[jj, i] := cinput[2 * i - 1];  {"fsre" = "Filtrovany Signal (casova oblast) REalny"}
        fsim[jj, i] := cinput[2 * i];      {"fsim" = "Filtrovany Signal (casova oblast) IMaginarni"}
      end;
      {"fsre" i "fsim" se hodi uchovat ve dvourozmernem poli "(jj,i)"}
      {z jednoho filtru to mame zpatky v casu a kona se cyklus pro jednotlive vzorky}
      for ii := 1 to nsampl do  begin {cykly pres vzorky jsou vzdy "i" nebo "ii", tedy: "ii" probiha pocet vzorku, "jj" probiha pocet filtru}
        amp[jj, ii] := sqrt(fsre[jj, ii] * fsre[jj, ii] + fsim[jj, ii] * fsim[jj, ii]);     {spocte se amplituda obalky}
      end; {zde konci cyklus ii pro vzorky "nsampl" v ramci jednoho filtru}
    end; {zde konci cyklus jj pro kazdy filtr}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the amplitude power spectrum was filtered at each central period');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the spectrogram was created');
    for j := 1 to nhlf do begin  {tady bude trochu demonstrace vykreslování filtrovaného power spektra}
      for k := 1 to nflt do begin
        filtpowfrq[k, j] := sqrt(ffre[k, j] * ffre[k, j] + ffim[k, j] * ffim[k, j]);
      end;
    end;
    for j := 1 to nflt do begin {znormujeme filtrovane spektrum}
      for i := 1 to nhlf do begin
        if powfrq[i] = 0 then  filtpowfrq[j, i] := 0;
        if powfrq[i] <> 0 then begin
          hlfb := filtpowfrq[j, i] / hlfamx;  {"hlfb" je pomer aktualni amplitudy k te nejvetsi}
          www[j, i] := ww[j, i];              {ulozim si puvodni filtry, ktere maji jednotkovou velikost}
          ww[j, i] := ww[j, i] * filtpowfrq[j, nf[j]];
          hlfbw := ww[j, i] / hlfamx;
          hlfbww := (www[j, i] * filtpowfrq[10, nf[10]]) / hlfamx;
                 {tady to prenasobuju jen jednou hodnotou, aby byly vsechny stejne vysoke}
                 {pro nejvetsi amplitudu je hlfb = 1 a tedy nfiltpowfrq = npowfrq[j,primlocmx[j]], pro nfiltpowfrq = 0 musi byt log(b)= -(npowfrq[j,primlocmx[j]]/20)
                 a tedy musi b = 10e-5, tedy minimalni amplituda je 100 krat mensi nez maximalni amplituda}
          nfiltpowfrq[j, i] := (20.0 * log10(hlfb + 1.0e-10) + 100);
          nww[j, i] := (20.0 * log10(hlfbw + 1.0e-10) + 100);
          nwww[j, i] := (20.0 * log10(hlfbww + 1.0e-10) + 100);   {pro vykreslovani filtru ve spektru}
          {log pomeru max a min amplitudy je tedy 5, a tedy rozsah je 100db}
          if (nfiltpowfrq[j, i] < 0) then nfiltpowfrq[j, i] := 0; {zaopatrime i pripadne zaporne hodnoty}
        end; {of if}
      end; {of for :i:}
    end; {of for :j:}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the filtered amplitude power spectrum was normalized');
    for j := 1 to nflt do begin
      for i := 1 to nsampl do begin
        fxsre[j, i] := fsre[j, i];
        fxsim[j, i] := fsim[j, i];
      end;
    end;
    {ted se znormuje napoctene pole amplitud}
    amx := 0.0;                      {"amx" nastavime nejprve na nulu}
    for j := 1 to nflt do begin      {a pak do nej vkladame takove "amp(j,i)",}
      for i := 1 to nsampl do begin  {ktere jsou vetsi nez}
        if (amp[j, i] > amx) then begin
          amx := amp[j, i];    {cokoli predchoziho}
          maxindex := j;       {zde mam ulozen index filtru, ve kterem je absolutne nejvyssi amplituda}
        end;{of if}
      end;{of for i}
    end;{of for j}    {tim mame v "amx" absolutne nejvetsi amplitudu}
    for j := 1 to nflt do begin
      for i := 1 to nsampl do begin
        br := amp[j, i] / amx;  {"b" je pomer aktualni amplitudy k te nejvetsi}
        {pro nejvetsi amplitudu je b=1 a tedy namp = 100, pro namp = 0 musi byt log(b)= -5}
        {a tedy musi b=10e-5, tedy minimalni amplituda je 100000krat mensi nez maximalni amplituda}
        namp[j, i] := 20.0 * log10(br + 1.0e-10) + 100.0;  {"namp" = "Normalizovana AMPlituda"}
        {log pomeru max a min amplitudy je tedy 5, a tedy rozsah je 100db}
        if (namp[j, i] < 0) then begin
          namp[j, i] := 0;     {zaopatrime i pripadne zaporne hodnoty}
        end; {of if}
      end; {if for}
    end; {of for}
    {tady se najde minimum toho znormovaneho pole}
    amin := 100.0;                  {"amin" nastavime nejprve na nejvyssi hodnotu}
    for j := 1 to nflt do begin     {a pak do nej vkladame takove "amp(j,i)",}
      for i := 1 to nsampl do begin {ktere jsou mensi nez}
        if (namp[j, i] < amin) then begin
          amin := namp[j, i];        {cokoli predchoziho}
        end; {of if}
      end; {of for}
    end; {of for}        {tim mame v "amin" absolutne nejmensi amplitudu}
    {tady se najde kontrolne maximum toho znormovaneho pole}
    namx := 0.0;                    {"namx" nastavime nejprve na nejvyssi hodnotu}
    for j := 1 to nflt do begin     {a pak do nej vkladame takove "amp(j,i)",}
      for i := 1 to nsampl do begin {ktere jsou vetsi nez}
        if (namp[j, i] > namx) then begin
          namx := namp[j, i];        {cokoli predchoziho}
        end;{of if}
      end;{of for}
    end;{of for}        {tim mame v "namx" nejvetsi normovanou amplitudu}
    str(amx: 7: 3, amxstrg);
    str(amin: 7: 3, aminstrg);
    str(namx: 7: 3, namxstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the spectrogram''s absolute maximum is ' + amxstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the spectrogram was normalized to 100 dB scale');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the normalized spectrogram''s minimum is ' + aminstrg + ' dB');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the normalized spectrogram''s maximum is ' + namxstrg + ' dB');
    {provadi se cyklus pro hledani maxim jednotlivych filtru}
    for j := 1 to nflt do begin {pro zacatek nastavime vse na nulu}
      locmx[j] := 0;            {index vzorku localniho primarniho maximuma}
      nahradnimax[j] := 0;      {index vzorku localniho primarniho maximuma}
      refi[j] := 0;
      loc1amp[j] := 0.0;        {amplituda v localnim primarnim maximu}
      loc2amp[j] := 0.0;
      loc3amp[j] := 0.0;
      loc4amp[j] := 0.0;
      loc5amp[j] := 0.0;
      loc6amp[j] := 0.0;
      loc7amp[j] := 0.0;
      loc8amp[j] := 0.0;
    end;
    pocet1 := 0;

    {HLEDANI MAXIM OBALEK}
    setlength(istart, maxnflt + 1);
    setlength(ikonec, maxnflt + 1);
    if PREMlimit = false then begin
      for j := 1 to nflt do begin {v tomto pripade budou indexy istart a ikonec stejne pro vsechny filtry j, ale v pripade PREMlimit budou ruzne}
        istart[j] := 4;
        ikonec[j] := nsampl - 3;
      end;
    end;

    pozice := 1;
    repeat
      posledni := misto; {sem nactu posledni nalezenou pozici zpetneho lomitka}
      misto := PosEx('/', ParamStr(0), pozice); {ParamStr(0) vyhodi cestu k exe souboru SVAL.exe vcetne toho jmena SVAL.exe na konci, takze to musim odriznout}
      pozice := misto + 1;
    until misto = 0;
    cestakezdroji := Copy(ParamStr(0), 1, posledni);
    assignfile(RayPrem,cestakezdroji+'RayPREM.dat'); {prectu si hodnoty fazove rychlosti PREMu, soubor je v adresari D:/Disperze/programy/SVAL/, kde je cely projekt}
    assignfile(LovPrem,cestakezdroji+'LovPREM.dat'); {prectu si hodnoty fazove rychlosti PREMu, soubor je v adresari D:/Disperze/programy/SVAL/, kde je cely projekt}
    reset(RayPrem);
    reset(LovPrem);
    readln(RayPrem,hlavicka);          {prvni radka}
    readln(LovPrem,hlavicka);          {prvni radka}
    jj := 0;
    repeat
      jj := jj + 1;
      readln(RayPrem,RayPremPer[jj],RayPremPhase[jj],RayPremGroup[jj]);
      maxpremsRay := jj;
    until Eof(RayPrem);
    closefile(RayPrem);
    jj := 0;
    repeat
      jj := jj + 1;
      readln(LovPrem,LovPremPer[jj],LovPremPhase[jj],LovPremGroup[jj]);
      maxpremsLov := jj;
    until Eof(LovPrem);
    closefile(LovPrem);

    str(maxpremsRay:6,maxpremsRaystrg);
    str(maxpremsLov:6,maxpremsLovstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' - No of lines in the Rayleigh PREM model '+maxpremsRaystrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' - No of lines in the Love PREM model '+maxpremsLovstrg);

    if ((PREMlimit = true) or  (fixedcut = true )) then begin
      val(BatchForm.Edit9.Text,  fastPREM, cd); {rychlejsi PREM v pomeru, nactu v pripade PREMlimit i fixedcut}
      slowPREM := fastPREM;                     {do pomalyho nactu rychlej, pro fixedcut to tak zustane}
    end;
    if ((PREMlimit = true) and (fixedcut = false)) then begin
      val(BatchForm.Edit10.Text, slowPREM, cd); {pomalejsi prem v pomeru, nacitam jen kdyz to NENI fixed cut}
    end;

    pp3 := pp3 + 1;
    if ((PREMlimit = true) or  (fixedcut = true )) then begin
      with PlotPanel3 do begin
        LayerOptions(pp3, pmDot, 5);
      end;
    end;
    if ((PREMlimit = false) and (fixedcut = false ) and (batchproces = false)) then begin {tohle se tedy nakresli kdyz delam manualni analyzu}
      with PlotPanel3 do begin
        LayerOptions(pp3, pmDot, 2);
      end;
    end;

    for j := 1 to nflt do begin {Rayleigh}
      if (compon = 1) or (compon = 2) or (compon = 4) or (compon = 5) then begin
        minperpremdist := 10000;
        for jj := 1 to maxpremsRay do begin {pro vsechny filtry v souboru RayPREM}
          if abs(period[j] - RayPremPer[jj]) < minperpremdist then begin
            minperpremdist := abs(period[j] - RayPremPer[jj]);
            hledanyjj := jj;  {index radky v souboru RayPREM, ktery je nejblize (perioda toho radku) centralni periode}
          end; {if}
          if ((PREMlimit = true) or  (fixedcut = true )) then begin
            istart[j] := round((((distkm/(RayPremGroup[hledanyjj]*fastPREM)) - timedist) / timein) + 1 - nstart); {zde si vyjadrim ten index casoveho vzorku pomoci te nactene rychlosti}
            if istart[j] < 4 then istart[j] := 4;
            ikonec[j] := round((((distkm/(RayPremGroup[hledanyjj]*slowPREM)) - timedist) / timein) + 1 - nstart); {zde si vyjadrim ten index casoveho vzorku pomoci te nactene rychlosti}
            if ikonec[j] > nsampl - 3 then ikonec[j] := nsampl - 3;
            if fixedcut then refi[j] := istart[j];
          end; {if}
        end; {jj}
        if ((PREMlimit = true) or  (fixedcut = true )) then begin
          PlotPanel3.AddXY(period[j], RayPremGroup[hledanyjj]*fastPREM , RGB(255, 0, 255), pp3);
          PlotPanel3.AddXY(period[j], RayPremGroup[hledanyjj]*slowPREM , RGB(255, 0, 255), pp3);
        end;
        if ((PREMlimit = false) and (fixedcut = false ) and (batchproces = false)) then begin {tohle se tedy nakresli kdyz delam manualni analyzu}
          PlotPanel3.AddXY(period[j], RayPremGroup[hledanyjj] , RGB(255, 0, 255), pp3);
        end;
      end; {if Rayleigh, components 1,2,4,5}
    end; {j}

    for j := 1 to nflt do begin     {Love}
      if (compon = 3) then begin
        minperpremdist := 10000;
        for jj := 1 to maxpremsLov do begin {pro vsechny filtry v souboru LovPREM}
          if abs(period[j] - LovPremPer[jj]) < minperpremdist then begin
            minperpremdist := abs(period[j] - LovPremPer[jj]);
            hledanyjj := jj;  {index radky v souboru LovPREM, ktery je nejblize (perioda toho radku) centralni periode}
          end; {if}
          if ((PREMlimit = true) or  (fixedcut = true )) then begin
            istart[j] := round((((distkm/(LovPremGroup[hledanyjj]*fastPREM)) - timedist) / timein) + 1 - nstart); {zde si vyjadrim ten index casoveho vzorku pomoci te nactene rychlosti}
            if istart[j] < 4 then istart[j] := 4;
            ikonec[j] := round((((distkm/(LovPremGroup[hledanyjj]*slowPREM)) - timedist) / timein) + 1 - nstart); {zde si vyjadrim ten index casoveho vzorku pomoci te nactene rychlosti}
            if ikonec[j] > nsampl - 3 then ikonec[j] := nsampl - 3;
            if fixedcut then refi[j] := istart[j];
          end; {if}
        end; {jj}
        if ((PREMlimit = true) or  (fixedcut = true )) then begin
          PlotPanel3.AddXY(period[j], LovPremGroup[hledanyjj]*fastPREM , RGB(255, 0, 255), pp3);
          PlotPanel3.AddXY(period[j], LovPremGroup[hledanyjj]*slowPREM , RGB(255, 0, 255), pp3);
        end;
        if ((PREMlimit = false) and (fixedcut = false ) and (batchproces = false)) then begin {tohle se tedy nakresli kdyz delam manualni analyzu}
          PlotPanel3.AddXY(period[j], LovPremGroup[hledanyjj] , RGB(255, 0, 255), pp3);
        end;
      end; {if Love, component 3}
    end; {j}

    for j := 1 to nflt do begin
      for i := istart[j] to ikonec[j] do begin
        // tady bylo puvodne (leden 2024) namp
        if (amp[j, i] >= loc1amp[j]) then begin
          loc1amp[j] := amp[j, i];  {sem schovame hodnotu maximalni amplitudy}
          max1locmx[j] := i;         {a sem index, ktery ji v danem filtru prislusi}
          locmx[j]     := i;         {tohle je to same, ale posleze sem budu davat i nektere hodnoty z maxseclocmx}
        end; {of if}
      end; {of for "i"}
      if (loc1amp[j] <> 0) then pocet1 := pocet1 + 1; {pocitam primarni maxima}
    end; {of for "j"}
    str(pocet1: 4, pocet1strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - ' + pocet1strg + ' primary maxima were found');
    for j := 1 to nflt do begin   {tady najdeme druha (nizsi) lokalni maximka v jednom filtru}
      numofmax[j] := 0;           {pocet maxim v kazdem filtru "j"}
    end;
    maxnumofmax := 0;             {pocet maxim ve filtru, kde jich je nejvic}
    for j := 1 to nflt do begin   {cyklus bude probihat postupne pres vsechny filtry, nejprve pro alokovani pole seclocmax}
      for i := istart[j] to ikonec[j] do begin
        if   (((amp[j, i - 2] <= amp[j, i - 1]) and (amp[j, i - 1] <= amp[j, i]    )
          and  (amp[j, i]     >= amp[j, i + 1]) and (amp[j, i + 1] >= amp[j, i + 2])) {tedy nasel opravdicke maximum}
          or  ((amp[j, i - 3] <  amp[j, i - 2]) and (amp[j, i - 2] <  amp[j, i - 1])
          and  (amp[j, i - 1] <  amp[j, i])     and (amp[j, i]     <  amp[j, i + 1])
          and  (amp[j, i + 1] <  amp[j, i + 2]) and (amp[j, i + 2] <  amp[j, i + 3])  {tedy jestlize 6 po sobe jdoucich rozdilu vzorku roste}
          and ((amp[j, i - 2] -  amp[j, i - 3]) >   (amp[j, i - 1] -  amp[j, i - 2]))   {pro inflexi by mi stacilo porovnat 4 rozdily, ale pro jistotu pocitam derivaci ze 6, aby se vyloucilo nahodne zakmitani}
          and ((amp[j, i - 1] -  amp[j, i - 2]) >   (amp[j, i]     -  amp[j, i - 1])) {             and ( (amp[j,i  ]- amp[j,i-1]) > (amp[j,i+1]-amp[j,i  ]) )      }
          and ((amp[j, i + 1] -  amp[j, i])     <   (amp[j, i + 2] -  amp[j, i + 1]))
          and ((amp[j, i + 2] -  amp[j, i + 1]) <   (amp[j, i + 3] -  amp[j, i + 2]))){tedy je to placata rostouci inflexe}
          or  ((amp[j, i - 3] >  amp[j, i - 2]) and (amp[j, i - 2] >  amp[j, i - 1])
          and  (amp[j, i - 1] >  amp[j, i])     and (amp[j, i]     >  amp[j, i + 1])
          and  (amp[j, i + 1] >  amp[j, i + 2]) and (amp[j, i + 2] >  amp[j, i + 3])  {nebo jestlize 6 po sobe jdoucich rozdilu vzorku klesa}
          and ((amp[j, i + 2] -  amp[j, i + 3]) >   (amp[j, i + 1] -  amp[j, i + 2]))
          and ((amp[j, i + 1] -  amp[j, i + 2]) >   (amp[j, i]     -  amp[j, i + 1]))  {             and ( (amp[j,i  ]- amp[j,i+1]) > (amp[j,i-1]-amp[j,i  ]) )       } {tedy je to placata klesajici inflexe}
          and ((amp[j, i - 1] -  amp[j, i])     <   (amp[j, i - 2] -  amp[j, i - 1]))
          and ((amp[j, i - 2] -  amp[j, i - 1]) <   (amp[j, i - 3] -  amp[j, i - 2])))) then begin {tedy kdyz to najde dalsi maximum}
          numofmax[j] := numofmax[j] + 1;
        end;{if}
        {tedy kdyz to najde dalsi maximum nebo inflexi pro nejake "i", zvetsim o jednicku pocet maxim ve filtru "j"}
      end;  {koncim cyklus pro "i"}
      if (numofmax[j] > maxnumofmax) then maxnumofmax := numofmax[j];  {a jestlize jich je v tomto filtru vic, nez jich bylo v kteremkoli predchozim, ulozim do "maxnumofmax" tuto vyssi hodnotu}
    end;{koncim cyklus pro "j"}
    setlength(seclocmx, maxnflt + 1, maxnumofmax + 1);    {alokuju pole pro indexy vsech ostatnich maxim}
    setlength(lowerlocamp, maxnflt + 1, maxnumofmax + 1); {alokuju pole pro amplitudy vsech ostatnich maxim}
    setlength(oznaceni, maxnflt + 1, maxnumofmax + 1);    {alokuju pole pro oznaceni vsech ostatnich maxim}
    for j := 0 to maxnflt do begin {vynuluju ta pole}
      for k := 0 to maxnumofmax do begin
        seclocmx[j, k] := 0;
        lowerlocamp[j, k] := 0.0;
        oznaceni[j, k] := 'edge of the record';           {do vseho nacpu tohle oznaceni, ktere pak menim}
      end;                                                {jen pokud jsem predim nasel primarni maximum na okraji}
    end;                                                  {zaznamu, tak uz ho to pak neuvidi a hodi to tuhle hlasku, tedy tato hlaska ve vysledenm vypise muze prisluset jen primarnimu maximu}
    for j := 1 to nflt do begin {a znovu tentyz cyklus bude probihat postupne pres vsechny filtry}
      k := 0;
      for i := istart[j] to ikonec[j] do begin {vlastni hledani vedlejsich maxim}
        if   (((amp[j, i - 2] <= amp[j, i - 1]) and (amp[j, i - 1] <= amp[j, i]    )
          and  (amp[j, i]     >= amp[j, i + 1]) and (amp[j, i + 1] >= amp[j, i + 2])) {tedy nasel opravdicke maximum}
          or  ((amp[j, i - 3] <  amp[j, i - 2]) and (amp[j, i - 2] <  amp[j, i - 1])
          and  (amp[j, i - 1] <  amp[j, i]    ) and (amp[j, i]     <  amp[j, i + 1])
          and  (amp[j, i + 1] <  amp[j, i + 2]) and (amp[j, i + 2] <  amp[j, i + 3])
          and ((amp[j, i - 2] -  amp[j, i - 3]) >   (amp[j, i - 1] -  amp[j, i - 2]))
          and ((amp[j, i - 1] -  amp[j, i - 2]) >   (amp[j, i]     -  amp[j, i - 1]))     { tedy kdyz to najde inflexni bod, }
          {             and ( (amp[j,i  ]- amp[j,i-1]) > (amp[j,i+1]-amp[j,i  ]) )      } { ve kterem je derivace nejmensi a }
          and ((amp[j, i + 1] -  amp[j, i]    ) <   (amp[j, i + 2] -  amp[j, i + 1]))     { zaroven ten bod je v rostouci casti obalky}
          and ((amp[j, i + 2] -  amp[j, i + 1]) <   (amp[j, i + 3] -  amp[j, i + 2])))
          or  ((amp[j, i - 3] >  amp[j, i - 2]) and (amp[j, i - 2] >  amp[j, i - 1])
          and  (amp[j, i - 1] >  amp[j, i]    ) and (amp[j, i]     >  amp[j, i + 1])
          and  (amp[j, i + 1] >  amp[j, i + 2]) and (amp[j, i + 2] >  amp[j, i + 3])      { tedy kdyz to najde inflexni bod, }
          and ((amp[j, i + 2] -  amp[j, i + 3]) >   (amp[j, i + 1] -  amp[j, i + 2]))
          and ((amp[j, i + 1] -  amp[j, i + 2]) >   (amp[j, i]     -  amp[j, i + 1]))     { ve kterem je derivace nejmensi a }
          {             and ( (amp[j,i  ]- amp[j,i+1]) > (amp[j,i-1]-amp[j,i  ]) )       }{ zaroven ten bod je v klesajici casti obalky}
          and ((amp[j, i - 1] -  amp[j, i]    ) <   (amp[j, i - 2] -  amp[j, i - 1]))
          and ((amp[j, i - 2] -  amp[j, i - 1]) <   (amp[j, i - 3] -  amp[j, i - 2])))) then begin {tedy kdyz to najde dalsi maximum}
          k := k + 1;
          seclocmx[j, k] := i;             {tady mam index nejakeho dalsiho maxima, tedy vcetne toho primarniho}
          lowerlocamp[j, k] := amp[j, i]; {a tady mam jeho amplitudu} // tady bylo puvodne namp[j,i]
        end; {of if}
      end; {koncim cyklus pro i}
    end; {koncim cyklus pro j}

    for j := 1 to nflt do begin
      k := 0;
      for i := istart[j] to ikonec[j] do begin {vlastni hledani vedlejsich maxim}
        if {ted delam ten samy cyklus :if:, ale rozdeleny na tri podcykly tak, jak je predtim oddelovaly :or:}
            ((amp[j, i - 2] <= amp[j, i - 1]) and (amp[j, i - 1] <= amp[j, i]    )
         and (amp[j, i]     >= amp[j, i + 1]) and (amp[j, i + 1] >= amp[j, i + 2])){tedy nasel opravdicke maximum} then begin
          k := k + 1;
          oznaceni[j, k] := 'maximum';     {delam to proto, abych si mohl poznacit, ktere maximum je jakeho typu, to ukladam do pole :oznaceni:}
        end
        else if ((amp[j, i - 3] < amp[j, i - 2]) and (amp[j, i - 2] < amp[j, i - 1])
          and    (amp[j, i - 1] < amp[j, i]    ) and (amp[j, i]     < amp[j, i + 1])
          and    (amp[j, i + 1] < amp[j, i + 2]) and (amp[j, i + 2] < amp[j, i + 3])
          and   ((amp[j, i - 2] - amp[j, i - 3]) >   (amp[j, i - 1] - amp[j, i - 2]))
          and   ((amp[j, i - 1] - amp[j, i - 2]) >   (amp[j, i]     - amp[j, i - 1]))
          {         and ( (amp[j,i  ]- amp[j,i-1]) > (amp[j,i+1]-amp[j,i  ]) )        }
          and   ((amp[j, i + 1] - amp[j, i]    ) <   (amp[j, i + 2] - amp[j, i + 1]))
          and   ((amp[j, i + 2] - amp[j, i + 1]) <   (amp[j, i + 3] - amp[j, i + 2]))) then begin
          k := k + 1;
          oznaceni[j, k] := 'increasing inflection';
        end
        else if ((amp[j, i - 3] > amp[j, i - 2]) and (amp[j, i - 2] > amp[j, i - 1])
          and    (amp[j, i - 1] > amp[j, i]    ) and (amp[j, i]     > amp[j, i + 1])
          and    (amp[j, i + 1] > amp[j, i + 2]) and (amp[j, i + 2] > amp[j, i + 3])
          and   ((amp[j, i + 2] - amp[j, i + 3]) >   (amp[j, i + 1] - amp[j, i + 2]))
          and   ((amp[j, i + 1] - amp[j, i + 2]) >   (amp[j, i]     - amp[j, i + 1]))
          {         and ( (amp[j,i  ]- amp[j,i+1]) > (amp[j,i-1]-amp[j,i  ]) )          }
          and   ((amp[j, i - 1] - amp[j, i]    ) <   (amp[j, i - 2] - amp[j, i - 1]))
          and   ((amp[j, i - 2] - amp[j, i - 1]) <   (amp[j, i - 3] - amp[j, i - 2]))) then begin
          k := k + 1;
          oznaceni[j, k] := 'decreasing inflection';
        end;
      end;  {kocim cyklus pro "i"}
    end; {koncim cyklus pro "j"}

    {KONEC HLEDANI MAXIM OBALEK}

    for j := 1 to nflt do begin {tady oznacim primarni maxima, ale hledat uz je nemusim, uz je mam}
      for k := 1 to maxnumofmax do begin
        if (seclocmx[j, k] = max1locmx[j]) then begin
          locmx1oznaceni[j] := oznaceni[j, k];
          {z logiky veci vyplyva, ze primarni maximum musi byt maximum a ne inflexe}
        end; {takze tady nemusim resit, jestli chci nebo nechci hledat inflexe}
      end;
      locmxoznaceni[j] := locmx1oznaceni[j];   {napred to vsechno nastavim jako ze jsou to primarni}
    end;                                       {a posleze ta jina zmenim, takze v primarnich zustane oznaceni primarnich}
    if allbods then begin      {pokud hledam vsechna typy maxim}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - both maxima and inflection points of each filter will be found');
    end;
    if (allbods = False) then begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - only pure maxima of each filter will be found (no inflection points will be used)');
    end;
    {pozor : promenna seclocmx oznacuje indexy vsech maxim, tedy primarnich, sekundarnich i vsech nizsich}
    {puvodne jsem odliseni nizsich maxim od vyssich kontroloval jen pomoci rozdilnych indexu i, tedy rozdilnych seclocmx, tedy rozdilnych prichodu v case}
    {ale protoze nekdy se stavalo, ze v case se sice maxima lisily, ale byla jen kousek od sebe a mela shodnou amplitudu, resp. to bylo jedno a totez maximum s "placatym" vrcholem}
    {kontroluju i jejich amplitudy a to tak, ze mezi nimi musi byt kousek vzdalenost}
    pocet2 := 0;
    pocet3 := 0;
    pocet4 := 0;
    pocet5 := 0;
    pocet6 := 0;
    pocet7 := 0;
    pocet8 := 0;
    for j := 1 to nflt do begin  {najdu nejvetsi - sekundarni - z vedlejsich maxim}
      hlpseclocamp := 0;
      for k := 1 to maxnumofmax do begin
        {tady davam podminku, aby se dalsi maximum od predchoziho lisilo aspon o 0.01 dB - kvuli zaokrouhlovani}
        {ten rozdil byl do srpna 2020 nastaven na 0.0005, tedy nula cela a tri nuly a petka, a davam to o rad min, tedy pridavam ctvrtou nulu}
        {tady si hraju s rozlisenim amplitud ruznych maxim}
        if ((lowerlocamp[j, k] > hlpseclocamp) and (seclocmx[j, k] <> max1locmx[j]) and (abs(lowerlocamp[j, k] - loc1amp[j]) > 0.00005) and (lowerlocamp[j, k] < loc1amp[j])) then begin
          {tedy pokud je nejake dalsi maximum vetsi nez pomocne ale nerovna se primarnimu a to ani v indexu = v case, ani v amplitude}
          if allbods then begin {pokud hledam vsechna typy maxim}
            hlpseclocamp := lowerlocamp[j, k];  {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pro dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
            max2locmx[j] := seclocmx[j, k];     {a do "maxseclocmx" ulozim index nejvyssiho vedlejsiho maxima, tedy druheho nejvyssiho ve filtru "j"}
            loc2amp[j] := lowerlocamp[j, k];    {a sem ulozim tu amplitudu sekundarniho maxima}
            locmx2oznaceni[j] := oznaceni[j, k];
          end; {if / pro vsechna typy maxim}
          if (allbods = False) then begin {pokud hledam jenom opravdicka maxima - zde je to jenom pozadavek}
            if oznaceni[j, k] = 'maximum' then begin {tedy dal to pustim jenom kdyz jsou to opravdicka maxima - a zde testuju, aby to tak opravdu bylo}
              hlpseclocamp := lowerlocamp[j, k];     {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pro dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
              max2locmx[j] := seclocmx[j, k];        {a do "maxseclocmx" ulozim index nejvyssiho vedlejsiho maxima, tedy druheho nejvyssiho ve filtru "j"}
              loc2amp[j] := lowerlocamp[j, k];       {a sem ulozim tu amplitudu sekundarniho maxima}
              locmx2oznaceni[j] := oznaceni[j, k];
            end; {if cyklu pro maxima, ktera jsou oznacena jako opravdicka maxima}
          end; {if cyklu jen pro opravdicka maxima}
        end;{if cykly, ktery vybira, jestli se tim lowerlocamp maximem budeme vubec zabyvat}
      end;{of for :k:}
      if (loc2amp[j] <> 0) then pocet2 := pocet2 + 1;
    end;{of for :j:}
    str(pocet2: 4, pocet2strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - ' + pocet2strg + ' secondary maxima of were found');
    for j := 1 to nflt do begin  {najdu terciarni maximum}
      hlpseclocamp := 0;
      for k := 1 to maxnumofmax do begin
        if ((lowerlocamp[j, k] > hlpseclocamp) and (seclocmx[j, k] <> max1locmx[j]) and
          (seclocmx[j, k] <> max2locmx[j]) and (abs(lowerlocamp[j, k] - loc2amp[j]) > 0.00005) and
          (lowerlocamp[j, k] < loc2amp[j])) then begin {tedy pokud je nejake dalsi maximum vetsi nez pomocne ale nerovna se ani primarnimu ani secondarnimu a je od nich vzdaleno 0.01 dB a je mensi nez to sekundarni}
          if allbods then begin {pokud hledam vsechna typy maxim}
            hlpseclocamp := lowerlocamp[j, k]; {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
            max3locmx[j] := seclocmx[j, k];    {a do "maxterlocmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy tretiho nejvyssiho ve filtru "j"}
            loc3amp[j] := lowerlocamp[j, k];   {a sem ulozim tu amplitudu terciarniho maxima}
            locmx3oznaceni[j] := oznaceni[j, k];
          end; {if / pro vsechna typy maxim}
          if (allbods = False) then begin {pokud hledam jenom opravdicka maxima - zde je to jenom pozadavek}
            if oznaceni[j, k] = 'maximum' then begin {tedy dal to pustim jenom kdyz jsou to opravdicka maxima - a zde testuju, aby to tak opravdu bylo}
              hlpseclocamp := lowerlocamp[j, k]; {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
              max3locmx[j] := seclocmx[j, k];    {a do "maxterlocmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy tretiho nejvyssiho ve filtru "j"}
              loc3amp[j] := lowerlocamp[j, k];   {a sem ulozim tu amplitudu terciarniho maxima}
              locmx3oznaceni[j] := oznaceni[j, k];
            end; {if cyklu pro maxima, ktera jsou oznacena jako opravdicka maxima}
          end; {if cyklu jen pro opravdicka maxima}
        end;{of if}
      end;{of for :k:}
      if (loc3amp[j] <> 0) then pocet3 := pocet3 + 1;
    end;{of for :j:}
    str(pocet3: 4, pocet3strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - ' + pocet3strg + ' tertiary maxima were found');
    for j := 1 to nflt do begin  {najdu quarterni maximum}
      jake[j] := 'primary';      {zatim pro vsechna maxima nastavim, ze jsou primarni a pak to budu menit}
      hlpseclocamp := 0;
      for k := 1 to maxnumofmax do begin
        if ((lowerlocamp[j, k] > hlpseclocamp) and (seclocmx[j, k] <> max1locmx[j]) and
          (seclocmx[j, k] <> max2locmx[j]) and (seclocmx[j, k] <> max3locmx[j]) and
          (abs(lowerlocamp[j, k] - loc3amp[j]) > 0.00005) and (lowerlocamp[j, k] < loc3amp[j])) then begin {tedy pokud je nejake dalsi maximum vetsi nez pomocne ale nerovna se ani primarnimu ani secondarnimu ani terciarnimu}
          if allbods then begin {pokud hledam vsechna typy maxim}
            hlpseclocamp := lowerlocamp[j, k];  {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
            max4locmx[j] := seclocmx[j, k];     {a do "maxquarlocmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy ctvrteho nejvyssiho ve filtru "j"}
            loc4amp[j] := lowerlocamp[j, k];    {a sem ulozim tu amplitudu quarterniho maxima}
            locmx4oznaceni[j] := oznaceni[j, k];
          end; {if / pro vsechna typy maxim}
          if (allbods = False) then begin {pokud hledam jenom opravdicka maxima - zde je to jenom pozadavek}
            if oznaceni[j, k] = 'maximum' then begin {tedy dal to pustim jenom kdyz jsou to opravdicka maxima - a zde testuju, aby to tak opravdu bylo}
              hlpseclocamp := lowerlocamp[j, k];
              {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
              max4locmx[j] := seclocmx[j, k];
              {a do "maxquarlocmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy ctvrteho nejvyssiho ve filtru "j"}
              loc4amp[j] := lowerlocamp[j, k];
              {a sem ulozim tu amplitudu quarterniho maxima}
              locmx4oznaceni[j] := oznaceni[j, k];
            end; {if cyklu pro maxima, ktera jsou oznacena jako opravdicka maxima}
          end; {if cyklu jen pro opravdicka maxima}
        end;{of if}
      end;{of for :k:}
      if (loc4amp[j] <> 0) then pocet4 := pocet4 + 1;
    end;{of for :j:}
    str(pocet4: 4, pocet4strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - ' + pocet4strg + ' quartery maxima were found');

    for j := 1 to nflt do begin  {najdu kvinterni maximum}
      hlpseclocamp := 0;
      for k := 1 to maxnumofmax do
      begin
        if ((lowerlocamp[j, k] > hlpseclocamp) and (seclocmx[j, k] <> max1locmx[j]) and
          (seclocmx[j, k] <> max2locmx[j]) and (seclocmx[j, k] <> max3locmx[j]) and
          (seclocmx[j, k] <> max4locmx[j]) and (abs(lowerlocamp[j, k] - loc4amp[j]) > 0.00005) and
          (lowerlocamp[j, k] < loc4amp[j])) then begin
          {tedy pokud je nejake dalsi maximum vetsi nez pomocne ale nerovna se ani primarnimu ani secondarnimu ani terciarnimu ani kvarternimu}
          if allbods then begin {pokud hledam vsechna typy maxim}
            hlpseclocamp := lowerlocamp[j, k];       {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
            max5locmx[j] := seclocmx[j, k];          {a do "max5locmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy pateho nejvyssiho ve filtru "j"}
            loc5amp[j] := lowerlocamp[j, k];         {a sem ulozim tu amplitudu 5. maxima}
            locmx5oznaceni[j] := oznaceni[j, k];
          end; {if / pro vsechna typy maxim}
          if (allbods = False) then begin            {pokud hledam jenom opravdicka maxima - zde je to jenom pozadavek}
            if oznaceni[j, k] = 'maximum' then begin {tedy dal to pustim jenom kdyz jsou to opravdicka maxima - a zde testuju, aby to tak opravdu bylo}
              hlpseclocamp := lowerlocamp[j, k];     {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
              max5locmx[j] := seclocmx[j, k];        {a do "max5locmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy pateho nejvyssiho ve filtru "j"}
              loc5amp[j] := lowerlocamp[j, k];       {a sem ulozim tu amplitudu 5. maxima}
              locmx5oznaceni[j] := oznaceni[j, k];
            end; {if cyklu pro maxima, ktera jsou oznacena jako opravdicka maxima}
          end; {if cyklu jen pro opravdicka maxima}
        end;{of if}
      end;{of for :k:}
      if (loc5amp[j] <> 0) then pocet5 := pocet5 + 1;
    end;{of for :j:}
    str(pocet5: 4, pocet5strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - ' + pocet5strg + ' quintery maxima were found');
    for j := 1 to nflt do begin  {najdu 6. maximum}
      hlpseclocamp := 0;
      for k := 1 to maxnumofmax do begin
        if ((lowerlocamp[j, k] > hlpseclocamp) and (seclocmx[j, k] <> max1locmx[j]) and
          (seclocmx[j, k] <> max2locmx[j]) and (seclocmx[j, k] <> max3locmx[j]) and
          (seclocmx[j, k] <> max4locmx[j]) and (seclocmx[j, k] <> max5locmx[j]) and
          (abs(lowerlocamp[j, k] - loc5amp[j]) > 0.00005) and (lowerlocamp[j, k] < loc5amp[j])) then begin {tedy pokud je nejake dalsi maximum vetsi nez pomocne ale nerovna se ani primarnimu ani secondarnimu ani terciarnimu ani kvarternimu ani quinternimu}
          if allbods then begin {pokud hledam vsechna typy maxim}
            hlpseclocamp := lowerlocamp[j, k]; {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
            max6locmx[j] := seclocmx[j, k];    {a do "max6locmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy sesteho nejvyssiho ve filtru "j"}
            loc6amp[j] := lowerlocamp[j, k];   {a sem ulozim tu amplitudu 6. maxima}
            locmx6oznaceni[j] := oznaceni[j, k];
          end; {if / pro vsechna typy maxim}
          if (allbods = False) then begin {pokud hledam jenom opravdicka maxima - zde je to jenom pozadavek}
            if oznaceni[j, k] = 'maximum' then begin {tedy dal to pustim jenom kdyz jsou to opravdicka maxima - a zde testuju, aby to tak opravdu bylo}
              hlpseclocamp := lowerlocamp[j, k]; {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
              max6locmx[j] := seclocmx[j, k];    {a do "max6locmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy sesteho nejvyssiho ve filtru "j"}
              loc6amp[j] := lowerlocamp[j, k];   {a sem ulozim tu amplitudu 6. maxima}
              locmx6oznaceni[j] := oznaceni[j, k];
            end; {if cyklu pro maxima, ktera jsou oznacena jako opravdicka maxima}
          end; {if cyklu jen pro opravdicka maxima}
        end;{of if}
      end;{of for :k:}
      if (loc6amp[j] <> 0) then pocet6 := pocet6 + 1;
    end;{of for :j:}
    str(pocet6: 4, pocet6strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - ' + pocet6strg + ' 6th maxima were found');
    for j := 1 to nflt do begin  {najdu 7. maximum}
      hlpseclocamp := 0;
      for k := 1 to maxnumofmax do begin
        if ((lowerlocamp[j, k] > hlpseclocamp) and (seclocmx[j, k] <> max1locmx[j]) and
          (seclocmx[j, k] <> max2locmx[j]) and (seclocmx[j, k] <> max3locmx[j]) and
          (seclocmx[j, k] <> max4locmx[j]) and (seclocmx[j, k] <> max5locmx[j]) and
          (seclocmx[j, k] <> max6locmx[j]) and (abs(lowerlocamp[j, k] - loc6amp[j]) > 0.00005) and
          (lowerlocamp[j, k] < loc6amp[j])) then begin {tedy pokud je nejake dalsi maximum vetsi nez pomocne ale nerovna se ani primarnimu ani secondarnimu ani terciarnimu ani kvarternimu ani quinternimu ani sexternimu}
          if allbods then begin {pokud hledam vsechna typy maxim}
            hlpseclocamp := lowerlocamp[j, k];
            {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
            max7locmx[j] := seclocmx[j, k];
            {a do "max7locmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy sedmeho nejvyssiho ve filtru "j"}
            loc7amp[j] := lowerlocamp[j, k]; {a sem ulozim tu amplitudu 7. maxima}
            locmx7oznaceni[j] := oznaceni[j, k];
          end; {if / pro vsechna typy maxim}
          if (allbods = False) then begin {pokud hledam jenom opravdicka maxima - zde je to jenom pozadavek}
            if oznaceni[j, k] = 'maximum' then begin {tedy dal to pustim jenom kdyz jsou to opravdicka maxima - a zde testuju, aby to tak opravdu bylo}
              hlpseclocamp := lowerlocamp[j, k];     {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
              max7locmx[j] := seclocmx[j, k];        {a do "max7locmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy sedmeho nejvyssiho ve filtru "j"}
              loc7amp[j] := lowerlocamp[j, k];       {a sem ulozim tu amplitudu 7. maxima}
              locmx7oznaceni[j] := oznaceni[j, k];
            end; {if cyklu pro maxima, ktera jsou oznacena jako opravdicka maxima}
          end; {if cyklu jen pro opravdicka maxima}
        end;{of if}
      end;{of for :k:}
      if (loc7amp[j] <> 0) then pocet7 := pocet7 + 1;
    end;{of for :j:}
    str(pocet7: 4, pocet7strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - ' + pocet7strg + ' 7th maxima were found');
    for j := 1 to nflt do begin  {najdu 8. maximum}
      hlpseclocamp := 0;
      for k := 1 to maxnumofmax do begin
        if ((lowerlocamp[j, k] > hlpseclocamp) and (seclocmx[j, k] <> max1locmx[j]) and
          (seclocmx[j, k] <> max2locmx[j]) and (seclocmx[j, k] <> max3locmx[j]) and
          (seclocmx[j, k] <> max4locmx[j]) and (seclocmx[j, k] <> max5locmx[j]) and
          (seclocmx[j, k] <> max6locmx[j]) and (seclocmx[j, k] <> max7locmx[j]) and
          (abs(lowerlocamp[j, k] - loc7amp[j]) > 0.00005) and (lowerlocamp[j, k] < loc7amp[j])) then begin
          {tedy pokud je nejake dalsi maximum vetsi nez pomocne ale nerovna se ani primarnimu ani secondarnimu ani terciarnimu ani kvarternimu ani quinternimu ani sexternimu ani septernimu}
          if allbods then begin {pokud hledam vsechna typy maxim}
            hlpseclocamp := lowerlocamp[j, k]; {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
            max8locmx[j] := seclocmx[j, k];    {a do "max8locmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy osmeho nejvyssiho ve filtru "j"}
            loc8amp[j] := lowerlocamp[j, k];   {a sem ulozim tu amplitudu 8. maxima}
            locmx8oznaceni[j] := oznaceni[j, k];
          end; {if / pro vsechna typy maxim}
          if (allbods = False) then begin {pokud hledam jenom opravdicka maxima - zde je to jenom pozadavek}
            if oznaceni[j, k] = 'maximum' then begin {tedy dal to pustim jenom kdyz jsou to opravdicka maxima - a zde testuju, aby to tak opravdu bylo}
              hlpseclocamp := lowerlocamp[j, k]; {tak do pomocneho nactu toto dalsi, abych v pristi iteraci pdo dalsi "k" uz mel pojisteno, ze do "maxseclocmx" ulozim nejake jine maximum toho filtru, jen kdyz bude jeste vetsi}
              max8locmx[j] := seclocmx[j, k];    {a do "max8locmx" ulozim index nejvyssiho dalsiho vedlejsiho maxima, tedy osmeho nejvyssiho ve filtru "j"}
              loc8amp[j] := lowerlocamp[j, k];  {a sem ulozim tu amplitudu 8. maxima}
              locmx8oznaceni[j] := oznaceni[j, k];
            end; {if cyklu pro maxima, ktera jsou oznacena jako opravdicka maxima}
          end; {if cyklu jen pro opravdicka maxima}
        end;{of if}
      end;{of for :k:}
      if (loc8amp[j] <> 0) then pocet8 := pocet8 + 1;
    end;{of for :j:}
    str(pocet8: 4, pocet8strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - ' + pocet8strg + ' 8th maxima were found');
    {nyni vybereme, jestli se pouziji primarni ci sekundarni ci terciarni ci quarterni ci kvinterni ci 6. ci 7. ci 8. maxima}

    if reference then begin
      skladej := 4; {pokud pouzivam referencni krivku, tak budu skladat podle ni, a nebude to skladej tedy ani jedna moznost ze tri klikacich v hlavnim okne}
    end;
    if fixedcut then begin
      skladej := 5; {pokud pouzivam FIXNI orezani podle referencni krivky, tak budu skladat podle ni}
    end;

    if skladej = 2 then begin {skladani podle nejdelsiho filtru}
      for j := nflt downto 2 do begin {od nejvyssiho filtru (absolutniho maxima) projedu filtry dolu}
        if max8locmx[j - 1] <> 0 then begin {pro nenulove 8. maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max8locmx[j - 1] - locmx[j])) then begin {pokud je 8. maximum bliz nez primarni}
            locmx[j - 1] := max8locmx[j - 1]; {vezmu 8.}
            locmxoznaceni[j - 1] := locmx8oznaceni[j - 1];
            jake[j - 1] := 'eighth';
          end; {if}
        end;
        if max7locmx[j - 1] <> 0 then begin {pro nenulove 7. maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max7locmx[j - 1] - locmx[j])) then begin {pokud je 7. maximum bliz nez primarni}
            locmx[j - 1] := max7locmx[j - 1]; {vezmu 7.}
            locmxoznaceni[j - 1] := locmx7oznaceni[j - 1];
            jake[j - 1] := 'seventh';
          end; {if}
        end;
        if max6locmx[j - 1] <> 0 then begin {pro nenulove 6. maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max6locmx[j - 1] - locmx[j])) then begin {pokud je 6. maximum bliz nez primarni}
            locmx[j - 1] := max6locmx[j - 1]; {vezmu 6.}
            locmxoznaceni[j - 1] := locmx6oznaceni[j - 1];
            jake[j - 1] := 'sixth';
          end; {if}
        end;
        if max5locmx[j - 1] <> 0 then begin {pro nenulove kvinterni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max5locmx[j - 1] - locmx[j])) then begin {pokud je kvinterni maximum bliz nez primarni}
            locmx[j - 1] := max5locmx[j - 1]; {vezmu kvinterni}
            locmxoznaceni[j - 1] := locmx5oznaceni[j - 1];
            jake[j - 1] := 'quinternary';
          end; {if}
        end;
        if max4locmx[j - 1] <> 0 then begin {pro nenulove quarterni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max4locmx[j - 1] - locmx[j])) then begin {pokud je quarterni maximum bliz nez primarni}
            locmx[j - 1] := max4locmx[j - 1]; {vezmu quarterni}
            locmxoznaceni[j - 1] := locmx4oznaceni[j - 1];
            jake[j - 1] := 'quarternary';
          end; {if}
        end;
        if max3locmx[j - 1] <> 0 then begin {pro nenulove tercierni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max3locmx[j - 1] - locmx[j])) then begin {ale pokud je terciarni maximum bliz nez bylo to quarterni}
            locmx[j - 1] := max3locmx[j - 1]; {vezmu terciarni}
            locmxoznaceni[j - 1] := locmx3oznaceni[j - 1];
            jake[j - 1] := 'tertiary';
          end; {if}
        end;
        if max2locmx[j - 1] <> 0 then begin {pro nenulove sekundarni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max2locmx[j - 1] - locmx[j])) then begin {ale pokud je secondarni jeste bliz nez terciarni}
            locmx[j - 1] := max2locmx[j - 1]; {vezmu secondarni}
            locmxoznaceni[j - 1] := locmx2oznaceni[j - 1];
            jake[j - 1] := 'secondary';
          end; {if} {a pokud nebylo bliz ani terciarni ani secondarni, necha se tam primarni}
        end;
      end;{of for :j:}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - selection between primary, secondary, tertiary, quarternary, quinternary, sixth, seventh and eighth maxima ...');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |    ... was performed according to the longest filter maximum');
    end; {of if skladej = 2}

    if skladej = 1 then begin {skladani podle absolutni amplitudy}
      for j := maxindex to nflt - 1 do begin {od absolutniho maxima projedu filtry nahoru}
        if max8locmx[j + 1] <> 0 then begin {pro nenulove osme maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max8locmx[j + 1] - locmx[j])) then begin {pokud je osme maximum bliz nez primarni}
            locmx[j + 1] := max8locmx[j + 1]; {vezmu osme}
            locmxoznaceni[j + 1] := locmx8oznaceni[j + 1];
            jake[j + 1] := 'eighth';
          end; {if}
        end;
        if max7locmx[j + 1] <> 0 then begin {pro nenulove sedme maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max7locmx[j + 1] - locmx[j])) then begin {pokud je sedme maximum bliz nez primarni}
            locmx[j + 1] := max7locmx[j + 1]; {vezmu sedme}
            locmxoznaceni[j + 1] := locmx7oznaceni[j + 1];
            jake[j + 1] := 'seventh';
          end; {if}
        end;
        if max6locmx[j + 1] <> 0 then begin {pro nenulove seste maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max6locmx[j + 1] - locmx[j])) then begin {pokud je seste maximum bliz nez primarni}
            locmx[j + 1] := max6locmx[j + 1]; {vezmu seste}
            locmxoznaceni[j + 1] := locmx6oznaceni[j + 1];
            jake[j + 1] := 'sixth';
          end; {if}
        end;
        if max5locmx[j + 1] <> 0 then begin {pro nenulove kvinterni maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max5locmx[j + 1] - locmx[j])) then begin {pokud je kvinterni maximum bliz nez primarni}
            locmx[j + 1] := max5locmx[j + 1]; {vezmu kvinterni}
            locmxoznaceni[j + 1] := locmx5oznaceni[j + 1];
            jake[j + 1] := 'quinternary';
          end; {if}
        end;
        if max4locmx[j + 1] <> 0 then begin {pro nenulove quarterni maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max4locmx[j + 1] - locmx[j])) then begin {pokud je quarterni maximum bliz nez primarni}
            locmx[j + 1] := max4locmx[j + 1]; {vezmu quarterni}
            locmxoznaceni[j + 1] := locmx4oznaceni[j + 1];
            jake[j + 1] := 'quarternary';
          end; {if}
        end; {if}
        if max3locmx[j + 1] <> 0 then begin {pro nenulove tercierni maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max3locmx[j + 1] - locmx[j])) then begin {ale pokud je terciarni maximum bliz nez bylo to quarterni}
            locmx[j + 1] := max3locmx[j + 1]; {vezmu terciarni}
            locmxoznaceni[j + 1] := locmx3oznaceni[j + 1];
            jake[j + 1] := 'tertiary';
          end; {if}
        end; {if}
        if max2locmx[j + 1] <> 0 then begin {pro nenulove sekundarni maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max2locmx[j + 1] - locmx[j])) then begin {ale pokud je secondarni jeste bliz nez terciarni}
            locmx[j + 1] := max2locmx[j + 1]; {vezmu secondarni}
            locmxoznaceni[j + 1] := locmx2oznaceni[j + 1];
            jake[j + 1] := 'secondary';
          end; {if} {a pokud nebylo bliz ani terciarni ani secondarni, necha se tam primarni}
        end; {if}
      end;{of for :j:}
      for j := maxindex downto 2 do begin {od absolutniho maxima projedu filtry dolu}
        if max8locmx[j - 1] <> 0 then begin {pro nenulove osme maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max8locmx[j - 1] - locmx[j])) then begin {pokud je osme maximum bliz nez primarni}
            locmx[j - 1] := max8locmx[j - 1]; {vezmu osme}
            locmxoznaceni[j - 1] := locmx8oznaceni[j - 1];
            jake[j - 1] := 'eighth';
          end; {if}
        end;
        if max7locmx[j - 1] <> 0 then begin {pro nenulove sedme maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max7locmx[j - 1] - locmx[j])) then begin {pokud je sedme maximum bliz nez primarni}
            locmx[j - 1] := max7locmx[j - 1]; {vezmu sedme}
            locmxoznaceni[j - 1] := locmx7oznaceni[j - 1];
            jake[j - 1] := 'seventh';
          end; {if}
        end;
        if max6locmx[j - 1] <> 0 then begin {pro nenulove seste maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max6locmx[j - 1] - locmx[j])) then begin {pokud je seste maximum bliz nez primarni}
            locmx[j - 1] := max6locmx[j - 1]; {vezmu seste}
            locmxoznaceni[j - 1] := locmx6oznaceni[j - 1];
            jake[j - 1] := 'sixth';
          end; {if}
        end;
        if max5locmx[j - 1] <> 0 then begin {pro nenulove kvinterni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max5locmx[j - 1] - locmx[j])) then begin {pokud je kvinterni maximum bliz nez primarni}
            locmx[j - 1] := max5locmx[j - 1]; {vezmu kvinterni}
            locmxoznaceni[j - 1] := locmx5oznaceni[j - 1];
            jake[j - 1] := 'quinternary';
          end; {if}
        end;
        if max4locmx[j - 1] <> 0 then begin {pro nenulove quarterni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max4locmx[j - 1] - locmx[j])) then begin {pokud je quarterni maximum bliz nez primarni}
            locmx[j - 1] := max4locmx[j - 1]; {vezmu quarterni}
            locmxoznaceni[j - 1] := locmx4oznaceni[j - 1];
            jake[j - 1] := 'quarternary';
          end; {if}
        end; {if}
        if max3locmx[j - 1] <> 0 then begin {pro nenulove tercierni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max3locmx[j - 1] - locmx[j])) then begin {ale pokud je terciarni maximum bliz nez bylo to quarterni}
            locmx[j - 1] := max3locmx[j - 1]; {vezmu terciarni}
            locmxoznaceni[j - 1] := locmx3oznaceni[j - 1];
            jake[j - 1] := 'tertiary';
          end; {if}
        end; {if}
        if max2locmx[j - 1] <> 0 then begin {pro nenulove sekundarni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max2locmx[j - 1] - locmx[j])) then begin {ale pokud je secondarni jeste bliz nez terciarni}
            locmx[j - 1] := max2locmx[j - 1]; {vezmu secondarni}
            locmxoznaceni[j - 1] := locmx2oznaceni[j - 1];
            jake[j - 1] := 'secondary';
          end; {if} {a pokud nebylo bliz ani terciarni ani secondarni, necha se tam primarni}
        end; {if}
      end;{of for :j:}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - selection between primary, secondary, tertiary, quarternary, quinternary, sixth, seventh and eighth maxima ...');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |    ... was performed according to absolute amplitude maximum');
    end; {of if skladej = 1 - podle absolutni amplitudy}

    if skladej = 3 then begin {skladani podle otpimalne zvoleneho filtru}
      val(NoSVALform.Edit27.Text, optperiod, cd);     {prectu zvolenou periodu pro zacatek kompilace}
      rozdilselected := 10000;                        {nastavim rozdil na nejake nesmyslne velke cislo}
      for j := 1 to nflt do begin                     { pro vsechny filtry}
        if abs(optperiod - period[j]) < rozdilselected then begin {pokud je rozdil od zvolene k aktualni mensi nez byl predchozi nejmensi rozdil}
          rozdilselected := abs(optperiod - period[j]);           {nacpu ten mensi rozdil pro zapamatovani}
          selectedindex := j;                                     {a zapamatuju si index filtru, pro ktery to nastalo}
        end;
      end; {for j - tady mam tedy index pro filtr nejblize zvolene periode}
      for j := selectedindex to nflt - 1 do begin {od zvoleneho filtru projedu filtry nahoru}
        if max8locmx[j + 1] <> 0 then begin {pro nenulove osme maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max8locmx[j + 1] - locmx[j])) then begin {pokud je osme maximum bliz nez primarni}
            locmx[j + 1] := max8locmx[j + 1]; {vezmu osme}
            locmxoznaceni[j + 1] := locmx8oznaceni[j + 1];
            jake[j + 1] := 'eighth';
          end; {if}
        end;
        if max7locmx[j + 1] <> 0 then begin {pro nenulove sedme maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max7locmx[j + 1] - locmx[j])) then begin {pokud je sedme maximum bliz nez primarni}
            locmx[j + 1] := max7locmx[j + 1]; {vezmu sedme}
            locmxoznaceni[j + 1] := locmx7oznaceni[j + 1];
            jake[j + 1] := 'seventh';
          end; {if}
        end;
        if max6locmx[j + 1] <> 0 then begin {pro nenulove seste maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max6locmx[j + 1] - locmx[j])) then begin {pokud je seste maximum bliz nez primarni}
            locmx[j + 1] := max6locmx[j + 1]; {vezmu seste}
            locmxoznaceni[j + 1] := locmx6oznaceni[j + 1];
            jake[j + 1] := 'sixth';
          end; {if}
        end;
        if max5locmx[j + 1] <> 0 then begin {pro nenulove kvinterni maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max5locmx[j + 1] - locmx[j])) then begin {pokud je kvinterni maximum bliz nez primarni}
            locmx[j + 1] := max5locmx[j + 1]; {vezmu kvinterni}
            locmxoznaceni[j + 1] := locmx5oznaceni[j + 1];
            jake[j + 1] := 'quinternary';
          end; {if}
        end;
        if max4locmx[j + 1] <> 0 then begin {pro nenulove quarterni maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max4locmx[j + 1] - locmx[j])) then begin {pokud je quarterni maximum bliz nez primarni}
            locmx[j + 1] := max4locmx[j + 1]; {vezmu quarterni}
            locmxoznaceni[j + 1] := locmx4oznaceni[j + 1];
            jake[j + 1] := 'quarternary';
          end; {if}
        end; {if}
        if max3locmx[j + 1] <> 0 then begin {pro nenulove tercierni maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max3locmx[j + 1] - locmx[j])) then begin {ale pokud je terciarni maximum bliz nez bylo to quarterni}
            locmx[j + 1] := max3locmx[j + 1]; {vezmu terciarni}
            locmxoznaceni[j + 1] := locmx3oznaceni[j + 1];
            jake[j + 1] := 'tertiary';
          end; {if}
        end; {if}
        if max2locmx[j + 1] <> 0 then begin {pro nenulove sekundarni maximum}
          if (abs(locmx[j + 1] - locmx[j]) > abs(max2locmx[j + 1] - locmx[j])) then begin {ale pokud je secondarni jeste bliz nez terciarni}
            locmx[j + 1] := max2locmx[j + 1]; {vezmu secondarni}
            locmxoznaceni[j + 1] := locmx2oznaceni[j + 1];
            jake[j + 1] := 'secondary';
          end; {if} {a pokud nebylo bliz ani terciarni ani secondarni, necha se tam primarni}
        end; {if}
      end;{of for :j:}
      for j := selectedindex downto 2 do begin {od zvoleneho filtru projedu filtry dolu}
        if max8locmx[j - 1] <> 0 then begin {pro nenulove osme maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max8locmx[j - 1] - locmx[j])) then begin {pokud je osme maximum bliz nez primarni}
            locmx[j - 1] := max8locmx[j - 1]; {vezmu osme}
            locmxoznaceni[j - 1] := locmx8oznaceni[j - 1];
            jake[j - 1] := 'eighth';
          end; {if}
        end;
        if max7locmx[j - 1] <> 0 then begin {pro nenulove sedme maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max7locmx[j - 1] - locmx[j])) then begin {pokud je sedme maximum bliz nez primarni}
            locmx[j - 1] := max7locmx[j - 1]; {vezmu sedme}
            locmxoznaceni[j - 1] := locmx7oznaceni[j - 1];
            jake[j - 1] := 'seventh';
          end; {if}
        end;
        if max6locmx[j - 1] <> 0 then begin {pro nenulove seste maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max6locmx[j - 1] - locmx[j])) then begin {pokud je seste maximum bliz nez primarni}
            locmx[j - 1] := max6locmx[j - 1]; {vezmu seste}
            locmxoznaceni[j - 1] := locmx6oznaceni[j - 1];
            jake[j - 1] := 'sixth';
          end; {if}
        end;
        if max5locmx[j - 1] <> 0 then begin {pro nenulove kvinterni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max5locmx[j - 1] - locmx[j])) then begin {pokud je kvinterni maximum bliz nez primarni}
            locmx[j - 1] := max5locmx[j - 1]; {vezmu kvinterni}
            locmxoznaceni[j - 1] := locmx5oznaceni[j - 1];
            jake[j - 1] := 'quinternary';
          end; {if}
        end;
        if max4locmx[j - 1] <> 0 then begin {pro nenulove quarterni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max4locmx[j - 1] - locmx[j])) then begin {pokud je quarterni maximum bliz nez primarni}
            locmx[j - 1] := max4locmx[j - 1]; {vezmu quarterni}
            locmxoznaceni[j - 1] := locmx4oznaceni[j - 1];
            jake[j - 1] := 'quarternary';
          end; {if}
        end; {if}
        if max3locmx[j - 1] <> 0 then begin {pro nenulove tercierni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max3locmx[j - 1] - locmx[j])) then begin {ale pokud je terciarni maximum bliz nez bylo to quarterni}
            locmx[j - 1] := max3locmx[j - 1]; {vezmu terciarni}
            locmxoznaceni[j - 1] := locmx3oznaceni[j - 1];
            jake[j - 1] := 'tertiary';
          end; {if}
        end; {if}
        if max2locmx[j - 1] <> 0 then begin {pro nenulove sekundarni maximum}
          if (abs(locmx[j - 1] - locmx[j]) > abs(max2locmx[j - 1] - locmx[j])) then begin {ale pokud je secondarni jeste bliz nez terciarni}
            locmx[j - 1] := max2locmx[j - 1]; {vezmu secondarni}
            locmxoznaceni[j - 1] := locmx2oznaceni[j - 1];
            jake[j - 1] := 'secondary';
          end; {if} {a pokud nebylo bliz ani terciarni ani secondarni, necha se tam primarni}
        end; {if}
      end;{of for :j:}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - selection between primary, secondary, tertiary, quarternary, quinternary, sixth, seventh and eighth maxima ...');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |    ... was performed according to selected period');
    end; {if skladej = 3 - optimalne zvolena perioda}

    if skladej = 4 then begin                {skladani podle referencni disperze}
      rozdilselected := 10000;               {nastavim rozdil na nejake nesmyslne velke cislo}

      // refgrpvel[j] - tohle nactu ze souboru
      // grvel[i] := distkm / (((i + nstart - 1) * timein) + timedist); - tohle je definice rychlosti zkopirovana odjinud z tohoto souboru

      for j := 1 to nflt do begin {pro vsechny filtry}
        refi[j] := round((((distkm/refgrpvel[j]) - timedist) / timein) + 1 - nstart); {zde si vyjadrim ten index casoveho vzorku pomoci te nactene rychlosti}
      end; {a tim refi[j] nahradim locmx[j] v nasledujicich cyklech, ktere jsou jinak stejne jako pro skladej = 3}

      for j := 1 to nflt do begin {pro vsechny filtry}
        if max8locmx[j] <> 0 then begin {pro nenulove osme maximum}
          if (abs(locmx[j] - refi[j]) > abs(max8locmx[j] - refi[j])) then begin {pokud je osme maximum bliz k referencni nez primarni}
            locmx[j] := max8locmx[j]; {vezmu osme}
            locmxoznaceni[j] := locmx8oznaceni[j];
            jake[j] := 'eighth';
          end; {if}
        end;
        if max7locmx[j] <> 0 then begin {pro nenulove sedme maximum}
          if (abs(locmx[j] - refi[j]) > abs(max7locmx[j] - refi[j])) then begin {pokud je sedme maximum bliz nez primarni, ve kterem uz muze byt to osme}
            locmx[j] := max7locmx[j]; {vezmu sedme}
            locmxoznaceni[j] := locmx7oznaceni[j];
            jake[j] := 'seventh';
          end; {if}
        end;
        if max6locmx[j] <> 0 then begin {pro nenulove seste maximum}
          if (abs(locmx[j] - refi[j]) > abs(max6locmx[j] - refi[j])) then begin {pokud je seste maximum bliz nez primarni}
            locmx[j] := max6locmx[j]; {vezmu seste}
            locmxoznaceni[j] := locmx6oznaceni[j];
            jake[j] := 'sixth';
          end; {if}
        end;
        if max5locmx[j] <> 0 then begin {pro nenulove kvinterni maximum}
          if (abs(locmx[j] - refi[j]) > abs(max5locmx[j] - refi[j])) then begin {pokud je kvinterni maximum bliz nez primarni}
            locmx[j] := max5locmx[j]; {vezmu kvinterni}
            locmxoznaceni[j] := locmx5oznaceni[j];
            jake[j] := 'quinternary';
          end; {if}
        end;
        if max4locmx[j] <> 0 then begin {pro nenulove quarterni maximum}
          if (abs(locmx[j] - refi[j]) > abs(max4locmx[j] - refi[j])) then begin {pokud je quarterni maximum bliz nez primarni}
            locmx[j] := max4locmx[j]; {vezmu quarterni}
            locmxoznaceni[j] := locmx4oznaceni[j];
            jake[j] := 'quarternary';
          end; {if}
        end; {if}
        if max3locmx[j] <> 0 then begin {pro nenulove tercierni maximum}
          if (abs(locmx[j] - refi[j]) > abs(max3locmx[j] - refi[j])) then begin {ale pokud je terciarni maximum bliz nez bylo to quarterni}
            locmx[j] := max3locmx[j]; {vezmu terciarni}
            locmxoznaceni[j] := locmx3oznaceni[j];
            jake[j] := 'tertiary';
          end; {if}
        end; {if}
        if max2locmx[j] <> 0 then begin {pro nenulove sekundarni maximum}
          if (abs(locmx[j] - refi[j]) > abs(max2locmx[j] - refi[j])) then begin {ale pokud je secondarni jeste bliz nez terciarni}
            locmx[j] := max2locmx[j]; {vezmu secondarni}
            locmxoznaceni[j] := locmx2oznaceni[j];
            jake[j] := 'secondary';
          end; {if} {a pokud nebylo bliz ani terciarni ani secondarni, necha se tam primarni}
        end; {if}
      end;{of for :j:}

      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - selection between primary, secondary, tertiary, quarternary, quinternary, sixth, seventh and eighth maxima ...');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |    ... was performed according to selected period');
    end; {if skladej = 4 - referencni disperze}


    {tady se natvrdo nahradi ty indexy pro dany zaznam tema z referencni disperze, takze se nehleda vubec nic a rovnou se to natvrdo vyreze vsechno stejne}
    if skladej = 5 then begin
      for j := 1 to nflt do begin {pro vsechny filtry}
        //refi[j] := round((((distkm/refgrpvel[j]) - timedist) / timein) + 1 - nstart); {zde si vyjadrim ten index casoveho vzorku pomoci te nactene rychlosti}
        //refi[j] := istart[j]; {vezmu idex z PREMu, ktery je na 100 procentech, tedy presne prem, zadne odchylky}
        locmx[j] := refi[j];
        locmxoznaceni[j] := 'maximum';
        jake[j] := 'fixed';
      end; {for j}
    end; {if skladej = 5}

    nahrada := True; {nastavim to, jako ze je to dycky true, aby to pokracovalo dalsi sekci}
  end; {konec :: if nahrada = false ::}
  if nahrada then begin {pokud mam nejake nahrazene body, provedu analyzu jenom odsud}
    if nahrada2 then begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - analysis for hand-made dispersion started');
    end; {nahrada2}
    {najdou se indexy, ktere vymezuji orezani spektrogramu}
    if nasilne = False then begin {zde je zacatek vyhybky, kdy se vypisuje, ze se indexy nasly podle inflexnich bodu obalky}
      for j := 1 to nflt do begin {cyklus bude probihat postupne pres vsechny filtry}
        {a pro kazdy filtr projde vsechny vzorky a najde meze, ktere me zajimaji}
        uppersampl[j] := nsampl;
        lowersampl[j] := 0;
        upperzerosampl[j] := nsampl;
        lowerzerosampl[j] := 0;
        for i := 2 to nsampl - 1 do begin {napoctu derivaci obalky signalu / ma blbej rozmer, nedelim to casem, ale to je fuk}
          derivace[j, i] := amp[j, i + 1] - amp[j, i - 1];
        end;
        minderivace := 0;
        maxderivace := 0;
        {hledam maximum derivace nahoru of maxima obalky / ale protoze jsem v klesajici casti obalky, hledam vlastne jeji minimum}
        if ((locmxoznaceni[j] = 'maximum') or (locmxoznaceni[j] = 'decreasing inflection')) then begin
          for i := locmx[j] + 1 to nsampl do begin {zacne se od maxima filtru nahoru}
            if derivace[j, i] > 0 then break; {jakmile derivace preleze nulu nahoru, vyskoci to z cyklu}
            if (derivace[j, i] < minderivace) then begin
              minderivace := derivace[j, i];        {ulozim si hodnotu derivace, ktera byla zatim nejmensi}
              uppersampl[j] := i;                   {sem si schovame index "i", ktery dane mezni hodnote prislusi}
            end;
          end;
        end;        {hledal jsem tedy od maxima obalky v jeji klesajici casti tedy v zapornych derivacich do nulove derivace, tedy do minima obalky}
        if (locmxoznaceni[j] = 'increasing inflection') then begin {pro rostouci inflexe to projedu jeste nahoru}
          uppersampl[j] := locmx[j] + 2; {nastavim umele mez pro zapoceti orezavani}
        end;
        if (uppersampl[j] = locmx[j]) then uppersampl[j] := uppersampl[j] + 5; {kdyz to padne zaroven do maxima}
        if (uppersampl[j] >= nsampl) then uppersampl[j] := nsampl - 1;{kontrola, aby to nebyl ten posledni}
        if (amp[j, uppersampl[j]] - amp[j, uppersampl[j] + 1] <= 0) then uppersampl[j] := uppersampl[j] - 1; {kontrola, aby se to zase hned nezvedalo}
        if ((locmxoznaceni[j] = 'maximum') or (locmxoznaceni[j] = 'increasing inflection')) then begin
          for i := locmx[j] - 1 downto 1 do begin
            if derivace[j, i] < 0 then break; {jakmile derivace preleze nulu dolu, vyskoci to z cyklu}
            if (derivace[j, i] > maxderivace) then begin
              maxderivace := derivace[j, i];  {ulozim si hodnotu derivace, ktera byla zatim nejvetsi}
              lowersampl[j] := i;             {sem si schovame index "i", ktery dane mezni hodnote prislusi}
            end;
          end;
        end;        {hledal jsem od maxima obalky v jeji rostouci casti tedy v kladnych derivacich do nulove derivace, tedy do minima obalky}
        if (locmxoznaceni[j] = 'decreasing inflection') then begin {pro klesajici inflexe to projedu jeste dolu}
          lowersampl[j] := locmx[j] - 2; {nastavim umele mez pro zapoceti orezavani}
        end;        {tedy ted mam obe meze lowersampl a uppersampl pro vsechny tri pripady maxima a obou inflexi}
        if (lowersampl[j] = locmx[j]) then lowersampl[j] := lowersampl[j] - 5; {kdyz to padne do maxima}
        if (lowersampl[j] <= 1) then lowersampl[j] := 2; {kontrola, aby to nebyl ten prvni}
        if (amp[j, lowersampl[j]] - amp[j, lowersampl[j] - 1] <= 0) then lowersampl[j] := lowersampl[j] + 1;{kontrola, aby se to zase hned nezvedalo}
        {meze, kdy uz to bude nula, stanovime o ....... dale}
        uppdiff[j] := amp[j, (uppersampl[j] - 1)] - amp[j, uppersampl[j]];
        lowdiff[j] := amp[j, (lowersampl[j] + 1)] - amp[j, lowersampl[j]];
        if ((locmxoznaceni[j] = 'maximum') or (locmxoznaceni[j] = 'decreasing inflection')) then begin
          upperzerosampl[j] := uppersampl[j] + trunc((amp[j, uppersampl[j]] / uppdiff[j]));
        end;
        if ((locmxoznaceni[j] = 'maximum') or (locmxoznaceni[j] = 'increasing inflection')) then
        begin
          lowerzerosampl[j] := lowersampl[j] - trunc((amp[j, lowersampl[j]] / lowdiff[j]));
        end;
        if (locmxoznaceni[j] = 'increasing inflection') then begin {pro rostouci inflexe to projedu jeste nahoru}
          upperzerosampl[j] := 2 * locmx[j] - lowerzerosampl[j];
        end;
        if (locmxoznaceni[j] = 'decreasing inflection') then begin {pro klesajici inflexe to projedu jeste dolu}
          lowerzerosampl[j] := 2 * locmx[j] - upperzerosampl[j];
        end;
        if ((lowersampl[j] - lowerzerosampl[j]) > (3 * period[j] / timein)) then lowerzerosampl[j] := lowersampl[j] - trunc(3 * period[j] / timein);
        if ((upperzerosampl[j] - uppersampl[j]) > (3 * period[j] / timein)) then upperzerosampl[j] := uppersampl[j] + trunc(3 * period[j] / timein);
        {tady se opravuji ruzne zadrhele, ktere mohou nastat na koncich}
        if (upperzerosampl[j] >= nsampl + 1) then upperzerosampl[j] := nsampl;
        if (upperzerosampl[j] < uppersampl[j]) then upperzerosampl[j] := nsampl;
        if (lowerzerosampl[j] <= 0) then  lowerzerosampl[j] := 1;
        if (lowerzerosampl[j] > lowersampl[j]) then lowerzerosampl[j] := 1;
      end;{of for, loop for all the filters}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - points for truncating the filtered signals were found ...');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - ... according to the inflection points method');
    end;  { if nasilne = false - konec vyhybky pro hranice stanovene podle inflexnich bodu obalky}

    {tady budu hledat inflexe pro urceni chyb maxim, udelam to pro vsech osm maxim nezavisle na tom, jake se vybralo do vysledne disperzni krivky}
    for j := 1 to nflt do begin
      Noznaceni[1, j] := locmx1oznaceni[j];
      Noznaceni[2, j] := locmx2oznaceni[j];
      Noznaceni[3, j] := locmx3oznaceni[j];
      Noznaceni[4, j] := locmx4oznaceni[j];
      Noznaceni[5, j] := locmx5oznaceni[j];
      Noznaceni[6, j] := locmx6oznaceni[j];
      Noznaceni[7, j] := locmx7oznaceni[j];
      Noznaceni[8, j] := locmx8oznaceni[j];
      Nlocmx[1, j] := max1locmx[j];
      Nlocmx[2, j] := max2locmx[j];
      Nlocmx[3, j] := max3locmx[j];
      Nlocmx[4, j] := max4locmx[j];
      Nlocmx[5, j] := max5locmx[j];
      Nlocmx[6, j] := max6locmx[j];
      Nlocmx[7, j] := max7locmx[j];
      Nlocmx[8, j] := max8locmx[j];
    end;
    for m := 1 to 8 do begin {pro vsech osm nejvyssich maxim}
      for j := 1 to nflt do begin {cyklus bude probihat postupne pres vsechny filtry}
        {a pro kazdy filtr projde vsechny vzorky a najde meze, ktere me zajimaji}
        Nuppersampl[j] := nsampl;
        Nlowersampl[j] := 0;
        for i := 2 to nsampl - 1 do begin {napoctu derivaci obalky signalu / ma blbej rozmer, nedelim to casem, ale to je fuk}
          derivace[j, i] := amp[j, i + 1] - amp[j, i - 1];
        end;
        minderivace := 0;
        maxderivace := 0;
        {hledam maximum derivace nahoru of maxima obalky / ale protoze jsem v klesajici casti obalky, hledam vlastne jeji minimum}
        if ((Noznaceni[m, j] = 'maximum') or (Noznaceni[m, j] = 'decreasing inflection')) then begin
          for i := Nlocmx[m, j] + 1 to nsampl do begin {zacne se od maxima filtru nahoru}
            if derivace[j, i] > 0 then  break; {jakmile derivace preleze nulu nahoru, vyskoci to z cyklu}
            if (derivace[j, i] < minderivace) then begin
              minderivace := derivace[j, i];  {ulozim si hodnotu derivace, ktera byla zatim nejmensi}
              Nuppersampl[j] := i;            {sem si schovame index "i", ktery dane mezni hodnote prislusi}
            end;
          end;
        end;  {hledal jsem tedy od maxima obalky v jeji klesajici casti tedy v zapornych derivacich do nulove derivace, tedy do minima obalky}
        if (Noznaceni[m, j] = 'increasing inflection') then begin {pro rostouci inflexe to projedu jeste nahoru}
          Nuppersampl[j] := Nlocmx[m, j] + 2; {nastavim umele mez pro zapoceti orezavani}
        end;
        if (Nuppersampl[j] = Nlocmx[m, j]) then Nuppersampl[j] := Nuppersampl[j] + 5; {kdyz to padne zaroven do maxima}
        if (Nuppersampl[j] >= nsampl) then Nuppersampl[j] := nsampl - 1;{kontrola, aby to nebyl ten posledni}
        if (amp[j, Nuppersampl[j]] - amp[j, Nuppersampl[j] + 1] <= 0) then Nuppersampl[j] := Nuppersampl[j] - 1; {kontrola, aby se to zase hned nezvedalo}
        if ((Noznaceni[m, j] = 'maximum') or (Noznaceni[m, j] = 'increasing inflection')) then begin
          for i := Nlocmx[m, j] - 1 downto 1 do  begin
            if derivace[j, i] < 0 then break; {jakmile derivace preleze nulu dolu, vyskoci to z cyklu}
            if (derivace[j, i] > maxderivace) then begin
              maxderivace := derivace[j, i];      {ulozim si hodnotu derivace, ktera byla zatim nejvetsi}
              Nlowersampl[j] := i;                {sem si schovame index "i", ktery dane mezni hodnote prislusi}
            end;
          end;
        end;   {hledal jsem od maxima obalky v jeji rostouci casti tedy v kladnych derivacich do nulove derivace, tedy do minima obalky}
        if (Noznaceni[m, j] = 'decreasing inflection') then begin {pro klesajici inflexe to projedu jeste dolu}
          Nlowersampl[j] := Nlocmx[m, j] - 2; {nastavim umele mez pro zapoceti orezavani}
        end;   {tedy ted mam obe meze lowersampl a uppersampl pro vsechny tri pripady maxima a obou inflexi}
        if (Nlowersampl[j] = Nlocmx[m, j]) then Nlowersampl[j] := Nlowersampl[j] - 5; {kdyz to padne do maxima}
        if (Nlowersampl[j] <= 1) then Nlowersampl[j] := 2; {kontrola, aby to nebyl ten prvni}
        if (amp[j, Nlowersampl[j]] - amp[j, Nlowersampl[j] - 1] <= 0) then Nlowersampl[j] := Nlowersampl[j] + 1;{kontrola, aby se to zase hned nezvedalo}
        errormax[m, j] := ((Nuppersampl[j] - Nlowersampl[j]) / 2) * timein; {udelam prumernou vzdalenost v case tech inflexi od maxima a to ulozim jako :chybu: maxima}
      end;{j of for, loop for all the filters}
    end; {m pro osm maxim}

    if nasilne = True then begin    {zacatek vyhybky - zde to udelam pro pevne hranice zavisle jen na vzdalenosti na centralni periode}
      val(Edit24.Text, orizka, cd); {prectu, jak dlouha ma byt vyriznuta skupina - je to cela skupina dohromady}
      for j := 1 to nflt do begin   {cyklus bude probihat postupne pres vsechny filtry}
        uppersampl[j] := locmx[j] + trunc(period[j] * (orizka * 0.1) / timein);
        lowersampl[j] := locmx[j] - trunc(period[j] * (orizka * 0.1) / timein);      {cas, ktera zustane, je 20 procent delky cele skupiny}
        upperzerosampl[j] := locmx[j] + trunc(period[j] * (orizka * 0.5) / timein);  {horni a dolni mez jsou pulku delky na kazdou stranu}
        lowerzerosampl[j] := locmx[j] - trunc(period[j] * (orizka * 0.5) / timein);
        if (uppersampl[j] = locmx[j]) then uppersampl[j] := uppersampl[j] + 5; {kdyz to padne zaroven do maxima}
        if (uppersampl[j] >= nsampl) then  uppersampl[j] := nsampl - 1;{kontrola, aby to nebyl ten posledni}
        if (lowersampl[j] = locmx[j]) then lowersampl[j] := lowersampl[j] - 5; {kdyz to padne do maxima}
        if (lowersampl[j] <= 1) then lowersampl[j] := 2; {kontrola, aby to nebyl ten prvni}
        {tady se opravuji ruzne zadrhele, ktere mohou nastat na koncich}
        if (upperzerosampl[j] >= nsampl + 1) then upperzerosampl[j] := nsampl;
        if (upperzerosampl[j] < uppersampl[j]) then upperzerosampl[j] := nsampl;
        if (lowerzerosampl[j] <= 0) then lowerzerosampl[j] := 1;
        if (lowerzerosampl[j] > lowersampl[j]) then lowerzerosampl[j] := 1;

        {ovsem pokud jsem si nacetl referencni disperzi, tak do techto hodnot casu nacpu natvrdo casy podle te referencni a nic nepocitam}
        //if reference then begin
        //  uppersampl[j] := trunc((distkm / refgrpvel[j] - timedist) / timein) - nstart + trunc(period[j] * (orizka * 0.1) / timein);
        //  lowersampl[j] := trunc((distkm / refgrpvel[j] - timedist) / timein) - nstart - trunc(period[j] * (orizka * 0.1) / timein);     {cas, ktera zustane, je 20 procent delky cele skupiny}
        //  upperzerosampl[j] := trunc((distkm / refgrpvel[j] - timedist) / timein) - nstart + trunc(period[j] * (orizka * 0.5) / timein); {horni a dolni mez jsou pulku delky na kazdou stranu}
        //  lowerzerosampl[j] := trunc((distkm / refgrpvel[j] - timedist) / timein) - nstart - trunc(period[j] * (orizka * 0.5) / timein);
        //end; {if reference}
      end;{of for, loop for all the filters}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - points for truncating the filtered signals were found ...');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - ... according to the fixed phase range');
    end; {if nasilne = true - konec vyhybky pro pevne hranice orezavani}

    {pokracuje se dal posleze vyhybek}
    for j := 1 to nflt do begin {a tenhle cyklus bude probihat uz jen pro ta definitivne vybrana}
      {nasledujicich pet cyklu se radi za sebe tak, ze "i" projde postupne od "1" do "nsampl"}
      {rozsah filtru je rozdelen na pet oddilu pomoci sesti vyse uvedenych mezi:}
      {"1"-"lowerzerosampl"-"lowersampl"-"uppersampl"-"upperzerosampl"-"nsampl"}
      {mezi "lowersampl" a "uppersampl" je vmezereno jeste "locmx",coz vsak ted nepotrebujeme}
      if (POLARflip = False) and (POLARflipZT = False) then begin {pokud delam prvni ze dvou nebo tri komponent}
        for i := 1 to lowerzerosampl[j] do begin  {od "1"(vcetne) do "lowerzerosampl"(vcetne) to budou jen nuly}
          fsre[j, i] := 0; {vynuluje se "Filtrovany Signal REalny"}
          fnamp[j, i] := 0;  {vytvarime nove pole spektrogramu "Filtrovana Normalizovana AMPlituda"}
          famp[j, i] := 0;    {a take stejne pole ale nenormalizovane (pro demonstraci prace programu)}
        end;
        for i := upperzerosampl[j] to nsampl do begin {od "upperzerosampl"(vcetne) do "nsampl"(vcetne)}
          fsre[j, i] := 0;  {to budou take jen nuly}
          fnamp[j, i] := 0;
          famp[j, i] := 0;
        end;
        for i := lowerzerosampl[j] + 1 to lowersampl[j] do begin  {od "lowerzerosampl" do "lowersampl"(vcetne) to zahladime}
          if taper then begin
            fe := 0.5 * (1.0 - cos(pi * (i - lowerzerosampl[j] - 1) / (lowersampl[j] - lowerzerosampl[j])));    {kosinovym oknem}
          end;
          if taper = False then begin
            fe := 1; {nebudu to zhlazovat}
          end;
          fsre[j, i]  := fxsre[j, i] * fe;
          fsim[j, i]  := fxsim[j, i] * fe;
          fnamp[j, i] := namp[j, i]  * fe;
          famp[j, i]  := amp[j, i]   * fe;
        end;
        for i := upperzerosampl[j] - 1 downto uppersampl[j] do begin {od "uppersampl"(vcetne) do "upperzerosampl" take}
          if taper then begin
            fe := 0.5 * (1.0 - cos(pi * (i - upperzerosampl[j] + 1) / (upperzerosampl[j] - uppersampl[j])));    {zahladime kos.oknem}
          end;
          if taper = False then begin
            fe := 1; {nebudu to zhlazovat}
          end;
          fsre[j, i] := fxsre[j, i] * fe;
          fsim[j, i] := fxsim[j, i] * fe;
          fnamp[j, i] := namp[j, i] * fe;
          famp[j, i] := amp[j, i] * fe;
        end;
        for i := lowersampl[j] + 1 to uppersampl[j] - 1 do begin  {mezi "lowersampl" a "uppersampl" ponechame hodnoty stejne}
          fsre[j, i] := fxsre[j, i];
          fsim[j, i] := fxsim[j, i];
          fnamp[j, i] := namp[j, i];
          famp[j, i] := amp[j, i];
        end;
        {tady si zapamatuju ty ctyri casy pro zhlazeni, abych je mohl pouzit i na druhou slozku stejne}
        POLlowerzerosampl[j] := lowerzerosampl[j];
        POLlowersampl[j] := lowersampl[j];
        POLuppersampl[j] := uppersampl[j];
        POLupperzerosampl[j] := upperzerosampl[j];
      end;
      {POLARflip = false, tedy standarni zhlazovani, mam zapamatovane ty hodnoty casu pro zhlazovani}
      if (POLARflip = True) or (POLARflipZT = True) then begin {pokud delam druhou nebo treti komponentu, zhladim je za pouziti tech prvne zapamatovanych casu}
        for i := 1 to POLlowerzerosampl[j] do begin  {od "1"(vcetne) do "lowerzerosampl"(vcetne) to budou jen nuly}
          fsre[j, i] := 0; {vynuluje se "Filtrovany Signal REalny"}
          fnamp[j, i] := 0;  {vytvarime nove pole spektrogramu "Filtrovana Normalizovana AMPlituda"}
          famp[j, i] := 0;    {a take stejne pole ale nenormalizovane (pro demonstraci prace programu)}
        end;
        for i := POLupperzerosampl[j] to nsampl do begin {od "upperzerosampl"(vcetne) do "nsampl"(vcetne)}
          fsre[j, i] := 0;  {to budou take jen nuly}
          fnamp[j, i] := 0;
          famp[j, i] := 0;
        end;
        for i := POLlowerzerosampl[j] + 1 to POLlowersampl[j] do begin  {od "lowerzerosampl" do "lowersampl"(vcetne) to zahladime}
          if taper then begin
            fe := 0.5 * (1.0 - cos(pi * (i - POLlowerzerosampl[j] - 1) / (POLlowersampl[j] - POLlowerzerosampl[j])));  {kosinovym oknem}
          end;
          if taper = False then begin
            fe := 1; {nebudu to zhlazovat}
          end;
          fsre[j, i] := fxsre[j, i] * fe;
          fsim[j, i] := fxsim[j, i] * fe;
          fnamp[j, i] := namp[j, i] * fe;
          famp[j, i] := amp[j, i] * fe;
        end;
        for i := POLupperzerosampl[j] - 1 downto POLuppersampl[j] do begin {od "uppersampl"(vcetne) do "upperzerosampl" take}
          if taper then begin
            fe := 0.5 * (1.0 - cos(pi * (i - POLupperzerosampl[j] + 1) / (POLupperzerosampl[j] - POLuppersampl[j]))); {zahladime kos.oknem}
          end;
          if taper = False then begin
            fe := 1; {nebudu to zhlazovat}
          end;
          fsre[j, i] := fxsre[j, i] * fe;
          fsim[j, i] := fxsim[j, i] * fe;
          fnamp[j, i] := namp[j, i] * fe;
          famp[j, i] := amp[j, i] * fe;
        end;
        for i := POLlowersampl[j] + 1 to POLuppersampl[j] - 1 do begin  {mezi "lowersampl" a "uppersampl" ponechame hodnoty stejne}
          fsre[j, i] := fxsre[j, i];
          fsim[j, i] := fxsim[j, i];
          fnamp[j, i] := namp[j, i];
          famp[j, i] := amp[j, i];
        end;
      end; {if POLARflip = true or POLARflip = True}
    end;  {konec cyklu pres filtry}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - filtered signals were truncated and smoothed');

    {zde se spocte okamzita perioda podle vzorecku V. Cerveny pomoci analytickeho signalu, ktera prislusi jiz primo bodu v case, ktery prislusi prichodu maximalni energie v skoromonochromatickem
    signalu, tento bod je pro j-ty filtr obsazen v poli integeru locmx(j)}
    for j := 1 to nflt do begin
      for i := 1 to nsampl do begin {spocteni analyticke phase pro vsechny filtry a vsechny casove body}
        anphase[j, i] := -arctan2(fxsim[j, i], (fxsre[j, i] + 0.000000001)); {tady jsou oba NEOREZANE}
      end;{of for :i:}
      anphaseMAX[j] := anphase[j,locmx[j]]; {faze v pod maximem obalky}
    end;{of for :j:}

    for j := 1 to nflt do begin
      //for i := 1 to nsampl do begin {posunuti o 2*pi tak, aby phase byla kladna - dodano brezen 2016}
      //  if (anphase[j,i] <= 0.0)  then begin
      //    for k := 1 to nsampl do begin {posunuti o 2*pi tak, aby phase byla kladna}
      //      anphase[j,k] := anphase[j,k]+2*pi;  {pokud byla nejaka zaporna, prictu 2*pi k uplne vsem}
      //    end; {for k, coz jsou zase samply}
      //  end;{of if / konec posouvani o pi}
      //end;{of for :i:}
      for i := 2 to nsampl do begin {posunuti o 2*pi tak, aby phase byla monotonni}
        if (anphase[j, i - 1] - anphase[j, i] >= 1.0) then begin {tedy pokud ta nasledujici je mensi, nez ta predchazejici}
          for k := i to nsampl do begin {tak ke vsem nasledujicim prictu 2*pi}
            anphase[j, k] := anphase[j, k] + 2 * pi;
          end;{of for :k:}
        end;{of if / konec posouvani o pi}
      end;{of for :i:}
      for i := 2 to nsampl - 1 do begin
        derphase[j, i] := (anphase[j, i + 1] - anphase[j, i - 1]) / (2 * timein); {derivace phase}
      end;
    end;{of for :j:}
    for j := 1 to nflt do begin
      for i := 2 to nsampl - 1 do begin {hleda okamzitou periodu pro vsechny body spektrogramu}
        instfreq[j, i] := (1.0 / (2 * pi)) * (derphase[j, i] + 0.000000001);
        instper[j, i] := 1.0 / instfreq[j, i];
      end;{of for :i:}

      zerophasetime[j] := SVALtime[locmx[j]] - ((anphaseMAX[j]/(2*pi))*instper[j, locmx[j]]); {cas kdy je faze nula podle okamzite faze pod maximem obalky a okamzite periody}
//      if zerophasetime[j] > SVALtime[locmx[j]] then zerophasetime[j] := zerophasetime[j] - instper[j, locmx[j]];

    end; {of for :j:}
    for j := 1 to nflt do begin
      numfilt[j] := j;
    end;
    periodsbox := TStringList.Create;
    filterbox := TStringList.Create;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the instantaneous periods of each maxima were estimated');
    for j := 1 to nflt do begin
      for i := 2 to nsampl - 1 do begin
        if instper[j, i] <= 0 then begin
          instper[j, i] := ((instper[j, i - 1] + instper[j, i + 1]) / 2); {tu zapornou nahradim prumerem tech okolnich}
        end;{of if}
      end;{for "i"}
      if instper[j, locmx[j]] <= 0 then begin {a pokud je jeste porad zaporna nejaka, co je dulezita, napisu o tom hlaseni}
        str(j: 4, jstrg);
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - something wrong with the period (filter No. ' + jstrg + ') - it is negative!!!!');
      end;{of if}
    end;{of j}
    for j := 1 to nflt do  begin
      str(instper[j, locmx[j]]: 8: 5, periodstrg);  {do stringu periodstrg ulozi hodnotu instper v maximu}
      str(j, filterstrg);         {a do stringu filterstring ulozi poradove cislo filtru}
      periodsbox.Add(periodstrg); {nacpe periody do boxu}
      filterbox.Add(filterstrg);  {nacpe poradova cisla do jineho boxu}
    end;{of for :j:}
    combobox1.items := periodsbox; {zobrazi periody v rolete pro vyber}
    combobox2.items := periodsbox; {zobrazi periody v rolete pro vyber}
    combobox3.items := periodsbox; {zobrazi periody v rolete pro vyber}

    {tady se hledaji pozice, kdy je faze dane vlny nulova}
    for j := 1 to nflt do begin
      nahradnimax[j] := locmx[j];
      if PREMlimit then begin {v pripade pouziti PREMlimit to nahradnimax udelam jine}
        if (abs(locmx[j] - istart[j]) < 10) or (abs(locmx[j] - ikonec[j]) < 10) then begin {pokud je nalezene maximum grupy prilis blizko tem hranicim}
          nahradnimax[j] := trunc((ikonec[j] + istart[j])/2);                              {budu hledat zeroposition od prostredka mezi tema hranicema PREMu}
        end;
      end;
      for i := nahradnimax[j] to nsampl - 2 do begin                           {tedy od pouziteho maxima filtru nahoru}
        if ((fxsre[j, i - 2] <= 0.0) and (fxsre[j, i + 2] >= 0.0)) then begin  {pruchod ze zapornych do kladnych hodnot}
          zeroposition1[j] := i;                                               {sem ulozime hodnotu indexu casu, kdy to proslo ze zapornych do kladnych}
          break; {a uz dal nehledame}
          if i = nsampl - 2 then zeroposition1[j] := 0;
        end; {of if}
      end; {of for :i:}
    end; {of for :j:}
    for j := 1 to nflt do begin
      for i := nahradnimax[j] downto 3 do begin                                {tedy od pouziteho maxima filtru dolu}
        if ((fxsre[j, i - 2] <= 0.0) and (fxsre[j, i + 2] >= 0.0)) then begin  {pruchod ze zapornych do kladnych hodnot}
          zeroposition2[j] := i;                                               {sem ulozime hodnotu casu, kdy to proslo ze zapornych do kladnych}
          break; {a uz dal nehledame}
          if i = 3 then zeroposition2[j] := 0;
          if zeroposition2[j] > nsampl then zeroposition2[j] := nsampl; {nekdy se to seklo, kdyz je perioda nesmyslne velika, ze to vyhodi nesmyslne velikou zeroposition}
        end;{of if}
      end;{of for :i:}
    end;{of for :j:}
    for j := 1 to nflt do begin {vytvorim virtualni zeroposition3, kera bude o jednu periodu posunuta vuci zeroposition1 smerem k vetsimu casu, tedy pomalejsi}
      zeroposition3[j] := zeroposition1[j] + trunc(instper[j, nahradnimax[j]] / timein);
      if zeroposition3[j] > nsampl then zeroposition3[j] := nsampl; {nekdy se to seklo, kdyz je perioda nesmyslne velika, ze to vyhodi nesmyslne velikou zeroposition}
      if zeroposition3[j] < 1      then zeroposition3[j] := 1;      {to same pro moc malou vec}
    end;
    for j := 1 to nflt do begin {vytvorim virtualni zeroposition4, kera bude o jednu periodu posunuta vuci zeroposition2 smerem k mensimu casu, tedy rychlejsi}
      zeroposition4[j] := zeroposition2[j] - trunc(instper[j, nahradnimax[j]] / timein);
      if zeroposition4[j] > nsampl then zeroposition4[j] := nsampl; {nekdy se to seklo, kdyz je perioda nesmyslne velika, ze to vyhodi nesmyslne velikou zeroposition}
      if zeroposition4[j] < 1      then zeroposition4[j] := 1;      {to same pro moc malou vec}
    end;
    {tedy zeroposition1 a zeroposition3 (liche) jsou pro zero-crossings ZA maximem, a zeroposition2 a zeroposition4 (sude) jsou PRED maximem}
    {vypada to, ze zejmena - celkem neprekvapive - potrebuju hlavne ty 1 a 2, tedy ty nejbliz groupovemu maximu}

    {tady mam nalezene zeroposition 1 - 4 a ulozim si je jeste do dalsi promenne ktera si bude pamatovat ty indexy pro vsechny stanice}
    for j := 1 to nflt do begin
      zeropositionStation1[j, pocitadlofile] := zeroposition1[j];
      zeropositionStation2[j, pocitadlofile] := zeroposition2[j];
      zeropositionStation3[j, pocitadlofile] := zeroposition3[j];
      zeropositionStation4[j, pocitadlofile] := zeroposition4[j];
      SVALtimeStation[j, pocitadlofile] := SVALtime[nahradnimax[j]];
      grvelStation[j,pocitadlofile] := grvel[locmx[j]]; {grupova rychlost s indexem filtru a stanice}
    end;
    KUKdistkmStation[pocitadlofile] := KUKdistkm;
    KUKlatStation[pocitadlofile]    := KUKlat;
    KUKlonStation[pocitadlofile]    := KUKlon;
    druhyradekstrgStation[pocitadlofile] := druhyradekstrg;

    for j := 1 to nflt do begin {vybereme, ktera nulova pozice je bliz k maximu}
      zeroposition[j]                       := zeroposition1[j]; {napred do finalni nactu ty prvni, a pak je budu pripadne menit}
//      minfazeindex[j] := 1;  {jsem v cyklu pro filtry, takze tohle se "vynuluje" pro kazdy filtr znova}
//      maxfazeindex[j] := 1;
      maxfsre := -1000000000;
      minfsre := +1000000000;
      for i := 3 to nsampl - 2 do begin {pres vsechny vzorky bez krajnich dvou}
        if (fsre[j, i] > maxfsre) then begin {pokud je aktualni amplituda vyssi nez maximum}
//          maxfazeindex[j] := i;
          maxfsre := fsre[j, i]; {bude to nove maximum}
        end;
        if (fsre[j, i] < minfsre) then begin
//          minfazeindex[j] := i;
          minfsre := fsre[j, i];
        end;
      end;

//      if maxfazeindex[j] > minfazeindex[j] then finalindex := minfazeindex[j]; {tady vyberu, ktery ten index je mensi, tedy prvni v case, a ten ulozim do finalindex}
//      if maxfazeindex[j] < minfazeindex[j] then finalindex := maxfazeindex[j];
      {zkusim mezi zeroposition 1 a 2 vybrat tu, ktera je bliz k maximu obalky - nefunguje to univerzalne}
      if abs(SVALtime[zeroposition2[j]] - SVALtime[nahradnimax[j]]) < abs(SVALtime[zeroposition1[j]] - SVALtime[nahradnimax[j]]) then  zeroposition[j] := zeroposition2[j];
      zeropositionStation[j, pocitadlofile] := zeroposition[j];  {tohle je to same, ale jeste to ma i index stanice}

      if zeroposition[j] = 0 then zeroposition[j] := zeroposition2[j];
      if zeroposition[j] = 0 then begin {pokud to zustalo nula, protoze to proste zadny bod nenaslo}
        zeroposition[j] := 1; {dam tam jednicku, aby se to nezasekavalo v dalsich vypoctech}
        str(j: 4, jstrg);
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - no phase crossing zero found for filter No. ' + jstrg);
      end;
    end; {for j}

    {zde se spocte grupova rychlost: vzdalenost delena souctem casu od casu vzniku k prvnimu vzorku zaznamu,
    casu ktery ubehl od prvniho vzorku zaznamu do "nstart" a casu, ktery bezi od "nstart" do "nend"}
    for i := 1 to nsampl do begin
      if hydro = False then begin {pro hydro verzi udelam specialni vzorecek, nebude to rychlost, ale cas}
        grvel[i] := distkm / (((i + nstart - 1) * timein) + timedist);
      end;
      if hydro = True then begin {pro hydro verzi udelam specialni vzorecek, nebude to rychlost, ale cas}
        grvel[i] := (i + nstart - 1) * (timein / 60); {mam to v minutach}
      end;
    end;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - group velocity for each maximum was computed');
    {napocitavani casu pro spravne zobrazeni podle puvodniho suroveho signalu pricita se tez rozdil pocatecniho casu a casu zacatku zaznamu "timedist"}
    PlotPanel3.Xmin := (instper[1, locmx[1]]);
    if PlotPanel3.XMin <= 0 then PlotPanel3.XMin := 0;
    if supermaxsamples = maxsamples then begin
      if (instper[nflt, locmx[nflt]]) * 1.15 > 3 * period[nflt] then begin
        PlotPanel3.Xmax := 3 * period[nflt];
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - maximal period was too large for plotting, lower value was used for X axis of spectrogram');
      end
      else begin
        PlotPanel3.Xmax := (instper[nflt, locmx[nflt]]) * 1.15;
      end;
    end; {tady se to silene seka}
    PlotPanel3.XInterval := (PlotPanel3.XMax - PlotPanel3.Xmin) / 6;
    PlotPanel3.Xmin := (instper[1, locmx[1]]) - (PlotPanel3.XInterval) / 4;
    original01 := PlotPanel3.XInterval;
    if ((PlotPanel3.XInterval <= 100.0) and (PlotPanel3.XInterval > 10.0)) then PlotPanel3.XInterval := 10.0
    else if ((PlotPanel3.XInterval <= 10.00) and (PlotPanel3.XInterval > 1.00)) then PlotPanel3.XInterval := 1.0
    else if ((PlotPanel3.XInterval <= 1.000) and (PlotPanel3.XInterval > 0.10)) then PlotPanel3.XInterval := 0.1
    else if ((PlotPanel3.XInterval <= 0.100) and (PlotPanel3.XInterval > 0.01)) then PlotPanel3.XInterval := 0.01
    else if (PlotPanel3.XInterval <= 0.01) then PlotPanel3.XInterval := 0.001;
    if PlotPanel3.XInterval <= original01 then  PlotPanel3.XInterval := PlotPanel3.XInterval * (trunc(original01 / PlotPanel3.XInterval));
    PlotPanel3.XMarks := True;
    PlotPanel3.Ymin := grvel[nsampl];
    PlotPanel3.Ymax := grvel[1];
    PlotPanel3.YInterval := (PlotPanel3.Ymax - PlotPanel3.Ymin) / 6;
    original02 := PlotPanel3.YInterval;
    PlotPanel3.Ymin := grvel[nsampl] - ((grvel[1] - grvel[nsampl]) / 12);
    PlotPanel3.Ymax := grvel[1] + ((grvel[1] - grvel[nsampl]) / 12);
    if ((PlotPanel3.YInterval <= 100.0) and (PlotPanel3.YInterval > 10.0)) then PlotPanel3.YInterval := 10.0
    else if ((PlotPanel3.YInterval <= 10.00) and (PlotPanel3.YInterval > 1.00)) then PlotPanel3.YInterval := 1.0
    else if ((PlotPanel3.YInterval <= 1.000) and (PlotPanel3.YInterval > 0.10)) then PlotPanel3.YInterval := 0.1
    else if ((PlotPanel3.YInterval <= 0.100) and (PlotPanel3.YInterval > 0.01)) then PlotPanel3.YInterval := 0.01
    else if (PlotPanel3.YInterval <= 0.01) then PlotPanel3.YInterval := 0.001; {tady se to sikene seka}
    if PlotPanel3.YInterval <= original02 then PlotPanel3.YInterval := PlotPanel3.YInterval * (trunc(original02 / PlotPanel3.YInterval));
    PlotPanel3.YMarks := True;
    label15.BringToFront;
    label17.Visible := True;
    label17.BringToFront;
    PlotPanel1.Xmin := SVALtime[1];
    PlotPanel1.Xmax := SVALtime[nsampl];
    for i := 1 to 1 do begin {delam si cylkus jen proto, abych z nej mohl vyskakovat}
      if (dur > 50000000.0) then begin
        PlotPanel1.XInterval := 7257600.0; {tri mesice}
        break;
      end;
      if (dur > 20000000.0) then begin
        PlotPanel1.XInterval := 2419200.0; {28 dni}
        break;
      end;
      if (dur > 10000000.0) then begin
        PlotPanel1.XInterval := 1209600.0; {14 dni}
        break;
      end;
      if (dur > 5000000.0) then begin
        PlotPanel1.XInterval := 604800.0; {tyden}
        break;
      end;
      if (dur > 2000000.0) then begin
        PlotPanel1.XInterval := 172800.0; {dva dny}
        break;
      end;
      if (dur > 1000000.0) then begin
        PlotPanel1.XInterval := 86400.0; {jeden den}
        break;
      end;
      if (dur > 500000.0) then begin
        PlotPanel1.XInterval := 60000.0;
        break;
      end;
      if (dur > 200000.0) then begin
        PlotPanel1.XInterval := 24000.0;
        break;
      end;
      if (dur > 100000.0) then begin
        PlotPanel1.XInterval := 12000.0;
        break;
      end;
      if (dur > 50000.0) then begin
        PlotPanel1.XInterval := 6000.0;
        break;
      end;
      if (dur > 20000.0) then begin
        PlotPanel1.XInterval := 2400.0;
        break;
      end;
      if (dur > 10000.0) then begin
        PlotPanel1.XInterval := 1200.0;
        break;
      end;
      if (dur > 5000.0) then begin
        PlotPanel1.XInterval := 600.0;
        break;
      end;
      if (dur > 2000.0) then begin
        PlotPanel1.XInterval := 240.0;
        break;
      end;
      if (dur > 1000.0) then begin
        PlotPanel1.XInterval := 120.0;
        break;
      end;
      if (dur > 500.0) then begin
        PlotPanel1.XInterval := 60.0;
        break;
      end;
      if (dur > 200.0) then begin
        PlotPanel1.XInterval := 20.0;
        break;
      end;
      if (dur > 100.0) then begin
        PlotPanel1.XInterval := 10.0;
        break;
      end;
      if (dur > 50.0) then begin
        PlotPanel1.XInterval := 5.0;
        break;
      end;
      if (dur > 20.0) then begin
        PlotPanel1.XInterval := 2.0;
        break;
      end;
      if (dur > 3.0) then begin
        PlotPanel1.XInterval := 1.0;
        break;
      end;
      if (dur > 0.1) then begin
        PlotPanel1.XInterval := 0.25;
        break;
      end;
      if (dur > 0.0) then begin
        PlotPanel1.XInterval := 0.10;
        break;
      end;
    end;
    PlotPanel1.XMarks := True;
    if panely then begin
      PlotPanel2.Xmin := SVALtime[1];
      PlotPanel2.Xmax := SVALtime[nsampl];
      for i := 1 to 1 do begin {delam si cyklus jen proto, abych z nej mohl vyskakovat}
        if (dur > 50000000.0) then begin
          PlotPanel2.XInterval := 7257600.0; {tri mesice}
          break;
        end;
        if (dur > 20000000.0) then begin
          PlotPanel2.XInterval := 2419200.0; {28 dni}
          break;
        end;
        if (dur > 10000000.0) then begin
          PlotPanel2.XInterval := 1209600.0; {14 dni}
          break;
        end;
        if (dur > 5000000.0) then begin
          PlotPanel2.XInterval := 604800.0; {tyden}
          break;
        end;
        if (dur > 2000000.0) then begin
          PlotPanel2.XInterval := 172800.0; {dva dny}
          break;
        end;
        if (dur > 1000000.0) then begin
          PlotPanel2.XInterval := 86400.0; {jeden den}
          break;
        end;
        if (dur > 500000.0) then begin
          PlotPanel2.XInterval := 60000.0;
          break;
        end;
        if (dur > 200000.0) then begin
          PlotPanel2.XInterval := 24000.0;
          break;
        end;
        if (dur > 100000.0) then begin
          PlotPanel2.XInterval := 12000.0;
          break;
        end;
        if (dur > 50000.0) then begin
          PlotPanel2.XInterval := 6000.0;
          break;
        end;
        if (dur > 20000.0) then begin
          PlotPanel2.XInterval := 2400.0;
          break;
        end;
        if (dur > 10000.0) then begin
          PlotPanel2.XInterval := 1200.0;
          break;
        end;
        if (dur > 5000.0) then begin
          PlotPanel2.XInterval := 600.0;
          break;
        end;
        if (dur > 2000.0) then begin
          PlotPanel2.XInterval := 240.0;
          break;
        end;
        if (dur > 1000.0) then begin
          PlotPanel2.XInterval := 120.0;
          break;
        end;
        if (dur > 500.0) then begin
          PlotPanel2.XInterval := 60.0;
          break;
        end;
        if (dur > 200.0) then begin
          PlotPanel2.XInterval := 20.0;
          break;
        end;
        if (dur > 100.0) then begin
          PlotPanel2.XInterval := 10.0;
          break;
        end;
        if (dur > 50.0) then begin
          PlotPanel2.XInterval := 5.0;
          break;
        end;
        if (dur > 20.0) then begin
          PlotPanel2.XInterval := 2.0;
          break;
        end;
        if (dur > 3.0) then begin
          PlotPanel2.XInterval := 1.0;
          break;
        end;
        if (dur > 0.1) then begin
          PlotPanel2.XInterval := 0.25;
          break;
        end;
        if (dur > 0.0) then begin
          PlotPanel2.XInterval := 0.10;
          break;
        end;
      end;
      if hydro = false then begin
        PlotPanel2.XMarks := True;
      end;
      PlotPanel2.Ymin := (-1.2);
      PlotPanel2.Ymax := (1.2);
      PlotPanel2.YInterval := (1 / 3);
      Button6.Enabled := True; {seismogram}
      if hydro = false then begin
        Ukazcarky;
        Ukazrychlosti; //(Sender);
      end;
    end; {if panely}
    ComboBox1.Enabled := True; {povoluji a zakazuji nektere cudliky a boxy}
    ComboBox2.Enabled := True; {aby se pri opetovnem spusteni analyzy znova uvedly do stejneho}
    ComboBox3.Enabled := True;
    Button3.Enabled := False;  {monochromaticky}
    Button5.Enabled := False;  {orezany}
    button10.Enabled := True;  {spectrogram}
    button11.Enabled := True;
    button53.Enabled := True;
    if besseltrue then button54.Enabled := True;
    button55.Enabled := True;
    Button14.Enabled := False; {ukladani monochromatickeho}
    button15.Enabled := True;
    button16.Enabled := True;  {sekundarni maxima}
    button17.Enabled := True;  {primarni maxima}
    Button21.Enabled := True;
    Button23.Enabled := False; {otvirani inverzniho okna}
    Button25.Enabled := False; {S velocity}
    Button26.Enabled := False; {Density}
    Button27.Enabled := False;
    Button28.Enabled := False; {P velocity}
    Button29.Enabled := False; {save struc}
    Button32.Enabled := False; {Use Loaded}
    Edit23.Enabled := False;   {chyba lodovany}
    Button33.Enabled := False; {save model}
    button34.Enabled := False; {kresli range filter}
    for i := 1 to supermaxsamples do begin {nuluju pripadne hodnoty ve oborove filtrovanem seismogramu}
      filtered[i] := 0.0;
      wcw[i] := 0.0;
    end;
    for i := 1 to trunc(supermaxsamples / 2) do begin {nuluju pripadne hodnoty ve oborove filtrovanem seismogramu}
      complfiltpowfrq[i] := 0.0;
      complfiltnpowfrq[i] := 0.0;
      nwc[i] := 0.0;
    end;
    button36.Enabled := True; {terciarni maxima}
    button37.Enabled := True; {quarterni maxima}
    button38.Enabled := True; {orezany spectrogram}
    Button39.Enabled := False; {Fitovana disperze / cervena cara}
    button40.Enabled := True; {quinterni maxima}
    button50.Enabled := True; {quinterni maxima}
    button51.Enabled := True; {quinterni maxima}
    button52.Enabled := True; {quinterni maxima}
    button53.Enabled := True; {AnSig}
    button55.Enabled := True; {ImRe}
    Button41.Enabled := True;  {Zoom Out}
    Button47.Enabled := True; {bandpass}
    Button2.Enabled := False; {bandpass envelope}

    if (filtrujuopravovany = False) then begin
      SpectrumForm.Button16.Enabled := False; { Filterd spec }
      SpectrumForm.Button29.Enabled := False; { Smoothed }
      SpectrumForm.Button30.Enabled := False; { Whitened }
      SpectrumForm.Button31.Enabled := False; { Fi-Re }
      SpectrumForm.Button32.Enabled := False; { Fi-Im }
      SpectrumForm.Button33.Enabled := False; { W-Re }
      SpectrumForm.Button34.Enabled := False; { W-Im }
      SpectrumForm.Button17.Enabled := False;
      {vykreslovani amplitudove transfer function}
      SpectrumForm.Button18.Enabled := False; {opravene spektrum}
      SpectrumForm.Button19.Enabled := False; {opravena realna cast spektra}
      SpectrumForm.Button20.Enabled := False; {opravena imaginarni cast spektra}
      SpectrumForm.Button21.Enabled := False;
      {spousti analyzu pro opravene spektrum - DULEZITE !!!!!}
      SpectrumForm.Button22.Enabled := False;
      {na vykreslovani normalizovaneho bandpass filtrovaneho spektra}
      SpectrumForm.Button23.Enabled := False; {vykreslovani phaseove transfer function}
      SpectrumForm.Button24.Enabled := False; {opravene normalizovane spektrum}
    end;
    uzjsemtu := False; {pro vynulovani formulare pro spektra}
    if FFT = False then begin {nastavuju to jenom pro filtrovani, kdyz delam samotnou FFT tak ne}
      SpectrumForm.combobox1.items := periodsbox; {zobrazi periody v rolete pro vyber}
      SpectrumForm.combobox1.Enabled := True;
      Button9.Enabled := True;
      Button10.Enabled := True;
      Button11.Enabled := True;
      Button53.Enabled := True;
      if besseltrue then Button54.Enabled := True;
      Button55.Enabled := True;
    end; {konec nastavovani jenom pro filtrovani}
    indexf := 0;
    Edit12.Enabled := False; {startovaci grupova rychlost}
    Edit13.Enabled := False; {krok rychlosti}
    Edit14.Enabled := False; {krok hustoty}
    Edit21.Enabled := False; {range prvni vrstvy}
    CheckBox2.Enabled := False; {prepinac konstantni hustoty}
    Edit15.Enabled := False; {startovaci povrchova S-rychlost}
    CheckBox4.Enabled := False; {prepinac low velocity zone}
    Edit16.Enabled := False; {startovaci povrchova hustota}
    Edit17.Enabled := False; {startovaci pomer Pv/Ps}
    Edit18.Enabled := False; {startovaci variace pomeru}
    RadioGroup1.Enabled := False;
    RadioGroup3.Enabled := False;
    RadioGroup6.Enabled := False;
    RadioButton1.Enabled := False;
    RadioButton2.Enabled := False;
    RadioButton3.Enabled := False;
    PlotPanel1.Enabled := True;
    PlotPanel2.Enabled := True;
    PlotPanel3.Enabled := True;
    instrument := 'kokot';     {a nastavuji nektere hodnoty znovu na pocatecni}
    inverindexf := 0;           {stavu jako pri jejim prvnim spusteni}
    inverindexl := 0;
    index := 0;
    nasel := False;
    for j := 1 to nflt do begin
      clickedper1[j] := 0;
      clickedvel1[j] := 0;
      clickedper2[j] := 0;
      clickedvel2[j] := 0;
      clickedper3[j] := 0;
      clickedvel3[j] := 0;
      clickedper4[j] := 0;
      clickedvel4[j] := 0;
      clickedper5[j] := 0;
      clickedvel5[j] := 0;
      clickedper6[j] := 0;
      clickedvel6[j] := 0;
      clickedper7[j] := 0;
      clickedvel7[j] := 0;
      clickedper8[j] := 0;
      clickedvel8[j] := 0;
    end;
    minclickedper := 100;
    minclickedvel := 100;
    filtrange := True;    {tedy ze nemam vytvoreny omezeny filtrovany signal pro tuto analyzu}
    uzjsemvni := False;   {pro vymazani formulare pri inverzi}
    useloaded := False;
    joint := False;       {nasleduje vypocet casu konce analyzy}
    zacatekSval := zacatekSVAL * 86400; {koncove technicke vypisu analyzy}
    nahrada := False;     {nastavim, ze jako nic nenahrazuju, coz muzu zmenit klikanim na PlotPanel3}
    nahrada2 := False;
    CheckBox1.Enabled := False;
    CheckBox1.Checked := False; {obnovovani cudliku a checkboxu, ktere vyly vyrazeny z cinnosti po kliknuti do PlotPanelu period-velocity diagramu}
    if epicfromfile = False then begin
      Edit1.Enabled := True;     {epicentralni vzdalenost}
      Edit2.Enabled := True;     {time interval}
    end;
    if sloupec = 1 then begin    {obnovim, jen kdyz mam jednosloupcovy soubor}
      Edit3.Enabled := True;     {sampling frequency}
    end;
    Edit5.Enabled := True;       {min group velocity}
    Edit4.Enabled := True;       {max group velocity}
    Edit6.Enabled := True;       {minimal period}
    Edit7.Enabled := True;       {maximal period}
    Edit8.Enabled := True;       {number of filters}
    Edit9.Enabled := True;       {smoothing window}
    Edit10.Enabled := True;      {alpha slope}
    if CheckBox3.Checked = False then begin
      Edit11.Enabled := True;      {alpha intercept point}
    end;
    Button13.Enabled := True;    {Open data file...}
    RadioGroup2.Enabled := True; {A / L / O option}
    bandpass := False;
    RadioGroup4.Enabled := True; {inflex / maxi option}
    RadioGroup5.Enabled := False; {R / F option}
    RadioGroup7.Enabled := True; {N / X option}
    RadioGroup8.Enabled := True; {vel / time option}
    {konec obnovovani cudliku po kliknuti do PlotPanelu}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - analysis ended at ' + DateTimeToStr(Now));
    konecSVAL := Time;
    konecSVAL := konecSVAL * 86400;
    trvaniSVAL := konecSVAL - zacatekSVAL;
    str(trvaniSVAL: 5: 2, trvaniSVALstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - time needed for the analysis: ' + trvaniSVALstrg + ' s');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ...end of the analysis');
  end;{if nahrada = true; tedy pro nahrazene body}
end;{end of the procedure = end of the main program SVAL}

procedure TNoSVALform.FormCreate(Sender: TObject);
var
  i       : integer;
begin           {creates the basic settings}
  nenulovy := false;               {jakoze vsechny vzorky jsou nula, a kdyz nejaky neni, tak to zmenim}
  notvalidfile := false;
  proccount := 0;
  scalefactor := 100;
  SpinEdit1.Value := 100;
  pp1    := 1;   {vrstvy pro plotpanel1                      plotpanel 1}
  cfs    := 1;   {vrstvy vsechny                             plotpanel 2}
  crych  := 400; {vrstva pro carky oznacujici rychlosti      plotpanel 2}
  pp3    := 1;   {vrstvy pro plotpanel3                      plotpanel 3}
  clicks := 600; {vrstvy pro nakliknute bodiky               plotpanel 3}
  chos   := 800; {vrstvy pro bodiky vybrane ze seznamu       plotpanel 3}
  for i := 1 to maxnumoflayers do begin
    eskai[i] := i; {vrstvy pro strukturu esek               plotpanel 4}
  end;
  pecka := 110; {vrstvy pro strukturu pecek                 plotpanel 4}
  lay   := 210; {malovani vrstev, neboli vrstvy pro vrstvy  plotpanel 4}
  zacP  := 310; {malovani startovaciho modelu pecek         plotpanel 4}
  zacS  := 410; {malovani startovaciho modelu esek          plotpanel 4}
  zacR  := 510; {malovani startovaciho modelu hustot        plotpanel 4}
  husto := 610; {vrstvy pro strukturu hustoty               plotpanel 4}
  eska  := 710; {vrstvy pro strukturu esek                  plotpanel 4}
  ee := 0;
  ks := 0;
  part1 := '';          {prvni cast hlavicky okna}
  part2 := '';          {druha cast hlavicky okna}
  partdir := '';
  partpocitad := '';
  partcomponent := '';
  ityprl := 2;          {RADGROUP 1 rozliseni Rayleigh nebo Love, coz je 1 nebo 0, tedy 2 neni nic, 3 jsou dohromady}
  skladej := 2;         {RADGROUP 2 skladani od nejdelsiho filtru spektrogramu}
  FFT := False;         {RADGROUP 3 tedy ze delam kompletni analyzu}
  allbods := False;     {RADGROUP 4 implicitne se to dela jen pro opravdicka maxima}
  usefiltered := False; {RADGROUP 5 zakladni nastaveni: nepouzivam kompletne filtrovany zaznam, ale jen puvodni}
  usegroup := False;     {RADGROUP 6 zakladni nastaveni, pouzivam grupovou rychlost}
  nasilne := True;      {RADGROUP 7 implicitne se to dela podle fixnich orezavani}
  rozmezivel := True;   {RADGROUP 8 implicitni je zadavani rychlosti}
  nahrada := False;     {napred to delam jako normalni analyzu, pak az nahrazuju}
  nahrada2 := False;
  joint := False;
  Button47.BringToFront;
  Button2.BringToFront;
  SpinEdit1.BringToFront;
  zarad := True;
  filtrujuopravovany := False;
  interaktivni := False;  {mod pro rucni nastavovani rychlosti S-vln}
  menise := False;        {mod, kdy je hustota konstantni a nemeni se v prubehu inverze}
  filesamplesnumber := 0; {pocet vzorku je nula}
  lvz := True;            {zakladni nastaveni je, ze LVZ se hleda}
  batchproces := False;   {implicitne to neni v rezimu davkoveho zpracovani}
  vynuceneukonceni := False;
  pocitadlofile := 0;
  removeoffset := True;   {ze sundavam offset}
  alphacheck := True;     {ze kontroluju, aby alpha nebyla moc malinka}
  logiksezavrel := False;
  prorenatu := False;
  zacatekblbe := False;
  konecblbe := False;
  panely := True;         {ze jako nastavuju PlotPanely}
  puvodno := True;        {ze chci menit "resize" levy panel}
  batchinver := False;    {nechci batch inverzi}
  prumernabatch := False; {zatim nemaluju krivku pro prumernou strukturu}
  skok := False;          {ze DC nemam skok}
  ema := False;           {jakoze nechci delat ema}
  zemy := False;          {jakoze jsem nezmacknul ema cudlik}
  ibp := 1;
  allthreeyes := False;
  grupka := True;         {ze jako klikam na grupove body, protoze na fazove klikam az kdyz namaluju fazove krivky}
  taper := True;          {jakoze chci taperovat a jenom kdyz aktivne zmacknu pri batch processingu, ze nechci, tak to nebude}
  udelalopraveny := False;{true je to jen kdyz se zmackne cudlik na vypocet casoveho opraveneho zaznamu}
  Dinar := False;
  KTB := False;
  prvniDinar := false;
  fromPhaseCorr := false;
  fromArrayCorr := false;
  uztubyl := false;
end; {konec zakladajici procedury}

procedure TNoSVALform.ComboBox1CloseUp(Sender: TObject);
var {allows to choose from a list of filtered periods}
  eee, oo             : integer;
  nampstrg            : string;
  m1strg, m1indstrg   : string;
  m2strg, m2indstrg   : string;
  m3strg, m3indstrg   : string;
  m4strg, m4indstrg   : string;
  m5strg, m5indstrg   : string;
  m6strg, m6indstrg   : string;
  m7strg, m7indstrg   : string;
  m8strg, m8indstrg   : string;
  upperinfstrg        : string;
  lowerinfstrg        : string;
  upperzerostrg       : string;
  lowerzerostrg       : string;
  zeropositionstrg    : string;
  anphaseminstrg      : string;
  anphasemaxstrg      : string;
 // timestrg            : string;
begin
  Timer1.Enabled := False; {zrusim blikani vybraneho bodiku}
  if index <> 0 then begin
    PlotPanel3.HideLayer(chos);
    with PlotPanel3 do begin
      LayerOptions(chos, pmDot, 5);
    end;
    PlotPanel3.AddXY(instper[index, locmx[index]], grvel[locmx[index]], clRed, chos);
  end;
  val(combobox1.Text, slctdperiod, cd);  {selection of one of the monochromatic filtered-out signals}
  str(slctdperiod: 8: 5, slctdperiodstrg);
  for oo := 1 to nflt do begin
    if (instper[oo, locmx[oo]] < slctdperiod + 0.000009) and (instper[oo, locmx[oo]] > slctdperiod - 0.000009) then begin
      index := oo;
    end;
  end;
  if batchproces then begin {kdyz delam demonstraci v batchi, tak vyberu filter uprostred spektra a ten namaluju}
    index := trunc(nflt / 2);
  end;
  if index = 0 then begin
    ShowMessage('No filter selected!');
    exit;
  end;
  str(index, indexstrg);
  str(period[index]: 8: 4, centralperstrg);
  str((1 / period[index]): 7: 4, centralfrqstrg);
  str(instper[index, zeroposition[index]]: 8: 4, zeropositionperiodstrg);
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - you have selected the period ' + slctdperiodstrg + ' seconds; it means filter number ' + indexstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - corresponding central period is ' + centralperstrg + ' seconds and central frequency is ' + centralfrqstrg + ' Hz');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - zero phase position period is ' + zeropositionperiodstrg + ' seconds');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - ' + jake[index] + ' maximum of this filter was used');
  str(namp[index, locmx[index]]: 6: 2, nampstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - normalized amplitude of this ' + jake[index] + ' maximum is ' + nampstrg + ' dB');
  str(SVALtime[uppersampl[index]]: 8: 3, upperinfstrg);
  str(SVALtime[lowersampl[index]]: 8: 3, lowerinfstrg);
  str(SVALtime[upperzerosampl[index]]: 8: 3, upperzerostrg);
  str(SVALtime[lowerzerosampl[index]]: 8: 3, lowerzerostrg);
  str(SVALtime[zeroposition[index]]: 8: 3, zeropositionstrg);
  if nasilne = False then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - lower cutting zero point at:        ' + lowerzerostrg + ' s');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - lower cutting inflection point at: ' + lowerinfstrg + ' s');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - upper cutting inflection point at: ' + upperinfstrg + ' s');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - upper cutting zero point at:        ' + upperzerostrg + ' s');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - phase zero position at:        ' + zeropositionstrg + ' s');
  end;
  if nasilne = True then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - lower fixed zero point at:          ' + lowerzerostrg + ' s');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - lower fixed smoothing point at: ' + lowerinfstrg + ' s');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - upper fixed smoothing point at: ' + upperinfstrg + ' s');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - upper fixed zero point at:          ' + upperzerostrg + ' s');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - phase zero position at:             ' + zeropositionstrg + ' s');
  end;
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - overview of all maxima for this filter:');
  if (max1locmx[index] <> 0) then begin
    str(SVALtime[max1locmx[index]]: 8: 3, m1indstrg);    {pro popis toho, v jakem case prislo toto maximum}
    str(namp[index, max1locmx[index]]: 6: 2, m1strg);    {pro popis toho, jakou ma toto maximum amplitudu}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | -----       primary: ' + m1strg + ' dB, time: ' + m1indstrg + ' s, type: ' + locmx1oznaceni[index]);
  end;
  if (max1locmx[index] = 0) then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- no primary maximum was found');
  end;
  if (max2locmx[index] <> 0) then begin
    str(SVALtime[max2locmx[index]]: 8: 3, m2indstrg);
    str(namp[index, max2locmx[index]]: 6: 2, m2strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | -----  secondary: ' + m2strg + ' dB, time: ' + m2indstrg + ' s, type: ' + locmx2oznaceni[index]);
  end;
  if (max2locmx[index] = 0) then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- no secondary maximum was found');
  end;
  if (max3locmx[index] <> 0) then begin
    str(SVALtime[max3locmx[index]]: 8: 3, m3indstrg);
    str(namp[index, max3locmx[index]]: 6: 2, m3strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | -----        tertiary: ' + m3strg + ' dB, time: ' + m3indstrg + ' s, type: ' + locmx3oznaceni[index]);
  end;
  if (max3locmx[index] = 0) then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- no tertiary maximum was found');
  end;
  if (max4locmx[index] <> 0) then begin
    str(SVALtime[max4locmx[index]]: 8: 3, m4indstrg);
    str(namp[index, max4locmx[index]]: 6: 2, m4strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- quarternary: ' + m4strg + ' dB, time: ' + m4indstrg + ' s, type: ' + locmx4oznaceni[index]);
  end;
  if (max4locmx[index] = 0) then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- no quarternary maximum was found');
  end;
  if (max5locmx[index] <> 0) then begin
    str(SVALtime[max5locmx[index]]: 8: 3, m5indstrg);
    str(namp[index, max5locmx[index]]: 6: 2, m5strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- quinternary: ' + m5strg + ' dB, time: ' + m5indstrg + ' s, type: ' + locmx5oznaceni[index]);
  end;
  if (max5locmx[index] = 0) then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- no quinternary maximum was found');
  end;
  if (max6locmx[index] <> 0) then begin
    str(SVALtime[max6locmx[index]]: 8: 3, m6indstrg);
    str(namp[index, max6locmx[index]]: 6: 2, m6strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- sixth: ' + m6strg + ' dB, time: ' + m6indstrg + ' s, type: ' + locmx6oznaceni[index]);
  end;
  if (max6locmx[index] = 0) then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- no sixth maximum was found');
  end;
  if (max7locmx[index] <> 0) then begin
    str(SVALtime[max7locmx[index]]: 8: 3, m7indstrg);
    str(namp[index, max7locmx[index]]: 6: 2, m7strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- seventh: ' + m7strg + ' dB, time: ' + m7indstrg + ' s, type: ' + locmx7oznaceni[index]);
  end;
  if (max7locmx[index] = 0) then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- no seventh maximum was found');
  end;
  if (max8locmx[index] <> 0) then begin
    str(SVALtime[max8locmx[index]]: 8: 3, m8indstrg);
    str(namp[index, max8locmx[index]]: 6: 2, m8strg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- eighth: ' + m8strg + ' dB, time: ' + m8indstrg + ' s, type: ' + locmx8oznaceni[index]);
  end;
  if (max8locmx[index] = 0) then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ----- no eighth maximum was found');
  end;
  str(anphase[index, nsampl]: 9: 2, anphasemaxstrg);
  str(anphase[index, 1]: 9: 2, anphaseminstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - phase minimum is: ' + anphaseminstrg + ' rad ...');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - ... and phase maximum is: ' + anphasemaxstrg + ' rad');

//  str(SVALtime[maxfazeindex[index]]:8:3, timestrg);
//  radek := radek + 1;
//  str(radek: 4, radekstrg);
//  memo1.Lines.Add(radekstrg + ' | - time of the phase maximum: ' + timestrg);
//  str(SVALtime[minfazeindex[index]]:8:3, timestrg);
//  radek := radek + 1;
//  str(radek: 4, radekstrg);
//  memo1.Lines.Add(radekstrg + ' | - time of the phase minimum: ' + timestrg);

  plotsigmaxi := 0;
  for eee := 2 to nsampl - 1 do begin {hleda maximum a minimum pro PlotPanel 1}
    if (amp[index, eee] > plotsigmaxi) then begin
      plotsigmaxi := amp[index, eee]; {finds the amlitude maximum of the part of signal to be drawn}
    end;
  end;
  PlotPanel1.Ymin := -1.1;
  PlotPanel1.Ymax := 1.1;
  PlotPanel1.YInterval := (1 / 3);
  vybr := 0;
  chos := chos + 1;
  Timer1.Enabled := True;
  Button3.Enabled := True;
  Button5.Enabled := True;
  Button14.Enabled := True;
end; {of the procedure, which allows to choose from a list of filtered periods}

procedure TNoSVALform.Button3Click(Sender: TObject);
var                      {kresli PUVODNI NEOREZANY monochromaticky signal a jeho obalku}
  uu, mm                          : integer;
  iiss                            : integer; {promene zkopirovane z vykreslovani celeho spektrogramu}
  bR, bG, bB                      : integer;
  brange                          : integer; {rozsah barvicek}
  bgrvelstep                      : double;
  bactgrvel                       : double;
  bborder1, bborder2, bborder3    : double;
  bamin2                          : double;
begin
  if index = 0 then begin
    ShowMessage('No filter selected');
    exit;
  end;
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 1); {monochromatic signal}
  end;
  for uu := 2 to trunc(nsampl / kraceni) do begin {for uu:= 2 to nsampl do begin}
    PlotPanel1.AddXY(SVALtime[uu * kraceni], fxsre[index, uu * kraceni] / plotsigmaxi, clSkyBlue, pp1);
  end;{to byl monochromaticky signal - NEOREZANY}
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2); {envelope}
  end;
  for mm := 2 to trunc(nsampl / kraceni) do begin {for mm:= 2 to nsampl do begin}
    PlotPanel1.AddXY(SVALtime[mm * kraceni], amp[index, mm * kraceni] / plotsigmaxi, clBlue, pp1);
  end; {a to byla jeho obalka}

  //pp1 := pp1 + 1;
  //with PlotPanel1 do begin
  //  LayerOptions(pp1, pmDot, 2); {vsechna maxima}
  //end;
  //for k := 1 to maxnumofmax do begin
  //  PlotPanel1.AddXY(SVALtime[seclocmx[index, k]], amp[index, seclocmx[index, k]] / plotsigmaxi, clWhite, pp1);
  //end; {a to byly tecky pro vsechna maxima}

  pp3 := pp3 + 1;
  with PlotPanel3 do begin   {a tedy se vykresli zavislost obalky na periode do spektrogramoveho PlotPanelu3}
    LayerOptions(pp3, pmDot, 4);
  end;
  bR := 0;
  bG := 0;
  bB := 0;
  bborder1 := 0.90;
  bborder2 := 0.75;
  bborder3 := 0.40;
  bamin2 := 1.5 * amin;
  brange := trunc((100 - bamin2)); {od "amin2" do 100}
  bgrvelstep := (grvel[2] - grvel[nsampl]) / 200;
  bactgrvel := grvel[2];
  iiss := 2;
  if hydro = False then begin
    while ((iiss < nsampl) {and (iiss > 0)}) do begin
      if ((iiss = 0) or (iiss = 1)) then iiss := 2;
      if (namp[index, iiss] <= 100) and (namp[index, iiss] > ((brange * bborder1) + bamin2)) then begin
        bR := 255;
        bG := trunc((100 - namp[index, iiss]) * (2.55 / (1 - bborder1)));
        bB := 0;
      end;
      if (namp[index, iiss] <= ((brange * bborder1) + bamin2)) and (namp[index, iiss] > ((brange * bborder2) + bamin2)) then begin
        bR := trunc((namp[index, iiss] - ((brange * bborder2) + bamin2)) * (2.55 / (bborder1 - bborder2)));
        bG := 200;
        bB := 0;
      end;
      if (namp[index, iiss] <= ((brange * bborder2) + bamin2)) and (namp[index, iiss] > ((brange * bborder3) + bamin2)) then begin
        bR := 0;
        bB := trunc((((brange * bborder2) + bamin2) - namp[index, iiss]) * (2.55 / (bborder2 - bborder3)));
      end;
      if (namp[index, iiss] <= ((brange * bborder3) + bamin2)) and (namp[index, iiss] > 0) then begin
        bR := 0;
        bB := 255;
      end;
      if (namp[index, iiss] <= ((brange * bborder2) + bamin2)) and (namp[index, iiss] > 0) then begin
        bG := trunc((namp[index, iiss] - bamin2) * (2.55 / (bborder2)));
      end;
      if bR > 255 then bR := 255;
      if bR <   0 then bR := 0;
      if bG > 255 then bG := 255;
      if bG <   0 then bG := 0;
      if bB > 255 then bB := 255;
      if bB <   0 then bB := 0;
      if instper[index, iiss] > 0 then begin
        if (instper[index, iiss] > PlotPanel3.XMin) and (instper[index, iiss] < PlotPanel3.XMax) and (grvel[iiss] > PlotPanel3.YMin) and (grvel[iiss] < PlotPanel3.YMax) then begin
          PlotPanel3.AddXY((instper[index, iiss]), grvel[iiss], RGB(bR, bG, bB), pp3);
        end;
      end;
      bactgrvel := bactgrvel - bgrvelstep;
      if bactgrvel <> 0 then begin
        iiss := trunc((((distkm / bactgrvel) - timedist) / timein) - 1 - nstart);
      end;
    end;{of while}
  end; {if to neni hydro}
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
end; {konec kresleni monochromatickeho signalu a jeho obalky}

procedure TNoSVALform.Button5Click(Sender: TObject);
var  {kresli orezany monochromaticky signal a jeho obalku}
  uu, k                         : integer;
  ciiss                         : integer; {promene zkopirovane z vykreslovani celeho spektrogramu}
  cR, cG, cB                    : integer;
  crange                        : integer;  {rozsah barvicek}
  cgrvelstep                    : double;
  cactgrvel                     : double;
  cborder1, cborder2, cborder3  : double;
  camin2                        : double;
  krokro                        : double;
begin
  truncx := True; {ze je nakresleny truncated seismogram}
  if index = 0 then begin
    ShowMessage('No filter selected');
    exit;
  end;

  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 1); {truncated monochromatic signal - REAL PART}
  end;
  for uu := 2 to trunc(nsampl / kraceni) do begin {for uu:= 2 to nsampl do begin}
    PlotPanel1.AddXY(SVALtime[uu * kraceni], fsre[index, uu * kraceni] / plotsigmaxi, clYellow, pp1);
  end; {to byl orezany monochromaticky signal}


  //pp1 := pp1 + 1;
  //with PlotPanel1 do begin
  //  LayerOptions(pp1, pmLine, 1); {truncated monochromatic signal - IMAGINARY PART}
  //end;
  //for uu := 2 to trunc(nsampl / kraceni) do begin {for uu:= 2 to nsampl do begin}
  //  PlotPanel1.AddXY(SVALtime[uu * kraceni], fsim[index, uu * kraceni] / plotsigmaxi, clWhite, pp1);
  //end; {to byl orezany monochromaticky signal}


  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2); {truncated envelope}
  end;
  for uu := 2 to trunc(nsampl / kraceni) do begin {for uu:= 2 to nsampl do begin}
    PlotPanel1.AddXY(SVALtime[uu * kraceni], famp[index, uu * kraceni] / plotsigmaxi, clRed, pp1);
  end; {a to byla jeho obalka}


  pp1 := pp1 + 1;
  with PlotPanel1 do begin {nakreslim bod, kdy prochazi faze nulou}
    LayerOptions(pp1, pmDot, 8);
  end;
  PlotPanel1.AddXY(SVALtime[zeroposition[index]], 0, clWhite, pp1); {nakresli se bod nulove faze WHITE - ten vybrany, at uz jakkoli}
  pp1 := pp1 + 1;
    with PlotPanel1 do begin {nakreslim bod, kdy prochazi faze nulou}
      LayerOptions(pp1, pmDot, 6);
    end;
  PlotPanel1.AddXY(SVALtime[zeroposition1[index]], 0, clBlue, pp1); {nakresli se bod nulove faze BLUE - prvni ZA maximem obalky}
  pp1 := pp1 + 1;
    with PlotPanel1 do begin {nakreslim bod, kdy prochazi faze nulou}
      LayerOptions(pp1, pmDot, 6);
    end;
  PlotPanel1.AddXY(SVALtime[zeroposition2[index]], 0, clBlue, pp1); {nakresli se bod nulove faze BLUE - prvni PRED maximem obalky}
  pp1 := pp1 + 1;
    with PlotPanel1 do begin {nakreslim bod, kdy prochazi faze nulou}
      LayerOptions(pp1, pmDot, 6);
    end;
  PlotPanel1.AddXY(SVALtime[zeroposition3[index]], 0, clBlue, pp1); {nakresli se bod nulove faze}
  pp1 := pp1 + 1;
      with PlotPanel1 do begin {nakreslim bod, kdy prochazi faze nulou}
        LayerOptions(pp1, pmDot, 6);
      end;
  PlotPanel1.AddXY(SVALtime[zeroposition4[index]], 0, clBlue, pp1); {nakresli se bod nulove faze}

  pp1 := pp1 + 1;
      with PlotPanel1 do begin
        LayerOptions(pp1, pmDot, 6);
      end;
  PlotPanel1.AddXY(zerophasetime[index], 0, clGreen, pp1);        {nakresli se bod nulove faze spocteny z okamzite faze pod maximem obalky}

  pp3 := pp3 + 1;
  with PlotPanel3 do begin   {a tedy se vykresli zavislost obalky na periode do spektrogramoveho PlotPanelu}
    LayerOptions(pp3, pmDot, 4);
  end;
  cR := 0;
  cG := 0;
  cB := 0;
  cborder1 := 0.90;
  cborder2 := 0.75;
  cborder3 := 0.40;
  camin2 := 1.5 * amin;
  crange := trunc((100 - camin2)); {od "amin2" do 100}
  cgrvelstep := (grvel[2] - grvel[nsampl]) / 200;
  cactgrvel := grvel[2];
  ciiss := 1;
  while ((ciiss < nsampl) {and (ciiss > 0)}) {upperzerosampl[index]} do begin
    if ((ciiss = 0) or (ciiss = 1)) then ciiss := 2;
    if (fnamp[index, ciiss] <= 100) and (fnamp[index, ciiss] > ((crange * cborder1) + camin2)) then begin
      cR := 255;
      cG := trunc((100 - fnamp[index, ciiss]) * (2.55 / (1 - cborder1)));
      cB := 0;
    end;
    if (fnamp[index, ciiss] <= ((crange * cborder1) + camin2)) and (fnamp[index, ciiss] > ((crange * cborder2) + camin2)) then begin
      cR := trunc((fnamp[index, ciiss] - ((crange * cborder2) + camin2)) * (2.55 / (cborder1 - cborder2)));
      cG := 200;
      cB := 0;
    end;
    if (fnamp[index, ciiss] <= ((crange * cborder2) + camin2)) and (fnamp[index, ciiss] > ((crange * cborder3) + camin2)) then begin
      cR := 0;
      cB := trunc((((crange * cborder2) + camin2) - fnamp[index, ciiss]) * (2.55 / (cborder2 - cborder3)));
    end;
    if (fnamp[index, ciiss] <= ((crange * cborder3) + camin2)) and (fnamp[index, ciiss] > 0) then begin
      cR := 0;
      cB := 255;
    end;
    if (fnamp[index, ciiss] <= 100) and (fnamp[index, ciiss] > ((crange * cborder2) + camin2)) then begin
      {     cG := trunc((100-fnamp[index,iis])*(2.55/(1-cborder2)));}
    end;
    if (fnamp[index, ciiss] <= ((crange * cborder2) + camin2)) and (fnamp[index, ciiss] > 0) then begin
      cG := trunc((fnamp[index, ciiss] - camin2) * (2.55 / (cborder2)));
    end;
    if cR > 255 then cR := 255;
    if cR <   0 then cR := 0;
    if cG > 255 then cG := 255;
    if cG <   0 then cG := 0;
    if cB > 255 then cB := 255;
    if cB <   0 then cB := 0;
    if (instper[index, ciiss] > 0) and (fnamp[index, ciiss] = 0) then begin {premazu to, co je orezane}
      if (instper[index, ciiss] > PlotPanel3.XMin) and (instper[index, ciiss] < PlotPanel3.XMax) and (grvel[ciiss] > PlotPanel3.YMin) and (grvel[ciiss] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY((instper[index, ciiss]), grvel[ciiss], RGB(0, 0, 0), pp3);
      end;
    end;
    if (instper[index, ciiss] > 0) and (fnamp[index, ciiss] > 0) then begin
      if (instper[index, ciiss] > PlotPanel3.XMin) and (instper[index, ciiss] < PlotPanel3.XMax) and (grvel[ciiss] > PlotPanel3.YMin) and (grvel[ciiss] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY((instper[index, ciiss]), grvel[ciiss], RGB(cR, cG, cB), pp3);
      end;
    end;
    cactgrvel := cactgrvel - cgrvelstep;
    ciiss := trunc((((distkm / cactgrvel) - timedist) / timein) - 1 - nstart);
  end;{of while - konec vykreslovani obalky do PlotPanelu3}
  {tady nakreslim do spektrogramovskeho PlotPanelu3 misto, kde faze prochazi nulou}
  PlotPanel3.AddXY(instper[index, zeroposition[index]], grvel[zeroposition[index]], clWhite, pp3);
  pp1 := pp1 + 1;  {tady nakreslim mista, ve kterych je puvodni obalka orezana}
  krokro := (PlotPanel1.Ymax - PlotPanel1.YMin) / 30; {krok pro malovani bodiku misto cary}
  with PlotPanel1 do begin
    LayerOptions(pp1, pmDot, 1);
  end;
  for k := 0 to 30 do begin
    PlotPanel1.AddXY(SVALtime[uppersampl[index]] , (PlotPanel1.YMin + k * krokro), clWhite, pp1);
    PlotPanel1.AddXY(SVALtime[lowersampl[index]] , (PlotPanel1.YMin + k * krokro), clWhite, pp1);
    PlotPanel1.AddXY(SVALtime[upperzerosampl[index]], (PlotPanel1.YMin + k * krokro), clWhite, pp1);
    PlotPanel1.AddXY(SVALtime[lowerzerosampl[index]], (PlotPanel1.YMin + k * krokro), clWhite, pp1);
  end;
  if nasilne = True then begin {tady nakreslim kotovani, ze se jedna o fixni orezani, pokud je zvoleno}
    pp1 := pp1 + 1;
    with PlotPanel1 do begin
      LayerOptions(pp1, pmLine, 1);
    end;
    PlotPanel1.AddXY(SVALtime[uppersampl[index]], trunc({plotsigmaxi}1 / 2), clWhite, pp1);
    PlotPanel1.AddXY(SVALtime[lowersampl[index]], trunc({plotsigmaxi}1 / 2), clWhite, pp1);
    pp1 := pp1 + 1;
    with PlotPanel1 do begin
      LayerOptions(pp1, pmLine, 1);
    end;
    PlotPanel1.AddXY(SVALtime[uppersampl[index]], trunc(-1{plotsigmaxi} / 2), clWhite, pp1);
    PlotPanel1.AddXY(SVALtime[upperzerosampl[index]], trunc(-1{plotsigmaxi} / 2), clWhite, pp1);
    pp1 := pp1 + 1;
    with PlotPanel1 do begin
      LayerOptions(pp1, pmLine, 1);
    end;
    PlotPanel1.AddXY(SVALtime[lowersampl[index]], trunc(-1{plotsigmaxi} / 2), clWhite, pp1);
    PlotPanel1.AddXY(SVALtime[lowerzerosampl[index]], trunc(-1{plotsigmaxi} / 2), clWhite, pp1);
    Posunnapisu(Sender);
  end;{if nasilne = true}
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
end; {konec kresleni orezaneho signalu a jeho obalky}

procedure TNoSVALform.Button47Click(Sender: TObject);
var {pocitani a kresleni kompletniho filtrovani; do teto procedury vstupuje VZDY pole rawsre, tedy ze souboru nacteny signal, pouze se zhlazenymi okraji, ktery nebyl nikdy menen}
  uu, i, k                    : integer;
  complfiltpowfrqnfminstrg    : string;
  complfiltpowfrqnfmaxstrg    : string;
  zvetsit                     : word;
  kousicek                    : double;
begin
  zmacknulbandpass := True;
  if zemy = False then begin  {pokud jsem v tomhle miste zmacknutim BandPass}
    ema := False;             {tak vypnu to, ze delam EMU, abych delal i normalni BandPass}
  end;                        {ale pokud jsem v tomhle miste byl diky zmacknuti EMA, tak delam EMu}
  memo1.Lines.Add('------------------------------------------------------------------------');
  if ema = False then begin
    if doublebandpass = False then begin
      perfltminstrg := edit19.Text;
      {minimalni a maximalni perioda celkoveho filtrovani}
      val(perfltminstrg, perfltmin, cd);
      perfltmaxstrg := edit20.Text;
      val(perfltmaxstrg, perfltmax, cd);
    end;
    if doublebandpass = True then begin         {pokud delam dvojite filtrovani}
      if prvnidoublebandpass = True then begin  {pro prvni beh dvojiteho filtrovani}
        perfltminstrg := BatchForm.edit4.Text;  {minimalni a maximalni perioda celkoveho filtrovani}
        val(perfltminstrg, perfltmin, cd);
        perfltmaxstrg := BatchForm.edit5.Text;
        val(perfltmaxstrg, perfltmax, cd);
      end;
      if prvnidoublebandpass = False then begin {druhy beh dvojiteho filtrovani}
        perfltminstrg := BatchForm.edit6.Text;  {minimalni a maximalni perioda celkoveho filtrovani}
        val(perfltminstrg, perfltmin, cd);
        perfltmaxstrg := BatchForm.edit7.Text;
        val(perfltmaxstrg, perfltmax, cd);
      end;
    end; {if doublebandpass = true}
  end; {if ema = false}
  if ema = True then begin
    perfltminstrg := edit22.Text;   {minimalni perioda EMA filtrovani, maximalni je nekonecno}
    val(perfltminstrg, perfltmin, cd);
    perfltmax := 0;
  end;
  for i := 1 to n do begin        {do imaginarni casti signalu se vlozi nuly}
    rawsim[i] := 0.0;                  {"sim" = "Signal IMaginarni"}
  end;
  for i := nsampl + 1 to n do begin       {do zbytku realneho signalu se take vlozi nuly}
    rawsre[i] := 0.0;                   {"sre" = "Signal REalny"}
  end;
  setlength(cinput, (2 * supermaxsamples) + 1); //  setlength(cinput,(2*n)+1);
  for i := 0 to (2 * n) do begin
    cinput[i] := 0.0;
  end;
  for i := 1 to n do begin            {slozi se vstupni datove pole pro FFT}
    cinput[2 * i - 1] := rawsre[i];        {"cinput" = "Complex INPUT"}
    cinput[2 * i] := rawsim[i];
  end;
  four1(cinput, n, +1);                {spocte se spektrum realneho signalu}
  nhlf := trunc(n / 2);                 {dalsi operace budu delat jenom pro pulku spektra}
  for i := 1 to n do begin      {a opet se rozlozi vystupni datove pole na realnou a imaginarni cast}
    xfre[i] := cinput[2 * i - 1] / nhlf;    {"fre" = "Frekvence (oblast) REalna"}
    xfim[i] := cinput[2 * i] / nhlf;      {"fim" = "Frekvence (oblast) IMaginarni"}
  end;
  if ema = False then begin
    alphamin := alphaabs + (alphadir * perfltmin); {alfy pro kompletni filtrovani}
    alphamax := alphaabs + (alphadir * perfltmax);
    if alphacheck = False then begin
      if (alphamax < 0.00001) then begin
        alphamax := 0.00001;
      end;
      if (alphamin < 0.00001) then begin
        alphamin := 0.00001;
      end;
    end;
    if alphacheck = True then begin
      if (alphamax < 7) then begin
        alphamax := 7;
      end;
      if (alphamin < 7) then begin
        alphamin := 7;
      end;
    end;
    nfmin := trunc(((n - 1) * timein) / perfltmin + 0.5);  {stanovuju "centralni" frekvence pro kompletni filtrovani}
    nfmax := trunc(((n - 1) * timein) / perfltmax + 0.5);
  end; {if ema je false}
  if ema = True then begin
    nfmin := trunc(((n - 1) * timein) / perfltmin + 0.5);  {kdyz perfltmin je perioda, tak nfmin je frekvence ve vzorkach spektra}
  end;
  if ema = False then begin
    completefilter(nfmin, nfmax, alphamin, alphamax);      {vola se procedurka pro kompletni filtrovani}
  end;
  if ema = True then begin
    completeEMA(nfmin); {vola se procedurka pro EMA filtrovani}
  end;
  for i := 1 to nhlf do begin                       {pocitam amplitudove spektrum kompletniho filtrovani}
    complfiltpowfrq[i] := sqrt(complffre[i] * complffre[i] + complffim[i] * complffim[i]);
  end;
  hlfamx := 0.0;
  {"hlfamx" nastavime nejprve na nulu a pak do nej vkladame takove "complfiltpowfrq(i)", ktere jsou vetsi nez cokoli predchoziho}
  {tohle je obecne jinak velke hlfamx, nez to, co se pocita pro spektrum, proto nesouhlasi vykreslovani spektra ve spektralnim okne, ale po prekresleni si to sedne na sebe}
  for i := 1 to nhlf do begin
    if (complfiltpowfrq[i] > hlfamx) then begin
      hlfamx := complfiltpowfrq[i];
    end;
  end;                                  {tim mame v "hlfamx" absolutne nejvetsi amplitudu}
  for i := 1 to nhlf do begin
    hlfb := complfiltpowfrq[i] / hlfamx;  {"hlfb" je pomer aktualni amplitudy k te nejvetsi}
    {pro nejvetsi amplitudu je hlfb = 1 a tedy npowfrq = 100, pro npowfrq = 0 musi byt log(b)= -5}
    {a tedy musi b=10e-5, tedy minimalni amplituda je 100000krat mensi nez maximalni amplituda}
    complfiltnpowfrq[i] := (20.0 * log10(hlfb + 1.0e-10) + 100.0);
    {"npowfrq" = "Normalizovana POWer FReQuency", tohle pak vykresluju jako normalizovane spektrum}
    {log pomeru max a min amplitudy je tedy 5, a tedy rozsah je 100db}
    if (complfiltnpowfrq[i] < 0) then complfiltnpowfrq[i] := 0; {zaopatrime i pripadne zaporne hodnoty}
  end;
  Whit(Sender, complfiltpowfrq, complffre, complffim);  {zavolam procedurku na whitening spektra a jako vstup ji dam to kompletne filtrovane spektrum}
  if ema = False then  begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - range-filtered amplitude spectrum was normalized');
  end;
  if ema = True then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - EMA-filtered amplitude spectrum was normalized');
  end;
  if ema = False then begin
    for i := 1 to trunc(nfmax) do begin {delam si zvetsene ukazky filtru pro kresleni do PlotPanelu spektralniho okna}
      wcw[i] := wc[i] * complfiltpowfrq[trunc(nfmax)];   {tedy wcw je pusobici filtr s velikosti odpovidajici pusobenemu spektru}
    end;
    for i := (trunc(nfmax) + 1) to (trunc(nfmin) - 1) do begin
      wcw[i] := 0; {wc[i]*((complfiltpowfrq[nfmax]+complfiltpowfrq[nfmin])/2);}
    end;
    for i := trunc(nfmin) to nhlf do begin
      wcw[i] := wc[i] * complfiltpowfrq[trunc(nfmin)];
    end;
    str(complfiltpowfrq[trunc(nfmax)]: 13: 6, complfiltpowfrqnfmaxstrg);
    str(complfiltpowfrq[trunc(nfmin)]: 13: 6, complfiltpowfrqnfminstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | -      set min per of bandpass is: ' + perfltminstrg + ' s, ampl:' + complfiltpowfrqnfminstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | -      set max per of bandpass is: ' + perfltmaxstrg + ' s, ampl:' + complfiltpowfrqnfminstrg);
  end; {if ema = false}
  if ema = True then begin
    for i := 1 to nhlf do begin {delam si zvetsene ukazky filtru pro kresleni do PlotPanelu spektralniho okna}
      wcw[i] := wc[i] * complfiltpowfrq[trunc(nfmin)];
      {tedy wcw je pusobici filtr s velikosti odpovidajici pusobenemu spektru}
    end;
  end;
  for i := 1 to nhlf do begin
    hlfbwc := wcw[i] / hlfamx;
    if complfiltpowfrq[i] <> 0 then begin
      nwc[i] := (20.0 * log10(hlfbwc + 1.0e-10) + 100); {normalizovany pusobici filtr}
    end;
  end;
  nspek := n;
  nsamplspek := nsampl - 1;  {ulozim si sem pocet tech intervalu, a tech je o jeden min, nez vzorku}
  n2powspek := n2pow;
  timeinspek := timein;      {moznost prodlouzit spektrum nulama na vyssi mocninou dvou pro lepsi vzorkovani v case}
  if hydro then begin
    while ((n2powspek <= nejmoc) and (trunc(power(2, n2powspek)) < supermaxsamples)) do begin
      nakt := trunc(power(2, n2powspek));
      str(nakt, naktstrg);
      str(n2powspek, n2powspekstrg);
      zvetsit := MessageDlg('Power of 2 set according to the number of samples is 2^' + n2powspekstrg + ' = ' + naktstrg + '. Do you want to increase it?', mtConfirmation, [mbYes, mbNo], 0);
      if zvetsit = mrNo then break;
      if zvetsit = mrYes then begin
        n2powspek := n2powspek + 1;
        nspek := nspek * 2;  {"nspek" - samples entering the FFT}
        nsamplspek := nsamplspek * 2;  {zvojnasobim pocet intervalu}
        str(nspek, nspekstrg);
        timeinspek := timeinspek / 2;
        if (nspek = supermaxsamples) then begin
          ShowMessage('You reached the maximal number 2^' + n2powspekstrg + ' = ' + supermaxsamplesstrg + '  of samples set in the memory. To continue increasing, set higher option.');
        end;
      end;
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - the number of samples for inverse FFT was increased to the value of ' + nspekstrg);
    end;
  end; {if hydro}
  {jeste jednicku prictu, protoze mi jde o pocet vzorku, a tech je o jeden vic, ne tech intervalu}
  nsamplspek := nsamplspek + 1;
  if CheckBox8.Checked = False then begin   {chci prevest filtrovane spektrum}
    for i := 1 to n do  begin            {nyni se prevede vyfiltrovane spektrum zpet do casu,}
      cinput[2 * i - 1] := complffre[i];      {slozi se vstupni datove pole pro inverzni FFT}
      cinput[2 * i] := complffim[i];
    end;
  end;
  if CheckBox8.Checked = True then begin    {chci prevest filtrovane a jeste k tomu whitened spektrum}
    for i := 1 to n do begin            {nyni se prevede vyfiltrovane spektrum zpet do casu,}
      cinput[2 * i - 1] := whitenedRe[i];      {slozi se vstupni datove pole pro inverzni FFT}
      cinput[2 * i] := whitenedIm[i];      {to whitened mam dycky, protoze se dycky spocte pri Analysis}
    end;
  end;
  if nspek > n then begin {pokud jsem prodluzoval}
    for i := n + 1 to nspek do  begin
      cinput[2 * i - 1] := 0; {pokud jsem to prodlouzil, nacpu tam nuly}
      cinput[2 * i] := 0;
    end;
  end;
  four1(cinput, nspek, -1);    {spocte se signal (casova oblast) k danemu vyfiltrovanemu spektru - puvodne tady bylo -1}
  for i := 1 to nspek do begin {a opet se rozlozi vystupni datove pole na realnou a imaginarni cast}
    complfsre[i] := cinput[2 * i - 1]; {tady muzu mit dve moznosti: budto jenom bandpassfiltrovany, anebo whitened bandpassfiltrovany}
    complfsim[i] := cinput[2 * i];
  end;
  {pocitani obalky a faze bandpassfiltrovaneho signalu v case}
  for i := 1 to nsamplspek do begin {cykly pres vzorky jsou vzdy "i" nebo "ii",}
    complamp[i] := sqrt(complfsre[i] * complfsre[i] + complfsim[i] * complfsim[i]);  {spocte se amplituda obalky}
    complphase[i] := -arctan2(complfsim[i], (complfsre[i] + 0.000000001));
  end; {for i}
  {posunuti o 2*pi tak, aby phase byla monotonni}
  for i := 1 to nsampl - 1 do begin
    if (complphase[i] - complphase[i + 1] >= 1.0) then begin
      for k := i + 1 to nsampl do begin             {od toho icka, kde nastaval skok, az dokonce}
        complphase[k] := complphase[k] + 2 * pi;
      end;{of for :k:}
    end;{of if / konec posouvani o pi}
  end;{of for :i:}
  {odectu od faze jeji trend}
  kousicek := 0;
  for i := 1 to nsampl - 1 do begin
    kousicek := kousicek + complphase[i + 1] - complphase[i];   {sectu si vsechny rozdily mezi vzorky}
  end;
  kousicek := kousicek / nsampl;
  {spoctu prumerny rozdil mezi vzorky, tedy neco jako prumernou derivaci}
  if kousicek < 0.0000001 then begin
    kousicek := kousicek * 100;
    for i := 1 to nsampl do begin
      complphase[i] := complphase[i] * 100;
    end;
  end;
  if kousicek < 0.00000001 then begin
    kousicek := kousicek * 100;
    for i := 1 to nsampl do begin
      complphase[i] := complphase[i] * 100;
    end;
  end;
  if kousicek < 0.000000001 then begin
    kousicek := kousicek * 100;
    for i := 1 to nsampl do begin
      complphase[i] := complphase[i] * 100;
    end;
  end;
  for i := 1 to nsampl do begin  {odectu od faze jeji trend}
    complphase[i] := complphase[i] - kousicek * (i - 1);
  end;
  complsigmaxi := 0;
  for i := 1 to nspek do begin {najdeme maximum toho correctovaneho signalu}
    if complfsre[i] > complsigmaxi then begin
      complsigmaxi := complfsre[i];
    end;
  end;
  for i := 1 to nsamplspek do begin
    SVALtimeSPEK[i] := (nstart - 1) * timein + ((i - 1) * timeinspek) + timedist;
  end;
  str(SVALtimeSPEK[1]: 8: 4, zacatekstrg);
  str(SVALtimeSPEK[nsamplspek]: 8: 4, konecstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - processed part of the signal starts at ' + zacatekstrg + ' s from origin time');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - processed part of the signal ends at    ' + konecstrg + ' s from origin time');
  dur := timeinspek * (nsamplspek - 1);
  str(dur: 5: 3, durstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - the duration of the input signal is ' + durstrg + ' seconds');
  cfs := cfs + 1;
  if panely then begin
    with PlotPanel2 do begin
      LayerOptions(cfs, pmLine, 1);
    end;
    for uu := 2 to trunc(nsamplspek / kraceni) do begin {for uu:= 2 to nsampl do begin}
      PlotPanel2.AddXY(SVALtimeSPEK[uu * kraceni], complfsre[uu * kraceni] / complsigmaxi, RGB(255, 0, 255), cfs);
    end;
  end; {if panely}
  RadioGroup5.Enabled := True;
  SpectrumForm.Button22.Enabled := True;
  SpectrumForm.Button16.Enabled := True; { Filterd spec }
  SpectrumForm.Button29.Enabled := True; { Smoothed }
  SpectrumForm.Button30.Enabled := True; { Whitened }
  SpectrumForm.Button31.Enabled := True; { Fi-Re }
  SpectrumForm.Button32.Enabled := True; { Fi-Im }
  SpectrumForm.Button33.Enabled := True; { W-Re }
  SpectrumForm.Button34.Enabled := True; { W-Im }
  bandpass := True;
  if panely then begin
    Button2.Enabled := True; {dovolim kreslit i obalku bandpassfiltru}
  end; {if panely}
  button15.Enabled := True; {ulozeni zaznamu}
  zemy := False; {nastavim, jakoze jsem nezmackl EMA}
  udelalopraveny := False;
  {zrusim prapadne prepinac, ktery rikal, ze jsem udelal corrected casovy signal, je to kvuli vypoctu obalky}
  if hydro = false then begin
    Ukazcarky;
    Ukazrychlosti; //(Sender);
  end;
end; {to bylo pocitani a kresleni kompletniho filtrovani}

procedure TNoSVALform.Button49Click(Sender: TObject);
begin
  ema  := True; {ze se ma delat EMA, coz ovlivnuje dalsi procedury}
  zemy := True; {ze jsem to poslal do procedury pro BandPass odsud}
  Button47Click(Sender); {zmacknu proceduru pro BandPass filtr, ale protoze EMA bude true, tak se pojede trosku jinak}
  if hydro = false then begin
    Ukazcarky;
    Ukazrychlosti;
  end;
end; {konec EMA filtru}

procedure TNoSVALform.Button2Click(Sender: TObject);
var {kresleni obalky bandpass filterovaneho signalu a pocitani a kresleni zhlazene obalky}
  uu, j, k, i        : integer;
  delkazhlazeni      : integer;
begin
  for i := 1 to nsamplspek do begin
    zhlazena[i] := 0;
  end;
  {spocitam zhlazenou verzi obalky a pak s ni dale vydelim realnou cast bandpass filtrovaneho signalu, abych trochu vyrovnal amplitudy}
  val(Edit26.Text, winlen, cd);                 {prectu delku zhlazovaciho okna pro cas}
  pulwinlen := trunc((winlen - 1) / 2);             {pulka delky zhlazovaciho okna}
  if udelalopraveny = False then begin {kdyz je to pro bandpass}
    for j := 1 to pulwinlen do begin {prvni kousek zhlazeneho se bude rovnat puvodnimu}
      zhlazena[j] := complamp[j];
    end;
    for j := nsamplspek - pulwinlen to nsamplspek do begin {posledni kousek zhlazeneho se bude rovnat puvodnimu}
      zhlazena[j] := complamp[j];
    end;
    for j := pulwinlen + 1 to nsamplspek - pulwinlen - 1 do begin     {a vnitrni cast zhladim}
      for k := 1 to winlen do begin                                   {v delce toho zhlaovaciho okna}
        zhlazena[j] := zhlazena[j] + complamp[j - pulwinlen + k - 1]; {sectu vzorky pres okno}
      end; {for k}
      zhlazena[j] := zhlazena[j] / winlen;                            {a vydelim je delkou okna, tedy delam klouzavy prumer}
    end; {for j}
    for i := 1 to nsamplspek do begin
      vyrovnany[i] := complfsre[i] / complamp[i] * zhlazena[i];       {realnou cast bandpass filtrovaneho signalu vydelim obalkou a vynasobim naopak zhlazenou obalkou a tim vyrovnam amplitudy}
    end;
    cfs := cfs + 1;
    with PlotPanel2 do begin
      LayerOptions(cfs, pmLine, 1);
    end;
    for uu := 2 to trunc(nsampl / kraceni) do begin {kreslim obalku banspass filtrovaneho zaznamu}
      PlotPanel2.AddXY(SVALtime[uu * kraceni], complamp[uu * kraceni] / complsigmaxi, RGB(255, 0, 255), cfs);
    end;
    //cfs := cfs + 1; {namaluju zhlazenou obalku, at uz vznikla jakkoli}
    //with PlotPanel2 do begin
    //  LayerOptions(cfs, pmLine, 1);
    //end;
    //for uu := 2 to trunc(nsampl / kraceni) do begin {kreslim zhlazenou obalku bandpass filtrovaneho zaznamu}
    //  PlotPanel2.AddXY(SVALtime[uu * kraceni], zhlazena[uu * kraceni] / complsigmaxi, RGB(50, 255, 100), cfs);
    //end;
  end; {if to bylo pro bandpass filtrovany}

  if udelalopraveny then begin {kdyz je to pro corrected pote, co byl pouzit filtrovany}
    for j := 1 to pulwinlen do begin {prvni kousek zhlazeneho se bude rovnat puvodnimu}
      zhlazena[j] := EnvCorrS[j];
    end;
    for j := nsamplspek - pulwinlen to nsamplspek do begin {posledni kousek zhlazeneho se bude rovnat puvodnimu}
      zhlazena[j] := EnvCorrS[j];
    end;
    for j := pulwinlen + 1 to nsamplspek - pulwinlen - 1 do begin     {a vnitrni cast zhladim}
      for k := 1 to winlen do begin                                   {v delce toho zhlaovaciho okna}
        zhlazena[j] := zhlazena[j] + EnvCorrS[j - pulwinlen + k - 1]; {sectu vzorky pres okno}
      end; {for k}
      zhlazena[j] := zhlazena[j] / winlen;
      {a vydelim je delkou okna, tedy delam klouzavy prumer}
    end; {for j}

    delkazhlazeni := 5;
    for i := prvniodraz - delkazhlazeni to posledniodraz do begin       {a mezi temito indexy - minus jeste delka zhlazeni, ktere aplikuju vzapeti}
      zhlazena[i] := ((zhlazena[i] / corrsigmaxi) + 0.2) * corrsigmaxi; {odrazim obalku od nuly tim, ze prictu neco nahulvata a pak zpatky vratim zhlazene obalce jeji skutecnou velikost}
    end;
    for i := prvniodraz - delkazhlazeni to prvniodraz do begin                               {a chvili pred tim prvnim nasazenim to zhladim}
      f := 0.5 * (1.0 - cos(pi * (i - (prvniodraz - delkazhlazeni)) / (delkazhlazeni + 1))); {this is the smoothing cosine window}
      zhlazena[i] := zhlazena[i] * f;
    end;
    for i := 1 to prvniodraz - delkazhlazeni do begin                              {a uplne pred tim zhlazenim to uplne vynuluju}
      zhlazena[i] := 0;
    end;
    for i := 1 to nw do begin                         {zhladim konec zhlazene obalky}
      f := 0.5 * (1.0 - cos(pi * (i - 1) / nw));        {this is the smoothing cosine window}
      zhlazena[nsampl + 1 - i] := zhlazena[nsampl + 1 - i] * f; {it smooths the end of the signal}
    end;

    for i := 1 to nsamplspek do begin
      vyrovnany[i] := CorrSRe[i] / EnvCorrS[i] * zhlazena[i];  {realnou cast corrected signalu vydelim jeho vlastni obalkou (takze vsechny se rovna jednicce) a vynasobim naopak zhlazenou obalkou a tim vyrovnam amplitudy}
    end;

    //cfs := cfs + 1; {namaluju zhlazenou obalku, at uz vznikla jakkoli}
    //with PlotPanel2 do begin
    //  LayerOptions(cfs, pmLine, 1);
    //end;
    //for uu := 2 to trunc(nsampl / kraceni) do begin {kreslim jenom zhlazenou obalku, protoze originalni obalku correcet signalu muzu kreslit jinym tlacitkem}
    //  PlotPanel2.AddXY(SVALtime[uu * kraceni], zhlazena[uu * kraceni] / corrsigmaxi, RGB(50, 255, 100), cfs);
    //end;
  end; {if to bylo pro corrected}

  {tady mam zhlazenou obalku budto pro bandpass, anebo pro corrected}
  {a taky mam vyrovnany, coz je signal vznikly pomoci te zhlazene obalky a to zase bud pro bandpass, nebo pro corrected}
  if hydro = false then begin
    Ukazcarky;
    Ukazrychlosti;
  end;
end; {konec kresleni obalky bandpass filtrovaneho signalu}

procedure TNoSVALform.Button4Click(Sender: TObject);
begin {maze graf pro monochromaticke signaly}
  PlotPanel1.ClearData;
  pp1 := 0;
  truncx := False; {ze neni nakresleny truncated kanal}
  label36.Visible := False; {fixed}
  label37.Visible := False; {fixed}
  label38.Visible := False; {fixed}
end;

procedure TNoSVALform.Najdinasazeni(Sender: TObject; vstupsighledej: array of double);
var
  i, k, uu: integer;
  maxSTALTA: double;
  meanSTALTA: double;
begin               {udelam STA / LTA trigger, abych chytil zacatek popripade i konec signalu}
  prvniodraz := 1;  {aby tam byla nejaka hodnota i kdyz to nic nenajde}
  posledniodraz := nsampl;                           {to same pro konec}
  LTAlen := 200;
  STAlen := 40;
  for i := LTAlen to nsampl do begin     {zacinam ne od jednicky, ale az od vzorku v delce toho LTA, abych mel co poscitavat}
    LTA[i] := 0;                         {startovaci hodnota je nula}
    STA[i] := 0;
    for k := i - LTAlen + 1 to i do begin    {obe hranice k bezi jako i, ale ta prvni je posunuta o LTAlen nize}
      LTA[i] := LTA[i] + abs(vstupsighledej[k]);
      {udelam to na uplne prapuvodnim nefiltrovanem neopravenem signalu}
    end;
    for k := i - STAlen + 1 to i do begin    {obe hranice k bezi jako i, ale ta prvni je posunuta o LTAlen nize}
      STA[i] := STA[i] + abs(vstupsighledej[k]);
    end;
    LTA[i] := LTA[i] / LTAlen;
    {udelam prumer, tedy soucet vydelim poctem vzorku}
    STA[i] := STA[i] / STAlen;
  end;
  {zde mam LTA pro vzorek i spocteny jako prumer predchozich LTAlen vzorku a stejne tak STA pro STAlen vzorku}

  maxSTALTA := 0;                        {napred nastavim maximum na nulu}
  for i := LTAlen to nsampl do begin     {projedu ten pomer a najdu jeho maximum}
    if STA[i] / LTA[i] > maxSTALTA then
      maxSTALTA := STA[i] / LTA[i];
  end;
  meanSTALTA := 0;
  for i := LTAlen to nsampl do begin     {projedu ten pomer a najdu jeho stredni hodnotu = prumer}
    meanSTALTA := meanSTALTA + STA[i] / LTA[i];
  end;
  meanSTALTA := meanSTALTA / (nsampl - LTAlen);
  for i := LTAlen to nsampl do begin     {projedu ten pomer}
    if STA[i] / LTA[i] > (((maxSTALTA - meanSTALTA) / 3) + meanSTALTA) then begin  {a kdyz bude vetsi nez nejaka cast maxima - to delam proto, abych to naskaloval pro ruzne stanice, natvrdo cisla moc nefungovalo}
      prvniodraz := i - trunc(STAlen);
      {zapamatuju si prvni takovy index a odectu od nej delku, kterou potrebovalo STA aby se zvetsilo}
      break;                             {vyskocim z cylku for}
    end;
  end;
  //    for i := prvniodraz+STAlen+1 to nsamplspek do begin {projedu ten pomer ale uz jenom dal, od jiz nalezeneho prvniho nasazeni}
  //      if STA[i]/LTA[i] < 0.2 then begin      {a kdyz to bude mensi nez 2}
  //        posledniodraz := i-STAlen;         {zapamatuju si prvni takovy index, tedy konec jevu}
  //        break;
  //      end;
  //    end;
  cfs := cfs + 1;
  with NoSVALform.PlotPanel2 do begin
    LayerOptions(cfs, pmLine, 1);
  end;
  for uu := 2 to trunc(nsampl / kraceni) do begin      {for uu := 2 to nsampl do begin}
    if LTA[uu * kraceni] <> 0 then begin               {namaluju ten pomer s odectenou stredni hodnoutou, aby se to malovalo kolem nuly}
      NoSVALform.PlotPanel2.AddXY(SVALtime[uu * kraceni],(STA[uu * kraceni] / LTA[uu * kraceni] - meanSTALTA), clYellow, cfs);
    end;
  end;
  {vykresluju seismogram deleny nejvyssi hodnotou, aby mel maximalne amplitudu = 1}
  cfs := cfs + 1;                                    {namaluju prvni nasazeni}
  with NoSVALform.PlotPanel2 do begin
    LayerOptions(cfs, pmLine, 2);
  end;
  NoSVALform.PlotPanel2.AddXY(SVALtime[prvniodraz], (NoSVALform.PlotPanel2.YMin), clYellow, cfs);
  NoSVALform.PlotPanel2.AddXY(SVALtime[prvniodraz], (NoSVALform.PlotPanel2.YMax), clYellow, cfs);
end; {of procedure Najdinasazeni}

procedure TNoSVALform.Button6Click(Sender: TObject);
var {kresli puvodni seismogram}
  uu, i     : integer;
begin
  cfs := cfs + 1;
  with PlotPanel2 do begin
    LayerOptions(cfs, pmLine, 1);
  end;
  for uu := 2 to trunc(nsampl / kraceni) do begin      {for uu := 2 to nsampl do begin}
    PlotPanel2.AddXY(SVALtime[uu * kraceni], sre[uu * kraceni] / sigmaxi, clSkyBlue, cfs);
  end;
  {vykresluju seismogram deleny nejvyssi hodnotou, aby mel maximalne amplitudu = 1}

  if batchproces = False then begin
    cfs := cfs + 1;                                    {vykreslim take zhlazovaci okno, ale jen kdyz nejsem v batchi, protoze v batchi to zdrzuje}
    for i := 1 to nw do begin                          {cyklus pres vzorky okna}
      f := 0.5 * (1.0 - cos(pi * (i - 1) / nw));       {this is the smoothing cosine window}
      PlotPanel2.AddXY(SVALtime[i], f, clGreen, cfs);  {napocitavam ho znova, protoze to neni pole, ale jen cislo}
    end;
    cfs := cfs + 1;                                    {koncova cast zhlazovaciho okna}
    for i := 1 to nw do begin                          {it smooths the edges of processed part of signal}
      f := 0.5 * (1.0 - cos(pi * (i - 1) / nw));       {this is the smoothing cosine window}
      PlotPanel2.AddXY(SVALtime[nsampl + 1 - i], f, clGreen, cfs);
    end;
  end; {if batchproces = false}

  if hydro = false then begin
    Ukazcarky;
    Ukazrychlosti;
  end;
  //Najdinasazeni(Sender, rawsre);                     {zavolam procedurku na nalezeni prvniho nasazeni, jako vstup ji dam puvodni syrovy zaznam}
end;{konec kresleni puvodniho seismogramu}

procedure TNoSVALform.Button34Click(Sender: TObject);
var {pocita a kresli filtrovany seismogram pro vybrane periody}
  uu, i, j  : integer;
begin
  for i := 1 to nsampl do begin {napocita filtrovany "signal", a to tak,}
    filtered[i] := 0.0;
  end;
  for i := 1 to nsampl do begin
    for j := inverindexf to inverindexl do begin {ze poscita jednotlive monochromaticke signaly ziskane}
      filtered[i] := filtered[i] + fsre[j, i]; {postupnym filtrovanim}
    end;
  end;
  fsigmx := 0.01; {naskaluje se to podle puvodniho syroveho zaznamu (jeho "sigmaxi" a "sigmini" uz mame)}
  for i := 1 to nsampl do begin  {zjistim maximum napocitaneho filtrovaneho "signalu" "fsigmx"}
    if (filtered[i] > fsigmx) then fsigmx := filtered[i]; {fsigmx je nejvetsi z te filtrovane skupinky}
  end;
  for i := 1 to nsampl do begin
    filtered[i] := filtered[i] * ((sigmaxi - sigmini) / 2.0) / fsigmx;
  end;
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - filtered signal for selected period range ...');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' |   ... from ' + ffirststrg + ' s to ' + flaststrg + ' s was created');
  cfs := cfs + 1;
  with PlotPanel2 do begin
    LayerOptions(cfs, pmLine, 2); {monochromatic signal}
  end;
  for uu := 2 to trunc(nsampl / kraceni) do begin {for uu:= 2 to nsampl do begin}
    PlotPanel2.AddXY(SVALtime[uu * kraceni], filtered[uu * kraceni] * scalefactor * 0.01 / sigmaxi, clRed, cfs);
  end;
  if savewave then begin {pokud to chci ukladat pri Batch, tak si to naskaluju na hodnotu 1000 abych mel vsechny stejne pro ulozeni}
    for i := 1 to nsampl do begin
      filtered[i] := (filtered[i] / ((sigmaxi - sigmini) / 2.0)) * 1000;
    end;
  end;
  filtrange := False; {tedy ted si to pamatuje, ze jsem ho vytvoril}
  if hydro = false then begin
    Ukazcarky;
    Ukazrychlosti;
  end;
end;{of procedure na vykreslovani filtrovanych hadu pro vybrane periody}

procedure TNoSVALform.Button8Click(Sender: TObject);
begin {maze graf pro puvodni a filtrovany seismogram}
  PlotPanel2.ClearData;
  crych := 400;
  cfs := 1;
end;

procedure TNoSVALform.Button9Click(Sender: TObject);
begin {maze disperzni krivku a spectrogram}
  PlotPanel3.ClearData;
  label15.Visible := True;                 {period [s] - popisek osy X}
  label15.BringToFront;
  label17.Visible := True;                 {group velocity km/s - popisek osy Y}
  label17.BringToFront;
  label31.Visible := False;                {alfa koeficient v PlotPanelu}
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  pp3 := 1;         {vrstvy kde ceho}
  clicks := 400;    {vrstvy pro nakliknute bodiky               plotpanel 3}
  chos := 600;      {vrstvy pro bodiky vybrane ze seznamu       plotpanel 3}
end;

procedure TNoSVALform.SpinEdit1Change(Sender: TObject);
begin     {meni se scalefactor, podle ktereho se vykresluje fitlrovany seismogram pres puvodni}
  if length(SpinEdit1.Text) < 1 then begin {kdyz smazu policko, tak dam jako scalefactor nulu a hlavne se to nekousne}
    SpinEdit1.Value := 0;
    scalefactor := 0; {protoze v hodnote SpinEdit1.Value musi neco byt a jakmile je to nic, zasekne se to}
    exit;
  end;
  scalefactor := SpinEdit1.Value;
end;

procedure TNoSVALform.Button10Click(Sender: TObject);
var {kresli spectrogram}
  iis, jjs                  : integer;
  R, G, B                   : integer;
  range                     : integer;  {rozsah barvicek}
  grvelstep                 : double;
  actgrvel                  : double;
  border1, border2, border3 : double;
  amin2                     : double;
begin
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 4);
  end;
  R := 0;
  G := 0;
  B := 0;
  border1 := 0.90;
  border2 := 0.75;
  border3 := 0.40;
  amin2 := 1.5 * amin; {amin = an actual minimum of normalized spectrogram}
  range := trunc((100 - amin2)); {od "amin2" do 100}
  if hydro = False then begin
    grvelstep := (grvel[2] - grvel[nsampl]) / 200;    {to cislo znamena, kolk bodiku se mi vykresli pres PlotPanel3}
  end;
  if hydro = True then begin
    grvelstep := (grvel[nsampl] - grvel[2]) / 200;    {to cislo znamena, kolk bodiku se mi vykresli pres PlotPanel3}
  end;
  if hydro = False then begin
    actgrvel := grvel[2];
  end;
  if hydro = True then begin
    actgrvel := grvel[2];
  end;
  iis := 2;
  while iis < nsampl do begin
    if ((iis = 0) or (iis = 1)) then iis := 2;
    for jjs := 1 to nflt do begin
      if (namp[jjs, iis] <= 100) and (namp[jjs, iis] > ((range * border1) + amin2)) then begin
        R := 255;
        G := trunc((100 - namp[jjs, iis]) * (2.55 / (1 - border1)));
        B := 0;
      end;
      if (namp[jjs, iis] <= ((range * border1) + amin2)) and (namp[jjs, iis] > ((range * border2) + amin2)) then begin
        R := trunc((namp[jjs, iis] - ((range * border2) + amin2)) * (2.55 / (border1 - border2)));
        G := 200;
        B := 0;
      end;
      if (namp[jjs, iis] <= ((range * border2) + amin2)) and (namp[jjs, iis] > ((range * border3) + amin2)) then begin
        R := 0;
        B := trunc((((range * border2) + amin2) - namp[jjs, iis]) * (2.55 / (border2 - border3)));
      end;
      if (namp[jjs, iis] <= ((range * border3) + amin2)) and (namp[jjs, iis] > 0) then begin
        R := 0;
        B := 255;
      end;
      if (namp[jjs, iis] <= 100) and (namp[jjs, iis] > ((range * border2) + amin2)) then begin
        {        G := trunc((100-namp[jjs,iis])*(2.55/(1-border2)));}
      end;
      if (namp[jjs, iis] <= ((range * border2) + amin2)) and (namp[jjs, iis] > 0) then begin
        G := trunc((namp[jjs, iis] - amin2) * (2.55 / (border2)));
      end;
      if R > 255 then R := 255;
      if R <   0 then R := 0;
      if G > 255 then G := 255;
      if G <   0 then G := 0;
      if B > 255 then B := 255;
      if B <   0 then B := 0;
      if instper[jjs, iis] > 0 then begin
        if (instper[jjs, iis] > PlotPanel3.XMin) and (instper[jjs, iis] < PlotPanel3.XMax) and (grvel[iis] > PlotPanel3.YMin) and (grvel[iis] < PlotPanel3.YMax) then begin
          PlotPanel3.AddXY({log10}(instper[jjs, iis]), grvel[iis], RGB(R, G, B), pp3);
        end;
      end;
    end;{of for}
    if hydro = False then begin
      actgrvel := actgrvel - grvelstep;  {vykresluje se to jenom pro nektere hodnoty grupove rychlosti}
    end;
    if hydro = True then begin
      actgrvel := grvelstep - actgrvel;  {vykresluje se to jenom pro nektere hodnoty grupove rychlosti}
    end;
    if actgrvel <> 0 then begin
      if hydro = False then begin
        iis := trunc((((distkm / actgrvel) - timedist) / timein) - 1 - nstart);
      end;
      if hydro = True then begin
        iis := trunc(((actgrvel) * (timein / 60)) - 1 - nstart);
      end;
    end;
  end;{of while}
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
end; {of procedure na kresleni spektrogramu}

procedure TNoSVALform.Button38Click(Sender: TObject);
var {kresli orezany spectrogram}
  diis, djjs                   : integer;
  dR, dG, dBB                  : integer;
  drange                       : integer;  {rozsah barvicek}
  dgrvelstep                   : double;
  dactgrvel                    : double;
  dborder1, dborder2, dborder3 : double;
  damin2                       : double;
begin
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 4);
  end;
  dR := 0;
  dG := 0;
  dBB := 0;
  dborder1 := 0.90;
  dborder2 := 0.75;
  dborder3 := 0.40;
  damin2 := 1.5 * amin; {amin = an actual minimum of normalized spectrogram}
  drange := trunc((100 - damin2)); {od "amin2" do 100}
  dgrvelstep := (grvel[2] - grvel[nsampl]) / 200; {to cislo znamena, kolk bodiku se mi vykresli pres PlotPanel3}
  dactgrvel := grvel[2];
  diis := 2;
  spodnejsi := 1;
  hornejsi := nflt;
  if ((inverindexf <> 0) and (inverindexl <> 0)) then begin
    spodnejsi := inverindexf; {pokud mam zvolene meze, udelam to jen pro ty meze}
    hornejsi := inverindexl;
  end;
  while diis < nsampl do begin
    if ((diis = 0) or (diis = 1)) then diis := 2;
    for djjs := spodnejsi to hornejsi do begin
      if (fnamp[djjs, diis] <= 100) and (fnamp[djjs, diis] > ((drange * dborder1) + damin2)) then begin
        dR := 255;
        dG := trunc((100 - fnamp[djjs, diis]) * (2.55 / (1 - dborder1)));
        dBB := 0;
      end;
      if (fnamp[djjs, diis] <= ((drange * dborder1) + damin2)) and (fnamp[djjs, diis] > ((drange * dborder2) + damin2)) then begin
        dR := trunc((fnamp[djjs, diis] - ((drange * dborder2) + damin2)) * (2.55 / (dborder1 - dborder2)));
        dG := 200;
        dBB := 0;
      end;
      if (fnamp[djjs, diis] <= ((drange * dborder2) + damin2)) and (fnamp[djjs, diis] > ((drange * dborder3) + damin2)) then begin
        dR := 0;
        dBB := trunc((((drange * dborder2) + damin2) - fnamp[djjs, diis]) * (2.55 / (dborder2 - dborder3)));
      end;
      if (fnamp[djjs, diis] <= ((drange * dborder3) + damin2)) and (fnamp[djjs, diis] > 0) then begin
        dR := 0;
        dBB := 255;
      end;
      if (fnamp[djjs, diis] <= 100) and (fnamp[djjs, diis] > ((drange * dborder2) + damin2)) then begin
        {        dG := trunc((100-fnamp[djjs,diis])*(2.55/(1-dborder2)));}
      end;
      if (fnamp[djjs, diis] <= ((drange * dborder2) + damin2)) and (fnamp[djjs, diis] > 0) then begin
        dG := trunc((fnamp[djjs, diis] - damin2) * (2.55 / (dborder2)));
      end;
      if dR > 255 then dR := 255;
      if dR <   0 then dR := 0;
      if dG > 255 then dG := 255;
      if dG <   0 then dG := 0;
      if dBB > 255 then dBB := 255;
      if dBB <   0 then dBB := 0;
      if (instper[djjs, diis] > 0) and (fnamp[djjs, diis] = 0) then begin   {premazu to, co je orezane}
        if (instper[djjs, diis] > PlotPanel3.XMin) and (instper[djjs, diis] < PlotPanel3.XMax) and (grvel[diis] > PlotPanel3.YMin) and (grvel[diis] < PlotPanel3.YMax) then begin
          PlotPanel3.AddXY({log10}(instper[djjs, diis]), grvel[diis], RGB(0, 0, 0), pp3);
        end;
      end;
      if (instper[djjs, diis] > 0) and (fnamp[djjs, diis] > 0) then begin
        if (instper[djjs, diis] > PlotPanel3.XMin) and (instper[djjs, diis] < PlotPanel3.XMax) and (grvel[diis] > PlotPanel3.YMin) and (grvel[diis] < PlotPanel3.YMax) then begin
          PlotPanel3.AddXY({log10}(instper[djjs, diis]), grvel[diis], RGB(dR, dG, dBB), pp3);
        end;
      end;
    end;{of for}
    dactgrvel := dactgrvel - dgrvelstep; {vykresluje se to jenom pro nektere hodnoty grupove rychlosti}
    diis := trunc((((distkm / dactgrvel) - timedist) / timein) - 1 - nstart);
  end;{of while}
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
end; {konec procedury na kresleni orezaneho spectrogramu}

procedure TNoSVALform.Button17Click(Sender: TObject);
var   {kresli syrovou disperzni krivku z primarnich maxim}
  jij         : integer;
begin
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 3);
  end;
  for jij := 1 to nflt do begin
    if (instper[jij, max1locmx[jij]] > PlotPanel3.XMin) and (instper[jij, max1locmx[jij]] < PlotPanel3.XMax) and
      (grvel[max1locmx[jij]] > PlotPanel3.YMin) and (grvel[max1locmx[jij]] < PlotPanel3.YMax) then begin
      PlotPanel3.AddXY({log10}(instper[jij, max1locmx[jij]]), grvel[max1locmx[jij]], RGB(233, 183, 62), pp3);
    end;
  end;
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2);
  end;
  if index <> 0 then begin {pokud mam vybrany nejaky filtr, vyznacim, kde je primarni maximum}
    PlotPanel1.AddXY(SVALtime[max1locmx[index]], PlotPanel1.Ymax, RGB(233, 183, 62), pp1);
    PlotPanel1.AddXY(SVALtime[max1locmx[index]], PlotPanel1.YMin, RGB(233, 183, 62), pp1);
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
end;  {konec kresleni syrove disperzni krivky z primarnich maxim}

procedure TNoSVALform.Button11Click(Sender: TObject);
var   {kresli definitivni syrovou disperzni krivku}
  jiji        : integer;
begin
  grupka := True; {prepnu to, abych mohl klikat na grupove body}
  pp3 := pp3 + 1;
  if pp3 > 1650 then pp3 := 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 5);
  end;
  spodnejsi := 1;
  hornejsi := nflt;
  if ((inverindexf <> 0) and (inverindexl <> 0)) then begin
    spodnejsi := inverindexf; {pokud mam zvolene meze, udelam to jen pro ty meze}
    hornejsi := inverindexl;
  end;
  for jiji := spodnejsi to hornejsi do begin
    if (instper[jiji, locmx[jiji]] > PlotPanel3.XMin) and (instper[jiji, locmx[jiji]] < PlotPanel3.XMax) and (grvel[locmx[jiji]] > PlotPanel3.YMin) and (grvel[locmx[jiji]] < PlotPanel3.YMax) then begin
      if jeblba = False then begin
        PlotPanel3.AddXY({log10}(instper[jiji, locmx[jiji]]), grvel[locmx[jiji]], RGB(255, 255, 0), pp3);
      end;
      if jeblba = True then begin
        PlotPanel3.AddXY({log10}(instper[jiji, locmx[jiji]]), grvel[locmx[jiji]], RGB(255, 0, 0), pp3); {kdyz je disperze blba, namaluju ji cervene}
      end;
      if useloaded then begin {pokud maluju naloadovanou}
        if chcichyby = True then begin {a pokud jsem k ni nacetl i chyby, vymaluju je taky}
          PlotPanel3.AddXY((loadper[jiji]), loadgrvel[jiji] + chybaL[jiji], RGB(50, 50, 50), pp3);
          PlotPanel3.AddXY((loadper[jiji]), loadgrvel[jiji] - chybaL[jiji], RGB(50, 50, 50), pp3);
        end;
      end; {if naloadovana}
    end;
  end; {for rozmezi indexu}
  if joint then begin
    for jiji := 1 to nflt do begin
      if (loadper2[jiji] > PlotPanel3.XMin) and (loadper2[jiji] < PlotPanel3.XMax) and (loadgrvel2[jiji] > PlotPanel3.YMin) and (loadgrvel2[jiji] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY(loadper2[jiji], loadgrvel2[jiji], RGB(255, 255, 0), pp3);
        if useloaded then begin {pokud maluju naloadovanou}
          if chcichyby = True then begin {a pokud jsem k ni nacetl i chyby, vymaluju je taky}
            PlotPanel3.AddXY((loadper[jiji]), loadgrvel[jiji] + chybaL[jiji], RGB(50, 50, 50), pp3);
            PlotPanel3.AddXY((loadper[jiji]), loadgrvel[jiji] - chybaL[jiji], RGB(50, 50, 50), pp3);
            PlotPanel3.AddXY((loadper2[jiji]), loadgrvel2[jiji] + chybaR[jiji], RGB(50, 50, 50), pp3);
            PlotPanel3.AddXY((loadper2[jiji]), loadgrvel2[jiji] - chybaR[jiji], RGB(50, 50, 50), pp3);
          end;
        end; {if naloadovana}
      end;
    end;
  end; {if joint}
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  button20.Enabled := True; {zoom Y}
  button41.Enabled := True; {zoom Y}
end; {konec kresleni definitivni syrove disperzni krivky}

procedure TNoSVALform.Button16Click(Sender: TObject);
var  {kresli syrovou disperzni krivku ze secondarnich maxim}
  jiji       : integer;
begin
  if batchproces = False then begin {hlasku vypisuju jenom pri rucnim zpracovani, pri batch processing ne}
    if pocet2 = 0 then begin
      ShowMessage('No secondary maxima were found!');
      exit;
    end;
  end;
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 3);
  end;
  for jiji := 1 to nflt do begin
    if (max2locmx[jiji] <> 0) and (max2locmx[jiji] <> nsampl) then begin
      if (instper[jiji, max2locmx[jiji]] > PlotPanel3.XMin) and (instper[jiji, max2locmx[jiji]] < PlotPanel3.XMax) and
        (grvel[max2locmx[jiji]] > PlotPanel3.YMin) and (grvel[max2locmx[jiji]] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY({log10}(instper[jiji, max2locmx[jiji]]), grvel[max2locmx[jiji]], RGB(255, 33, 0), pp3);
      end;
    end;
  end;
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2);
  end;
  if index <> 0 then begin {pokud mam vybrany nejaky filtr, vyznacim, kde je sekundarni maximum}
    if (max2locmx[index] <> 0) and (max2locmx[index] <> nsampl) then begin
      PlotPanel1.AddXY(SVALtime[max2locmx[index]], PlotPanel1.Ymax, RGB(255, 33, 0), pp1);
      PlotPanel1.AddXY(SVALtime[max2locmx[index]], PlotPanel1.YMin, RGB(255, 33, 0), pp1);
    end;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
end; {konec kresleni syrove disperzni krivky ze secondarnich maxim}

procedure TNoSVALform.Button36Click(Sender: TObject);
var
  ohoh: integer;
begin {kresli syrovou disperzni krivku z terciarnich maxim}
  if batchproces = False then begin {hlasku vypisuju jenom pri rucnim zpracovani, pri batch processing ne}
    if pocet3 = 0 then begin
      ShowMessage('No tertiary maxima were found!');
      exit;
    end;
  end;
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 3);
  end;
  for ohoh := 1 to nflt do begin
    if (max3locmx[ohoh] <> 0) and (max3locmx[ohoh] <> nsampl) then begin
      if (instper[ohoh, max3locmx[ohoh]] > PlotPanel3.XMin) and (instper[ohoh, max3locmx[ohoh]] < PlotPanel3.XMax) and
        (grvel[max3locmx[ohoh]] > PlotPanel3.YMin) and (grvel[max3locmx[ohoh]] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY({log10}(instper[ohoh, max3locmx[ohoh]]), grvel[max3locmx[ohoh]], RGB(20, 255, 20), pp3);
      end;
    end;
  end;
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2);
  end;
  if index <> 0 then begin {pokud mam vybrany nejaky filtr, vyznacim, kde je terciarni maximum}
    if (max3locmx[index] <> 0) and (max3locmx[index] <> nsampl) then begin
      PlotPanel1.AddXY(SVALtime[max3locmx[index]], PlotPanel1.Ymax, RGB(20, 255, 20), pp1);
      PlotPanel1.AddXY(SVALtime[max3locmx[index]], PlotPanel1.YMin, RGB(20, 255, 20), pp1);
    end;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
end; {konec kresleni syrove disperzni krivky z terciarnich maxim}

procedure TNoSVALform.Button37Click(Sender: TObject);
var {kresli syrovou disperzni krivku z quarternich maxim}
  ahah      : integer;
begin
  if batchproces = False then begin {hlasku vypisuju jenom pri rucnim zpracovani, pri batch processing ne}
    if pocet4 = 0 then begin
      ShowMessage('No quarternary maxima were found!');
      exit;
    end;
  end;
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 3);
  end;
  for ahah := 1 to nflt do begin
    if (max4locmx[ahah] <> 0) and (max4locmx[ahah] <> nsampl) then begin
      if (instper[ahah, max4locmx[ahah]] > PlotPanel3.XMin) and (instper[ahah, max4locmx[ahah]] < PlotPanel3.XMax)
        and (grvel[max4locmx[ahah]] > PlotPanel3.YMin) and (grvel[max4locmx[ahah]] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY({log10}(instper[ahah, max4locmx[ahah]]), grvel[max4locmx[ahah]], RGB(0, 216, 255), pp3);
      end;
    end;
  end;
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2);
  end;
  if index <> 0 then begin {pokud mam vybrany nejaky filtr, vyznacim, kde je kvarterni maximum}
    if (max4locmx[index] <> 0) and (max4locmx[index] <> nsampl) then begin
      PlotPanel1.AddXY(SVALtime[max4locmx[index]], PlotPanel1.Ymax, RGB(0, 216, 255), pp1);
      PlotPanel1.AddXY(SVALtime[max4locmx[index]], PlotPanel1.YMin, RGB(0, 216, 255), pp1);
    end;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
end; {konec kresleni syrove disperzni krivky z quarternich maxim}

procedure TNoSVALform.Button40Click(Sender: TObject);
var {kresli syrovou disperzni krivku z kvinternich maxim}
  ole: integer;
begin
  if batchproces = False then begin {hlasku vypisuju jenom pri rucnim zpracovani, pri batch processing ne}
    if pocet5 = 0 then begin
      ShowMessage('No quinternary maxima were found!');
      exit;
    end;
  end;
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 3);
  end;
  for ole := 1 to nflt do begin
    if (max5locmx[ole] <> 0) and (max5locmx[ole] <> nsampl) then begin
      if (instper[ole, max5locmx[ole]] > PlotPanel3.XMin) and (instper[ole, max5locmx[ole]] < PlotPanel3.XMax) and
        (grvel[max5locmx[ole]] > PlotPanel3.YMin) and (grvel[max5locmx[ole]] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY({log10}(instper[ole, max5locmx[ole]]), grvel[max5locmx[ole]], RGB(231, 90, 230), pp3);
      end;
    end;
  end;
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2);
  end;
  if index <> 0 then begin {pokud mam vybrany nejaky filtr, vyznacim, kde je kvinterni maximum}
    if (max5locmx[index] <> 0) and (max5locmx[index] <> nsampl) then begin
      PlotPanel1.AddXY(SVALtime[max5locmx[index]], PlotPanel1.Ymax, RGB(231, 90, 230), pp1);
      PlotPanel1.AddXY(SVALtime[max5locmx[index]], PlotPanel1.YMin, RGB(231, 90, 230), pp1);
    end;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
end; {konec kresleni syrove disperzni krivky z quinternich maxim}

procedure TNoSVALform.Button50Click(Sender: TObject);
var {kresli syrovou disperzni krivku z sestych maxim}
  ole: integer;
begin
  if batchproces = False then begin {hlasku vypisuju jenom pri rucnim zpracovani, pri batch processing ne}
    if pocet6 = 0 then begin
      ShowMessage('No sixth maxima were found!');
      exit;
    end;
  end;
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 3);
  end;
  for ole := 1 to nflt do begin
    if (max6locmx[ole] <> 0) and (max6locmx[ole] <> nsampl) then begin
      if (instper[ole, max6locmx[ole]] > PlotPanel3.XMin) and (instper[ole, max6locmx[ole]] < PlotPanel3.XMax) and
        (grvel[max6locmx[ole]] > PlotPanel3.YMin) and (grvel[max6locmx[ole]] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY({log10}(instper[ole, max6locmx[ole]]), grvel[max6locmx[ole]], RGB(231, 90, 230), pp3);
      end;
    end;
  end;
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2);
  end;
  if index <> 0 then begin {pokud mam vybrany nejaky filtr, vyznacim, kde je seste maximum}
    if (max6locmx[index] <> 0) and (max6locmx[index] <> nsampl) then begin
      PlotPanel1.AddXY(SVALtime[max6locmx[index]], PlotPanel1.Ymax, RGB(231, 90, 230), pp1);
      PlotPanel1.AddXY(SVALtime[max6locmx[index]], PlotPanel1.YMin, RGB(231, 90, 230), pp1);
    end;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
end; {konec kresleni syrove disperzni krivky z sestych maxim}

procedure TNoSVALform.Button51Click(Sender: TObject);
var {kresli syrovou disperzni krivku ze sedmych maxim}
  ole: integer;
begin
  if batchproces = False then begin {hlasku vypisuju jenom pri rucnim zpracovani, pri batch processing ne}
    if pocet7 = 0 then begin
      ShowMessage('No seventh maxima were found!');
      exit;
    end;
  end;
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 3);
  end;
  for ole := 1 to nflt do begin
    if (max7locmx[ole] <> 0) and (max7locmx[ole] <> nsampl) then begin
      if (instper[ole, max7locmx[ole]] > PlotPanel3.XMin) and (instper[ole, max7locmx[ole]] < PlotPanel3.XMax) and
        (grvel[max7locmx[ole]] > PlotPanel3.YMin) and (grvel[max7locmx[ole]] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY({log10}(instper[ole, max7locmx[ole]]), grvel[max7locmx[ole]], RGB(231, 90, 230), pp3);
      end;
    end;
  end;
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2);
  end;
  if index <> 0 then begin {pokud mam vybrany nejaky filtr, vyznacim, kde je sedme maximum}
    if (max7locmx[index] <> 0) and (max7locmx[index] <> nsampl) then begin
      PlotPanel1.AddXY(SVALtime[max7locmx[index]], PlotPanel1.Ymax, RGB(231, 90, 230), pp1);
      PlotPanel1.AddXY(SVALtime[max7locmx[index]], PlotPanel1.YMin, RGB(231, 90, 230), pp1);
    end;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
end; {konec kresleni syrove disperzni krivky ze sedmych maxim}

procedure TNoSVALform.Button52Click(Sender: TObject);
var {kresli syrovou disperzni krivku z osmych maxim}
  ole       : integer;
begin
  if batchproces = False then begin {hlasku vypisuju jenom pri rucnim zpracovani, pri batch processing ne}
    if pocet8 = 0 then begin
      ShowMessage('No eighth maxima were found!');
      exit;
    end;
  end;
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 3);
  end;
  for ole := 1 to nflt do begin
    if (max8locmx[ole] <> 0) and (max8locmx[ole] <> nsampl) then begin
      if (instper[ole, max8locmx[ole]] > PlotPanel3.XMin) and (instper[ole, max8locmx[ole]] < PlotPanel3.XMax) and
        (grvel[max8locmx[ole]] > PlotPanel3.YMin) and (grvel[max8locmx[ole]] < PlotPanel3.YMax) then begin
        PlotPanel3.AddXY({log10}(instper[ole, max8locmx[ole]]), grvel[max8locmx[ole]], RGB(231, 90, 230), pp3);
      end;
    end;
  end;
  pp1 := pp1 + 1;
  with PlotPanel1 do begin
    LayerOptions(pp1, pmLine, 2);
  end;
  if index <> 0 then begin {pokud mam vybrany nejaky filtr, vyznacim, kde je osme maximum}
    if (max8locmx[index] <> 0) and (max8locmx[index] <> nsampl) then begin
      PlotPanel1.AddXY(SVALtime[max8locmx[index]], PlotPanel1.Ymax, RGB(231, 90, 230), pp1);
      PlotPanel1.AddXY(SVALtime[max8locmx[index]], PlotPanel1.YMin, RGB(231, 90, 230), pp1);
    end;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  if (nasilne and truncx) then begin
    label36.Visible := True;{fixed}
    label36.BringToFront;{fixed}
    label37.Visible := True;{fixed}
    label37.BringToFront;{fixed}
    label38.Visible := True;{fixed}
    label38.BringToFront;{fixed}
  end;
  if (nasilne = False or truncx = False) then begin
    label36.Visible := False;{fixed}
    label37.Visible := False;{fixed}
    label38.Visible := False;{fixed}
  end;
end; {konec kresleni syrove disperzni krivky z osmych maxim}

procedure TNoSVALform.Timer1Timer(Sender: TObject);
begin   {blika disperznim bodem}
  if FFT then begin {pokud delam jen fouriera, nechci blikat}
    exit;
  end;
  if index = 0 then begin
    exit; {pokud neni nic vybrano, nechci, aby se to nic snazilo blikat}
  end;
  with PlotPanel3 do begin
    LayerOptions(chos, pmDot, 10);
  end;
  if ee = 0 then begin
    PlotPanel3.AddXY(instper[index, locmx[index]], grvel[locmx[index]], clRed, chos);
    ee := 1;
    Label21.Visible := True;
    Label32.Visible := True;
    Label57.Visible := True;
    vybr := vybr + 1;
    if vybr = 20 then begin
      Timer1.Enabled := False; {zrusim blikani vybraneho bodiku}
      PlotPanel3.HideLayer(chos);
      with PlotPanel3 do begin
        LayerOptions(chos, pmDot, 5);
      end;
      PlotPanel3.AddXY(instper[index, locmx[index]], grvel[locmx[index]], clRed, chos);
    end;  {if vybr = 20}
    exit;
  end;  {if ee = 0}
  if ee = 1 then begin
    PlotPanel3.AddXY((instper[index, locmx[index]]), grvel[locmx[index]], clWhite, chos);  {ukaze to bod na disperzni krivce}
    ee := 0;
    Label21.Visible := True;
    Label32.Visible := True;
    Label57.Visible := True;
    vybr := vybr + 1;
    if vybr = 20 then begin
      Timer1.Enabled := False; {zrusim blikani vybraneho bodiku}
      PlotPanel3.HideLayer(chos);
      with PlotPanel3 do begin
        LayerOptions(chos, pmDot, 5);
      end;
      PlotPanel3.AddXY(instper[index, locmx[index]], grvel[locmx[index]], clRed, chos);
    end;  {if vybr = 20}
    exit;
  end;  {if ee = 1}
end;  {konec blikani}

procedure TNoSVALform.Button13Click(Sender: TObject); {Open data file ...}
var
  nacet              : integer;
  sig                : double;
  naprvnimradkustrg  : string;
  i                  : integer;
  tecka              : string;
  pozicetecky        : integer;
begin                {for opening the record data file}
  notvalidfile := false;
  if (zbatche = False) and (batchproces = True) then begin    {pokud jsem to zmacknul rucne, ale batch processing bylo v behu, pak se to zepta}
    if MessageDlg('Do you want to cancel batch processing?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      batchproces := False;  {kdyz zmacknu Open file mysi, tak se me to zepta, jestli chci ukoncit batch processing, a kdyz dam, ze jo, tak to prepne boolean}
      RadioGroup2.Enabled := true;          {zapnu A / L / O option}
      PREMlimit := false;
      jmenoposledniho := ''; {vymazu jmeno posledniho souboru, takze batch pojede zase uplne od zacatku}
      pocitadlofile := 0;
      partdir := ''; {vymazeme hlasku o ceste}
      partpocitad := '';
      POLAR := false;
      reference := false;
      fixedcut := false;
      skladej := 2;
      if logiksezavrel = False then begin {kdyz se sam jeste nezavrel, tedy, kdyz vynucuju ukonceni batch processingu tlacitkem Open file ... }
        if saverdg then begin
          closefile(dispersionXdotALL);
          closefile(dotsmax1);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax2);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax3);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax4);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax5);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax6);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax7);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmax8);          {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmaxPERcas);     {zavru soubor se vsema teckama ze vsech stanic}
          closefile(dotsmaxPERcasBEZ1);
          {zavru soubor se vsema teckama ze vsech stanic bez prvniho maxima}
        end;
        if batchdisperze then begin
          closefile(ALLdispersionsAMPLI);
          closefile(ALLdispersionsPHASE);
          closefile(ALLdispersionsGROUP);
          closefile(redstation);
          closefile(redlabel);
          closefile(yellowstation);
          closefile(yellowlabel);
        end;
        if savewave then begin
          closefile(phaseALL);
          closefile(groupALL);
        end;
        if savewhole then begin
          closefile(aallbez);
          closefile(aallvyr);
        end;
      end;
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - SVAL batch processing was canceled, ' + pocitadlofilestrg + ' files were processed');
    end
    else   {kdyz zmackno no, tak to vyskoci z procedurky.}
      exit;
  end;
  zbatche := False;
  if batchproces = False then begin
    OpenDialog1.FileName := '';
    OpenDialog1.Execute;
    pozice := 1;
    repeat
      posledni := misto; {sem nactu posledni nalezenou pozici zpetneho lomitka}
      misto := PosEx('/', OpenDialog1.FileName, pozice);
      pozice := misto + 1;
    until misto = 0;
    cestamanu    := Copy(OpenDialog1.FileName, 1, posledni);
    pozicetecky  := PosEx('.', OpenDialog1.FileName, posledni);
    dispfilename := Copy(OpenDialog1.FileName, (posledni+1), (pozicetecky-posledni-1));
    if length(OpenDialog1.FileName) < 1 then exit; {kdyz zadny soubor nechci otevrit, vypadne to z procedurky}
    part1 := 'SVAL processes     ' + OpenDialog1.FileName;
  end; {tohle jsem udelal jen pro rucni otevreni souboru}
  if batchproces then begin
    if length(jmenofilu) < 1 then exit; {kdyz zadny soubor nechci otevrit, vypadne to z procedurky}
    part1 := 'SVAL processes     ' + jmenofilu;
  end;
  NoSVALform.Caption := part1 + part2 + refcaption;  {jaky zaznam zpracovavame a jaky je layers file}
  if batchproces then begin
    partpocitad := '     file No.: ' + pocitadlofilestrg + '      ';
    partdir := '         Active directory is:  ' + cesta;
    NoSVALform.Caption := partpocitad + part1 + part2 + partdir + refcaption;
  end;
  Button1.Enabled := True;
  RadioGroup5.ItemIndex := 0; {ze chci pouzit puvodni zaznam}
  Button47.Enabled := False;  {nemoznost vykreslit nejaky zastaraly filtrovany previt}
  Button2.Enabled := False;   {tedy pro jeho spocteni a vykresleni je nutne napred spustit Analyzu, aby se nacetl novy soubor se zaznamem}
  RadioGroup5.Enabled := False;
  SpectrumForm.Button22.Enabled := False;
  SpectrumForm.Button16.Enabled := False; { Filterd spec }
  SpectrumForm.Button29.Enabled := False; { Smoothed }
  SpectrumForm.Button30.Enabled := False; { Whitened }
  SpectrumForm.Button31.Enabled := False; { Fi-Re }
  SpectrumForm.Button32.Enabled := False; { Fi-Im }
  SpectrumForm.Button33.Enabled := False; { W-Re }
  SpectrumForm.Button34.Enabled := False; { W-Im }
  {pocitam radky v souboru, tedy kolik mam k dispozici sampliku}
  if batchproces = False then begin {pro rucni otevreni}
    assignfile(signal, OpenDialog1.FileName);
  end;
  reset(signal);
  nacet := 0;
  if sloupec = 1 then begin
    repeat
      readln(signal, sig);
      nacet := nacet + 1;
      filesamplesnumber := nacet;
    until EOF(signal);
  end;
  if (sloupec = 3) or (sloupec = 5) then begin  {cteni hlavicky KUKovskeho souboru}
    reset(signal);
    Read(signal, naprvnimradkustrg);
    reset(signal);
    if (Length(naprvnimradkustrg) >= 71) then begin {cteni dlouhe hlavicky se vsim, pro sloupec = 5 by to mela byt dycky tato dlouha}
      tecka := Copy(naprvnimradkustrg,3,1);
      if tecka <> '.' then begin                             {pokud neni na treti pozici tecka, neco je spatne}
        if superbatchyesno = false then ShowMessage('Error: '+ OpenDialog1.FileName +' is not a valid data file'); {napise to hlasku, ze to neni soubor s daty}
        notvalidfile := true;
        skippedfile := skippedfile + 1;
        closefile(signal);
        exit;                                                                      {a ukonci to proceduru, aby se nezabil cely program}
      end;
      epicfromfile := True;
      prorenatu := False;
      {     z Chameleona: }
      {     writeln(fo,hs,vzdal[k]:12:4,rozdcas[k]:10:2,'  ',sensor[k]:10,lat[k]:10:4,lon[k]:10:4); }
      readln(signal, prvniradekstrg, KUKdistkm, KUKtimedist, nic, KUKsensor, KUKlat, KUKlon, bazi);
      {                   17 znaku ,   cislo  ,  cislo     , 2  , 10 znaku , cislo , cislo  }
      {     sensor ma 10 znaku a pro prirazeni se jich musi opet 10 kontrolovat a to tak, ze dalsi znaky po skonceni nazvu sensoru musi byt mezery}
      {     protoze ten string[10] proste nacte 10 znaku, i kdyz jsou to mezery a drzi si je v sobe}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |   epic. distance and time interval were read from the KUK input file');
      str(KUKdistkm: 10: 4, KUKdistkmstrg);
      str(KUKtimedist: 10: 2, KUKtimediststrg);
      str(KUKlat: 10: 4, KUKlatstrg);
      str(KUKlon: 10: 4, KUKlonstrg);
      str(bazi: 10: 4, bazistrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | ------------KUK-file-header-printout----------------------------------------------------------- ');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |   ' + prvniradekstrg + KUKdistkmstrg + KUKtimediststrg + '  ' + KUKsensor + KUKlatstrg + KUKlonstrg + bazistrg);
    end; {konec pro dlouhou hlavicku}
    if ((Length(naprvnimradkustrg) >= 17) and (Length(naprvnimradkustrg) <= 19)) then begin {cteni hlavicky prastareho KUKu, pro sloupec = 5 by to sem nikdy nemelo vlezt}
      tecka := Copy(naprvnimradkustrg,3,1);
      if tecka <> '.' then begin                             {pokud neni na treti pozici tecka, neco je spatne}
        if superbatchyesno = false then ShowMessage('Error: '+ OpenDialog1.FileName +' is not a valid data file'); {napise to hlasku, ze to neni soubor s daty}
        notvalidfile := true;
        skippedfile := skippedfile + 1;
        closefile(signal);
        exit;                                                                      {a ukonci to proceduru, aby se nezabil cely program}
      end;
      epicfromfile := False;
      prorenatu := False;
      readln(signal, prvniradekstrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |   NO epic. distance and NO time interval found in the KUK input file');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | ------------KUK-file-header-printout----------------------------------------------------------- ');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |   ' + prvniradekstrg);
    end;
    if (Length(naprvnimradkustrg) = 50) then begin {cteni hlavicky pro Renatu}
      tecka := Copy(naprvnimradkustrg,3,1);
      if tecka <> '.' then begin                             {pokud neni na treti pozici tecka, neco je spatne}
        if superbatchyesno = false then ShowMessage('Error: '+ OpenDialog1.FileName +' is not a valid data file'); {napise to hlasku, ze to neni soubor s daty}
        notvalidfile := true;
        skippedfile := skippedfile + 1;
        closefile(signal);
        exit;                                                                      {a ukonci to proceduru, aby se nezabil cely program}
      end;
      epicfromfile := True;
      prorenatu := True;
      readln(signal, prvniradekstrg, KUKdistkm, KUKtimedist);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |   epic. distance and time interval for RENATA :-)');
      str(KUKdistkm: 10: 4, KUKdistkmstrg);
      str(KUKtimedist: 10: 2, KUKtimediststrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | ------------KUK-file-header-printout----------------------------------------------------------- ');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' |   ' + prvniradekstrg + KUKdistkmstrg + KUKtimediststrg);
    end;
    if (Length(naprvnimradkustrg) < 71) and (Length(naprvnimradkustrg) <> 50) and (Length(naprvnimradkustrg) <> 17) and (Length(naprvnimradkustrg) <> 18) and (Length(naprvnimradkustrg) <> 19) then begin {nesplnuje to nic z vyse uvedeneho}
      if superbatchyesno = false then ShowMessage('Error: '+ OpenDialog1.FileName +' is not a valid data file'); {napise to hlasku, ze to neni soubor s daty}
      notvalidfile := true;
      skippedfile := skippedfile + 1;
      closefile(signal);
      exit;                                                                      {a ukonci to proceduru, aby se nezabil cely program}
    end;
    readln(signal, druhyradekstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' |   ' + druhyradekstrg);
    readln(signal, tretiradekstrg); {tady je pocet odectu}
    val(tretiradekstrg, pocetnavic, cd);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' |   ' + tretiradekstrg);
    if pocetnavic > 0 then begin        {pokud to neni nula, tedy mam vice radku, tak je postupne vsechny nactu a zobrazim}
      for i := 1 to pocetnavic do begin {delam to hlavne proto, abych si to odradkoval az na data}
        readln(signal, tretiradekstrg);  {tady je pocet odectu}
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' |   ' + tretiradekstrg);
      end;
    end;
    readln(signal, KUKsampling); {pokracuju ctenim vzorkovaci frekvence}
    str(KUKsampling: 8: 3, KUKsamplingstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' |   ' + KUKsamplingstrg);
    readln(signal, patyradekstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' |   ' + patyradekstrg);
    readln(signal, sestyradekstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' |   ' + sestyradekstrg);
    readln(signal, sedmyradekstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' |   ' + sedmyradekstrg);
    readln(signal, osmyradekstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' |   ' + osmyradekstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | ------------end-of-KUK-file-header-printout---------------------------------------------------- ');
    if epicfromfile then begin
      Edit1.Text := KUKdistkmstrg; {naladuju prectene hodnoty do okenek SVAlu}
      Edit1.Enabled := False;
      Edit2.Text := KUKtimediststrg;
      Edit2.Enabled := False;
    end;
    Edit3.Text := KUKsamplingstrg;
    Edit3.Enabled := False;   {sampling frequency}
    if epicfromfile = False then begin
      Edit1.Enabled := True;
      Edit2.Enabled := True;
    end;
    Edit1.refresh;
    Edit2.refresh;
    Edit3.refresh;
    repeat
      readln(signal, sig);
      nacet := nacet + 1;
      filesamplesnumber := nacet;
    until EOF(signal);
  end; {if sloupec = 3 or 5}
  closefile(signal);
  str(filesamplesnumber: 8, filesamplesnumberstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - the opened file has ' + filesamplesnumberstrg + ' samples');
  if CheckBox3.Checked = True then begin {pokud chci alfu zavislou na vzdalenosti - to same je jeste v procedure pro analyzu}
    alphaabs := 0.3759905681 * KUKdistkm + 27.4032116;
    str(alphaabs: 5: 1, alphaabsstrg);
    edit11.Text := alphaabsstrg;
  end;
end; {konec otviraneho souboru}

procedure TNoSVALform.Button14Click(Sender: TObject);
var   {for saving the monochromatic signal}
  hh, j        : integer;
  jenjeden     : string;
  chceshrm     : word;
  chcesobalku  : word;
begin
  if index = 0 then begin
    ShowMessage('No filter selected');
    exit;
  end;
  if (filtrujuopravovany = False) then begin
    ShowMessage('The signals without any instrument correction will be saved');
  end;
  if (filtrujuopravovany) then begin
    ShowMessage('The signals with instrument correction applied will be saved');
  end;
  if ((inverindexf = 0) or (inverindexl = 0)) then begin
    ShowMessage('Only ONE selected filter will be saved. For saving multiple filters please select the period range!');
  end;
  SaveDialog1.Execute;
  if length(SaveDialog1.FileName) < 1 then exit;
  jenjeden := SaveDialog1.FileName;  {soubor pro ukladani jen jednoho vybraneho monochromatickeho kanalu}
  jenjeden := jenjeden + '.dat';
  assignfile(monochrom, jenjeden);
  rewrite(monochrom);
  if (filtrujuopravovany = False) then begin
    writeln(monochrom, '      Time      InstPeriod    WholeMonochrom     WholeEnvelope    TruncMonochrom     TruncEnvelope         AnPhase');
  end;
  if filtrujuopravovany then begin
    writeln(monochrom, '      Time      InstPeriod CorrWholeMonochrm CorrWholeEnvelope CorrTruncMonochrm CorrTruncEnvelope     CorrAnPhase');
  end;
  for hh := 1 to nsampl do begin
    writeln(monochrom, SVALtime[hh]: 10: 3, instper[index, hh]: 16: 4, fxsre[index, hh]: 18: 3, amp[index, hh]: 18: 3, fsre[index, hh]: 18: 3, famp[index, hh]: 18: 3, anphase[index, hh]: 16: 4);
  end;
  closefile(monochrom);
  if ((inverindexf = 0) or (inverindexl = 0)) then exit; {kdyz nemam vybrany obor period, dal to nedelam; ulozim jen jeden vybrany kanal a na zbytek kaslu}
  for j := 1 to maxnflt do begin
    maxmono[j] := 0;
    maxmonox[j] := 0;
  end;
  for j := inverindexf to inverindexl do begin {normalizuju jednotlive filtriky, aby to aspon radove bylo podobne s jinym zaznamem}
    for hh := 1 to nsampl do begin  {najdu nejvetsi kladnou amplitudu}
      if (fsre[j, hh] > maxmono[j]) then maxmono[j] := fsre[j, hh]; {normuju na OREZANY signal}
      if (fxsre[j, hh] > maxmonox[j]) then maxmonox[j] := fxsre[j, hh]; {normuju na CELY signal}
    end;
  end;
  chcesobalku := MessageDlg('Do you want to save envelopes?', mtConfirmation,[mbYes, mbNo], 0);
  chcesnormalizovany := MessageDlg('Do you want to save normalized amplitudes?',mtConfirmation, [mbYes, mbNo], 0);
  {soubor pro ukladani fazoveho vlneni vsech vybranych filtru - orezane signaly}
  dohromady := SaveDialog1.FileName;
  dohromady := dohromady + '.all';
  assignfile(monochromX, dohromady);
  rewrite(monochromX);
  if filtrujuopravovany then begin
    Write(monochromX, 'truncated monochromatic signals   INSTRUMENT-CORRECTED SIGNALS IN THIS FILE!!!');
  end;
  if filtrujuopravovany = False then begin
    Write(monochromX, 'truncated monochromatic signals   RAW SIGNALS IN THIS FILE!!!');
  end;
  writeln(monochromX);
  write(monochromX, '      Filter.No.');  {zapise to nazev prvniho radku do prvniho sloupce}
  for j := inverindexf to inverindexl do begin {zapise to cisla filtru do prvniho radku}
    Write(monochromX, '    FtNo.', j: 7);
  end;
  writeln(monochromX);
  Write(monochromX, '      CentralPer');  {zapise to nazev druheho radku do prvniho sloupce}
  for j := inverindexf to inverindexl do begin {zapise to hodnoty centralni periody do druheho radku}
    Write(monochromX, period[j]: 15: 4, 's');
  end;
  writeln(monochromX);
  Write(monochromX, '      Time/InsPr');  {zapise to nazev tretiho radku a prvniho sloupce do prvniho sloupce}
  for j := inverindexf to inverindexl do begin {zapise to hodnoty okamzite periody do tretiho radku}
    Write(monochromX, instper[j, locmx[j]]: 15: 4, 's');
  end;
  writeln(monochromX);
  for hh := 1 to nsampl do begin {zapise to tabulku vsech fazovych vlneni vsech vybranych filtru}
    Write(monochromX, SVALtime[hh]: 16: 7); {zapise hodnotu casu do prvniho sloupce}
    for j := inverindexf to inverindexl do begin {zapise to amplitudy do vsech ostatnich sloupcu}
      if (chcesnormalizovany = mrNo) and (chcesobalku = mrNo) then begin {nechci ani normalizovanou ani obalku}
        Write(monochromX, (fsre[j, hh]): 16: 6);                                                               {orezany signal - puvodni velikosti}
      end;
      if (chcesnormalizovany = mrYes) and (chcesobalku = mrNo) then begin {chci normalizovany}
        Write(monochromX, (fsre[j, hh] / maxmono[j] * 1000): 16: 6);                                           {orezany signal - normalizovane}
      end;
      if (chcesnormalizovany = mrNo) and (chcesobalku = mrYes) then begin {chci obalku}
        Write(monochromX, (famp[j, hh]): 16: 6);                                                               {orezana obalka - puvodni velikosti}
      end;
      if (chcesnormalizovany = mrYes) and (chcesobalku = mrYes) then begin {chci normalizovanou obalku}
        Write(monochromX, (famp[j, hh] / maxmono[j] * 1000): 16: 6);                                           {orezana obalka - normalizovane}
      end;
    end;{for j}
    writeln(monochromX);
  end; {for hh}
  closefile(monochromX);
  {soubor pro ukladani fazoveho vlneni vsech vybranych filtru - kompletni signaly (tedy neorezane)}
  dohromady := SaveDialog1.FileName;
  dohromady := dohromady + '.cpl';
  assignfile(monochromCPL, dohromady);
  rewrite(monochromCPL);
  if filtrujuopravovany then begin
    Write(monochromCPL, 'complete monochromatic signals   INSTRUMENT-CORRECTED SIGNALS IN THIS FILE!!!');
  end;
  if filtrujuopravovany = False then begin
    Write(monochromCPL, 'complete monochromatic signals   RAW SIGNALS IN THIS FILE!!!');
  end;
  writeln(monochromCPL);
  Write(monochromCPL, '      Filter.No.');  {zapise to nazev prvniho radku do prvniho sloupce}
  for j := inverindexf to inverindexl do begin {zapise to cisla filtru do prvniho radku}
    Write(monochromCPL, '    FtNo.', j: 7);
  end;
  writeln(monochromCPL);
  Write(monochromCPL, '      CentralPer');  {zapise to nazev druheho radku do prvniho sloupce}
  for j := inverindexf to inverindexl do begin {zapise to hodnoty centralni periody do druheho radku}
    Write(monochromCPL, period[j]: 15: 4, 's');
  end;
  writeln(monochromCPL);
  Write(monochromCPL, '      Time/InsPr');  {zapise to nazev tretiho radku a prvniho sloupce do prvniho sloupce}
  for j := inverindexf to inverindexl do begin {zapise to hodnoty okamzite periody do tretiho radku}
    Write(monochromCPL, instper[j, locmx[j]]: 15: 4, 's');
  end;
  writeln(monochromCPL);
  for hh := 1 to nsampl do begin {zapise to tabulku vsech fazovych vlneni vsech vybranych filtru}
    {vystup casu pro vody tedy s rokem, dnem, mesicem atd}
    {39751 je pocet dni od zacatku Delphi letopoctu tak, aby to bylo 30.10.2008}
    {SVALtime je v sekundach, takze ho delim poctem sekund za den, aby to byl zlomek dne, pak to vyhodi spravny cas}
    //    casik := DateTimeToStr(39751+(SVALtime[hh]/86400));
    //    if ((trunc(SVALtime[hh]) mod 86400) = 0) then begin {kdyz je to pulnoc}
    //      casik := casik + ' 0:00:00';
    //    end;
    Write(monochromCPL, SVALtime[hh]: 16: 7); {zapise hodnotu casu do prvniho sloupce}
    //  write(monochromCPL,casik); {zapise hodnotu kalendarniho casu do prvniho sloupce}
    for j := inverindexf to inverindexl do begin {zapise to amplitudy do vsech ostatnich sloupcu}
      if (chcesnormalizovany = mrNo) and (chcesobalku = mrNo) then begin {nechci ani normalizovanou ani obalku}
        Write(monochromCPL, (fxsre[j, hh]): 16: 6);                                                            {cely signal - puvodni velikost}
      end;
      if (chcesnormalizovany = mrYes) and (chcesobalku = mrNo) then begin {chci normalizovany}
        Write(monochromCPL, (fxsre[j, hh] / maxmonox[j] * 1000): 16: 6);                                        {cely signal - normalizovany - maxmono znamena normalizaci na maximum orezaneho
                                                                                                                                              maxmonox znamena normalizaci na maximum celeho, coz se muze lisit}
      end;
      if (chcesnormalizovany = mrNo) and (chcesobalku = mrYes) then begin {chci obalku}
        Write(monochromCPL, (amp[j, hh]): 16: 6);                                                              {cela obalka - puvodni velikost}
      end;
      if (chcesnormalizovany = mrYes) and (chcesobalku = mrYes) then begin {chci normalizovanou obalku}
        Write(monochromCPL, (amp[j, hh] / maxmonox[j] * 1000): 16: 6);                                         {cela obalka - normalizovana}
      end;
    end;{for j}
    writeln(monochromCPL);
  end; {for hh}
  closefile(monochromCPL); {ukladani COMPLETNICH harmonickych signalu}
  {ukladani souboru s polosirkama filtru}
  dohromady := SaveDialog1.FileName;
  dohromady := dohromady + '.ftw';
  assignfile(sirky, dohromady);
  rewrite(sirky);
  writeln(sirky, 'NoFilt   CentrPerS  CentrPerHz    InstPerS   InstPerHz     SirkaHz');
  for j := inverindexf to inverindexl do begin
    writeln(sirky, j: 6, period[j]: 12: 5, (1 / period[j]): 12: 5, instper[j, locmx[j]]: 12: 5, (1 / instper[j, locmx[j]]): 12: 5, (sirkafiltru[j]): 12: 5);
  end;
  closefile(sirky);
  {soubor pro ukladani okamzitych fazi vsech vybranych filtru}
  //  fazovy := SaveDialog1.FileName;
  //  fazovy := fazovy + '.phs';
  //  assignfile(monochromXX,fazovy);
  //  rewrite(monochromXX);
  //  if filtrujuopravovany then begin
  //    write(monochromXX,'phases of monochromatic signals   INSTRUMENT-CORRECTED SIGNALS IN THIS FILE!!!');
  //  end;
  //  if filtrujuopravovany = false then begin
  //    write(monochromXX,'phases of monochromatic signals   RAW SIGNALS IN THIS FILE!!!');
  //  end;
  //  writeln(monochromXX);
  //  write(monochromXX,'Filter.No.'); {zapise to nazev prvniho radku do prvniho sloupce}
  //  for j := inverindexf to inverindexl do begin {zapise to cisla filtru do prvniho radku}
  //    write(monochromXX,'    FtNo.',j:3);
  //  end;
  //  writeln(monochromXX);
  //  write(monochromXX,'CentralPer'); {zapise to nazev druheho radku do prvniho sloupce}
  //  for j := inverindexf to inverindexl do begin {zapise to hodnoty centralni periody do druheho radku}
  //    write(monochromXX,period[j]:11:4,'s');
  //  end;
  //  writeln(monochromXX);
  //  write(monochromXX,'Time/InsPr'); {zapise to nazev tretiho radku a prvniho sloupce do prvniho sloupce}
  //  for j := inverindexf to inverindexl do begin {zapise to hodnoty okamzite periody do tretiho radku}
  //    write(monochromXX,instper[j,locmx[j]]:11:4,'s');
  //  end;
  //  writeln(monochromXX);
  //  for hh := 1 to nsampl do begin {zapise to tabulku vsech fazovych vlneni vsech vybranych filtru}
  //    write(monochromXX,SVALtime[hh]:10:3); {zapise hodnotu casu do prvniho sloupce}
  //    for j := inverindexf to inverindexl do begin {zapise to faze analytickeho signalu do vsech ostatnich sloupcu}
  //      write(monochromXX,(anphase[j,hh]):12:3);
  //    end;{for j}
  //    writeln(monochromXX);
  //  end; {for hh}
  //  closefile(monochromXX);

  {a jeste dam moznot ulozit i soubor *.hrm, ktery se normalne uklada sam pri Batchprocessingu, ale nekdy se mi hodi vyrobit si ho i rucne}
  chceshrm := MessageDlg('Do you want to save *.hrm file?', mtConfirmation, [mbYes, mbNo], 0);
  if chceshrm = mrYes then begin {pokud jo, ptam se dal}
    trcyesnovalue := MessageDlg('Do you want to save TRUNCATED harmonic signals?', mtConfirmation, [mbYes, mbNo], 0);
    if trcyesnovalue = mrYes then trcyesno := True;
    if trcyesnovalue = mrNo then  trcyesno := False;
    chcesnormalizovany := MessageDlg('Do you want to save normalized amplitudes?', mtConfirmation, [mbYes, mbNo], 0);
    Ulozharmoniku;    {pokud jsem zmacknul YES, tak to zavola procedurku na ukladani souboru *.hrm}
  end
  else if chceshrm = mrNo then begin
    exit; {kdyz ji nechci, tak to skonci}
  end
  else
    exit; {kdyz okenko zabiju krizkem, vyskoci to z batch processing}
end; {konec ukladani monochromatickych kanalu}

procedure TNoSVALform.Button15Click(Sender: TObject);
var {for saving the filtered seismograms}
  mm, i        : integer;
  nazev        : string;
  nazevHYDRO   : string;
  nazevASG     : string;
  nazevDAT     : string;
  nazevPHS     : string;
  maxCorrSre   : double;
begin
  if batchproces = False then begin
    if (filtrujuopravovany = False) then begin    {kdyz nemam korekci}
      if filtrange then begin                     {a kdyz jsem nevytvoril filtrovanou skupinu}
        ShowMessage('Are you sure you don''t want to create and save the filtered wavegroup?');
      end;
    end;
    if filtrujuopravovany then begin              {kdyz mam korekci}
      if filtrange then begin                     {a kdyz jsem nevytvoril filtrovanou skupinu}
        ShowMessage('Are you sure you don''t want to create and save the instrument-corrected filtered wavegroup?');
      end;
    end;
    if (filtrujuopravovany = False) then begin    {kdyz nemam korekci}
      ShowMessage('The records WITHOUT any instrument correction will be saved');
    end;
    if filtrujuopravovany then begin              {kdyz mam korekci}
      ShowMessage('The records WITH instrument correction applied will be saved');
    end;
    SaveDialog2.Execute;
    if length(SaveDialog2.FileName) < 1 then  exit;
    nazev := SaveDialog2.FileName;
    nazevHYDRO := nazev;  {nazev souboru s ulozenym analytickymsignalem a casem a obalkou atd}
    nazevASG := nazev;    {nazev souboru s ulozenym analytickym signalem}
    nazevDAT := nazev;
    nazevPHS := nazev;
    if hydro = False then begin
      nazev := nazev + '.dat';
    end;
    if hydro = True then begin
      nazev := nazev + '.raw';
    end;
    nazevHYDRO := nazevHydro + '.txt';
    nazevASG   := nazevASG   + '.asg';
    nazevDAT   := nazevDAT   + '.dat';
    nazevPHS   := nazevPHS   + '.phs';
    assignfile(filteredseism, nazev); {pro seismiku .dat, pro hydro .raw}
    rewrite(filteredseism);
    if hydro then begin
      assignfile(filteredseismHYDRO, nazevHYDRO); {txt}
      rewrite(filteredseismHYDRO);
      assignfile(filteredseismASG, nazevASG);
      rewrite(filteredseismASG);
      assignfile(filteredseismDAT, nazevDAT);
      rewrite(filteredseismDAT);
      assignfile(filteredseismPHS, nazevPHS);
      rewrite(filteredseismPHS);
    end;
  end; {kdyz NEMAM batchprocesing}

  if batchproces and savecorrected then begin {podle slozky se to rozdeli do adresaru, ale v kazdem z nich uz ty nazvy souboru budou BEZ oznaceni slozky, aby se daly Grapherem vykreslovat stejne nazvy souboru pro ruzne slozky}
    if sloupec = 3 then begin
      if compon = 1 then begin
        nazev := 'Zcrr/' + druhyradekstrg + '.dat';
      end;
      if compon = 2 then begin
        nazev := 'Rcrr/' + druhyradekstrg + '.dat';
      end;
      if compon = 3 then begin
        nazev := 'Tcrr/' + druhyradekstrg + '.dat';
      end;
    end; {if 3 components}
    if sloupec = 5 then begin
      if compon = 1 then begin
        nazev := 'Zcrr/' + dispfilename + '.dat';
      end;
      if compon = 2 then begin
        nazev := 'Rcrr/' + dispfilename + '.dat';
      end;
      if compon = 3 then begin
        nazev := 'Tcrr/' + dispfilename + '.dat';
      end;
      if compon = 4 then begin
        nazev := 'RZcrr/' + dispfilename + '.dat';
      end;
      if compon = 5 then begin
        nazev := 'ZRcrr/' + dispfilename + '.dat';
      end;
    end; {if 5 components}
    assignfile(filteredseism, nazev);
    rewrite(filteredseism);
  end; {if batchproces}

  if (filtrujuopravovany = False) then begin                    {kdyz nemam korekci}
    {pokud nemam korekci, tak predpokladam, ze nedelam batchprocess}
    {ale muzu a nemusim mit filtrovanou skupinu}
    {a muzu a nemusim mit bandpass filtr}
    if ((filtrange = True) and (bandpass = False)) then begin  {kdyz nemam korekci a nemam filtrovany a nemam bandpass}
      writeln(filteredseism,'        Time            RawRecord          NoWaveGroup           NoReBandps           NoImBandps          NoBandEnvel');
      ShowMessage('Only time and raw seismogram was saved');
    end;
    if ((filtrange = False) and (bandpass = False)) then begin  {kdyz nemam korekci, ale mam filtrovany a nemam bandpass}
      writeln(filteredseism,'        Time            RawRecord         RawWaveGroup           NoReBandps           NoImBandps          NoBandEnvel');
      ShowMessage('Time, raw seismogram and raw filtered wavegroup was saved');
    end;
    if ((filtrange = True) and (bandpass = True)) then begin  {kdyz nemam korekci a nemam filtrovany ale mam bandpass}
      if hydro = False then begin
        writeln(filteredseism,'        Time            RawRecord          NoWaveGroup           ReBandpass           ImBandpass         BandEnvelope');
        ShowMessage('Time, raw seismogram and bandpass filtered seismogram was saved');
      end;
      if hydro then begin {zapisuju jen ctyri hlavicky, protoze *.asg zadnou hlavicku nema}
        writeln(filteredseismHYDRO, '              Time           ReBandpass');
        writeln(filteredseism,      '              Time             RawHydro');
        writeln(filteredseismDAT,   '              Time           ReBandpass           ImBandpass         BandEnvelope');
        writeln(filteredseismPHS,   '              Time            BandPhase');
        ShowMessage('Time and bandpass waterlevel saved in *.txt file. Time, RE and IM parts and envelope of the bandpass filtered waterlevel saved in *.dat file. Time and raw waterlevel saved in *.raw file. Time and analytical signal [RE and IM parts] saved in .asg file. Time and instantaneous phase of the analytical signal saved in .phs file.');
      end;
    end;
    if ((filtrange = False) and (bandpass = True)) then begin  {kdyz nemam korekci, ale mam filtrovany a mam bandpass}
      writeln(filteredseism,'        Time            RawRecord         RawWaveGroup           ReBandpass           ImBandpass         BandEnvelope');
      ShowMessage('Time, raw seismogram, raw filtered wavegroup and bandpass filtered seismogram was saved');
    end;
    if hydro then begin
      {39751 je pocet dni od zacatku Delphi letopoctu tak, aby to bylo 30.10.2008}
      {SVALtime je v sekundach, takze ho delim poctem sekund za den, aby to byl zlomek dne, pak to vyhodi spravny cas}
      for mm := 1 to nsamplspek do begin  {pro prevzorkovane HYDRO, uklada cas a filtrovanou skupinu}
        casikSPEK := DateTimeToStr(hydrodatum + (SVALtimeSPEK[mm] / 86400));
        if ((trunc(round(hydrodatum * 86400) + SVALtimeSPEK[mm]) mod 86400) = 0) then begin {kdyz je to pulnoc}
          casikSPEK := casikSPEK + ' 00:00:00'; {protoze to samo od sebe nuly nezapisuje}
        end;
        {vystup casu ve formatu pro HPV, tedy s rokem, dnem, mesicem atd}
        {pripony souboru pro HYDRO:}
        writeln(filteredseismHYDRO, casikSPEK, (complfsre[mm] * 1000): 21: 10);                                                                {*.txt}
        writeln(filteredseismASG,   casikSPEK, (complfsre[mm] * 1000): 21: 10, (complfsim[mm] * 1000): 21: 10);                                {*.asg}
        writeln(filteredseismDAT,   casikSPEK, (complfsre[mm] * 1000): 21: 10, (complfsim[mm] * 1000): 21: 10, (complamp[mm] * 1000): 21: 10); {*.dat}
        writeln(filteredseismPHS,   casikSPEK, (complphase[mm]      ): 21: 10);                                                                {*.phs}
      end; {for mm}
    end; {if hydro = true}
    for mm := 1 to nsampl do begin {pro seismiku a syrove hydro}
      if hydro then begin
        casik := DateTimeToStr(hydrodatum + (SVALtime[mm] / 86400));
        if ((trunc(round(hydrodatum * 86400) + SVALtime[mm]) mod 86400) = 0) then begin {kdyz je to pulnoc}
          casik := casik + ' 00:00:00'; {protoze to samo od sebe nuly nezapisuje}
        end;
        writeln(filteredseism, casik, sre[mm]: 21: 10); {zde je pro HYDRO ulozen JENOM puvodni zaznam, protoze je mozne, ze bandpass maj jine vzorkovani} {*.raw}
      end; {if hydro = true}
      if hydro = False then begin
        writeln(filteredseism, SVALtime[mm]: 12: 3, sre[mm]: 21: 8, (filtered[mm] * (scalefactor * 0.01)): 21: 8, complfsre[mm]: 21: 8, complfsim[mm]: 21: 8, complamp[mm]: 21: 8);
      end; {if hydro = false}
    end;
  end;                                          {konec, kdyz nemam korekci}
  if filtrujuopravovany then begin              {kdyz mam korekci}
    {kdyz mam korekci, tak si vyberu, jestli delam nebo nedelam batchprocessing}
    if batchproces = False then begin           { pro RUCNI ukladani }
      if filtrange = True then begin           {kdyz mam korekci ale nemam filtrovany}
        writeln(filteredseism,distkm:9:4);
        writeln(filteredseism, '    Time      CorrRecord     NoWaveGroup ');
        ShowMessage('Only time and instrument-corrected seismogram was saved');
      end;
      if filtrange = False then begin           {kdyz mam i korekci i filtrovany}
        writeln(filteredseism, '    Time      CorrRecord   CorrWaveGroup');
        ShowMessage('Time, instrument-corrected seismogram and instrument-corrected filtered wavegroup was saved');
      end;
      for mm := 1 to nsampl do begin            {uklada cas, korigovany zaznam a filtrovany s korekci}
        writeln(filteredseism, SVALtime[mm]: 8: 3, CorrSre[mm]: 16: 3, (filtered[mm] * (scalefactor * 0.01)): 16: 3);
      end;
    end; {batchprocess = false}
    if batchproces = True then begin            { pro BATCHPROCES }
      {kdyz mam batchprocess, tak jsem bud zadal nebo nezadal, ze to bude nebo nebude bandpassfiltrovany, }
      {ale pri ukladani to neresim, protoze se to zapisuje do toho sameho sloupecku, takze to proste musim vedet, co jsem zadal}
      {je to nastavene na ukladani, kdy se k amplitude pricita i epicentralni vzdalenost pro malovani stanic podle vzdalenosti do jednoho grafu}
      {to s tou vzdalenosti je ve druhem sloupci oznacene jako E, a ve tretim soupci je pak jeste to same ale bez te vzdalenosti}
      if filtrange then begin {kdyz nemam filtrovanou skupinu - u batche ji nikdy nemam, ale je to nachystane, kdybych ji nekdy chtel dodelat}
        if savecorrected then begin             {pokud chci ukladat corrected seismogram}
          if batchbandpass = True then begin      {kdyz to bylo z bandpassu}
            writeln(filteredseism, '    Time     CrrBpsRcrdE      CrrBpsRcrd    statn');
          end;
          if batchbandpass = False then  begin     {kdyz to NEbylo z bandpassu}
            writeln(filteredseism, '    Time     CorrRecordE      CorrRecord    statn');
          end;
        end;
      end;
      maxCorrSre := -50000;
      for mm := 1 to nsampl do begin            {najdu maximum ukladaneho zaznamu}
        if CorrSre[mm] > maxCorrSre then maxCorrSre := CorrSre[mm];
      end;
      {ulozim prvni radek, kde je i nazev stanice, je to pro vypsani nazvu jako PlotLabel v Grapheru}
      if savecorrected then begin {pokud chci ukladat corrected seismogram}
        writeln(filteredseism, SVALtime[1]: 8: 3, ((CorrSre[1] / maxCorrSre * 10) + KUKdistkm): 16: 6, (CorrSre[1] / maxCorrSre * 10): 16: 6, '    ', druhyradekstrg); {ukladam vsechny ostatni radky, kde uz ten nazev neopakuju}
        for mm := 1 to nsampl do begin            {uklada cas a korigovany zaznam}
          {normuju to tak, aby nejvetsi amplituda byla = normampli a prictu k tomu epicentralni vzdalenost}
          writeln(filteredseism, SVALtime[mm]: 8: 3, ((CorrSre[mm] / maxCorrSre * normampli) + KUKdistkm): 16: 6, (CorrSre[mm] / maxCorrSre * normampli): 16: 6);
        end; {mm}
      end; {if savecorrected}

      {a tady ulozim ten samy na pristroj opraveny zaznam pro vsechny stanice do JEDNOHO souboru pro malovani v GMT a vyrabeni videa}
      {a udelam to bud pro raw, nebo pro bandpassfiltrovany, podle toho, co jsem zvolil pro batch processing}
      {a jeste to udelam cele 2x, ta druha moznost bude pro :vyrovnany:, coz je signal vyrovnany pomoci zhlazene obalky}
      {a take to bud bude pro whitened spektrum nebo bez, ale to pri ukladani neresim, to musim vedet, co jsem zadal}
      {kazdopadne jsem tady v batchprocessingu a jsem v korekci, coz tak dycky bude}
      if savewhole then begin {a tohle se uz ulozi pro kazdou stanici}
        if prvnihlavickasavewhole = False then begin
          prvnihlavickasavewhole := True;
          Write(aallbez, 'stati      Long      Lati');
          Write(aallvyr, 'stati      Long      Lati');
          for i := 1 to nsampl do begin               {zapise to cisla sloupcu do prvniho radku}
            Write(aallbez, i: 8);
            Write(aallvyr, i: 8);
          end;
          writeln(aallbez);                           {odradkuju na druhy radek}
          writeln(aallvyr);                           {odradkuju na druhy radek}
          Write(aallbez, '                         ');{zapisu mezery v delce jako je vyse stati long lati}
          Write(aallvyr, '                         ');{zapisu mezery v delce jako je vyse stati long lati}
          for i := 1 to nsampl do begin
            Write(aallbez, SVALtime[i]: 8: 1);        {do druheho radku zapisu cas vzorku}
            Write(aallvyr, SVALtime[i]: 8: 1);        {do druheho radku zapisu cas vzorku}
          end;
          writeln(aallbez);                           {odradkuju na treti radek}
          writeln(aallvyr);                           {odradkuju na treti radek}
        end; {konec ukladani jen jednou}
        Write(aallbez, druhyradekstrg: 5, KUKlon: 10: 4, KUKlat: 10: 4);        {zapisu jmeno a souradnice stanice}
        Write(aallvyr, druhyradekstrg: 5, KUKlon: 10: 4, KUKlat: 10: 4);        {zapisu jmeno a souradnice stanice}
        for i := 1 to nsampl do begin                               {uklada seismogram s korekci}
          Write(aallbez, (CorrSre[i] / corrsigmaxi * 1000): 8: 1);
          Write(aallvyr, (vyrovnany[i] / maxik * 1000): 8: 1);
        end;
        writeln(aallbez);        {odradkuju na dalsi radek - pro dalsi stanici}
        writeln(aallvyr);        {odradkuju na dalsi radek - pro dalsi stanici}
        {ulozim tu samou informaci ale pro kazdou stanici do zvlastniho souboru}
        assignfile(stationbpsfile, 'Zbps/' + druhyradekstrg + '.dat');
        rewrite(stationbpsfile);
        assignfile(stationeqzfile, 'Zeqz/' + druhyradekstrg + '.dat');
        rewrite(stationeqzfile);
        writeln(stationbpsfile, prvniradekstrg + '  ' + KUKdistkmstrg, nstarthlp: 10: 2, '  ' + KUKsensor + KUKlatstrg + KUKlonstrg + bazistrg);
        // ulozim sem do prvniho radku kopii prvniho radku souboru s daty
        writeln(stationeqzfile, prvniradekstrg + '  ' + KUKdistkmstrg, nstarthlp: 10: 2, '  ' + KUKsensor + KUKlatstrg + KUKlonstrg + bazistrg);
        // ulozim sem do prvniho radku kopii prvniho radku souboru s daty
        {akorat misto timedist, coz je rozdil zacatku souboru s daty a origin time, sem zapisu pocatecni cas od ktereho jsem data zpracovaval, tedy cas, ktery jsem zadal do SVALu}
        for i := 1 to nsampl do begin
          writeln(stationbpsfile, (CorrSre[i] / corrsigmaxi * 1000): 8: 1);
          writeln(stationeqzfile, (vyrovnany[i] / maxik * 1000): 8: 1);
        end;
        closefile(stationbpsfile);
        closefile(stationeqzfile);
      end; {if savewhole}
    end; {batchprocess = true}
  end;   {konec, kdyz mam korekci}
  if savecorrected then begin
    closefile(filteredseism);      {if hydro, pak je to raw}
  end;
  if hydro then begin
    closefile(filteredseism);
    closefile(filteredseismHYDRO); {txt}
    closefile(filteredseismASG);   {asg}
    closefile(filteredseismDAT);   {dat}
    closefile(filteredseismPHS);   {phs}
  end;
end; {konec ukladani seismogramu}

procedure TNoSVALform.Button53Click(Sender: TObject);    {ANALYTICKY SIGNAL}
var       {pro pocitani a malovani fazove rychlosti z analytickeho signalu}
  juju, jiji, i, j, jx : integer;
  p, k                 : integer;
begin
  pp3 := pp3 + 1;                     {namaluju prah pro tri vlnove delky}
  with PlotPanel3 do begin
    LayerOptions(pp3, pmLine, 1);       {to posledni je tloustka tecek v pixelech}
  end;
  {namaluju krivku tak, aby distkm/3 = T.c, tedy aby tretina vzdalenosti mezi stanicemi byla rovna vlnove delce, tedy aby se vesly tri vlnove delky mezi stanice}
  {a to, co je v grafu rychlosti zavisle na periode POD touto krivkou je OK, co je nad uz toto kriterium nesplnuje, tedy bud je perioda moc dlouha nebo rychlost moc vysoka}
  for i := 1 to 200 do begin {namaluju to pro 200 bodu rovnomerne rozmistenych podel osy x == perioda}
    if (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin) > 0 then begin {pokud je perioda vetsi nez nula}
      PlotPanel3.AddXY((((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin), distkm / (3 * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin)) , clWhite, pp3);
    end;
  end;
  label58.Top := PlotPanel3.Height - trunc((PlotPanel3.Height - 40) / (PlotPanel3.YMax - PlotPanel3.YMin) * distkm / (3 * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * 170) + PlotPanel3.XMin))) - 30;
  label58.Left := trunc((PlotPanel3.Width - 10) / (PlotPanel3.XMax - PlotPanel3.Xmin) * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * 170) + PlotPanel3.XMin)) + 5;
  label58.Visible := True;
  label58.BringToFront;
  pp3 := pp3 + 1;                       {namaluju prah pro dve vlnove delky}
  with PlotPanel3 do begin
    LayerOptions(pp3, pmLine, 1);       {to posledni je tloustka tecek v pixelech}
  end;
  for i := 1 to 200 do begin {namaluju to pro 200 bodu rovnomerne rozmistenych podel osy x == perioda}
    if (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin) > 0 then begin {pokud je perioda vetsi nez nula}
      PlotPanel3.AddXY((((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin), distkm / (2 * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin)) , clWhite, pp3);
    end;
  end;
  label59.Top := PlotPanel3.Height - trunc((PlotPanel3.Height - 40) / (PlotPanel3.YMax - PlotPanel3.YMin) * distkm / (2 * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * 140) + PlotPanel3.XMin))) - 30;
  label59.Left := trunc((PlotPanel3.Width - 10) / (PlotPanel3.XMax - PlotPanel3.Xmin) * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * 140) + PlotPanel3.XMin)) + 5;
  label59.Visible := True;
  label59.BringToFront;
  pp3 := pp3 + 1;                     {namaluju prah pro jednu vlnovou delku}
  with PlotPanel3 do begin
    LayerOptions(pp3, pmLine, 1);       {to posledni je tloustka tecek v pixelech}
  end;
  for i := 1 to 200 do begin {namaluju to pro 200 bodu rovnomerne rozmistenych podel osy x == perioda}
    if (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin) > 0 then begin {pokud je perioda vetsi nez nula}
      PlotPanel3.AddXY((((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin), distkm / (1 * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin)), clWhite, pp3);
    end;
  end;
  label60.Top := PlotPanel3.Height - trunc((PlotPanel3.Height - 40) / (PlotPanel3.YMax - PlotPanel3.YMin) * distkm / (1 * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * 110) + PlotPanel3.XMin))) - 30;
  label60.Left := trunc((PlotPanel3.Width - 10) / (PlotPanel3.XMax - PlotPanel3.Xmin) * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * 110) + PlotPanel3.XMin)) + 5;
  label60.Visible := True;
  label60.BringToFront;
  pp3 := pp3 + 1;                     {namaluju prah pro 0.38 vlnove delky}
  with PlotPanel3 do begin
    LayerOptions(pp3, pmLine, 1);       {to posledni je tloustka tecek v pixelech}
  end;
  for i := 1 to 200 do begin {namaluju to pro 200 bodu rovnomerne rozmistenych podel osy x == perioda}
    if (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin) > 0 then begin {pokud je perioda vetsi nez nula}
      PlotPanel3.AddXY((((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin) , distkm / (0.38 * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * i) + PlotPanel3.XMin)) , clWhite, pp3);
    end;
  end;
  label62.Top := PlotPanel3.Height - trunc((PlotPanel3.Height - 40) / (PlotPanel3.YMax - PlotPanel3.YMin) * distkm / (0.38 * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * 170) + PlotPanel3.XMin))) - 30;
  label62.Left := trunc((PlotPanel3.Width - 10) / (PlotPanel3.XMax - PlotPanel3.Xmin) * (((PlotPanel3.XMax - PlotPanel3.XMin) / 200 * 170) + PlotPanel3.XMin)) + 5;
  label62.Visible := True;
  label62.BringToFront;               {konec malovani prahu pro vlnove delky}
  grupka := False;
  {----------------------------------------------}
  {spoctu fazovou rychlost z analytickeho signalu}
  setlength(fazovaP, 2 * fazky + 1, maxnflt + 1);
  for juju := 1 to nflt do begin                            {anphase[j,i] je ta faze analytickeho signalu}
    anphasegroup[juju] := anphase[juju, locmx[juju]];       {z dvourozmerne anphase, ktera ma indexy [j,i] udelam fazi s indexama jenom [j] pro grupovy cas}
  end;
  for juju := nflt downto 2 do begin                        {zhladim anphasi pres filtry}
    if (anphasegroup[juju - 1] - anphasegroup[juju]) > 3.0 then begin   {pokud ta pro nizsi filtr je o hodne vetsi}
      for k := juju - 1 downto 1 do begin                  {tak vsechny pocitaje tou vetsi smerem k nizsim filtrum zmensim o 2*pi}
        anphasegroup[k] := anphasegroup[k] - 2 * pi;
      end;
    end;
  end;
  for juju := nflt downto 2 do begin                                  {ted to zhladim jeste, aby to bylo monotonni}
    if (anphasegroup[juju - 1] - anphasegroup[juju]) < -1.0 then begin  {pokud ta pro nizsi filtr je mensi}
      for k := juju - 1 downto 1 do begin   {tak vsechny pocitaje tou mensi smerem k nizsim filtrum zvetsim o 2*pi}
        anphasegroup[k] := anphasegroup[k] + 2 * pi;
      end;
    end;
  end;
  for juju := 1 to nflt do begin   {pocitam a maluju ruzne vetve fazove rychlosti z analytickeho signalu - tmave fialove tecky}
    {locmx ... indexy casu finalni disperzni krivky pro filtry juju a v tomto indexu casu potrebuju vycislit fazi}
    {v grvel uz je zahrnuta vzdalenost distkm}
    {1/(instper[juju,locmx[juju]]) ... frekvence v Hz, ale potrebuju ji jeste prenasobit 2*pi}
    {fazky ... pocet vetvi fazove rychlosti smerem na jednu stranu, pouzije ho to na kazdou stranu, tedy do plus i do minus, je to natvrdo zadana konstana nekde vyse}
    for p := 0 to 2 * fazky do begin      {jedu do dvojnasobku fazek, protoze zacinam u minusovych - p oznacuje ruzne disperzni vetve}
      {p ... integer, fazky ... integer}
      {vzorecek jsem vzal asi z Bensen et al. 2007, strana 14, rovnice 10, vlevo uplne dole}
//      vzorecek je:  c = 1 / (  (1 /                  U) - ( (fi                 + 2 * pi * (p - 70         + 1/8)) / (2*pi * (1/T                         ) * dist  ) )  )
//    fazovaP[p, juju] := 1 / (  (1 / grvel[locmx[juju]]) - ( (anphasegroup[juju] + 2 * pi * (p - fazky - 30 + 1/8)) / (2*pi * (1/instper[juju, locmx[juju]]) * distkm) )  );
      fazovaP[p, juju] := 1 / (  (1 / grvel[locmx[juju]]) - ( (anphasegroup[juju] + 2 * pi * (p - fazky - 30 - 1/8)) / (2*pi * (1/instper[juju, locmx[juju]]) * distkm) )  );
      {ta 1/8 je prenasobena 2*pi, takze je to vlastne 1/4*pi a to je vysledek toho, ze 1/2*pi musim odecist kvuli zmene z velocigramu na seismogram a pak musim jeste 1/4*pi pricist kvuli geometrii zdroje}
      {nejrozumensji vysledek dava kombinace dvou minusu ve vzorecku, jak pred anphasegroup, tak pred 1/8}
    end; {for p}
  end; {for juju}
  {---------------------------------------------- konec pocitani fazove rychlosti z analytickeho signalu ----------------------}
  {----- tady bych mohl spocitat grupovou z te fazove -----}

  pp3 := pp3 + 1;
  with PlotPanel3 do begin       {maluju bodiky fazovych vetvi z analytickeho signalu}
    LayerOptions(pp3, pmDot, 2);   {to posledni je tloustka tecek v pixelech}
  end;
  for jiji := 1 to nflt do begin
    for p := 0 to 2 * fazky do begin  {jedu do dvojnasobku fazek, protoze zacinam u minusovych}
      PlotPanel3.AddXY({log10}(instper[jiji, locmx[jiji]]), fazovaP[p, jiji], RGB(255, 0, 80), pp3);     {tmave fialove tecky - stejne jako v okne pro frekvence - SpectrumUnit}
    end;
  end;
  {spocitam a namaluju automaticky vybranou fazovou krivku z analytickeho signalu - svetle fialova cara}
  for p := 0 to 2 * fazky do begin                                         {projedu vsechna mozna p, tedy vetve krivek}
    if ((fazovaP[p, nflt] > 3.0) and (fazovaP[p, nflt] < 6.0)) then begin  {pokud nejaky bod pro nejdelsi periodu spadne do rozumneho rozmezi}
      fazova[nflt] := fazovaP[p, nflt];                                    {tak jeho hodnotu nacpu do vysledne kompilovane}
    end;
  end;
  for jx := nflt - 1 downto 1 do begin
    fazova[jx] := -50000;       {zadam nesmyslnou hodnotu}
    for p := 0 to 2 * fazky do begin
      if (abs(fazova[jx + 1] - fazovaP[p, jx]) < abs(fazova[jx + 1] - fazova[jx])) then fazova[jx] := fazovaP[p, jx];
    end;                        {konec pres vsechny vetve}
  end;                          {konec od nejvetsiho indexu dolu}
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmLine, 1); {to posledni je tloustka tecek v pixelech}
  end;
  if ((inverindexf <> 0) and (inverindexl <> 0)) then begin
    for j := inverindexf to inverindexl do begin {namaluju tu jen pro vybrany obor, protoze pro ten to pak ulozim, tak abych to videl, ze je jen omezeny}
      if (instper[j, locmx[j]] > PlotPanel3.Xmin) and
        (instper[j, locmx[j]] < PlotPanel3.Xmax) and (fazova[j] > PlotPanel3.Ymin) and
        (fazova[j] < PlotPanel3.Ymax) then begin
        PlotPanel3.AddXY({log10}(instper[j, locmx[j]]), fazova[j], RGB(255, 0, 210), pp3);  {svetle fialova cara - stejne jako v okne pro frekvence - SpectrumUnit}
      end;
    end;
  end;
  for j := 1 to nflt do begin                    {pokud ale nemam zadny dolni a horni malovaci index vybrany, namaluju to pro vsechny}
    if (instper[j, locmx[j]] > PlotPanel3.Xmin) and (instper[j, locmx[j]] < PlotPanel3.Xmax)
      and (fazova[j] > PlotPanel3.Ymin) and (fazova[j] < PlotPanel3.Ymax) then begin
      PlotPanel3.AddXY({log10}(instper[j, locmx[j]]), fazova[j], RGB(255, 0, 210), pp3);    {svetle fialova cara - stejne jako v okne pro frekvence - SpectrumUnit}
    end;
  end;
end; {konec pocitani a malovani fazove disperze nekolika metodami}

procedure TNoSVALform.Button54Click(Sender: TObject);   {BESSEL FUNCTION}
var       {pro pocitani a malovani fazove rychlosti z Bessel function}
  m, k    : integer;
begin     {pocitam a maluju vetve fazove rychlosti pomoci Bessel function - tmave modre tecky}
  for m := 1 to maxzerocross do begin        {pro vsechny nalezene zerocrossings - osa period}
    for k := 1 to cvelnum + 1 do begin         {pro mozna vetve - osa rychlosti - cvelnum je konstanta zadana na zacatku}
      cvel[m, k] := 0;
    end;
  end;
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 2);          {to posledni je tloustka tecek v pixelech}
  end;
  for m := 1 to maxzerocross do begin     {pro vsechny nalezene zerocrossings}
    for k := 1 to cvelnum do begin        {pro vice ruznych moznosti (frekvenci), protoze nevim, ktera nula bessel function patri ke kteremu zerocrossings, cvelnum je konstanta zadana na zacatku}
      if (((m + k - 10) > 0) and ((m + k - 10) < 505)) then begin
        if (zerocrosslabel[m] = besselzerolabel[m + k - 10]) then begin              {jen kdyz maji stejnou derivaci, tim se zmensi pocet moznosti}
          cvel[m, k] := zerocross[m] * 1.5 * pi * distkm / besselzero[m + k - 10];   {tady je pro displacement 2*pi, ale kdyz vezmu v uvahu posun mezi displacement a velocity, tak je to pi/2, takze jenom 1.5*pi}
          PlotPanel3.AddXY((1 / zerocross[m]), cvel[m, k], RGB(0, 50, 255), pp3);    {tmave modre tecky - stejne jako v okne pro frekvence - SpectrumUnit}
        end; {if}
      end; {if}
    end; {for k}
  end; {for m}
  {zkompiluju a namaluju fazovou krivku z Bessela - svetle modra cara}
  spadnul1 := False;
  spadnul2 := False;
  for m := 1 to maxzerocross do begin
    compiledcvel[m] := -50000;                                    {zadam tam nesmysl}
  end;
  for k := 1 to cvelnum do begin                                  {projedu vsechny mozne k}
    if ((cvel[1, k] > 3.0) and (cvel[1, k] < 6.0)) then begin   {pokud nejaky bod pro nejdelsi periodu spadne do rozumneho rozmezi}
      compiledcvel[1] := cvel[1, k];      {zacnu od nej kompilovat}
      spadnul1 := True;                   {nasel neco rozumneho na nejdelsi periode}
    end;
  end;
  if spadnul1 = False then begin    {pokud to nenaslo zadnou rozumou rychlost na nejdelsi periode, podivame se na druhou nejdelsi}
    for k := 1 to cvelnum do begin                                {projedu vsechny mozne k}
      if ((cvel[2, k] > 3.0) and (cvel[2, k] < 6.0)) then begin {pokud nejaky bod pro druhou nejdelsi periodu spadne do rozumneho rozmezi}
        compiledcvel[2] := cvel[2, k];        {zacnu od nej kompilovat}
        spadnul2 := True;                     {nasel neco rozumneho na druhe nejdelsi periode}
      end;
    end;
  end;
  if spadnul1 then begin                                          {vlastni kompilace podle nejdelsi periody}
    for m := 2 to maxzerocross do begin {pro vsechny nalezene zerocrossings - tedy podel osy X, ale od nejdelsich period k nejkratsim, coz je fajn, protoze podle te nejdelsi to rozhodnu, ktera vetev je ta spravna}
      for k := 1 to cvelnum do begin         {a pro jedno m projedu vsechny mozne k}
        if (abs(cvel[m, k] - compiledcvel[m - 1]) < abs(compiledcvel[m] - compiledcvel[m - 1])) then compiledcvel[m] := cvel[m, k];
        {   jakakoli     kompilovana pro        nova kompilovana    kompilovana pro         nova kompilovana   ta spravna  }
        { pro kratsi T      delsi T                                    delsi T                                pro kratsi T }
      end;
    end;
  end;
  if spadnul2 then begin                                          {vlastni kompilace podle druhe nejdelsi}
    for m := 3 to maxzerocross do begin {pro vsechny nalezene zerocrossings - tedy podel osy X, ale od nejdelsich period k nejkratsim, coz je fajn, protoze podle te nejdelsi to rozhodnu, ktera vetev je ta spravna}
      for k := 1 to cvelnum do begin         {a pro jedno m projedu vsechny mozne k}
        if (abs(cvel[m, k] - compiledcvel[m - 1]) < abs(compiledcvel[m] - compiledcvel[m - 1])) then compiledcvel[m] := cvel[m, k];
        {   jakakoli     kompilovana pro        nova kompilovana    kompilovana pro         nova kompilovana   ta spravna  }
        { pro kratsi T      delsi T                                    delsi T                                pro kratsi T }
      end;
    end;
  end;
  pp3 := pp3 + 1;  {a jeste tu vybranou namaluju}
  with PlotPanel3 do begin
    LayerOptions(pp3, pmLine, 1);   {to posledni je tloustka tecek v pixelech}
  end;
  if spadnul1 then begin
    for m := 1 to maxzerocross do begin                           {pro vsechny nalezene zerocrossings od nejdelsi}
      PlotPanel3.AddXY((1 / zerocross[m]), compiledcvel[m], RGB(0, 255, 250), pp3);    {svetle modra cara  - stejne jako v okne pro frekvence - SpectrumUnit}
    end;
  end;
  if spadnul2 then begin
    for m := 2 to maxzerocross do begin                           {pro vsechny nalezene zerocrossings od druhe nejdelsi}
      PlotPanel3.AddXY((1 / zerocross[m]), compiledcvel[m], RGB(0, 255, 250), pp3);    {svetle modra cara  - stejne jako v okne pro frekvence - SpectrumUnit}
    end;
  end;
end; {konec procedury pocitani a malovani faze z Bessela}

procedure TNoSVALform.Button55Click(Sender: TObject);   {SPECTRAL PHASE}
var       {procedura na pocitani a malovani fazove rychlosti z faze spektra}
  m, k, h                    : integer;
  kompilujuodm, kompilujudom : integer;
begin     {pocitam a maluju ruzne vetve fazove rychlosti spoctene z faze spektra - tmave zelene tecky}
  for m := 1 to nhlf do begin             {pro vsechny vzorky spektra - osa period}
    for k := 1 to cvelnumspec do begin    {pro nejaky zadany pocet fazovych vetvi - osa rychlosti, cvelnumspec je konstanta zadana na zacatku}
      spectralc[m, k] := -1;              {vynuluju - prvni index jsou vzorky podel frekvence, druhy index jsou vetve, stejne jako cvel vyse}
    end;
  end;
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 2);            {to posledni je tloustka tecek v pixelech}
  end;
  for m := 1 to nhlf do begin
    for k := 1 to cvelnumspec do begin
      if (spectralphase[m] + 2 * pi * (k)) > 0 then begin
        spectralc[m, k] := (frequency[m] * 2 * pi * distkm) / (spectralphase[m] + 2 * pi * (k));
        if ((1 / frequency[m]) > instper[1, locmx[1]]) and ((1 / frequency[m]) < PlotPanel3.Xmax) and (spectralc[m, k] > 0) and (spectralc[m, k] < PlotPanel3.Ymax) then begin {abys se to malovalo jen od nejkratsi periody smerem k delsim a ne pro spoustu jesty vyssich frekvenci (kratsich period)}
          PlotPanel3.AddXY((1 / frequency[m]), spectralc[m, k], RGB(0, 100, 30), pp3);  {tmave zelene tecky  - stejne jako v okne pro frekvence - SpectrumUnit}
        end; {if}
      end; {if}
    end; {for k}

    if spectralc[m, 1] > 7 then begin       {pokud uz ta fazova rychlost pro rostouci frekvenci "m" bude moc velika, tak prictu ke vsem nasledujicim fazim nasobek 2*pi}
      for h := m + 1 to nhlf do begin        {tak ke vsem nasledujicim prictu 2*pi, ... delam fazi monotonni, ale ne pro kazdy krok, ale jen kdyz to potrebuju kvuli te rychlosti}
        spectralphase[h] := spectralphase[h] + 2 * pi;
      end; {of for :h:}
    end; {if}

  end; {for m}
  {kompiluju hladkou fazovou krivku z faze spektra}
  for m := 1 to nhlf do begin
    compiledspectralc[m] := -50000;                               {zadam tam nesmysl}
  end;
  for m := 1 to nhlf do begin                                    {projedu vsechny mozne frekvence}
    if ((1 / frequency[m]) < instper[nflt, locmx[nflt]]) then begin {chci to delat jen pro rozumne rozmezi period, ne pro nejkratsi frekvence, tedy pro nesmyslne dlouhe periody}
      kompilujuodm := m;      {takze tady mam nejake nejmensi m oznacujici nejmensi frekvenci, tedy nejdelsi periodu, pro kterou budu kompilovat}
      break;
    end; {if frekvence jsou v rozmezi period}
  end;
  for m := nhlf downto 1 do begin    {projedu vsechny mozne frekvence, ale pozpatku, od te nejvyssi, abych si nasel nejvyssi smysluplnou}
    if ((1 / frequency[m]) > instper[1, locmx[1]]) then begin {chci to delat jen pro rozumne rozmezi period, ne pro nejkratsi frekvence, tedy pro nesmyslne dlouhe periody a to same i pro nejvyssi frekvence, tedy nesmyslne kratke periody}
      kompilujudom := m;      {takze tady mam nejake nejvetsi m oznacujici nejvyssi frekvenci, tedy nejkratsi periodu, kam az ma smysl to kompilovat}
      break;
    end; {if frekvence jsou v rozmezi period}
  end;
  for k := 1 to cvelnumspec do begin                              {projedu vsechny mozne k}
    if ((spectralc[kompilujuodm, k] > 2.0) and (spectralc[kompilujuodm, k] < 6.0)) then begin   {pokud nejaky bod pro nejdelsi periodu spadne do rozumneho rozmezi}
      compiledspectralc[kompilujuodm] := spectralc[kompilujuodm, k];      {zacnu od nej kompilovat}
    end; {if to bylo v rozmezi}
  end; {for k}
  for m := kompilujuodm + 1 to kompilujudom do begin {pro vsechny nalezene zerocrossings - tedy podel osy X, ale od nejdelsich period k nejkratsim, coz je fajn, protoze podle te nejdelsi to rozhodnu, ktera vetev je ta spravna}
    for k := 1 to cvelnumspec do begin         {a pro jedno m projedu vsechny mozne k}
      if (abs(spectralc[m, k] - compiledspectralc[m - 1]) <
        abs(compiledspectralc[m] - compiledspectralc[m - 1])) then compiledspectralc[m] := spectralc[m, k];
    end;
  end;
  pp3 := pp3 + 1;  {a jeste tu vybranou namaluju}
  with PlotPanel3 do begin
    LayerOptions(pp3, pmLine, 1); {to posledni je tloustka tecek v pixelech}
  end;
  for m := kompilujuodm to kompilujudom do begin
    if ((1 / frequency[m]) > instper[1, locmx[1]]) and ((1 / frequency[m]) < PlotPanel3.Xmax) then begin {abys se to malovalo jen od nejkratsi periody smerem k delsim a ne pro spoustu jesty vyssich frekvenci (kratsich period)}
      PlotPanel3.AddXY((1 / frequency[m]), compiledspectralc[m], RGB(0, 255, 30), pp3);     {jedle zelena cara  - stejne jako v okne pro frekvence - SpectrumUnit}
    end;
  end;
end; {konec pocitani a malovani fazove rychlosti z faze spektra}

procedure TNoSVALform.Button56Click(Sender: TObject);
var {kresleni vyrovnaneho bandpass filterovaneho signalu}
  uu          : integer;
begin
  if udelalopraveny = True then maxik := corrsigmaxi;
  if udelalopraveny = False then maxik := complsigmaxi;
  cfs := cfs + 1;
  with PlotPanel2 do begin
    LayerOptions(cfs, pmLine, 1);
  end;
  for uu := 2 to trunc(nsampl / kraceni) do begin {for uu:= 2 to nsampl do begin}
    PlotPanel2.AddXY(SVALtime[uu * kraceni], vyrovnany[uu * kraceni] / maxik, RGB(255, 50, 50), cfs);
  end;
  if hydro = false then begin
    Ukazcarky;
    Ukazrychlosti;
  end;
end;

procedure TNoSVALform.RadioGroup3Click(Sender: TObject);
begin {vybira typ inverze}
  if RadioGroup3.ItemIndex = 0 then begin {kdyz chci pouzit defaultni inverzi}
    Dinar := False;
    fromPhaseCorr := false;
    fromArrayCorr := false;
    KTB := False;
    Form1.Edit6.Text := '10';
    CheckBox2.Enabled := true;      {constant density}
    edit15.Text := '1.9';           {S wave v prvni vrstve}
    edit15.Enabled := true;         {surface S wave velocity}
    edit21.Text := '0.2';           {surface S wave step}
    edit21.Enabled := true;
    edit17.Text := '1.73';          {vpvs}
    edit17.Enabled := true;
    edit18.Text := '0.1';           {range of vpvs}
    edit18.Enabled := true;
    edit13.Text := '0.22';          {range of S}
    edit13.Enabled := true;
    edit16.Text := '1.8';           {surface density}
    edit16.Enabled := true;
    edit14.Text := '0.08';          {density step}
    edit14.Enabled := true;
    RadioGroup6.ItemIndex := 1;     {phase}
    RadioGroup1.Enabled := true;    {kde se vybira typ vln}
    RadioButton1.Enabled := true;
    RadioButton2.Enabled := true;
    RadioGroup6.Enabled := false;   {group / phase}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | A - DEFAULT inversion selected');
  end;
  if RadioGroup3.ItemIndex = 1 then begin {kdyz chci pouzit DINARIDES inverzi}
    Dinar := True;
    KTB := False;
    Form1.Edit6.Text := '100';
    CheckBox2.Checked := true;      {constant density}
    menise := False;
    CheckBox2.Enabled := false;
    edit15.Enabled := false;        {surface S wave velocity - hodnotu nastavim az podle layers}
    edit21.Text := '0.2';           {surface S wave step}
    edit21.Enabled := false;
    edit17.Text := '1.65';          {vpvs}
    edit17.Enabled := false;
    edit18.Text := '0.00001';       {range of vpvs}
    edit18.Enabled := false;
    edit13.Text := '0.15';          {range of S  - pro prvni 4306 beh tu bylo 0.3 tedy 2x vice, ale pro vice vrstev to snizuju na 0.15}
    edit13.Enabled := false;
    edit16.Text := '2.0';           {surface density podle update AK135}
    edit16.Enabled := false;
    edit14.Text := '0.00001';       {density step}
    edit14.Enabled := false;
    RadioGroup6.ItemIndex := 1;     {phase}
    RadioGroup1.Enabled := false;   {kde se vybira typ vln}
    RadioButton1.Enabled := false;
    RadioButton2.Enabled := false;
    RadioGroup6.Enabled := false;   {group / phase}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | B - DEEP inversion selected');
  end;
  if RadioGroup3.ItemIndex = 2 then begin {kdyz chci pouzit KTB inverzi}
    Dinar := False;
    fromPhaseCorr := false;
    fromArrayCorr := false;
    KTB := True;
    Form1.Edit6.Text := '30';
    CheckBox2.Checked := true;      {constant density}
    menise := False;
    CheckBox2.Enabled := false;
    edit15.Enabled := false;        {surface S wave velocity - hodnotu nastavim az podle layers}
    edit21.Text := '0.4';           {surface S wave step}
    edit21.Enabled := false;
    edit17.Text := '1.744';         {vpvs at the surface from Irene's RF models}
    edit17.Enabled := false;
    edit18.Text := '0.00001';       {range of vpvs}
    edit18.Enabled := false;
    edit13.Text := '0.15';          {range of S}
    edit13.Enabled := false;
    edit16.Text := '1.02';          {surface density podle update AK135}
    edit16.Enabled := false;
    edit14.Text := '0.00001';       {density step}
    edit14.Enabled := false;
    RadioGroup6.ItemIndex := 0;     {group}
    RadioGroup1.Enabled := false;   {kde se vybira typ vln}
    RadioButton1.Enabled := false;
    RadioButton2.Enabled := false;
    RadioGroup6.Enabled := false;   {group / phase}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | C - KTB inversion selected');
  end;
end; {procedury na vybirani typu inverze default - dinarides - ktb}


procedure TNoSVALform.Button19Click(Sender: TObject); {Save disp ...}
{for saving the dispersion curve and to interpolate the values of propagation time and group velocity}
const
  kmax = 3000; {pocet bodu interpolovane krivky}
var
  juju, k, i, hh  : integer;
  interperi       : array[1..kmax] of double; {body periody, do nichz budu interpolovat cas a rychlost}
  intertime       : array[1..kmax] of double; {interpolovane hodnoty casu prichodu}
  intervelo       : array[1..kmax] of double; {interpolovane hodnoty grupove rychlosti}
  dX, dY          : double;
  diffperi        : double;
  deltaperi       : double;
  pocetperi       : integer;
  vsechno         : string;
  interpol        : string;
  wavegrp         : string;
  pocetperistrg   : string;
  deltaperistrg   : string;
  grvl1, grvl2, grvl3, grvl4, grvl5, grvl6, grvl7, grvl8: double;
  zapsat          : array of boolean;
  CC              : string;
begin
  if ((inverindexf = 0) or (inverindexl = 0)) then begin
    ShowMessage('Please, select the period range for the curve you want to save!');
    exit;
  end; {disperzi ukladam jen pro vybrany obor period, jinak ne}
  if batchproces = False then begin {kdyz ukladam pomoci batch processing, tak tyhle hlasky preskakuju}
    if (sloupec <> 5) then begin {kdyz delam 5-column file, tak to taky preskocim}
      if (filtrujuopravovany = False) then begin  {kdyz nemam korekci}
        ShowMessage('The dispersion curves WITHOUT any instrument correction will be saved');
      end;
      if (filtrujuopravovany) then begin          {kdyz mam korekci}
        ShowMessage('The dispersion curves WITH instrument correction applied will be saved');
      end;
    end; {vynechano pro 5-column file}
    if sloupec = 5 then begin {tedy je zaskrtnuto "5-component CC file"}
      CreateDir(cestamanu+'disp');
      if compon = 1 then CC := '_ZZ';
      if compon = 2 then CC := '_RR';
      if compon = 3 then CC := '_TT';
      if compon = 4 then CC := '_RZ';
      if compon = 5 then CC := '_ZR';
      vsechno  := cestamanu+'disp/'+dispfilename+CC;
      interpol := cestamanu+'disp/'+dispfilename+CC;
      ridges   := cestamanu+'disp/'+dispfilename+CC;
      dots     := cestamanu+'disp/'+dispfilename+CC;
    end
    else begin
      SaveDialog3.Execute;            {pro rucni ukladani vezmu nazev souboru z dialogu, kam jsem ho rucne naklofal}
      if length(SaveDialog3.FileName) < 1 then exit;
      vsechno  := SaveDialog3.FileName;
      interpol := SaveDialog3.FileName;
      ridges   := SaveDialog3.FileName;
      dots     := SaveDialog3.FileName;
    end; {if to je nebo neni 5-component}
  end; {if batchprocess = false}

  if batchproces then begin             {pro batchprocess vezmu nazev souboru z jmenouloz, ktere jsem si vytvoril v procedure Vyrobjmeno}
    ridges := jmenouloz;
    dots := jmenouloz;
    if batchdisperze then begin         {pokud chci v Batchi ukladat take disperzi}
      vsechno  := jmenouloz;            {tak i temto dvoum souborum priradim ta jmena z Vyrobjmeno}
      interpol := jmenouloz;
      wavegrp  := jmenouloz;
    end; {if batchdisperze}
    if prorenatu then begin
      delkarenaty := length(jmenofilu);
      ridges := Copy(jmenofilu, 1, delkarenaty - 4);
    end;
  end; {if batchprocess = true}

  if batchproces = False then begin {delam jen pro rucni analyzu}
    vsechno := vsechno + '.dat';
    assignfile(dispersion, vsechno);
    rewrite(dispersion);
    interpol := interpol + '.itp';
    assignfile(dispersionX, interpol);
    rewrite(dispersionX);
    if savewave then begin
      wavegrp := wavegrp + '.dat';
      assignfile(wavegroupfile, wavegrp);
      rewrite(wavegroupfile);
    end;
  end;

  if batchdisperze then begin   {delam jen kdyz jsem zamerne zvolil, ze CHCI ukladat disperzi i v Batchi}
    if compon = 1 then begin    {tohle jsou sobory pro kazdou stanici zvlast}
      vsechno  := 'Zdsp/' + vsechno  + '.dat'; {ulozim to do specialniho adresare}
      interpol := 'Zdsp/' + interpol + '.itp'; {ulozim to do specialniho adresare}
      wavegrp  := 'Zwgr/' + wavegrp  + '.dat'; {ulozim to do specialniho adresare}
    end;
    if compon = 2 then begin
      vsechno  := 'Rdsp/' + vsechno  + '.dat'; {ulozim to do specialniho adresare}
      interpol := 'Rdsp/' + interpol + '.itp'; {ulozim to do specialniho adresare}
      wavegrp  := 'Rwgr/' + wavegrp  + '.dat'; {ulozim to do specialniho adresare}
    end;
    if compon = 3 then begin
      vsechno  := 'Tdsp/' + vsechno  + '.dat'; {ulozim to do specialniho adresare}
      interpol := 'Tdsp/' + interpol + '.itp'; {ulozim to do specialniho adresare}
      wavegrp  := 'Twgr/' + wavegrp  + '.dat'; {ulozim to do specialniho adresare}
    end;
    if compon = 4 then begin
      vsechno  := 'RZdsp/' + vsechno  + '.dat'; {ulozim to do specialniho adresare}
      interpol := 'RZdsp/' + interpol + '.itp'; {ulozim to do specialniho adresare}
      wavegrp  := 'RZwgr/' + wavegrp  + '.dat'; {ulozim to do specialniho adresare}
    end;
    if compon = 5 then begin
      vsechno  := 'ZRdsp/' + vsechno  + '.dat'; {ulozim to do specialniho adresare}
      interpol := 'ZRdsp/' + interpol + '.itp'; {ulozim to do specialniho adresare}
      wavegrp  := 'ZRwgr/' + wavegrp  + '.dat'; {ulozim to do specialniho adresare}
    end;
    assignfile(dispersion, vsechno);
    rewrite(dispersion);
    assignfile(dispersionX, interpol);
    rewrite(dispersionX);
    if savewave then begin
      assignfile(wavegroupfile, wavegrp);
      rewrite(wavegroupfile);
    end;
  end; {if batchdisperze}

  if ((batchproces = False) or (batchdisperze)) then begin {delam jen pro rucni analyzu anebo kdyz jsem zamerne zvolil, ze CHCI ukladat disperzi i v Batchi}
    if (filtrujuopravovany = False) then begin  {kdyz nemam korekci}
      writeln(dispersion,'    InstPeriod InstFrequency    PropagTime    GroupVeloc           Amplitude CentralPeriod   PhasePeriod PhasePosition    phasevel    AnPhsGrp');
    end;
    if filtrujuopravovany then begin            {kdyz mam korekci}
      writeln(dispersion,'    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc           Amplitude CentralPeriod   PhasePeriod PhasePosition');
    end;
    for juju := inverindexf to inverindexl do begin   {tenhleten cas me zajima pro tomografii}
      writeln(dispersion, instper[juju, locmx[juju]]: 14: 4, 1 / (instper[juju, locmx[juju]]): 14: 4, SVALtime[locmx[juju]]: 14: 3, grvel[locmx[juju]]: 14: 4, amp[juju, locmx[juju]]: 20: 4, period[juju]: 14: 4, instper[juju, zeroposition[juju]]: 14: 4, SVALtime[zeroposition[juju]]: 14: 4, fazova[juju]: 12: 6, anphasegroup[juju]: 12: 4);
    end; {tady jsem ulozil napoctene body disperze pro vybrany obor period}
    closefile(dispersion);
    {uklada se dalsi soubor s interpolovanymi hodnotami}
    for k := 1 to kmax do begin {pro jistotu nuluju pole pred kazdym pouzitim}
      intertime[k] := 0.0;
      intervelo[k] := 0.0;
    end;
    deltaperi := 0.05;
    diffperi := instper[inverindexl, locmx[inverindexl]] - instper[inverindexf, locmx[inverindexf]]; {rozsah ukladanych period}
    pocetperi := trunc(diffperi / deltaperi) + 2;  {kolik period po kroku 0.05 by se tam veslo}
    if pocetperi < 20 then begin    {kdyz bude tech interpolacnich bodu moc malo, tak je dam hustejc}
      deltaperi := 0.005;
      pocetperi := trunc(diffperi / deltaperi) + 2; {kolik period po kroku 0.005 by se tam veslo}
    end;
    str(pocetperi: 4, pocetperistrg);
    str(deltaperi: 6: 4, deltaperistrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - dispersion curve is interpolated into ' + pocetperistrg + ' points');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - the interpolation step is ' + deltaperistrg + ' s');
    for k := 1 to kmax do begin
      interperi[k] := deltaperi * k; {body periody, do nichz budu interpolovat cas a rychlost}
    end;     {napoctu si jich hodne, vic, nez nakonec budu potrebovat, ale je to takhle jednodussi}
    for juju := inverindexf to (inverindexl - 1) do begin
      for k := 1 to kmax do begin
        if (interperi[k] >= instper[juju, locmx[juju]]) and (interperi[k] <= instper[juju + 1, locmx[juju + 1]]) then begin
          dY := SVALtime[locmx[juju + 1]] - SVALtime[locmx[juju]];
          dX := instper[juju + 1, locmx[juju + 1]] - instper[juju, locmx[juju]];
          intertime[k] := SVALtime[locmx[juju]] + (dY / dX) * (interperi[k] - instper[juju, locmx[juju]]);
        end; {if}
        if (interperi[k] >= instper[juju, locmx[juju]]) and (interperi[k] <= instper[juju + 1, locmx[juju + 1]]) then begin
          dY := grvel[locmx[juju + 1]] - grvel[locmx[juju]];
          dX := instper[juju + 1, locmx[juju + 1]] - instper[juju, locmx[juju]];
          intervelo[k] := grvel[locmx[juju]] + (dY / dX) * (interperi[k] - instper[juju, locmx[juju]]);
        end; {if}
      end; {for k}
    end; {for juju}
    for k := kmax downto 1 do begin {najdu jeste jeden extrapolovany bod v kratkych periodach}
      if interperi[k] < instper[inverindexf, locmx[inverindexf]] then begin
        dY := SVALtime[locmx[inverindexf + 1]] - SVALtime[locmx[inverindexf]];
        dX := instper[inverindexf + 1, locmx[inverindexf + 1]] - instper[inverindexf, locmx[inverindexf]];
        intertime[k] := SVALtime[locmx[inverindexf]] + (dY / dX) * (interperi[k] - instper[inverindexf, locmx[inverindexf]]);
        dY := grvel[locmx[inverindexf + 1]] - grvel[locmx[inverindexf]];
        dX := instper[inverindexf + 1, locmx[inverindexf + 1]] - instper[inverindexf, locmx[inverindexf]];
        intervelo[k] := grvel[locmx[inverindexf]] + (dY / dX) * (interperi[k] - instper[inverindexf, locmx[inverindexf]]);
        break; {aby to vyskocilo po prvnim takovem bodu}
      end; {if}
    end; {for k}
    for k := 1 to kmax do begin {najdu jeste jeden extrapolovany bod v dlouhych periodach}
      if interperi[k] > instper[inverindexl, locmx[inverindexl]] then begin
        dY := SVALtime[locmx[inverindexl]] - SVALtime[locmx[inverindexl - 1]];
        dX := instper[inverindexl, locmx[inverindexl]] -
          instper[inverindexl - 1, locmx[inverindexl - 1]];
        intertime[k] := SVALtime[locmx[inverindexl]] + (dY / dX) *
          (interperi[k] - instper[inverindexl, locmx[inverindexl]]);
        dY := grvel[locmx[inverindexl]] - grvel[locmx[inverindexl - 1]];
        dX := instper[inverindexl, locmx[inverindexl]] -
          instper[inverindexl - 1, locmx[inverindexl - 1]];
        intervelo[k] := grvel[locmx[inverindexl]] + (dY / dX) *
          (interperi[k] - instper[inverindexl, locmx[inverindexl]]);
        break; {aby to vyskocilo po prvnim takovem bodu}
      end; {if}
    end; {for k}
    if (filtrujuopravovany = False) then begin      {kdyz nemam korekci}
      if sloupec = 5 then begin
        writeln(dispersionX, 'dist',KUKdistkmstrg,'  ', druhyradekstrg);
      end;
      writeln(dispersionX, '    Period    InterpolTime  InterpolGroupVel');
    end;
    if (filtrujuopravovany) then begin              {kdyz mam korekci}
      writeln(dispersionX, '    Period  CorrIntrplTime  CorrIntrplGrpVel');
      if savewave then begin
        writeln(wavegroupfile, prvniradekstrg + '  ' + KUKdistkmstrg, nstarthlp: 10: 2, '  ' + KUKsensor + KUKlatstrg + KUKlonstrg + bazistrg);// ulozim sem do prvniho radku kopii prvniho radku souboru s daty
      end; // akorat misto timedist, coz je rozdil zacatku souboru s daty a origin time, sem zapisu pocatecni cas od ktereho jsem data zpracovaval, tedy cas, ktery jsem zadal do SVALu
    end;
    for k := 1 to kmax do begin
      if (intertime[k] <> 0.0) then begin
        writeln(dispersionX, interperi[k]: 10: 3, intertime[k]: 16: 3, intervelo[k]: 18: 3);
      end;
    end;
    if savewave then begin
      for i := 1 to nsampl do begin
        writeln(wavegroupfile, filtered[i]: 8: 1);
      end;
    end;
    closefile(dispersionX);
    if savewave then begin
      closefile(wavegroupfile);
    end;
  end; {konec if pro batchproces = false nebo if jsem chtel batchdisperzi}

  {uklada se soubor se vsema ridges}
  if batchproces and saverdg then begin
    if compon = 1 then begin
      ridges := 'Zrdg/' + ridges + '.rdg'; {ulozim to do specialniho adresare}
      dots := 'Zrdg/' + dots + '.dot'; {ulozim to do specialniho adresare}
    end;
    if compon = 2 then begin
      ridges := 'Rrdg/' + ridges + '.rdg'; {ulozim to do specialniho adresare}
      dots := 'Rrdg/' + dots + '.dot'; {ulozim to do specialniho adresare}
    end;
    if compon = 3 then begin
      ridges := 'Trdg/' + ridges + '.rdg'; {ulozim to do specialniho adresare}
      dots := 'Trdg/' + dots + '.dot'; {ulozim to do specialniho adresare}
    end;
    if compon = 4 then begin
      ridges := 'RZrdg/' + ridges + '.rdg'; {ulozim to do specialniho adresare}
      dots := 'RZrdg/' + dots + '.dot'; {ulozim to do specialniho adresare}
    end;
    if compon = 5 then begin
      ridges := 'ZRrdg/' + ridges + '.rdg'; {ulozim to do specialniho adresare}
      dots := 'ZRrdg/' + dots + '.dot'; {ulozim to do specialniho adresare}
    end;
  end; {if batchproces and saverdg}
  if batchproces = False then begin
    ridges := ridges + '.rdg';
    dots := dots + '.dot';
  end;
  if ((batchproces = False) or ((batchproces = True) and (saverdg = True))) then begin
    assignfile(dispersionXrdg, ridges); {zde je to pro batch i bez batch}
    rewrite(dispersionXrdg);    {ukladam epicentralni vzdalenost, aby se v jinem programu mohl odecitat cas sireni pro zvoleny model, dale pak pristroj - jen pro informaci}
    {a dale pak ukladam i souradnice stanice, aby s tim dal mohly pracovat Widle}
    //writeln(dispersionXrdg, distkm: 12: 4, '  ', KUKsensor: 10, KUKlat: 10: 4, KUKlon: 10: 4); // zapisuje hlavicku
    //prorenatu := True; // jen pro demonstraci to prepnu na prorenatu, protoze to zapisuje i rychlosti do rdg souboru
    if prorenatu = False then begin
      if (filtrujuopravovany = False) then begin  {kdyz nemam korekci}
        write(dispersionXrdg,  '    InsPer1      Time1       Err1    InsPer2      Time2       Err2    InsPer3      Time3       Err3    InsPer4      Time4       Err4');
        writeln(dispersionXrdg,'    InsPer5      Time5       Err5    InsPer6      Time6       Err6    InsPer7      Time7       Err7    InsPer8      Time8       Err8');
      end;
      if filtrujuopravovany then begin            {kdyz mam korekci}
        write(dispersionXrdg,  '    InsPer1   CrrTime1       Err1    InsPer2   CrrTime2       Err2    InsPer3   CrrTime3       Err3    InsPer4   CrrTime4       Err4');
        writeln(dispersionXrdg,'    InsPer5   CrrTime5       Err5    InsPer6   CrrTime6       Err6    InsPer7   CrrTime7       Err7    InsPer8   CrrTime8       Err8');
      end;
    end;
    if prorenatu = True then begin
      if (filtrujuopravovany = False) then begin  {kdyz nemam korekci}
        Write(dispersionXrdg,  '    InsPer1      GrVl1       Err1    InsPer2      GrVl2       Err2    InsPer3      GrVl3       Err3    InsPer4      GrVl4       Err4');
        writeln(dispersionXrdg,'    InsPer5      GrVl5       Err5    InsPer6      GrVl6       Err6    InsPer7      GrVl7       Err7    InsPer8      GrVl8       Err8');
      end;
      if filtrujuopravovany then begin            {kdyz mam korekci}
        Write(dispersionXrdg,  '    InsPer1   CrrGrVl1       Err1    InsPer2   CrrGrVl2       Err2    InsPer3   CrrGrVl3       Err3    InsPer4   CrrGrVl4       Err4');
        writeln(dispersionXrdg,'    InsPer5   CrrGrVl5       Err5    InsPer6   CrrGrVl6       Err6    InsPer7   CrrGrVl7       Err7    InsPer8   CrrGrVl8       Err8');
      end;
    end;
    grvl1 := 0;
    grvl2 := 0;
    grvl3 := 0;
    grvl4 := 0;
    grvl5 := 0;
    grvl6 := 0;
    grvl7 := 0;
    grvl8 := 0;
    for juju := inverindexf to inverindexl do begin {index k = (1 .. 8) v pripade errormax oznacuje, kolikate maximum to je ve filtru juju}
      if SVALtime[max1locmx[juju]] = 0 then errormax[1, juju] := 0;  {nuluju, ze kdyz je cas nula, aby i odchlka byla nula, protoze tam jsou nejake hovjeziny}
      if SVALtime[max2locmx[juju]] = 0 then errormax[2, juju] := 0;
      if SVALtime[max3locmx[juju]] = 0 then errormax[3, juju] := 0;
      if SVALtime[max4locmx[juju]] = 0 then errormax[4, juju] := 0;
      if SVALtime[max5locmx[juju]] = 0 then errormax[5, juju] := 0;
      if SVALtime[max6locmx[juju]] = 0 then errormax[6, juju] := 0;
      if SVALtime[max7locmx[juju]] = 0 then errormax[7, juju] := 0;
      if SVALtime[max8locmx[juju]] = 0 then errormax[8, juju] := 0;
      if prorenatu = False then begin
        writeln(dispersionXrdg,  instper[juju, max1locmx[juju]]: 11: 3, SVALtime[max1locmx[juju]]: 11: 3, errormax[1, juju]: 11: 3,
                                 instper[juju, max2locmx[juju]]: 11: 3, SVALtime[max2locmx[juju]]: 11: 3, errormax[2, juju]: 11: 3,
                                 instper[juju, max3locmx[juju]]: 11: 3, SVALtime[max3locmx[juju]]: 11: 3, errormax[3, juju]: 11: 3,
                                 instper[juju, max4locmx[juju]]: 11: 3, SVALtime[max4locmx[juju]]: 11: 3, errormax[4, juju]: 11: 3,
                                 instper[juju, max5locmx[juju]]: 11: 3, SVALtime[max5locmx[juju]]: 11: 3, errormax[5, juju]: 11: 3,
                                 instper[juju, max6locmx[juju]]: 11: 3, SVALtime[max6locmx[juju]]: 11: 3, errormax[6, juju]: 11: 3,
                                 instper[juju, max7locmx[juju]]: 11: 3, SVALtime[max7locmx[juju]]: 11: 3, errormax[7, juju]: 11: 3,
                                 instper[juju, max8locmx[juju]]: 11: 3, SVALtime[max8locmx[juju]]: 11: 3, errormax[8, juju]: 11: 3);
      end;
      if prorenatu then begin
        if SVALtime[max1locmx[juju]] <> 0 then grvl1 := distkm / SVALtime[max1locmx[juju]];
        if SVALtime[max2locmx[juju]] <> 0 then grvl2 := distkm / SVALtime[max2locmx[juju]];
        if SVALtime[max3locmx[juju]] <> 0 then grvl3 := distkm / SVALtime[max3locmx[juju]];
        if SVALtime[max4locmx[juju]] <> 0 then grvl4 := distkm / SVALtime[max4locmx[juju]];
        if SVALtime[max5locmx[juju]] <> 0 then grvl5 := distkm / SVALtime[max5locmx[juju]];
        if SVALtime[max6locmx[juju]] <> 0 then grvl6 := distkm / SVALtime[max6locmx[juju]];
        if SVALtime[max7locmx[juju]] <> 0 then grvl7 := distkm / SVALtime[max7locmx[juju]];
        if SVALtime[max8locmx[juju]] <> 0 then grvl8 := distkm / SVALtime[max8locmx[juju]];
        writeln(dispersionXrdg, instper[juju, max1locmx[juju]]: 11: 6, grvl1: 11: 3, errormax[1, juju]: 11: 3,
                                instper[juju, max2locmx[juju]]: 11: 6, grvl2: 11: 3, errormax[2, juju]: 11: 3,
                                instper[juju, max3locmx[juju]]: 11: 6, grvl3: 11: 3, errormax[3, juju]: 11: 3,
                                instper[juju, max4locmx[juju]]: 11: 6, grvl4: 11: 3, errormax[4, juju]: 11: 3,
                                instper[juju, max5locmx[juju]]: 11: 6, grvl5: 11: 3, errormax[5, juju]: 11: 3,
                                instper[juju, max6locmx[juju]]: 11: 6, grvl6: 11: 3, errormax[6, juju]: 11: 3,
                                instper[juju, max7locmx[juju]]: 11: 6, grvl7: 11: 3, errormax[7, juju]: 11: 3,
                                instper[juju, max8locmx[juju]]: 11: 6, grvl8: 11: 3, errormax[8, juju]: 11: 3);
      end; {if prorenatu = true}
    end; {for juju}
    //prorenatu := false; /////////////////////////////////////////////////
    closefile(dispersionXrdg);
  end; {if to neni batch anebo je to batch a zaroven to je saverdg}
  radek := radek + 1;
  str(radek: 4, radekstrg);
  if batchproces = False or saverdg then begin
    memo1.Lines.Add(radekstrg + ' | - ' + vsechno + ', ' + interpol + ' and ' + ridges + ' files were saved');
  end;
  if batchdisperze then begin
    memo1.Lines.Add(radekstrg + ' | - ' + vsechno + ', ' + interpol + ' files were saved');
  end;
  if batchproces and saverdg then begin
    memo1.Lines.Add(radekstrg + ' | - ' + ridges + ' file was saved');
  end;

  {ulozim soubor, kde budou pod sebou vsechna maxima, tedy vsechny disperzni hrbety bez rozliseni jejich amplitud nebo prislusnosti k modu}
  {jeho sloupce budou stejne, jako sloupce souboru s disperzi vybraneho modu, ale hodnoty tu budou vsechny za sebou}
  {soubor se uklada at uz mam nebo nemam batchproces, ale v pripade batchprocesu se uklada do specialniho adresare - pracuje se s nim stejne jako se soubory *.rdg}
  if ((batchproces = False) or ((batchproces = True) and (saverdg = True))) then begin
    assignfile(dispersionXdot, dots);
    rewrite(dispersionXdot);
    if (filtrujuopravovany = False) then begin  {kdyz nemam korekci}
      writeln(dispersionXdot, '    InstPeriod InstFrequency    PropagTime    GroupVeloc           Amplitude CentralPeriod');
    end;
    if filtrujuopravovany then begin            {kdyz mam korekci}
      writeln(dispersionXdot, '    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc           Amplitude CentralPeriod');
    end;
    for juju := inverindexf to inverindexl do begin
      for k := 1 to maxnumofmax do begin
        if (allbods = False) and (oznaceni[juju, k] = 'maximum') then begin {kdyz vybiram jen opravdicka maxima, kontroluju jejich oznaceni a zapisu jen ta opravdicka maxima}
          writeln(dispersionXdot, instper[juju, seclocmx[juju, k]]: 14: 4, 1 / (instper[juju, seclocmx[juju, k]]): 14: 4, SVALtime[seclocmx[juju, k]]: 14: 3, grvel[seclocmx[juju, k]]: 14: 4, amp[juju, seclocmx[juju, k]]: 20: 4, period[juju]: 14: 4);
        end;
        if (allbods = True) then begin {kdyz delam vsechny body, zapisu vsechny}
          writeln(dispersionXdot, instper[juju, seclocmx[juju, k]]: 14: 4, 1 / (instper[juju, seclocmx[juju, k]]): 14: 4, SVALtime[seclocmx[juju, k]]: 14: 3, grvel[seclocmx[juju, k]]: 14: 4, amp[juju, seclocmx[juju, k]]: 20: 4, period[juju]: 14: 4);
        end;
      end;
    end; {tady jsem ulozil napoctene body disperze pro vybrany obor period}
    closefile(dispersionXdot);
  end; {if to neni batch anebo je to batch a zaroven to je saverdg}
  if batchproces then begin {tady zapisu to same, jako jsem zapisoval do tech *.dot pro kazdou stanici zvlast, ale tady to udelam vsechny stanice do jednoho souboru - delam jen v pripade batch processingu}
    if saverdg then begin
      for juju := inverindexf to inverindexl do begin
        for k := 1 to maxnumofmax do begin
          if (allbods = False) and (oznaceni[juju, k] = 'maximum') then begin {kdyz vybiram jen opravdicka maxima, kontroluju jejich oznaceni a zapisu jen ta opravdicka maxima}
            writeln(dispersionXdotALL, druhyradekstrg: 7, KUKdistkm: 10: 2, k: 4, instper[juju, seclocmx[juju, k]]: 14: 4, 1 / (instper[juju, seclocmx[juju, k]]): 14: 4, SVALtime[seclocmx[juju, k]]: 14: 3, grvel[seclocmx[juju, k]]: 14: 4, amp[juju, seclocmx[juju, k]]: 14: 4, period[juju]: 14: 4);
          end;
          if (allbods = True) then begin {kdyz delam vsechny body, zapisu vsechny}
            writeln(dispersionXdotALL, druhyradekstrg: 7, KUKdistkm: 10: 2, k: 4, instper[juju, seclocmx[juju, k]]: 14: 4, 1 / (instper[juju, seclocmx[juju, k]]): 14: 4, SVALtime[seclocmx[juju, k]]: 14: 3, grvel[seclocmx[juju, k]]: 14: 4, amp[juju, seclocmx[juju, k]]: 14: 4, period[juju]: 14: 4);
          end;
        end; {pro ruzna maxima k}
        {a ted zapisu jeste zvlast tech prvnich osm maxim, ktera mam roztridena}
        if instper[juju, max1locmx[juju]] <> 0 then writeln(dotsmax1, druhyradekstrg: 7, KUKdistkm: 10: 2, instper[juju, max1locmx[juju]]: 14: 4, 1 / (instper[juju, max1locmx[juju]]): 14: 4, SVALtime[max1locmx[juju]]: 14: 3, grvel[max1locmx[juju]]: 14: 4, amp[juju, max1locmx[juju]]/100000000: 14: 4, period[juju]: 14: 4);
        if instper[juju, max2locmx[juju]] <> 0 then writeln(dotsmax2, druhyradekstrg: 7, KUKdistkm: 10: 2, instper[juju, max2locmx[juju]]: 14: 4, 1 / (instper[juju, max2locmx[juju]]): 14: 4, SVALtime[max2locmx[juju]]: 14: 3, grvel[max2locmx[juju]]: 14: 4, amp[juju, max2locmx[juju]]/100000000: 14: 4, period[juju]: 14: 4);
        if instper[juju, max3locmx[juju]] <> 0 then writeln(dotsmax3, druhyradekstrg: 7, KUKdistkm: 10: 2, instper[juju, max3locmx[juju]]: 14: 4, 1 / (instper[juju, max3locmx[juju]]): 14: 4, SVALtime[max3locmx[juju]]: 14: 3, grvel[max3locmx[juju]]: 14: 4, amp[juju, max3locmx[juju]]/100000000: 14: 4, period[juju]: 14: 4);
        if instper[juju, max4locmx[juju]] <> 0 then writeln(dotsmax4, druhyradekstrg: 7, KUKdistkm: 10: 2, instper[juju, max4locmx[juju]]: 14: 4, 1 / (instper[juju, max4locmx[juju]]): 14: 4, SVALtime[max4locmx[juju]]: 14: 3, grvel[max4locmx[juju]]: 14: 4, amp[juju, max4locmx[juju]]/100000000: 14: 4, period[juju]: 14: 4);
        if instper[juju, max5locmx[juju]] <> 0 then writeln(dotsmax5, druhyradekstrg: 7, KUKdistkm: 10: 2, instper[juju, max5locmx[juju]]: 14: 4, 1 / (instper[juju, max5locmx[juju]]): 14: 4, SVALtime[max5locmx[juju]]: 14: 3, grvel[max5locmx[juju]]: 14: 4, amp[juju, max5locmx[juju]]/100000000: 14: 4, period[juju]: 14: 4);
        if instper[juju, max6locmx[juju]] <> 0 then writeln(dotsmax6, druhyradekstrg: 7, KUKdistkm: 10: 2, instper[juju, max6locmx[juju]]: 14: 4, 1 / (instper[juju, max6locmx[juju]]): 14: 4, SVALtime[max6locmx[juju]]: 14: 3, grvel[max6locmx[juju]]: 14: 4, amp[juju, max6locmx[juju]]/100000000: 14: 4, period[juju]: 14: 4);
        if instper[juju, max7locmx[juju]] <> 0 then writeln(dotsmax7, druhyradekstrg: 7, KUKdistkm: 10: 2, instper[juju, max7locmx[juju]]: 14: 4, 1 / (instper[juju, max7locmx[juju]]): 14: 4, SVALtime[max7locmx[juju]]: 14: 3, grvel[max7locmx[juju]]: 14: 4, amp[juju, max7locmx[juju]]/100000000: 14: 4, period[juju]: 14: 4);
        if instper[juju, max8locmx[juju]] <> 0 then writeln(dotsmax8, druhyradekstrg: 7, KUKdistkm: 10: 2, instper[juju, max8locmx[juju]]: 14: 4, 1 / (instper[juju, max8locmx[juju]]): 14: 4, SVALtime[max8locmx[juju]]: 14: 3, grvel[max8locmx[juju]]: 14: 4, amp[juju, max8locmx[juju]]/100000000: 14: 4, period[juju]: 14: 4);
      end; {for vybrany obor period juju}
    end; {if saverdg}
    {ale tohle ted potrebuju, aby se ulozilo jenom jednou, a ne pro kazdou stanici znova}
    if prvnihlavicka = False then begin
      prvnihlavicka := True;
      if saverdg then begin
        write(dotsmaxPERcas, 'Filter.No.              ');        {zapise to nazev prvniho radku do prvniho sloupce}
      end;
      if batchdisperze then begin
        write(ALLdispersionsAMPLI, '    1         2         3'); {prvni radek}
        write(ALLdispersionsPHASE, '    1         2         3'); {prvni radek}
        write(ALLdispersionsGROUP, '    1         2         3'); {prvni radek}
        for juju := inverindexf to inverindexl do begin          {zapise to cisla filtru plus 3 do prvniho radku}
          write(ALLdispersionsAMPLI,(juju+3):17);
          write(ALLdispersionsPHASE,(juju+3):8);
          write(ALLdispersionsGROUP,(juju+3):8);
        end;
        writeln(ALLdispersionsAMPLI);                            {a odradkuju dal}
        writeln(ALLdispersionsPHASE);                            {a odradkuju dal}
        writeln(ALLdispersionsGROUP);                            {a odradkuju dal}
        write(ALLdispersionsAMPLI, 'stati      Long      Lati'); {druhy radek}
        write(ALLdispersionsPHASE, 'stati      Long      Lati'); {druhy radek}
        write(ALLdispersionsGROUP, 'stati      Long      Lati'); {druhy radek}
      end;  {hlavicka pro soubor s disperzema}
      for juju := inverindexf to inverindexl do begin            {zapise to cisla filtru do prvniho radku}
        if saverdg then begin
          write(dotsmaxPERcas, ' FtNo.', juju: 4);
        end;
        if batchdisperze then begin
          write(ALLdispersionsAMPLI, period[juju]:17: 3);        {hlavicka pro soubor s disperzema - pokracovani prvniho radku}
          write(ALLdispersionsPHASE, period[juju]: 8: 3);        {hlavicka pro soubor s disperzema - pokracovani prvniho radku}
          write(ALLdispersionsGROUP, period[juju]: 8: 3);        {hlavicka pro soubor s disperzema - pokracovani prvniho radku}
        end;
      end;
      if saverdg then begin
        writeln(dotsmaxPERcas);
      end;
      if batchdisperze then begin
        writeln(ALLdispersionsAMPLI);                          {a odradkuju dal}
        writeln(ALLdispersionsPHASE);                          {a odradkuju dal}
        writeln(ALLdispersionsGROUP);                          {a odradkuju dal}
      end;
      if saverdg then begin
        Write(dotsmaxPERcas, 'Stn/CntrPr  epicdist   k');      {zapise to nazev druheho radku do prvniho sloupce}
        for juju := inverindexf to inverindexl do begin {zapise to hodnoty centralni periody do druheho radku}
          Write(dotsmaxPERcas, period[juju]: 9: 3, 's');
        end;
        writeln(dotsmaxPERcas);
      end;
      {a jeste pro ten soubor bez primarnich maxim}
      if saverdg then begin
        Write(dotsmaxPERcasBEZ1, 'Filter.No.              '); {zapise to nazev prvniho radku do prvniho sloupce}
        for juju := inverindexf to inverindexl do begin       {zapise to cisla filtru do prvniho radku}
          Write(dotsmaxPERcasBEZ1, ' FtNo.', juju: 4);
        end;
        writeln(dotsmaxPERcasBEZ1);
        Write(dotsmaxPERcasBEZ1, 'Stn/CntrPr  epicdist   k'); {zapise to nazev druheho radku do prvniho sloupce}
        for juju := inverindexf to inverindexl do begin       {zapise to hodnoty centralni periody do druheho radku}
          Write(dotsmaxPERcasBEZ1, period[juju]: 9: 3, 's');
        end;
        writeln(dotsmaxPERcasBEZ1);
      end; {if saverdg}
      if savewave then begin {zapisu do souboru se vsema surface wavegroup}
        write(phaseALL, 'stati      Long      Lati');
        write(groupALL, 'stati      Long      Lati');
        for i := 1 to nsampl do begin               {zapise to cisla sloupcu do prvniho radku}
          write(phaseALL, i: 8);
          write(groupALL, i: 8);
        end;
        writeln(phaseALL);                  {odradkuju na druhy radek}
        writeln(groupALL);                  {odradkuju na druhy radek}
        write(phaseALL, '                         ');
        write(groupALL, '                         ');
        {zapisu mezery v delce jako je vyse stati long lati}
        for i := 1 to nsampl do begin               {zapise to cisla filtru do prvniho radku}
          write(phaseALL, SVALtime[i]: 8: 1);  {do druheho radku zapisu cas vzorku}
          write(groupALL, SVALtime[i]: 8: 1);  {do druheho radku zapisu cas vzorku}
        end;
        writeln(phaseALL);                  {odradkuju na treti radek}
        writeln(groupALL);                  {odradkuju na treti radek}
      end; {if savewave}
    end; {konec ulozeni jen jednou}
    if batchdisperze then begin
      write(ALLdispersionsAMPLI, druhyradekstrg: 5, KUKlon: 10: 4, KUKlat: 10: 4); {do tretiho (a vsech dalsich) radku zapisu jmeno stanice a jeji souradnice}
      write(ALLdispersionsPHASE, druhyradekstrg: 5, KUKlon: 10: 4, KUKlat: 10: 4); {do tretiho (a vsech dalsich) radku zapisu jmeno stanice a jeji souradnice}
      write(ALLdispersionsGROUP, druhyradekstrg: 5, KUKlon: 10: 4, KUKlat: 10: 4); {do tretiho (a vsech dalsich) radku zapisu jmeno stanice a jeji souradnice}
      if jeblba then begin
        writeln(redstation   , KUKlon: 10: 4, KUKlat: 10: 4,        ' # ' , druhyradekstrg: 5);
        writeln(redlabel     , KUKlon: 10: 4, KUKlat: 10: 4, ' 3 0 0 MC ' , druhyradekstrg: 5);
      end;
      if jeblba = false then begin
        writeln(yellowstation, KUKlon: 10: 4, KUKlat: 10: 4,        ' # ' , druhyradekstrg: 5);
        writeln(yellowlabel  , KUKlon: 10: 4, KUKlat: 10: 4, ' 3 0 0 MC ' , druhyradekstrg: 5);
      end;
      {zapisu jmeno a souradnice stanice}
      for juju := inverindexf to inverindexl do begin
        write(ALLdispersionsAMPLI, (amp[juju, locmx[juju]]/1000000):17:4);          {tady zapisu amplitudu}
        write(ALLdispersionsPHASE, SVALtime[zeroposition[juju]]:8:2);    {tady zapisu fazovy cas}
        //write(ALLdispersionsPHASE, zerophasetime[juju]:8:2);             {tady zapisu fazovy cas pro hypotetickou nulovou fazi odectenou od faze pod maximem obalky}
        write(ALLdispersionsGROUP, SVALtime[locmx[juju]]:8:2);           {pokracovani druheho radku (a vsech dalsich) - zapisu pro vsechny filtry cas sireni, tedy grupovy cas}
      end;
      writeln(ALLdispersionsAMPLI);                                        {a odradkuju dal}
      writeln(ALLdispersionsPHASE);                                        {a odradkuju dal}
      writeln(ALLdispersionsGROUP);                                        {a odradkuju dal}
    end; {if batchdisperze}
    if superbatchyesno then begin  {pokud delam superbatch, zapamatuju si pocet zlutych a cervenych stanic}
      if jeblba then begin
        redstationN := redstationN + 1;
      end;
      if jeblba = false then begin
        yellowstationN := yellowstationN + 1;
      end;
    end;


    setlength(zapsat, maxnumofmax + 1);
    if saverdg then begin
      for k := 1 to maxnumofmax do begin
        zapsat[k] := False;
        for juju := inverindexf to inverindexl do begin {pro dane k projdu vsechny filtry a podivam se, jestli nahodou nejsou vsechny bez toho oznaceni "maximum" - v tom pripade to pro dane k vubec nebudu zapisovat}
          if (oznaceni[juju, k] = 'maximum') then zapsat[k] := True;  {kdyz to najde aspon jeden, ktery JE oznacen jako 'maximum', tak se to udela true}
        end;
      end;
      for k := 1 to maxnumofmax do begin
        if zapsat[k] then begin
          Write(dotsmaxPERcas, druhyradekstrg: 10, KUKdistkm: 10: 2, k: 4);   {zapise nazev stanice do prvniho sloupce}
          for juju := inverindexf to inverindexl do begin {zapise to casy prichodu do vsech ostatnich sloupcu}
            if (allbods = False) then begin {kdyz vybiram jen opravdicka maxima, kontroluju jejich oznaceni a zapisu jen ta opravdicka maxima}
              if (oznaceni[juju, k] = 'maximum') {seclocmx[juju,k] >  3} then Write(dotsmaxPERcas, SVALtime[seclocmx[juju, k]]: 10: 3);
              if (oznaceni[juju, k] <> 'maximum') {seclocmx[juju,k] <= 3} then Write(dotsmaxPERcas, '     0.0  ');
            end;
            if (allbods = True) then begin {kdyz delam vsechny body, zapisu vsechny}
              {if seclocmx[juju,k] >  3 then} Write(dotsmaxPERcas,
                SVALtime[seclocmx[juju, k]]: 10: 3);
              //if seclocmx[juju,k] <= 3 then write(dotsmaxPERcas,                    '     0.0  ');
            end;
          end;{for j}
          writeln(dotsmaxPERcas);
        end; {if zapsat}
      end; {for k}
      for k := 1 to maxnumofmax do begin {a zapisu jeste to same, ale vynecham primarni maxima}
        if zapsat[k] then begin
          Write(dotsmaxPERcasBEZ1, druhyradekstrg: 10, KUKdistkm: 10: 2, k: 4); {zapise nazev stanice do prvniho sloupce}
          for juju := inverindexf to inverindexl do begin {zapise to casy prichodu do vsech ostatnich sloupcu}
            if (allbods = False) then begin {kdyz vybiram jen opravdicka maxima, kontroluju jejich oznaceni a zapisu jen ta opravdicka maxima}
              if (seclocmx[juju, k] <> max1locmx[juju]) then begin {pokud to NENI primarni, zapisu to}
                if (oznaceni[juju, k] = 'maximum') {seclocmx[juju,k] >  3} then Write(dotsmaxPERcasBEZ1, SVALtime[seclocmx[juju, k]]: 10: 3);
                if (oznaceni[juju, k] <> 'maximum') {seclocmx[juju,k] <= 3} then Write(dotsmaxPERcasBEZ1, '     0.0  ');
              end;
              if (seclocmx[juju, k] = max1locmx[juju]) then begin {pokud to JE primarni, zapisu nulu}
                Write(dotsmaxPERcasBEZ1, '     0.0  ');
              end;
            end;
            if (allbods = True) then begin {kdyz delam vsechny body, zapisu vsechny}
              if (seclocmx[juju, k] <> max1locmx[juju]) then begin {pokud to NENI primarni, zapisu to}
                {if seclocmx[juju,k] >  3 then} Write(dotsmaxPERcasBEZ1,
                  SVALtime[seclocmx[juju, k]]: 10: 3);
                //if seclocmx[juju,k] <= 3 then write(dotsmaxPERcasBEZ1,                    '     0.0  ');
              end;
              if (seclocmx[juju, k] = max1locmx[juju]) then begin {pokud to JE primarni, zapisu nulu}
                Write(dotsmaxPERcasBEZ1, '     0.0  ');
              end;
            end;
          end; {for j}
          writeln(dotsmaxPERcasBEZ1);
        end; {if zapsat}
      end; {for k}
    end; {if saverdg}

    if savewave then begin                                                       {pokud chci ulozit wavegroup}
      write(phaseALL, druhyradekstrg: 5, KUKlon: 10: 4, KUKlat: 10: 4);  {zapisu jmeno a souradnice stanice}
      write(groupALL, druhyradekstrg: 5, KUKlon: 10: 4, KUKlat: 10: 4);  {zapisu jmeno a souradnice stanice}
      maxmono[1] := 0;
      for hh := 1 to nsampl do begin                                             {najdu nejvetsi kladnou amplitudu}
        if (fsre[1, hh] > maxmono[1]) then maxmono[1] := fsre[1, hh];            {normuju na OREZANY signal - pro normovani obalky}
      end;                                                                       {maximum hledam na signalu, ale pak tim normuju obalku, nastavil jsem to tak, ale nevim, je-li to idealni}
      for i := 1 to nsampl do begin
        write(phaseALL,                        filtered[i]: 8: 1);       {ukladam vybranou povrchovou skupinu}
        write(groupALL, ((famp[1, i] / maxmono[1]) * 1000): 8: 1);       {ukladam obalku prvniho filtru - musim tedy pustit SVAL tak, aby prvni byl ten, co chci ulozit}
      end;
      writeln(phaseALL);
      writeln(groupALL);
    end; {if savewave}

  end; {if batchproces}
end; {end of the procedure for for saving the dispersion curve and to interpolate the values of propagation time and group velocity}

procedure TNoSVALform.Button20Click(Sender: TObject);
var       {zooms the dispersion curve}
  dispmin   : double;
  dispmax   : double;
  uj        : integer;
  posun     : double;
begin
  dispmax := 5;
  dispmin := 5;
  if ((inverindexf = 0) or (inverindexl = 0)) then begin {pokud nemam vybrany obor period}
    dispmax := 0;
    dispmin := 100;
    for uj := 1 to nflt do begin
      if grvel[locmx[uj]] > dispmax then begin
        dispmax := grvel[locmx[uj]]; {najdu maximum disperzni krivky}
      end; {if}
    end; {for}
    for uj := 1 to nflt do begin
      if grvel[locmx[uj]] < dispmin then begin
        dispmin := grvel[locmx[uj]]; {najdu mimimum disperzni krivky}
      end; {if}
    end; {for}
  end; {if nemam vybrany obor period}
  if ((inverindexf <> 0) and (inverindexl <> 0)) then begin {pokud mam vybrany obor period ale nemam korekci}
    dispmax := 0;
    dispmin := 100;
    for uj := inverindexf to inverindexl do begin
      if grvel[locmx[uj]] > dispmax then begin
        dispmax := grvel[locmx[uj]]; {najdu maximum disperzni krivky}
      end; {if}
    end; {for}
    for uj := inverindexf to inverindexl do begin
      if grvel[locmx[uj]] < dispmin then begin
        dispmin := grvel[locmx[uj]]; {najdu mimimum disperzni krivky}
      end; {if}
    end; {for}
  end; {if mam vybrany obor period ale nemam korekci}
  with PlotPanel3 do begin
    PlotPanel3.Ymin := dispmin;
    PlotPanel3.Ymax := dispmax;
    posun := (dispmax - dispmin) / 10;
    PlotPanel3.Ymin := dispmin - posun;
    PlotPanel3.Ymax := dispmax + posun;
    PlotPanel3.YInterval := (PlotPanel3.Ymax - PlotPanel3.Ymin) / 6;
    original02 := PlotPanel3.YInterval;
    if ((PlotPanel3.YInterval <= 100.0) and (PlotPanel3.YInterval > 10.0)) then PlotPanel3.YInterval := 10.0
    else if ((PlotPanel3.YInterval <= 10.00) and (PlotPanel3.YInterval > 1.00)) then PlotPanel3.YInterval := 1.0
    else if ((PlotPanel3.YInterval <= 1.000) and (PlotPanel3.YInterval > 0.10)) then PlotPanel3.YInterval := 0.1
    else if ((PlotPanel3.YInterval <= 0.100) and (PlotPanel3.YInterval > 0.01)) then PlotPanel3.YInterval := 0.01
    else if (PlotPanel3.YInterval <= 0.01) then PlotPanel3.YInterval := 0.001;
    if PlotPanel3.YInterval <= original02 then PlotPanel3.YInterval := PlotPanel3.YInterval * (trunc(original02 / PlotPanel3.YInterval));
    PlotPanel3.YMarks := True;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
end; {konec zoomovani}

procedure TNoSVALform.Button18Click(Sender: TObject);
var             {for saving the spectrogram}
  jjss, iiss    : integer;
  klasicky      : string;
  orezany       : string;
begin
  if ((inverindexf = 0) or (inverindexl = 0)) then begin
    ShowMessage('Please, select the period range for the truncated spectrogram you want to save!');
    exit;
  end;                                            {ulozim to jen pro vybrany obor period}
  if (filtrujuopravovany = False) then begin      {kdyz nemam korekci}
    ShowMessage('The spectrograms WITHOUT any instrument correction will be saved');
  end;
  if (filtrujuopravovany) then begin              {kdyz mam korekci}
    ShowMessage('The spectrograms WITH instrument correction applied will be saved');
  end;
  SaveDialog4.Execute;
  if length(SaveDialog4.FileName) < 1 then exit;
  klasicky := SaveDialog4.FileName;
  orezany := SaveDialog4.FileName;
  klasicky := klasicky + '.dat';
  orezany := orezany + '.trc';
  assignfile(dat, klasicky);
  assignfile(trc, orezany);
  rewrite(dat);
  rewrite(trc);
  if (filtrujuopravovany = False) then begin      {kdyz nemam korekci}
    writeln(dat,'      Time       Frequency      InstPeriod      LogInstPer   GroupVelocity       Amplitude        NormAmpl ');
    writeln(trc,'      Time       Frequency      InstPeriod      LogInstPer   GroupVelocity        TruncAmp     TruncNrmAmp     Trnc-1-NrmAmp');
  end;
  if filtrujuopravovany then begin                {kdyz mam korekci}
    writeln(dat,'      Time       Frequency      InstPeriod      LogInstPer   GroupVelocity   CorrAmplitude    CorrNormAmpl ');
    writeln(trc,'      Time       Frequency      InstPeriod      LogInstPer   GroupVelocity    CorrTruncAmp CorrTruncNrmAmp CorrTrnc-1-NrmAmp');
  end;
  for jjss := 1 to nflt do begin                  {ulozime klasicky spektrogram - dat, tedy diagram zavislosti casu na frekvenci}
    for iiss := 1 to nsampl do begin
      if instper[jjss, iiss] > 0 then begin        {jen pro kladne periody}
        writeln(dat, SVALtime[iiss]: 10: 3, instfreq[jjss, iiss]: 16: 5, instper[jjss, iiss]: 16: 7, log10(instper[jjss, iiss]): 16: 7, grvel[iiss]: 16: 4, amp[jjss, iiss]: 16: 4, namp[jjss, iiss]: 16: 4);
      end; {if}
    end; {of for :iiss:}
  end; {of for :jjss:}
  for jjss := inverindexf to inverindexl do begin {ulozime orezany spektrogram - trc, tedy diagram zavislosti grupove rychlosti na periode}
    for iiss := 1 to nsampl do begin
      xnamp[jjss, iiss] := famp[jjss, iiss] / famp[jjss, locmx[jjss]];  {delim to amplitudou pouziteho maxima filtru, tedy normuju kazdy filtr na jednicku}
      if instper[jjss, iiss] > 0 then begin        {jen pro kladne periody}
        writeln(trc, SVALtime[iiss]: 10: 3, instfreq[jjss, iiss]: 16: 5, instper[jjss, iiss]: 16: 7, log10(instper[jjss, iiss]): 16: 7, grvel[iiss]: 16: 4, famp[jjss, iiss]: 16: 4, fnamp[jjss, iiss]: 16: 4, xnamp[jjss, iiss]: 18: 10);
      end; {if}
    end; {of for :iiss:}
  end; {of for :jjss:}
  closefile(dat);
  closefile(trc);
end; {konec ukladani spektrogramu}

procedure TNoSVALform.Button21Click(Sender: TObject);
begin                     {otvira okno se spektry}
  SpectrumForm.PredShow;  {vola procedurku, ktera probehne, nez se pusti dalsi okno}
  SpectrumForm.Show;      {vola okno pro cele i filtrovane spektrum}
end;

{/////////////////////////////  odsud je to inverze  //////////////////////////////////}

procedure TNoSVALform.Button23Click(Sender: TObject);
var   {otevre okno informujici o inverzi    " Inversion " }
  ijuju, j: integer;
  ku: integer;
  setvelocitysstrg: string;
  setdensitystrg: string;
  setPVSVstrg: string;
  {  rustS, rustR      : double;}
  narustPstrg: string;
  narustSstrg: string;
  poklesSstrg: string;
  hustotynaruststrg: string;
  hustotypoklesstrg: string;
  najakestrg: string;
begin
  if ityprl = 2 then begin
    ShowMessage('What type of waves... ?');
    exit;
  end;
  startvelocitystrg := edit12.Text;  {tadyhle se nacte, at uz tam prislo samo, nebo jsme ho zmenili}
  val(startvelocitystrg, cstart, cd); {ulozi se pocatecni hodnota do promenne "cstart"}
  if cstart <= 0 then begin
    ShowMessage('The group starting velocity must be greater then zero!');
    exit;
  end;
  setvelocitysstrg := edit15.Text;
  val(setvelocitysstrg, setvelocitys, cd); {ulozi se pocatecni hodnota rychlosti S-vln na povrchu do promenne "setvelocitys"}
  if setvelocitys <= 0 then begin
    ShowMessage('The surface S-velocity must be greater then zero!');
    exit;
  end;
  if ityprl <> 1 then begin {pro cokoli krome Loveho}
    setPVSVstrg := edit17.Text;
    val(setPVSVstrg, setPVSV[1], cd); {ulozi se pocatecni hodnota Pv / Sv do promenne "setPVSV"}
    if setPVSV[1] <= 0 then begin
      ShowMessage('The Vp/Vs ratio must be greater then zero!');
      exit;
    end;

    if (Dinar = false) and (KTB = false) then begin
      for j := 2 to numoflay + 1 do begin {tu stejnou hodnotu dam i do dalsich poli setPVSV}
        setPVSV[j] := setPVSV[1];
      end;
    end; {if Dinar = false and KTB = false}

    if (Dinar = true) then begin {vpvs nastavim pro dinar podle ak135}
      for j := 1 to numoflay + 1 do begin
        if midD[j] <= 3.3  then setPVSV[j] := 1.65;
        if midD[j] >  3.3  then setPVSV[j] := 1.8125;
        if midD[j] >  10   then setPVSV[j] := 1.7436;
        if midD[j] >  18   then setPVSV[j] := 1.79; {z Grapheru odectene linearni trendy pro negativni ...}
        if midD[j] >  120  then setPVSV[j] := (midD[j] + 3228.209942) / (+1871.55516);                                          {Equation Y = +1871.55516  * X - 3228.209942}
        if midD[j] >  210  then setPVSV[j] := (midD[j] + 20704.15404) / (+11388.28781); {toto plati do hloubky 410 km}          {Equation Y = +11388.28781 * X - 20704.15404}
        if midD[j] >  410  then setPVSV[j] := (midD[j] - 18543.47540) / (-9842.953219); {toto plati od hloubky 410 km dolu}     {Equation Y = -9842.953219 * X + 18543.47540}
      end;
    end; {if Dinar = true}

    if KTB = true then begin
      for j := 1 to numoflay + 1 do begin
        if midD[j] <= 18.94 then setPVSV[j] := (midD[j] - 4718.765714) / -2705.714286 ; {z Grapheru odectene linearni trendy pro zjednoduseny model stanic KTB od I.B.}
        if midD[j] >  18.94 then setPVSV[j] := (midD[j] -  316.803333) /  -171.481481 ;
        if midD[j] >  28.20 then setPVSV[j] := (midD[j] +  280.570866) /  +183.464566 ;
        if midD[j] >  51.50 then setPVSV[j] := (midD[j] -  314.955555) /  -145.555555 ;
        if midD[j] >  56.74 then setPVSV[j] := (midD[j] + 1389.070000) /  +815.000000 ; {plati do hloubky 60 km}
      end;
    end; {if KTB = true}

    narustPstrg := edit18.Text;
    val(narustPstrg, narustP, cd); {ulozim plus minus hodnotu pomeru Vp/ Vs, toto je narust i pokles PvSv pomeru}
    if narustP <= 0 then begin
      ShowMessage('The Vp/Vs ratio +- difference must be greater then zero!');
      exit;
    end;
  end; {if to neni Love}
  dropoffstrg := edit13.Text;
  val(dropoffstrg, dropoff, cd);  {ulozi se povoleny pokles rychlosti v nizssi vrstve}
  dropofffirststrg := edit21.Text;
  val(dropofffirststrg, dropofffirst, cd); {ulozi se povoleny pokles rychlosti v prvni vrstve}
  if dropoff <= 0 then begin
    ShowMessage('The S-velocity step must be greater then zero!');
    exit;
  end;
  if dropofffirst < 0 then begin
    ShowMessage('The S-velocity range for the first layer must be greater then zero!');
    exit;
  end;
  if dropofffirst = 0 then begin {kdyz je to nula, dam tam neco malickeho}
    dropofffirst := 0.000001;
  end;
  setdensitystrg := edit16.Text; {surface density}
  val(setdensitystrg, setdensity, cd); {ulozi se pocatecni hodnota do promenne "setdensity"}
  if setdensity <= 0 then begin
    ShowMessage('The surface density must be greater then zero!');
    exit;
  end;
  val(edit14.Text, densitystep, cd);
  if densitystep <= 0 then begin
    ShowMessage('The density step must be greater then zero!');
    exit;
  end;
  memo1.Lines.Add('------------------------------------------------------------------------');
  if usegroup then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - starting group velocity is ' + startvelocitystrg + ' km/s');
  end;
  if usegroup = False then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - starting phase velocity is ' + startvelocitystrg + ' km/s');
  end;
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - S surface velocity is ' + setvelocitysstrg + ' km/s');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - S velocities starting model step is ' + dropoffstrg + ' km / s in next layer');
  dropoff := (-dropoff);
  if lvz then begin           {standardne nastvauju nejakou moznost pro pokles rychlosti}
    poklesS := dropoff * 1;   {toto jsou skutecne hranice omezujici mozne hodnoty rychlosti}
  end;
  if (lvz = False) then begin {kdyz nechci low velocity zone}
    poklesS := 0;            {toto jsou skutecne hranice omezujici mozne hodnoty rychlosti}
  end;
  narustS := -dropoff * 6;
  hustotypokles := -densitystep * 1;
  hustotynarust := densitystep * 6;
  str(hustotypokles: 5: 2, hustotypoklesstrg);
  str(hustotynarust: 5: 2, hustotynaruststrg);
  str(poklesS: 5: 2, poklesSstrg);
  str(narustS: 5: 2, narustSstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - S surface velocity range is ' + dropofffirststrg + ' km / s on both sides');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - S velocity can step up max by ' + narustSstrg + ' km/s in next layer');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - S velocity can drop off max by ' + poklesSstrg + ' km/s in next layer');
  if ((ityprl = 0) or (ityprl = 3)) then begin {pro Rayleigha}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - starting Vp / Vs ratio is ' + setPVSVstrg);
  end;
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - the Vp / Vs ratio can oscillate by ± ' + narustPstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - surface density is ' + setdensitystrg + ' g/cm3');
  if menise then begin {hustota je promenna}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - density starting step is ' + edit14.Text + ' g/cm3 in next layer');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - density can step up max by ' + hustotynaruststrg + ' g/cm3 in next layer');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - density can drop off max by ' + hustotypoklesstrg + ' g/cm3 in next layer');
  end; {pokud menim hustotu}
  if menise = False then begin {hustota je konstantni}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - density is fixed to given starting value in each layer and it is not changed by the inversion');
  end; {pokud je hustota konstantni}
  if chcichyby = False then begin {pokud nebudu chyby cist, nastavim je nejak}
    for ku := 1 to maxnflt do begin
      val(Edit23.Text, chybaL[ku], cd);
      val(Edit23.Text, chybaR[ku], cd);
    end;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - errors of the dispersion are constant: ' + Edit23.Text);
  end;
  if chcichyby = True then begin {pokud budu chyby cist}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - errors of the dispersion are read from file');
  end;
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | -  the inversion uses ' + OpenDialog3.FileName + ' layers file');
  for ijuju := inverindexf to inverindexl do begin                       {ulozi data do poli pro Unit1}
    cper[ijuju - inverindexf + 1] := instper[ijuju, locmx[ijuju]];       {tady ulozim periody}
    ca[ijuju - inverindexf + 1] := grvel[locmx[ijuju]];                  {a tady pripadne syrove rychlosti}
  end;
  if joint then begin {a ted to udelam jeste pro druhou krivku}
    for ijuju := inverindexf to inverindexl do begin        {ulozi data do poli pro InverUnit}
      cper2[ijuju - inverindexf + 1] := loadper2[ijuju];       {tady ulozim periody}
      {jestlize byla aplikovana casova korekce, tak to pro InverUnit vlozi opravenou grupovou rychlost}
      ca[ijuju - inverindexf + 1 + numofdat + numoflay + 1] := loadgrvel2[locmx[ijuju]];    {a tady pripadne syrove rychlosti}
    end; {for}
  end; {if joint}
  if norec = 1 then begin {vypisu, jenom kdyz jsem provedl analyzu, kdyz mam naloadovanou krivku, tak to nevypisuju}
    if filtrujuopravovany then begin {a jeste o tom vypisu hlaseni}
      if usegroup then begin
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - corrected group velocity values were sent to inversion');
      end;
      if usegroup = False then begin
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - corrected phase velocity values were sent to inversion');
      end;
    end
    else begin
      if usegroup then begin
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - only raw group velocity values were sent to inversion');
      end;
      if usegroup = False then begin
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - only raw phase velocity values were sent to inversion');
      end;
    end;
  end; {if norec = 1}
  for ijuju := 1 to (numofdat - 1) do begin {hledam rozdily mezi periodami vsech posobejdoucich dvojic filtru}
    rozdil[ijuju] := cper[ijuju + 1] - cper[ijuju];
    if joint then begin
      rozdil2[ijuju] := cper2[ijuju + 1] - cper2[ijuju];
    end;
  end;
  minrozdil1 := 100.0;
  minrozdil2 := 100.0;
  for ijuju := 1 to (numofdat - 1) do begin {hledam minimalni z vyse spoctenych rozdilu period}
    if (minrozdil1 > rozdil[ijuju]) then begin
      minrozdil1 := rozdil[ijuju];
      spodniindex1 := ijuju;
      horniindex1 := ijuju + 1;
    end;
  end;
  minrozdil := minrozdil1;
  if minrozdil < 0 then begin
    minrozdil := -minrozdil;
    if batchinver = false then begin {ukaze to zpravu jen kdyz to neni batch inverse}
      ShowMessage(' Be careful. The periods of your curve are not increasing monotonically.');
    end;
  end;
  spodnikrit := cper[spodniindex1];
  hornikrit  := cper[spodniindex1 + 1];
  spodniindex := spodniindex1 + inverindexf - 1;
  horniindex  := horniindex1 + inverindexf - 1;
  najakestrg := 'first';
  if joint then begin
    for ijuju := 1 to (numofdat - 1) do begin {hledam minimalni z vyse spoctenych rozdilu period}
      if (minrozdil2 > rozdil2[ijuju]) then begin
        minrozdil2 := rozdil2[ijuju];
        spodniindex2 := ijuju;
        horniindex2 := ijuju + 1;
      end;
    end;
    if minrozdil2 < minrozdil1 then begin
      minrozdil := minrozdil2;
      spodnikrit := cper2[spodniindex2];
      hornikrit := cper2[spodniindex2 + 1];
      spodniindex := spodniindex2 + inverindexf - 1;
      horniindex := horniindex2 + inverindexf - 1;
      najakestrg := 'second';
    end;
    if minrozdil1 < minrozdil2 then begin
      minrozdil := minrozdil1;
      spodnikrit := cper[spodniindex1];
      hornikrit := cper[spodniindex1 + 1];
      spodniindex := spodniindex1 + inverindexf - 1;
      horniindex := horniindex1 + inverindexf - 1;
      najakestrg := 'first';
    end;
  end;{if joint}
  str(minrozdil: 11: 8, minrozdilstrg);
  str(spodnikrit: 7: 4, spodnikritstrg);
  str(hornikrit: 7: 4, hornikritstrg);
  str(spodniindex: 2, spodniindexstrg);
  str(horniindex: 2, horniindexstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - the minimal difference of the two closest filters (No. ' +  spodniindexstrg + ' and No. ' + horniindexstrg + ') was found between...');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - ... periods ' + spodnikritstrg + ' and ' + hornikritstrg + ' and has the value ' + minrozdilstrg + ' s');
  if joint then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - it was found ont the ' + najakestrg + ' curve');
  end;
  if (Dinar = false) and (KTB = false) then begin
    fstep := 0.9 * minrozdil;  {tady ulozim krok v periode, se kterym se bude pracovat pri vypoctu prime ulohy maticovou metodou}
    str(fstep: 11: 8, fstepstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - period step for matrix method is set to ' + fstepstrg + ' s');
  end;
  if Dinar = true then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - DEEP inversion mode selected ///////////////////////////////// ');
  end;
  if KTB = true then begin
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - KTB mode selected ///////////////////////////////// ');
  end;
  if joint then begin
    ffirst := max(offirst, ffirst2);  {delam to jen pro podmnozinu periodovych oboru tech dvou krivek}
    flast := min(oflast, flast2);
  end;

  if (Dinar = false) and (KTB = false) then begin
    if (flast < (oflast + fstep / 2)) then begin
      flast := oflast + fstep;    {pro jistotu to trochu posunu, abych jistojiste zacal mimo ten obor}
    end;
  end;
  if (Dinar = true) or (KTB = true) then begin
    flast := oflast; {pokud to delam pro Dinarides nebo KTB, bude prvni presne ta prvni}
  end;
  if (Dinar = false) and (KTB = false) then begin
    if (ffirst > (offirst - fstep / 2)) then begin
      ffirst := offirst - fstep;   {pro jistotu to trochu posunu, abych jistojiste zacal mimo ten obor}
    end;
  end;
  if (Dinar = true) or (KTB = true) then begin
    ffirst := offirst; {pokud to delam pro Dinarides nebo KTB, bude prvni presne ta prvni}
  end;

  for ijuju := (numofdat + 1) to (numofdat + numoflay + 1) do begin
    ca[ijuju] := densitystep; {plnim daticka pro rozdily hustot}
  end;
  {napocitavam rozmezi, ve kterem se mohou pohybovat hodnoty hledanych parametru}
  {uz mam zadane startovaci hodnoty Pv, Sv a hustoty na povrchu}
  {hranice narustu a poklesu mi zaroven definuji startovaci hodnotu v kazde vrstve}
  {protoze prvni hodnota parametru je vzdycky na pul cesty resp. trochu blize k minimu mezi minimalni a maximalni hranici}
  {a ted tento startovaci model vykreslim do strukturniho okna}
  zacS := zacS + 1;
  zacR := zacR + 1;
  zacP := zacP + 1;
  with PlotPanel4 do begin
    LayerOptions(zacS, pmLine, 1);
  end;
  with PlotPanel4 do begin
    LayerOptions(zacR, pmLine, 1);
  end;
  with PlotPanel4 do begin
    LayerOptions(zacP, pmLine, 1);
  end;
  hlayers2 := 0.0;

  //  rustS := -dropoff; {(narustS - poklesS)/2 + poklesS;}
  //  rustR := densitystep; {(hustotynarust - hustotypokles)/2 + hustotypokles;}
  //  for hyh := 1 to numoflay do begin                                                               {zacatek vykreslovani startovacich hodnot pro kazdou vrstvu}
  //    PlotPanel4.AddXY(setvelocitys+(rustS*(hyh-1)) ,-hlayers2,clRed   ,zacS);                      {vykresluje rychlosti S-vln}
  //    PlotPanel4.AddXY(setdensity  +(rustR*(hyh-1)) ,-hlayers2,clYellow,zacR);                      {vykresluje hustotu}
  //    if ((ityprl = 0) or (ityprl = 3)) then begin                                                  {kdyz jsem pocital Rayleigha}
  //      PlotPanel4.AddXY((setvelocitys+(rustS*(hyh-1)))*(setPVSV),-hlayers2,RGB(124,219,230),zacP); {vykresluje rychlosti P-vln}
  //    end;
  //    hlayers2 := hlayers2 + DD[hyh];
  //    PlotPanel4.AddXY(setvelocitys+(rustS*(hyh-1)) ,-hlayers2,clRed   ,zacS);                      {vykresluje rychlosti S-vln}
  //    PlotPanel4.AddXY(setdensity  +(rustR*(hyh-1)) ,-hlayers2,clYellow,zacR);                      {vykresluje hustotu}
  //    if ((ityprl = 0) or (ityprl = 3)) then begin {kdyz jsem pocital Rayleigha}
  //      PlotPanel4.AddXY((setvelocitys +(rustS*(hyh-1)))*(setPVSV),-hlayers2,RGB(124,219,230),zacP); {vykresluje rychlosti P-vln}
  //    end;
  // end; {konec pro kazdou vrstvu}
  {pro poloprostor}
  //  PlotPanel4.AddXY(setvelocitys+(rustS*(numoflay)) ,-hlayers2     ,clRed   ,zacS); {vykresluje rychlost S-vln}
  //  PlotPanel4.AddXY(setdensity  +(rustR*(numoflay)) ,-hlayers2     ,clYellow,zacR); {vykresluje hustotu}
  //  PlotPanel4.AddXY(setvelocitys+(rustS*(numoflay)) ,-hlayers2*1.25,clRed   ,zacS); {vykresluje rychlost S-vln}
  //  PlotPanel4.AddXY(setdensity  +(rustR*(numoflay)) ,-hlayers2*1.25,clYellow,zacR); {vykresluje hustotu}
  //  if ((ityprl = 0) or (ityprl = 3)) then begin {kdyz jsem pocital Rayleigha}
  //    PlotPanel4.AddXY((setvelocitys +(rustS*numoflay))*setPVSV ,-hlayers2     ,RGB(124,219,230),zacP); {vykresluje rychlost P-vln}
  //    PlotPanel4.AddXY((setvelocitys +(rustS*numoflay))*setPVSV ,-hlayers2*1.25,RGB(124,219,230),zacP); {vykresluje rychlost P-vln}
  //  end;
  {konec vykreslovani startovacich hodnot v poloprostoru}

  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
  if uzjsemvni = False then Form1.Button2Click(Sender); {pokud jsem jeste nebyl v inverzi po analyze, vymazu graf misfitu}
  uzjsemvni := True;
  Form1.Show;
end; {konec otvirani okna o inverzi}

procedure TNoSVALform.RadioButton1Click(Sender: TObject);
begin                      {kdyz bude zaskrtnuto tohle, tak to bude Love}
  ityprl := 1;
  Edit17.Text := '----';
  Edit17.Enabled := False; {nepotrebuju zadavat hodnoty pomeru Vp / Vs pro Loveho}
  Edit18.Text := '----';
  Edit18.Enabled := False;
  {nepotrebuju zadavat hodnotu rozptylu pomeru Vp / Vs pro Loveho}
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - Love waves inversion selected');
  Form1.DatPar(self);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - ' + numofparstrg + ' parameters have to be estimated');
  joint := False;
  if zarad then begin
    Button23.Enabled := False;
    inverindexf := 0;
    inverindexl := 0;
    ComboBox2CloseUp(Sender);
    ComboBox3CloseUp(Sender);
  end;
end; {tak ted je to Love}

procedure TNoSVALform.RadioButton2Click(Sender: TObject);
begin                      {kdyz bude zaskrtnuto tohle, tak to bude Rayleigh}
  ityprl := 0;
  if Edit17.Text = '----' then Edit17.Text := '1.8';  {menim to jen kdyz tam zadna hodnota neni, tedy kdyz to predtim byl Love}
  if (Dinar = false) and (KTB = false) then Edit17.Enabled := True;  {kontroluju to proto, aby kdyz to predtim byl Rayleigh a ted zase chci Rayleigha, aby mi to porad nemenilo ten pomer, ktery jsem si tam rucne nastavil}
  if Edit18.Text = '----' then Edit18.Text := '0.1';
  if (Dinar = false) and (KTB = false) then Edit18.Enabled := True;
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - Rayleigh waves inversion selected');
  Form1.DatPar(self);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - ' + numofparstrg + ' parameters have to be estimated');
  joint := False;
  if zarad then begin
    Button23.Enabled := False;
    inverindexf := 0;
    inverindexl := 0;
    ComboBox2CloseUp(Sender);
    ComboBox3CloseUp(Sender);
  end;
end; {tak ted je to Rayleigh}

procedure TNoSVALform.RadioButton3Click(Sender: TObject);
begin                      {kdyz bude zaskrtnuto tohle, tak to bude Rayleigh i Love DOHROMADY}
  ityprl := 3;
  Edit17.Text := '1.8';
  if (Dinar = false) and (KTB = false) then Edit17.Enabled := True;
  Edit18.Text := '0.1';
  if (Dinar = false) and (KTB = false) then Edit18.Enabled := True;
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - joint Love and Rayleigh waves inversion selected');
  Form1.DatPar(self);      {tady se to musi dodelat}
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - ' + numofparstrg + ' parameters have to be estimated');
  joint := True;
  if zarad then begin
    Button23.Enabled := False;
    inverindexf := 0;
    inverindexl := 0;
    ComboBox2CloseUp(Sender);
    ComboBox3CloseUp(Sender);
  end;
end; {tak ted jsou to Love i Rayleigh dohromady}

procedure TNoSVALform.ComboBox2CloseUp(Sender: TObject);
var       {voli se prvni perioda pro inverzi, kresleni orezane disperze atd}
  ay: integer;
begin
  if posilamnacombo2 = False then begin {pokud jsem zmacknul cudlik rucne, udelam to prirazeni, pokud jsem to sem poslal z batch processing, tak ne}
    val(combobox2.Text, offirst, cd);
  end;
  ffirst := offirst;
  str(offirst: 7: 5, ffirststrg);
  if posilamnacombo2 then begin {pokud jsem to sem poslal z batch processing, tak zobrazim tu prvni periodu v menu}
    combobox2.ItemIndex := 0;
    posilamnacombo2 := False;   {zmenim to na false, aby v pripade kliknuti na combo i pri spusteneme batch processing to vyvolalo zmenu periody}
  end;
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - minimum period to be inverted (or summed) is ' + ffirststrg + ' s');
  if useloaded then begin {pokud se ma pouzit naloadovana disperze}
    if loadgrvelmax <> 0 then grvelmax := loadgrvelmax;
    if loadgrvelmin <> 0 then grvelmin := loadgrvelmin;
  end
  else begin {pokud se ma pouzit analyzovana}
    if grvel[1] <> 0 then grvelmax := grvel[1];
    if grvel[nsampl] <> 0 then grvelmin := grvel[nsampl];
  end;
  for ay := 1 to nflt do begin {vlozeni poradoveho cisla daticka do promenne inverindexf}
    if (instper[ay, locmx[ay]] <= offirst + 0.000009) and (instper[ay, locmx[ay]] > offirst - 0.000009) then begin
      inverindexf := ay;
    end;
  end;
  if inverindexf = 0 then begin
    ShowMessage('No minimum period of the range selected!');
    exit;
  end;
  ffirst2 := loadper2[inverindexf];  {priradim hodnotu prvni periody druhe krivky ke stejnemu indexu jako je u prvni krivky}

  if batchproces = false then begin {pro batch ty cary malovat nebudu}
    pp3 := pp3 + 1;
    with PlotPanel3 do begin
      LayerOptions(pp3, pmLine, 1);
    end;
    if joint = False then begin
      PlotPanel3.AddXY(offirst, grvelmax, clWhite, pp3); {namaluje to bilou caru}
      PlotPanel3.AddXY(offirst, grvelmin, clWhite, pp3);
    end;
    if joint then begin
      PlotPanel3.AddXY(offirst, loadgrvelmax1, clWhite, pp3); {namaluje to bilou caru}
      PlotPanel3.AddXY(offirst, loadgrvelmin1, clWhite, pp3);
      pp3 := pp3 + 1;
      with PlotPanel3 do begin
        LayerOptions(pp3, pmLine, 1);
      end;
      PlotPanel3.AddXY(ffirst2, loadgrvelmax2, clWhite, pp3); {namaluje to bilou caru}
      PlotPanel3.AddXY(ffirst2, loadgrvelmin2, clWhite, pp3);
    end;
  end;

  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  str(inverindexf, inverindexfstrg);
  str(grvel[locmx[inverindexf]]: 6: 3, svalcstartstrg);
  edit12.Text := svalcstartstrg;  {vlozi se do okenka grupova rychlost prvni uvazovane periody}
  {ale je mozne to cislo v okenku jeste zmenit rucne}
  if ((inverindexf <> 0) and (inverindexl <> 0)) then begin {tedy pokud mam vybrane obe hranice period range}
    Button22.Enabled := True; {Layers}
    Edit12.Enabled := True; {startovaci grupova rychlost}
    if (Dinar = false) and (KTB = false) then Edit15.Enabled := True; {startovaci povrchova S-rychlost}
    if (Dinar = false) and (KTB = false) then CheckBox4.Enabled := True; {prepinac low velocity zone}
    if ityprl <> 1 then begin {pro cokoli krome Loveho}
      if (Dinar = false) and (KTB = false) then Edit17.Enabled := True; {startovaci pomer Pv/Ps}
      if (Dinar = false) and (KTB = false) then Edit18.Enabled := True; {startovaci variace pomeru}
    end;
    if (Dinar = false) and (KTB = false) then Edit13.Enabled := True; {krok rychlosti}
    if (Dinar = false) and (KTB = false) then Edit16.Enabled := True; {startovaci povrchova hustota}
    if (Dinar = false) and (KTB = false) then Edit14.Enabled := True; {krok hustoty}
    if (Dinar = false) and (KTB = false) then Edit21.Enabled := True; {range prvni vrstvy}
    if (Dinar = false) and (KTB = false) then CheckBox2.Enabled := True; {prepinac konstantni hustoty}
    Button18.Enabled := True; {ukladani spektrogramu}
    Button19.Enabled := True; {ukladani disperzi}
    if layload then begin
      if (Dinar = false) and (KTB = false) then begin
        RadioGroup1.Enabled := True;
        RadioButton1.Enabled := True;
        RadioButton2.Enabled := True;
      end;
      Button23.Enabled := True; {spousti inverzi}
      zarad := False; {aby to vynechalo vypisovani hlasky pri Checkovani RadioButton3}
      if joint then begin
        RadioButton3.Enabled := True;
        RadioButton3.Checked := True;        {implicitne ho zaskrtnu, jakoze chci delat spolecnou inverzi}
      end;
      zarad := True;
      if (Dinar = false) and (KTB = false) then begin
        RadioGroup6.Enabled := True;
        RadioGroup3.Enabled := True;
      end;
    end;
    Button27.Enabled := True; {zoomuje na osu X}
    if useloaded = False then begin
      Button34.Enabled := True; {kresli range filter}
      SpinEdit1.Enabled := True; {pro nastavovani procent vysky filtrovanych potvor}
    end;
    numofdat := inverindexl - inverindexf + 1;
    if (Dinar = false) and (KTB = false) then begin
      if (numofdat < numofpar) then begin
        ShowMessage('You''ve got more parameters than data!!');
      end;
    end;
    str(numofdat, numofdatstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - selected part of the curve presents ' + numofdatstrg + ' points');
  end; {if inverindexf <> 0 atd...}
end; {vybrana nejkratsi perioda pro inverzi, pripadne pro kresleni orizle dizperze a sestrojeni filtrovaneho seismogramu}

procedure TNoSVALform.ComboBox3CloseUp(Sender: TObject);
var       {voli se maximalni perioda pro inverzi, kresleni orezane disperze atd}
  ayy: integer;
begin
  if posilamnacombo3 = False then begin {pokud jsem zmacknul cudlik rucne, udelam to prirazeni, pokud jsem to sem poslal z batch processing, tak ne}
    val(combobox3.Text, oflast, cd);
  end;
  flast := oflast;
  str(oflast: 7: 5, flaststrg);
  if posilamnacombo3 then begin {pokud jsem to sem poslal z batch processing, tak zobrazim tu prvni periodu v menu}
    combobox3.ItemIndex := nflt - 1;
    posilamnacombo3 := False;   {zmenim to na false, aby v pripade kliknuti na combo i pri spusteneme batch processing to vyvolalo zmenu periody}
  end;
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - maximum period to be inverted (or summed) is ' + flaststrg + ' s');
  if useloaded then begin {pokud se ma pouzit naloadovana disperze}
    if loadgrvelmax <> 0 then grvelmax := loadgrvelmax;
    if loadgrvelmin <> 0 then grvelmin := loadgrvelmin;
  end
  else begin {pokud se ma pouzit analyzovana}
    if grvel[1] <> 0 then grvelmax := grvel[1];
    if grvel[nsampl] <> 0 then grvelmin := grvel[nsampl];
  end;
  for ayy := 1 to nflt do begin {vlozeni poradoveho cisla daticka do promenne inverindexl}
    if (instper[ayy, locmx[ayy]] <= oflast + 0.000009) and (instper[ayy, locmx[ayy]] > oflast - 0.000009) then begin
      inverindexl := ayy;
    end;
  end;
  if inverindexl = 0 then begin
    ShowMessage('No maximum period of the range selected!');
    exit;
  end;
  flast2 := loadper2[inverindexl];  {priradim hodnotu posledni periody druhe krivky ke stejnemu indexu jako je u prvni krivky}

  if batchproces = false then begin {pro batch ty cary malovat nebudu}
  pp3 := pp3 + 1;
    with PlotPanel3 do begin
      LayerOptions(pp3, pmLine, 1);
    end;
    if joint = False then begin
      PlotPanel3.AddXY(oflast, grvelmax, clWhite, pp3);
      PlotPanel3.AddXY(oflast, grvelmin, clWhite, pp3);
    end;
    if joint then begin
      PlotPanel3.AddXY(oflast, loadgrvelmax1, clWhite, pp3); {namaluje to bilou caru}
      PlotPanel3.AddXY(oflast, loadgrvelmin1, clWhite, pp3);
      pp3 := pp3 + 1;
      with PlotPanel3 do begin
        LayerOptions(pp3, pmLine, 1);
      end;
      PlotPanel3.AddXY(flast2, loadgrvelmax2, clWhite, pp3); {namaluje to bilou caru}
      PlotPanel3.AddXY(flast2, loadgrvelmin2, clWhite, pp3);
    end;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  str(inverindexl, inverindexlstrg);
  if ((inverindexf <> 0) and (inverindexl <> 0)) then begin
    Button22.Enabled := True; {Layers}
    Edit12.Enabled := True; {startovaci grupova rychlost}
    if (Dinar = false) and (KTB = false) then Edit15.Enabled := True; {startovaci povrchova S-rychlost}
    if (Dinar = false) and (KTB = false) then CheckBox4.Enabled := True; {prepinac low velocity zone}
    if ityprl <> 1 then begin {pro cokoli krome Loveho}
      if (Dinar = false) and (KTB = false) then Edit17.Enabled := True; {startovaci pomer Pv/Ps}
      if (Dinar = false) and (KTB = false) then Edit18.Enabled := True; {startovaci variace pomeru}
    end;
    if (Dinar = false) and (KTB = false) then Edit13.Enabled := True; {krok rychlosti}
    if (Dinar = false) and (KTB = false) then Edit16.Enabled := True; {startovaci povrchova hustota}
    if (Dinar = false) and (KTB = false) then Edit14.Enabled := True; {krok hustoty}
    if (Dinar = false) and (KTB = false) then Edit21.Enabled := True; {range prvni vrstvy}
    if (Dinar = false) and (KTB = false) then CheckBox2.Enabled := True; {prepinac konstantni hustoty}
    Button18.Enabled := True; {ukladani spektrogramu}
    Button19.Enabled := True; {ukladani disperzi}
    if layload then begin
      if (Dinar = false) and (KTB = false) then begin
        RadioGroup1.Enabled := True;
        RadioButton1.Enabled := True;
        RadioButton2.Enabled := True;
      end;
      Button23.Enabled := True;
      zarad := False;
      if joint then begin
        RadioButton3.Enabled := True;
        RadioButton3.Checked := True;
      end;
      zarad := True;
      if (Dinar = false) and (KTB = false) then begin
        RadioGroup6.Enabled := True;
        RadioGroup3.Enabled := True;
      end;
    end;
    Button27.Enabled := True; {zoomuje na osu X}
    if useloaded = False then begin
      Button34.Enabled := True;  {kresli range filter}
      SpinEdit1.Enabled := True; {pro nastavovani procent vysky filtrovanych potvor}
    end;
    numofdat := inverindexl - inverindexf + 1;
    if (Dinar = false) and (KTB = false) then begin
      if (numofdat < numofpar) then begin
        ShowMessage('You''ve got more parameters than data!!');
      end;
    end;
    str(numofdat, numofdatstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - selected part of the curve presents ' + numofdatstrg + ' points');
  end; {if inverindexf <> 0 atd...}
end; {vybrana nejdelsi perioda pro inverzi, pripadne pro kresleni orizle dizperze a sestrojeni filtrovaneho seismogramu}

procedure TNoSVALform.Button24Click(Sender: TObject);
var   {maze strukturni model, ale nechava tam rozdeleni na vrstvy}
  h   : integer;
begin
  PlotPanel4.ClearData;
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront; {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
  hlayers := 0.0;
  with PlotPanel4 do begin
    LayerOptions(lay, pmLine, 2);
  end;
  for h := 1 to numoflay do begin
    lay := lay + 1;
    hlayers := hlayers + DD[h];
    PlotPanel4.AddXY(0.0, -hlayers, clWhite, lay);
    PlotPanel4.AddXY(20.0, -hlayers, clWhite, lay);
  end;
  CheckBox1.Enabled := False;
  CheckBox1.Checked := False;
end; {konec mazaci procedurky}

procedure TNoSVALform.Button25Click(Sender: TObject);
var   {vykresluje strukturni rez rychlosti S vln}
  hah: integer;
begin
  hlayers2 := 0.0;
  depth := 0.0;
  eska := eska + 1;
  with PlotPanel4 do begin
    LayerOptions(eska, pmLine, 4);
  end;
  for hah := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    PlotPanel4.AddXY(B[hah], -hlayers2, clRed, eska);    {vykresluje rychlosti S-vln}
    hlayers2 := hlayers2 + DD[hah];
    PlotPanel4.AddXY(B[hah], -hlayers2, clRed, eska);    {vykresluje rychlosti S-vln}
  end; {konec pro kazdou vrstvu}
  PlotPanel4.AddXY(B[numoflay + 1], -hlayers2, clRed, eska);  {vykresluje rychlost S-vln}
  PlotPanel4.AddXY(B[numoflay + 1], -hlayers2 * 1.25, clRed, eska);  {vykresluje rychlost S-vln}
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
  CheckBox1.Enabled := True;
  CheckBox1.Checked := False;
end; {konec vykreslovaci procedurky na S rychlosti}

procedure TNoSVALform.Button26Click(Sender: TObject);
var   {vykresluje strukturni rez hustot}
  haha            : integer;
begin
  hlayers2 := 0.0;
  depth := 0.0;
  husto := husto + 1;
  with PlotPanel4 do begin
    LayerOptions(husto, pmLine, 4);
  end;
  for haha := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    PlotPanel4.AddXY(R[haha], -hlayers2, clYellow, husto);      {vykresluje hustotu}
    hlayers2 := hlayers2 + DD[haha];
    PlotPanel4.AddXY(R[haha], -hlayers2, clYellow, husto);      {vykresluje hustotu}
  end; {konec pro kazdou vrstvu}
  PlotPanel4.AddXY(R[numoflay + 1], -hlayers2, clYellow, husto);      {vykresluje hustotu}
  PlotPanel4.AddXY(R[numoflay + 1], -hlayers2 * 1.25, clYellow, husto); {vykresluje hustotu}
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
end; {konec vykreslovaci procedurky na hustoty}

procedure TNoSVALform.Button28Click(Sender: TObject);
var   {vykresluje strukturni rez rychlosti P vln}
  huh: integer;
begin
  hlayers2 := 0.0;
  depth := 0.0;
  pecka := pecka + 1;
  with PlotPanel4 do begin
    LayerOptions(pecka, pmLine, 4);
  end;
  for huh := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    PlotPanel4.AddXY(A[huh], -hlayers2, RGB(124, 219, 230), pecka);   {vykresluje rychlosti P-vln}
    hlayers2 := hlayers2 + DD[huh];
    PlotPanel4.AddXY(A[huh], -hlayers2, RGB(124, 219, 230), pecka);   {vykresluje rychlosti P-vln}
  end; {konec pro kazdou vrstvu}
  PlotPanel4.AddXY(A[numoflay + 1], -hlayers2, RGB(124, 219, 230), pecka);        {vykresluje rychlost P-vln}
  PlotPanel4.AddXY(A[numoflay + 1], -hlayers2 * 1.25, RGB(124, 219, 230), pecka); {vykresluje rychlost P-vln}
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
end; {konec vykreslovaci procedurky na P rychlosti}

procedure TNoSVALform.Button39Click(Sender: TObject);
var {vykresluje nafitovanou disperzi / cervena cara}
  jeje: integer;
begin
  pp3 := pp3 + 1;
  with PlotPanel3 do begin               {VYKRESLUJE MODELOVOU DISPERZNI KRIVKU}
    LayerOptions(pp3, pmLine, 4);
  end;
  PlotPanel3.AddXY(prumtperiod[1], prumuvelocity[1], clRed, pp3);
  {prvni bod}
  for jeje := 1 to trunc(prumnft / 4) do begin
    PlotPanel3.AddXY(prumtperiod[jeje * 4], prumuvelocity[jeje * 4], clRed, pp3);    {body uprostred}
  end;
  PlotPanel3.AddXY(prumtperiod[prumnft], prumuvelocity[prumnft], clRed, pp3);        {posledni bod}
  if ityprl = 3 then begin               {pro spolecnou inverzi ot vykresli este druhou krivku}
    pp3 := pp3 + 1;
    with PlotPanel3 do begin             {VYKRESLUJE DRUHOU MODELOVOU DISPERZNI KRIVKU}
      LayerOptions(pp3, pmLine, 4);
    end;
    PlotPanel3.AddXY(prumtperiod[1], prumuvelocity2[1], clRed, pp3); {prvni bod}
    for jeje := 1 to trunc(prumnft / 4) do begin
      PlotPanel3.AddXY(prumtperiod[jeje * 4], prumuvelocity2[jeje * 4], clRed, pp3);  {body uprostred}
    end;
    PlotPanel3.AddXY(prumtperiod[prumnft], prumuvelocity2[prumnft], clRed, pp3);      {posledni bod}
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
end; {konec kresleni teoreticke nafitovane disperzni krivky}

procedure TNoSVALform.Button27Click(Sender: TObject);
begin {zoomuje na osu X}
  with PlotPanel3 do begin
    PlotPanel3.Xmin := offirst - ((oflast - offirst) * 0.07);
    PlotPanel3.Xmax := oflast + ((oflast - offirst) * 0.07);
    PlotPanel3.XInterval := (PlotPanel3.Xmax - PlotPanel3.Xmin) / 6;
    original02 := PlotPanel3.XInterval;
    if ((PlotPanel3.XInterval <= 100.0) and (PlotPanel3.XInterval > 10.0)) then PlotPanel3.XInterval := 10.0
    else if ((PlotPanel3.XInterval <= 10.00) and (PlotPanel3.XInterval > 1.00)) then PlotPanel3.XInterval := 1.0
    else if ((PlotPanel3.XInterval <= 1.000) and (PlotPanel3.XInterval > 0.10)) then PlotPanel3.XInterval := 0.1
    else if ((PlotPanel3.XInterval <= 0.100) and (PlotPanel3.XInterval > 0.01)) then PlotPanel3.XInterval := 0.01
    else if (PlotPanel3.XInterval <= 0.01) then PlotPanel3.XInterval := 0.001;
    if PlotPanel3.XInterval <= original02 then PlotPanel3.XInterval := PlotPanel3.XInterval * (trunc(original02 / PlotPanel3.XInterval));
    PlotPanel3.XMarks := True;
  end; {with}
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
end; {konec X zoomu}

procedure TNoSVALform.Button29Click(Sender: TObject);
var {ukladani strukturniho modelu}
  nin: integer;
  hloubka: double;
  zaloha: string;
  grafer: string;
  model: string;
  vpvs: extended;
begin
  if batchinver = False then begin {pro rucni ukladani}
    SaveDialog5.Execute;
    if length(SaveDialog5.FileName) < 1 then exit;
    zaloha := SaveDialog5.FileName; {soubor pro citelny vypis struktury}
  end;
  if batchinver then begin {pro davkovou inverzi}
    if prumernabatch = False then begin
      if ibp < 10 then begin
        zaloha := '0' + ibpstrg + 'struc';
      end;
      if ibp >= 10 then begin
        zaloha := ibpstrg + 'struc';
      end;
    end; {konec pro radove behy inverze}
    if prumernabatch = True then begin
      if (Dinar = false) and (KTB = false) then zaloha := 'batchstruc';
      if (Dinar = true) or (KTB = true) then zaloha := 'batchstrucZAL/'+nodestrg +'batchstruc'+subarrayname;
    end;
  end; {if batchinver}
  zaloha := zaloha + '.zal';
  ChDir(cestakdisperzi); {zmenim adresar na ten, odku jsem nacetl disperzi}

  if ((Dinar = false) and (KTB = false)) or ( ((Dinar = true) or (KTB = true)) and (prumernabatch = true)) then begin
    assignfile(structure, zaloha);
    rewrite(structure);
  end;

  if batchinver = False then begin {pro rucni ukladani}
    grafer := SaveDialog5.FileName; {nazev souboru pro vykresleni rezu v grapheru}
  end;
  if batchinver then begin {pro davkovou inverzi}
    if prumernabatch = False then begin
      if ibp < 10 then begin
        grafer := '0' + ibpstrg + 'struc';
      end;
      if ibp >= 10 then begin
        grafer := ibpstrg + 'struc';
      end;
    end;
    if prumernabatch = True then begin
      if (Dinar = false) and (KTB = false) then grafer := 'batchstruc';
      if (Dinar = true) or (KTB = true) then grafer := 'batchstrucDAT/'+nodestrg + 'batchstruc'+subarrayname;
    end;
  end;
  grafer := grafer + '.dat';

  if ((Dinar = false) and (KTB = false)) or (((Dinar = true) or (KTB = true)) and (prumernabatch = true)) then begin
    assignfile(strucgraf, grafer);
    rewrite(strucgraf);
  end;

  if batchinver = False then begin {pro rucni ukladani}
    model := SaveDialog5.FileName; {soubor pro sezrani herrmannovejma modalnima sumacema}
  end;
  if batchinver then begin {pro davkovou inverzi}
    if prumernabatch = False then begin
      if ibp < 10 then begin
        model := '0' + ibpstrg + 'struc';
      end;
      if ibp >= 10 then begin
        model := ibpstrg + 'struc';
      end;
    end;
    if prumernabatch = True then begin
      if (Dinar = false) and (KTB = false) then model := 'batchstruc';
      if (Dinar = true) or (KTB = true) then model := nodestrg + 'batchstruc'+subarrayname;
    end;
  end;
  model := model + '.mod';

  if (Dinar = false) and (KTB = false) then begin
    assignfile(modelovani, model);
    rewrite(modelovani);
  end;

  if ((Dinar = false) and (KTB = false)) or (((Dinar = true) or (KTB = true)) and (prumernabatch = true)) then begin
    if ityprl = 1 then begin  {zapisuje citelne strukturu pro Loveovy vlny - P-vlny jsou natvrdo pres pomer, pomer tam je vypsan jen ten natvrdo 1.73}
      writeln(structure, ' thickness  P - velocity  S - velocity   density      Vp/Vs ratio ');
      writeln(structure, ' of layers    (km / s)      (km / s)    (g / cm3)      (constant) ');
      for nin := 1 to numoflay do begin
        writeln(structure, DD[nin]: 10: 5, pvsvratio * B[nin]: 12: 4, B[nin]: 14: 4, R[nin]: 10: 4, pvsvratio: 17: 4);
      end;
      writeln(structure, 'halfspace ', pvsvratio * B[numoflay + 1]: 12: 4, B[numoflay + 1]: 14: 4, R[numoflay + 1]: 10: 4, pvsvratio: 17: 4);
    end; {konec citelneho vypisu pro Loveovy vlny}
    hloubka := 0;

    if ityprl = 1 then begin  {zapisuje strukturu pro Loveovy vlny pro grafer - P vlny jsou tam natvrdo}
      writeln(strucgraf, '       depth Pvel.CnstVp/Vs     S-velocity    density');
      for nin := 1 to numoflay do begin
        if nin =  1 then writeln(strucgraf, '     0.00000', pvsvratio * B[nin]: 15: 4, B[nin]: 15: 4, R[nin]: 11: 4);
        if nin <> 1 then writeln(strucgraf, hloubka: 12: 5, pvsvratio * B[nin]: 15: 4, B[nin]: 15: 4, R[nin]: 11: 4);
        hloubka := hloubka + DD[nin];
        writeln(strucgraf, hloubka: 12: 5, pvsvratio * B[nin]: 15: 4, B[nin]: 15: 4, R[nin]: 11: 4);
      end;
      writeln(strucgraf, hloubka: 12: 5, pvsvratio * B[numoflay + 1]: 15: 4, B[numoflay + 1]: 15: 4, R[numoflay + 1]: 11: 4);
      writeln(strucgraf, (hloubka * 1.25): 12: 5, pvsvratio *  B[numoflay + 1]: 15: 4, B[numoflay + 1]: 15: 4, R[numoflay + 1]: 11: 4);
    end; {konec vypisu pro Loveovy vlny pro grafer}

    if ((ityprl = 0) or (ityprl = 3)) then begin  {zapisuje citelnou strukturu pro Rayleighovy vlny vcetne skutecne nalezeneho pomeru Vp/Vs}
      writeln(structure, ' thickness  P - velocity  S - velocity   density      Vp/Vs ratio');
      writeln(structure, ' of layers    (km / s)      (km / s)    (g / cm3)');
      for nin := 1 to numoflay do begin
        vpvs := A[nin] / B[nin];
        writeln(structure, DD[nin]: 10: 5, A[nin]: 12: 4, B[nin]: 14: 4, R[nin]: 10: 4, vpvs: 17: 4);
      end;
      vpvs := A[numoflay + 1] / B[numoflay + 1];
      writeln(structure, 'halfspace ', A[numoflay + 1]: 12: 4, B[numoflay + 1]: 14: 4, R[numoflay + 1]: 10: 4, vpvs: 17: 4);
    end; {konec citelneho vypisu pro Rayleighovy vlny}

    if ((ityprl = 0) or (ityprl = 3)) then begin  {zapisuje strukturu pro Rayleighovy vlny pro grafer}
      writeln(strucgraf, '       depth     P-velocity     S-velocity    density');
      for nin := 1 to numoflay do begin
        if nin =  1 then writeln(strucgraf, '     0.00000', A[nin]: 15: 4, B[nin]: 15: 4, R[nin]: 11: 4);
        if nin <> 1 then writeln(strucgraf, hloubka: 12: 5, A[nin]: 15: 4, B[nin]: 15: 4, R[nin]: 11: 4);
        hloubka := hloubka + DD[nin];
        writeln(strucgraf, hloubka: 12: 5, A[nin]: 15: 4, B[nin]: 15: 4, R[nin]: 11: 4);
      end;
      writeln(strucgraf, hloubka: 12: 5, A[numoflay + 1]: 15: 4, B[numoflay + 1]: 15: 4, R[numoflay + 1]: 11: 4);
      writeln(strucgraf, (hloubka * 1.25): 12: 5, A[numoflay + 1]: 15: 4, B[numoflay + 1]: 15: 4, R[numoflay + 1]: 11: 4);
    end; {konec vypisu pro Rayleighovy vlny pro grafer}
    closefile(strucgraf);
    closefile(structure);
  end; {  if Dinar or ktb = false or prumernabatch = true }

  if (Dinar = false) and (KTB = false) then begin {tohle se nebude delat pro dinar ani pro ktb ani v pripade prumerne koncove struktury}
    writeln(modelovani, 'MODEL01.0'); {vypisujou se fixni hlasky pro modalne-sumacni soubor}
    if batchproces = False then begin
      writeln(modelovani, 'MODEL ' + OpenDialog1.FileName + ' / ' + OpenDialog3.FileName);  {vypise se jmeno souboru se zaznamem a take jmeno souboru s rozlozenim vrstev}
    end;
    if batchproces then begin
      writeln(modelovani, 'MODEL ' + jmenofilu + ' / ' + OpenDialog3.FileName);             {vypise se jmeno souboru se zaznamem a take jmeno souboru s rozlozenim vrstev}
    end;
    writeln(modelovani, 'ISOTROPIC');
    writeln(modelovani, 'KGS');
    writeln(modelovani, 'FLAT EARTH');
    writeln(modelovani, '1-D');
    writeln(modelovani, 'CONSTANT VELOCITY');
    writeln(modelovani, 'LINE08');
    writeln(modelovani, 'LINE09');
    writeln(modelovani, 'LINE10');
    writeln(modelovani, 'LINE11');
    writeln(modelovani, ' H      VP      VS   RHO QP   QS  ETAP ETAS REFP REFS');
    if ityprl = 1 then begin  {pro Loveovy vlny - P-vlny jsou natvrdo pres pomer}
      for nin := 1 to numoflay do begin
        writeln(modelovani, DD[nin]: 4: 2, pvsvratio * B[nin]: 9: 3, B[nin]: 8: 3, R[nin]: 6: 3, ' 0.0  0.0 0.0  0.0  1.0   1.0');
      end;
      writeln(modelovani, '0.00', pvsvratio * B[numoflay + 1]: 9: 3, B[numoflay + 1]: 8: 3, R[numoflay + 1]: 6: 3, ' 0.0  0.0 0.0  0.0  1.0   1.0');
    end; {konec vypisu pro Loveovy vlny pro vstup do modalni sumace}
    if ((ityprl = 0) or (ityprl = 3)) then begin  {pro Rayleighovy vlny}
      for nin := 1 to numoflay do begin
        writeln(modelovani, DD[nin]: 4: 2, A[nin]: 9: 3, B[nin]: 8: 3, R[nin]: 6: 3, ' 0.0  0.0 0.0  0.0  1.0   1.0');
      end;
      writeln(modelovani, '0.00', A[numoflay + 1]: 9: 3, B[numoflay + 1]: 8: 3, R[numoflay + 1]: 6: 3, ' 0.0  0.0 0.0  0.0  1.0   1.0');
    end; {konec vypisu pro Rayleighovy vlny pro vstup do modalni sumace}
    closefile(modelovani);
  end; {  if Dinar = false or ktb = false}
end; {strukturni model ulozen}

procedure TNoSVALform.Button31Click(Sender: TObject);    {Load disp}
var   {natahne nejakou disperzni krivku napocitanou jinde ci jindy}
  kuku, kuk                                : integer;
  prvni, druha, treti, ctvrta, pata, sesta : double;
  helpper                                  : array of double;
  helpgrvel                                : array of double;
  //cteniobraceno                            : word;
  ctenichcichyby                           : word;
  chciDinar                                : word;
  chciCorr                                 : word;
  chciKTB                                  : word;
  obraceno                                 : boolean;
  nacteno                                  : boolean;
begin
  setlength(helpper, maxnflt + 1);
  setlength(helpgrvel, maxnflt + 1);
  pocetdisperzi := 0; {pocet disperzi pro Dinar a KTB mode}
  for kuk := 1 to maxnflt do begin {nulovani poli, aby tam pri kazdem dalsim nacteni nezustavalo neco z minula}
    loadper[kuk] := 0;
    loadgrvel[kuk] := 0;
    loadper2[kuk] := 0;
    loadgrvel2[kuk] := 0;
    chybaL[kuk] := 0;
    chybaR[kuk] := 0;
  end;
  loadgrvelmin := 100.0;
  loadgrvelmax := 0.0;
  loadgrvelmin1 := 100.0;
  loadgrvelmax1 := 0.0;
  loadgrvelmin2 := 100.0;
  loadgrvelmax2 := 0.0;
  kuk := 0;
  {zepta se, jestli chci nacist frequenci, m/s a obracene poradi}
  //cteniobraceno := MessageDlg('Do you want to load inverse settings? ( Hz + m/s )', mtConfirmation, [mbYes, mbNo], 0);
  //if cteniobraceno = mrYes then begin
  //  obraceno := True;
  //end
  //else if cteniobraceno = mrNo then begin
    obraceno := False;
  //end
  //else exit;  {kdyz okenko zabiju krizkem, vyskoci to z loadovani krivky}

  chciDinar := MessageDlg('Do you want to switch to DEEP inversion mode? ', mtConfirmation, [mbYes, mbNo], 0);
  if chciDinar = mrYes then begin
    RadioGroup3.ItemIndex:= 1; {bude to Dinar}
    //RadioGroup3Click(Sender); {ten cudlik se pusti sam od sebe uz tim predchozim prikazem}
    chciCorr := QuestionDlg(' ','Are you loading the curve from PhaseCorr or from ArrayCorr?', mtConfirmation, [mrOK, 'PhaseCorr', mrYes, 'ArrayCorr'], 0);
    if chciCorr = mrOK then begin
      fromPhaseCorr := true;
      fromArrayCorr := false;
      chcichyby     := false;
      Edit23.Text := '0.03';
      Edit23.Enabled := True;
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | PhaseCorr input selected');
    end;
    if chciCorr = mrYes then begin
      fromPhaseCorr := false;
      fromArrayCorr := true;
      chcichyby     := true; {pro vstup z ArrayCorr to automaticky predpoklada, ze tam jsou uvedene chyby mereni}
      Edit23.Text := 'N/A';
      Edit23.Enabled := False;
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | ArrayCorr input selected');
    end;
  end
  else if chciDinar = mrNo then begin {neudelam nic}
  end
  else exit;  {kdyz okenko zabiju krizkem, vyskoci to z loadovani krivky}

  chciKTB := MessageDlg('Do you want to switch to KTB mode? ', mtConfirmation, [mbYes, mbNo], 0);
  if chciKTB = mrYes then begin
    RadioGroup3.ItemIndex:= 2; {bude to KTB}
    //RadioGroup3Click(Sender); {ten cudlik se pusti sam od sebe uz tim predchozim prikazem}
  end
  else if chciKTB = mrNo then begin {neudelam nic}
  end
  else exit;  {kdyz okenko zabiju krizkem, vyskoci to z loadovani krivky}

  if (chciDinar = mrNo) and (chciKTB = mrNO) then begin {kdyz to neni Dinar ani KTB}
    ctenichcichyby := MessageDlg('Do you want to load errors? ', mtConfirmation, [mbYes, mbNo], 0);
    if ctenichcichyby = mrYes then begin
      chcichyby := True;
    end
    else if ctenichcichyby = mrNo then begin
      chcichyby := False;
    end
    else exit;  {kdyz okenko zabiju krizkem, vyskoci to z loadovani krivky}
  end; {kdyz jsem nevybral Dinarides ani KTB}
  OpenDialog2.Execute;
  if length(OpenDialog2.FileName) < 1 then exit;
  part1 := 'SVAL has loaded  ' + OpenDialog2.FileName;
  NoSVALform.Caption := part1 + part2 + refcaption; {co naloadoval a jaky je layers file}

  pozice := 1;
  repeat
    posledni := misto; {sem nactu posledni nalezenou pozici zpetneho lomitka}
    misto := PosEx('/', OpenDialog2.FileName, pozice);
    pozice := misto + 1;
  until misto = 0;
  cestakdisperzi := Copy(OpenDialog2.FileName, 1, posledni);
  assignfile(loadingf, OpenDialog2.FileName);     {priradim soubor s krivkou}
  reset(loadingf);

  if (chciDinar = mrNo) and (chciKTB = mrNO) then begin {kdyz to neni Dinar ani KTB}
    nacteno := False;
    if chcichyby = False then begin {testuju, jestli jsou tam dva, tri nebo ctyri sloupce}
      Read(loadingf, prvni, druha);
      if Eoln(loadingf) then begin {pokud po nacteni DVOU cisel skonci radek, nic vic tam neni, je to tedy jen jedna krivka}
        ShowMessage('Two columns detected. ONE dispersion curve available.');
        reset(loadingf);           {nastavim soubor znova na zacatek}
        kuku := 1;
        repeat
          readln(loadingf, loadper[kuku], loadgrvel[kuku]); {nactu dva sloupce}
          kuku := kuku + 1;
        until EOF(loadingf);
        joint := False;
        nacteno := True;
      end {if Eoln}
      else begin
        reset(loadingf);           {nastavim soubor znova na zacatek}
        Read(loadingf, prvni, druha, treti); {kdyz nebyly dva, zkusim, jestli jsou tri}
      end;
      if (nacteno = False) and (Eoln(loadingf)) then begin {pokud po nacteni TRI cisel skonci radek, nic vic tam neni, je to tedy porad jen jedna krivka}
        ShowMessage('Three columns detected. ONE dispersion curve available and errors are probably included but not to be used.');
        reset(loadingf);           {nastavim soubor znova na zacatek}
        kuku := 1;
        repeat
          readln(loadingf, loadper[kuku], loadgrvel[kuku]);  {nactu take jen dva, i kdyz tam jsou tri}
          kuku := kuku + 1;
        until EOF(loadingf);
        joint := False;
        nacteno := True;
      end {if Eoln}
      else begin
        reset(loadingf);           {nastavim soubor znova na zacatek}
        Read(loadingf, prvni, druha, treti, ctvrta); {kdyz nebyly tri, zkusim, jestli jsou ctyri}
      end;
      if (nacteno = False) and (Eoln(loadingf)) then begin  {pokud po nacteni ctyr cisel skonci radek, nic vic tam neni, jsou to tedy dve krivky}
        ShowMessage('Four columns detected. TWO dispersion curves available.');
        reset(loadingf);                   {nastavim soubor znova na zacatek}
        kuku := 1;
        repeat
          read(loadingf, loadper[kuku], loadgrvel[kuku]);
          if loadper[kuku] <> 0 then begin
            if Eoln(loadingf) then begin {kdyz to mezi krivkama narazi na konec radku, je to spatne, ta druha je kratsi}
              ShowMessage('It seems that one of the dispersion curves is shorter then the other. Please fix it!');
              closefile(loadingf);{kdyz je ale kratsi ta prvni, tak to nacte napred tu druhou, nicmene efekt je stejny, protoze proste}
              exit;               {po nacteni jedne uz tam dalsi neni}
            end;
            readln(loadingf, loadper2[kuku], loadgrvel2[kuku]);
          end; {if loadper[kuku] <> 0}
          kuku := kuku + 1;
        until EOF(loadingf);
        joint := True; {je mozne delat dvojitou inverzi}
        nacteno := True;
      end; {if Eoln}
    end; {if jsem nechtel cist chyby}
    if chcichyby = True then begin         {testuju, jestli jsou tam dva, tri, ctyri, pet nebo sest sloupcu}
      Read(loadingf, prvni, druha);
      if Eoln(loadingf) then begin         {pokud po nacteni DVOU cisel skonci radek, nic vic tam neni, je to tedy jen jedna krivka a NEJSOU tam chyby}
        ShowMessage('Two columns detected. No errors included in the file. Exit.');
        exit;
      end
      else begin
        reset(loadingf);                   {nastavim soubor znova na zacatek}
        Read(loadingf, prvni, druha, treti);      {kdyz chci nacitat chyby, predpokaldam, ze tam jsou aspon tri sloupce}
      end;
      if Eoln(loadingf) then begin         {pokud po nacteni TRI cisel skonci radek, nic vic tam neni, je to tedy jen jedna krivka}
        ShowMessage('Three columns detected. ONE dispersion curve available with errors included.');
        reset(loadingf);                   {nastavim soubor znova na zacatek}
        kuku := 1;
        repeat
          readln(loadingf, loadper[kuku], loadgrvel[kuku], chybaL[kuku]); {nactu i chyby}
          kuku := kuku + 1;
        until EOF(loadingf);
        joint := False;
        nacteno := True;
      end
      else begin
        reset(loadingf);                   {nastavim soubor znova na zacatek}
        Read(loadingf, prvni, druha, treti, ctvrta);
      end;
      if (nacteno = False) and (Eoln(loadingf)) then begin {pokud po nacteni CTYR cisel skonci radek, nic vic tam neni, jsou to dve krivky, ale nejsou tam chyby}
        ShowMessage('Four columns detected. No errors included in the file. Exit.');
        reset(loadingf);                   {nastavim soubor znova na zacatek}
        exit;
      end
      else begin
        reset(loadingf);                   {nastavim soubor znova na zacatek}
        Read(loadingf, prvni, druha, treti, ctvrta, pata);
      end;
      if (nacteno = False) and (Eoln(loadingf)) then begin {pokud po nacteni PETI cisel skonci radek, nic vic tam neni, je to nejake divne}
        ShowMessage('Five columns detected. Not allowed. Exit.');
        reset(loadingf);                   {nastavim soubor znova na zacatek}
        exit;
      end
      else begin
        reset(loadingf);                   {nastavim soubor znova na zacatek}
        Read(loadingf, prvni, druha, treti, ctvrta, pata, sesta);
      end;
      if (nacteno = False) and (Eoln(loadingf)) then begin {pokud po nacteni SESTI cisel skonci radek, jsou to dve krivky i s chybama}
        ShowMessage('Six columns detected. Two dispersions with errors available.');
        reset(loadingf);  {nastavim soubor znova na zacatek}
        kuku := 1;
        repeat
          read(loadingf, loadper[kuku], loadgrvel[kuku], chybaL[kuku]);
          if loadper[kuku] <> 0 then begin
            if Eoln(loadingf) then begin                   {kdyz to mezi krivkama narazi na konec radku, je to spatne, ta druha je kratsi}
              ShowMessage( 'It seems that one of the dispersion curves is shorter then the other. Please fix it!');
              closefile(loadingf); {kdyz je ale kratsi ta prvni, tak to nacte napred tu druhou, nicmene efekt je stejny, protoze proste}
              exit;                {po nacteni jedne uz tam dalsi neni}
            end;
            readln(loadingf, loadper2[kuku], loadgrvel2[kuku], chybaR[kuku]);
          end; {if loadper[kuku] <> 0}
          kuku := kuku + 1;
        until EOF(loadingf);
        joint := True;                     {je mozne delat dvojitou inverzi}
        nacteno := True;
      end; {if Eoln}
    end; {if jsem chtel cist chyby}

    closefile(loadingf);                   {tady se soubor zavre jen kdyz to NENI dinar ani KTB}

    loadnflt := 0;
    kuk := 0;
    repeat
      kuk := kuk + 1;
      loadnflt := loadnflt + 1;   {kolik bodu ma naloadovana disperze}
    until loadper[kuk + 1] = 0;   {predpokladam, ze jich je mene nez 300 a tudiz to po skonceni krivky narazi na nulu}
    kuk := 0;
    repeat
      kuk := kuk + 1;
      loadnflt2 := loadnflt2 + 1; {kolik bodu ma naloadovana disperze}
    until loadper2[kuk + 1] = 0;  {predpokladam, ze jich je mene nez 300 a tudiz to po skonceni krivky narazi na nulu}

    if obraceno then begin        {pokud to nacitam v obracenem formatu}
      for kuku := 1 to loadnflt do begin
        helpper[kuku] := 1 / loadper[kuku];          {udelam z frekvenci periody}
        helpgrvel[kuku] := loadgrvel[kuku] / 1000;   {udelam z m/s km/s}
      end;
      for kuku := 1 to loadnflt do begin
        loadper[kuku] := helpper[loadnflt - kuku + 1]; {prohodim poradi}
        loadgrvel[kuku] := helpgrvel[loadnflt - kuku + 1];
      end;
    end;
  end;  {konec jen pro kdyz to neni Dinar ani KTB}

  {a v pripade ze jsem v Dinar nebo v KTB, tak tu zavolam zvlastni proceduru, kde se nacte prvni disperze z velkeho Dinar nebo KTB souboru, ktery uz je assignfile vyse}
  {tu budu pak volat znova a znova ale odjinud}
  {musi mi z nej vylezt:        loadnflt                }
  {                             loadgrvel[kuku]         }
  {                             loadper[..]             }
  if Dinar or KTB then begin
    CtiDinar;
  end;

  MalujLoaded; {pusti to rovnou nasledujici proceduru a to v kazdem pripade, at uz to byl nebo nebyl Dinar nebo KTB}
end; {konec natahovani jiz hotove disperze}

procedure TNoSVALform.CtiDinar;  {procedura na cteni souboru se vsema disperzema, ktere se maji invertit}
var
  i                     : integer;
  nodelati, nodelong    : double;
  numofentries          : integer;
  cokoli                : array[1..maxloadinver] of double;
  nic                   : string[1];
begin
  if Dinar then begin
    if fromPhaseCorr then begin
      read(loadingf, nodelati, nodelong);  {prectu prvni dve cisla na prvnim radku velkeho souboru se vsema krivkama}
      str(nodelati:5:2, nodelatistrg);
      str(nodelong:5:2, nodelongstrg);
    end;
    if fromArrayCorr then begin
      read(loadingf, nodelati, nodelong, nic, subarrayname);  {prectu prvni dve cisla na prvnim radku velkeho souboru se vsema krivkama plus je tam jeste jmeno stanice, kdyz je to z ArrayCorr}
      str(nodelati:7:4, nodelatistrg);
      str(nodelong:7:4, nodelongstrg);
      if subarrayname[5] = ' ' then SetLength(subarrayname,4);
      if subarrayname[4] = ' ' then SetLength(subarrayname,3);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - loaded subarray --'+subarrayname+'--');
      label66.Caption := subarrayname;
      label66.Visible := True;
      label66.BringToFront;
    end; {if from ArrayCorr}
  end;
  if KTB then begin
    read(loadingf, nodelati, nodelong);  {prectu prvni dve cisla na prvnim radku velkeho souboru se vsema krivkama}
    str(nodelati:4:3, nodelatistrg);
    str(nodelong:4:3, nodelongstrg);
  end;

  if Dinar then begin
    if fromPhaseCorr then begin
      nodestrg := Copy(nodelatistrg,1,2)+Copy(nodelatistrg,4,2)+Copy(nodelongstrg,1,2)+Copy(nodelongstrg,4,2);     {string pro dodani pred nazvy souboru}
    end;
    if fromArrayCorr then begin
      nodestrg := Copy(nodelatistrg,1,2)+Copy(nodelatistrg,4,4)+Copy(nodelongstrg,1,2)+Copy(nodelongstrg,4,4);     {string pro dodani pred nazvy souboru}
    end;
  end;
  if KTB then begin
    nodestrg := Copy(nodelatistrg,1,2)+Copy(nodelatistrg,4,3)+Copy(nodelongstrg,1,2)+Copy(nodelongstrg,4,3);     {string pro dodani pred nazvy souboru}
  end;
  numofentries := 0;
  for i := 1 to maxloadinver do begin
    cokoli[i] := 0;
  end;
  repeat
    numofentries := numofentries + 1;
    read(loadingf, cokoli[numofentries]); {prectu jednotlive hodnoty, at uz cehokoli}
  until Eoln(loadingf);

  if fromPhaseCorr then begin
    loadnflt := trunc(numofentries/2);
    for i := 1 to loadnflt do begin
      loadgrvel[i] := cokoli[i];           {sem nactu prvni pulku cisel, tedy rychlosti, bylo to tak puvodne, pak obracene, a pro AdriaCrust je to zase takto}
      loadper[i]   := cokoli[i+loadnflt];  {sem nactu druhou pulku cisel, tedy periody - tohle bylo nastaveni pro Dinarides}
      //loadper[i]   := cokoli[i];             {sem nactu prvni pulku cisel, tedy periody - pro AdriaTomo je to obracene, napred periody a pak rychlosti}
      //loadgrvel[i] := cokoli[i+loadnflt];    {sem nactu druhou pulku cisel, tedy rychlosti}
    end;
  end; {if fromPhaseCorr}

  if fromArrayCorr then begin
    loadnflt := trunc(numofentries/3);        {delim trema, protoze jsou tam i chyby}
    for i := 1 to loadnflt do begin
      loadgrvel[i] := cokoli[i];              {sem nactu prvni tretinu cisel, tedy rychlosti}
      loadper[i]   := cokoli[i+   loadnflt];  {sem nactu druhou tretinu cisel, tedy periody}
      chybaR[i]    := cokoli[i+(2*loadnflt)]; {sem nactu treti tretinu cisel, tedy chyby}
      chybaL[i]    := chybaR[i];
    end;
  end; {if fromPhaseCorr - mam nactene chyby}

  if KTB then begin
    loadnflt := trunc(numofentries/2);
    for i := 1 to loadnflt do begin
      loadgrvel[i] := cokoli[i];           {sem nactu prvni pulku cisel, tedy rychlosti}
      loadper[i]   := cokoli[i+loadnflt];  {sem nactu druhou pulku cisel, tedy periody - tohle bylo nastaveni pro Dinarides}
    end;
  end; {if fromPhaseCorr}

  if EOF(loadingf) = false then begin    {pokud jeste nejsem na konci souboru}
    readln(loadingf);                    {skocim na dalsi radek}
  end;
end; {of procedure CtiDinar - cte i KTB}

procedure TNoSVALform.MalujLoaded;
var
  kuku           : integer;
begin
  memo1.Lines.Add('------------------------------------------------------------------------');
  if loadnflt = loadnflt2 then begin   {kdyz to dojde sem, tak proste uz musi byt stejne, jinak to neni mozna}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - both loaded dispersions have the same number of points');
  end;
  str(loadnflt, loadnfltstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  if joint = False then begin
    memo1.Lines.Add(radekstrg + ' | - the loaded dispersion has ' + loadnfltstrg + ' points');
  end;
  if Dinar or KTB then begin {vypisu souradnice noveho nodu pro Dinar nebo pro KTB}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - lati and long of the loaded curve: ' + nodelatistrg + '  ' + nodelongstrg);
  end;
  if joint then begin
    memo1.Lines.Add(radekstrg + ' | - the loaded dispersions have ' + loadnfltstrg + ' points each');
  end;
  for kuku := 1 to loadnflt do begin   {pro oba pripady (1 i 2 krivky) hledam minimum a maximum z prvni krivky}
    if ((loadgrvel[kuku] < loadgrvelmin1) and (loadgrvel[kuku] <> 0)) then begin
      loadgrvelmin1 := loadgrvel[kuku];
    end;
    if (loadgrvel[kuku] > loadgrvelmax1) then begin
      loadgrvelmax1 := loadgrvel[kuku];
    end;
  end; {for kuku}
  if joint then begin                  {pokud je tam jeste druha krivka, najdu jeste i jeji minima a maxima}
    for kuku := 1 to loadnflt do begin
      if ((loadgrvel2[kuku] < loadgrvelmin2) and (loadgrvel2[kuku] <> 0)) then begin
        loadgrvelmin2 := loadgrvel2[kuku];
      end;
      if (loadgrvel2[kuku] > loadgrvelmax2) then begin
        loadgrvelmax2 := loadgrvel2[kuku];
      end;
    end; {for kuku}
  end; {if jsou to dve}
  loadgrvelmin := min(loadgrvelmin1, loadgrvelmin2); {hledani minima grupove rychlosti}
  loadgrvelmax := max(loadgrvelmax1, loadgrvelmax2); {hledani maxima grupove rychlosti}
  {nastavovani mezi plotpanelu podle naloadovane disperze}
  minjointload := min(loadper[1], loadper2[1]);
  maxjointload := max(loadper[loadnflt], loadper2[loadnflt]);
  if loadper2[1] = 0 then minjointload := loadper[1];
  PlotPanel3.Xmin := minjointload;
  if PlotPanel3.XMin <= 0 then PlotPanel3.XMin := 0;
  PlotPanel3.Xmax := maxjointload * 1.15;
  PlotPanel3.XInterval := (PlotPanel3.XMax - PlotPanel3.Xmin) / 6;
  PlotPanel3.Xmin := (minjointload) - (PlotPanel3.XInterval) / 4;
  original01 := PlotPanel3.XInterval;
  if ((PlotPanel3.XInterval <= 100.0) and (PlotPanel3.XInterval > 10.0)) then PlotPanel3.XInterval := 10.0
  else if ((PlotPanel3.XInterval <= 10.00) and (PlotPanel3.XInterval > 1.00)) then PlotPanel3.XInterval := 1.0
  else if ((PlotPanel3.XInterval <= 1.000) and (PlotPanel3.XInterval > 0.10)) then PlotPanel3.XInterval := 0.1
  else if ((PlotPanel3.XInterval <= 0.100) and (PlotPanel3.XInterval > 0.01)) then PlotPanel3.XInterval := 0.01
  else if (PlotPanel3.XInterval <= 0.01) then PlotPanel3.XInterval := 0.001;
  if PlotPanel3.XInterval <= original01 then PlotPanel3.XInterval := PlotPanel3.XInterval * (trunc(original01 / PlotPanel3.XInterval));
  PlotPanel3.XMarks := True;
  PlotPanel3.Ymin := loadgrvelmin;
  PlotPanel3.Ymax := loadgrvelmax;
  PlotPanel3.YInterval := (PlotPanel3.Ymax - PlotPanel3.Ymin) / 6;
  original02 := PlotPanel3.YInterval;
  PlotPanel3.Ymin := loadgrvelmin - (PlotPanel3.YInterval) / 4;
  PlotPanel3.Ymax := loadgrvelmax + (PlotPanel3.YInterval) / 4;
  if ((PlotPanel3.YInterval <= 100.0) and (PlotPanel3.YInterval > 10.0)) then PlotPanel3.YInterval := 10.0
  else if ((PlotPanel3.YInterval <= 10.00) and (PlotPanel3.YInterval > 1.00)) then PlotPanel3.YInterval := 1.0
  else if ((PlotPanel3.YInterval <= 1.000) and (PlotPanel3.YInterval > 0.10)) then PlotPanel3.YInterval := 0.1
  else if ((PlotPanel3.YInterval <= 0.100) and (PlotPanel3.YInterval > 0.01)) then PlotPanel3.YInterval := 0.01
  else if (PlotPanel3.YInterval <= 0.01) then PlotPanel3.YInterval := 0.001;
  if PlotPanel3.YInterval <= original02 then PlotPanel3.YInterval := PlotPanel3.YInterval * (trunc(original02 / PlotPanel3.YInterval));
  PlotPanel3.YMarks := True; {konec nastavovani mezi plotpanelu podle naloadovane disperze}
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 4);
  end;
  for kuku := 1 to loadnflt do begin                                                       {vykresleni naloadovane krivky}
    PlotPanel3.AddXY((loadper[kuku]), loadgrvel[kuku], RGB(120, 120, 120), pp3);           {kreslim jedno, anebo Love kdyz jsou dve}
    if chcichyby = true then begin
      PlotPanel3.AddXY((loadper[kuku]), loadgrvel[kuku] + chybaL[kuku], RGB(50, 50, 50), pp3);
      PlotPanel3.AddXY((loadper[kuku]), loadgrvel[kuku] - chybaL[kuku], RGB(50, 50, 50), pp3);
    end;
  end;
  if joint then begin                                                                      {pokud jsou dve ty krivky}
    for kuku := 1 to loadnflt do begin {vykresleni naloadovane krivky cislo 2}
      PlotPanel3.AddXY((loadper2[kuku]), loadgrvel2[kuku], clWhite, pp3);                  {kreslim Rayleigha, jakoze tu druhou}
      if chcichyby = true then begin                                                       {a pokud byla s chybama}
        PlotPanel3.AddXY((loadper2[kuku]), loadgrvel2[kuku] + chybaR[kuku], RGB(50, 50, 50), pp3); {namaluju i ty chyby}
        PlotPanel3.AddXY((loadper2[kuku]), loadgrvel2[kuku] - chybaR[kuku], RGB(50, 50, 50), pp3);
      end;
    end;
  end;
  label15.BringToFront;
  label17.Visible := True;
  label17.BringToFront;
  Button32.Enabled := True;
  if chcichyby = false then Edit23.Enabled := True;
  PlotPanel3.Enabled := True;
end; {konec pro malovani naloadovane disperze}

procedure TNoSVALform.Button32Click(Sender: TObject);
var   {nacpe naloadovanou disperzi misto namerene}
  j, joj: integer;
begin
  if nflt <> 0 then begin          {pokud je to nula, znamena to, ze jsem s tim zatim nepocital, a tudiz to nemusim nulovat}
    for joj := 1 to loadnflt do begin
      if locmx[joj] <> 0 then begin
        grvel[locmx[joj]] := 0.0; {vynuluju vsechno co tam bylo}
      end;
    end;
  end;
  nflt := loadnflt;
  for joj := 1 to nflt do begin
    locmx[joj] := joj;    {jen sem vlozim libovolne hodnoty (treba "joj"), aby tam neco bylo}
    //for i := 1 to maxsamples do begin
      instper[joj, locmx[joj]] := loadper[joj];
    //end;
    grvel[locmx[joj]] := loadgrvel[joj];
  end; {joj}
  {pro druhou krivku to tady vubec nedelem, je to zbytecne, nacpu ji az primo do inverze}
  loadperiodsbox := TStringList.Create;
  for j := 1 to nflt do begin
    str(loadper[j]: 8: 4, loadperiodstrg);
    loadperiodsbox.Add(loadperiodstrg); {nacpe periody do boxu}
    combobox2.items := loadperiodsbox;  {zobrazi periody v rolete pro vyber}
    combobox3.items := loadperiodsbox;  {zobrazi periody v rolete pro vyber}
  end; {of for :j:}
  ComboBox2.Enabled := True;
  ComboBox3.Enabled := True;
  useloaded := True;
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg +
    ' | - loaded dispersion ready for selecting min and max periods');
  Button11.Enabled := True;
  Button53.Enabled := True;
  if besseltrue then
    Button54.Enabled := True;
  Button55.Enabled := True;
  ComboBox1.Enabled := False;
  Button3.Enabled := False;
  Button5.Enabled := False;
  Button6.Enabled := False;
  Button10.Enabled := False;
  Button14.Enabled := False;
  Button15.Enabled := False;
  Button16.Enabled := False; {sekundarni maxima}
  Button17.Enabled := False; {primarni maxima}
  Button18.Enabled := False;
  Button19.Enabled := False;
  Button20.Enabled := False;
  Button21.Enabled := False;
  Button23.Enabled := False; {otvirani okna inverze}
  Button47.Enabled := False;
  Button2.Enabled := False;
  Edit12.Enabled := False; {startovaci grupova rychlost}
  Edit15.Enabled := False; {startovaci povrchova S-rychlost}
  CheckBox4.Enabled := False; {prepinac low velocity zone}
  Edit17.Enabled := False; {startovaci pomer Pv/Ps}
  Edit18.Enabled := False; {startovaci variace pomeru}
  Edit13.Enabled := False; {krok rychlosti}
  Edit16.Enabled := False; {startovaci povrchova hustota}
  Edit14.Enabled := False; {krok hustoty}
  Edit21.Enabled := False; {range prvni vrstvy}
  CheckBox2.Enabled := False; {prepinac konstantni hustoty}
  RadioGroup1.Enabled := False;
  RadioGroup3.Enabled := False;
  RadioGroup5.Enabled := False;
  RadioGroup6.Enabled := False;
  RadioButton1.Enabled := False;
  RadioButton2.Enabled := False;
  RadioButton3.Enabled := False;
  RadioButton3.Checked := False;
  Button25.Enabled := False;
  Button26.Enabled := False;
  Button27.Enabled := False;
  Button28.Enabled := False;
  Button29.Enabled := False;
  Button33.Enabled := False;
  Button34.Enabled := False;
  Button36.Enabled := False; {terciarni maxima}
  Button37.Enabled := False; {quarterni maxima}
  Button38.Enabled := False;
  Button39.Enabled := False;
  Button40.Enabled := False; {quinterni maxima}
  button50.Enabled := False; {quinterni maxima}
  button51.Enabled := False; {quinterni maxima}
  button52.Enabled := False; {quinterni maxima}
  button53.Enabled := False; {AnSig}
  button55.Enabled := False; {AnSig}
  Button41.Enabled := False;
  Edit1.Text := '00.000';
  inverindexf := 0;
  inverindexl := 0;
end; {konec cpani naloadovane misto namerene}

procedure TNoSVALform.Button33Click(Sender: TObject);
var   {for saving the modelled dispersion curve}
  hoh: integer;
  jmenosouboru: string;
begin
  if batchinver = False then begin {pro rucni ukladani}
    SaveDialog6.Execute;
    if length(SaveDialog6.FileName) < 1 then exit;
    jmenosouboru := SaveDialog6.FileName;
  end;
  if batchinver then begin {pro davkovou inverzi}
    if prumernabatch = False then begin
      if ibp < 10 then begin
        jmenosouboru := '0' + ibpstrg + 'disp';
      end;
      if ibp >= 10 then begin
        jmenosouboru := ibpstrg + 'disp';
      end;
    end;
    if prumernabatch = True then begin
      if (Dinar = false) and (KTB = false) then jmenosouboru := 'batchdisp';
      if (Dinar = true) then jmenosouboru := 'batchdisp/'+nodestrg+'batchdisp'+subarrayname;
      if (KTB = true)   then jmenosouboru := 'batchdisp/'+nodestrg+'batchdisp';
    end;
  end;
  jmenosouboru := jmenosouboru + '.dat';

  if ((Dinar = false) and (KTB = false)) or (((Dinar = true) or (KTB = true)) and (prumernabatch = true)) then begin
    assignfile(modeldisp, jmenosouboru);
    rewrite(modeldisp);
    if usegroup then begin {kdyz to byla grupova ryhlost}
      if ityprl = 0 then begin {pro Rayleigha zvlast}
        //writeln(modeldisp, '      Period   RayGrpVlc   Frequency   RayGrpM/S');
        writeln(modeldisp, '  Period RyGrV');
      end;
      if ityprl = 1 then begin {pro Loveho zvlast}
        writeln(modeldisp, '      Period  LoveGrpVlc   Frequency  LoveGrpM/S');
      end;
      if ityprl = 3 then begin {pro spolecnou ivnerzi}
        writeln(modeldisp, '      Period  LoveGrpVlc   RayGrpVlc   Frequency  LoveGrpM/S   RayGrpM/S');
      end;
    end; {konec hlavicek pro grupovou rychlost}
    if usegroup = False then begin {kfyz to byla fazova ryhlost}
      if ityprl = 0 then begin {pro Rayleigha zvlast}
        //writeln(modeldisp, '      Period   RayPhsVlc   Frequency   RayPhsM/S');
        writeln(modeldisp, '  Period RyPhV');
      end;
      if ityprl = 1 then begin {pro Loveho zvlast}
        //writeln(modeldisp, '      Period  LovePhsVlc   Frequency  LovePhsM/S');
        writeln(modeldisp, '  Period LvPhV');
      end;
      if ityprl = 3 then begin {pro spolecnou ivnerzi}
        writeln(modeldisp, '      Period  LovePhsVlc   RayPhsVlc   Frequency  LovePhsM/S   RayPhsM/S');
      end;
    end; {konec hlavicek pro fazovou rychlost}
    if ((ityprl = 0) or (ityprl = 1)) then begin {pro Loveho nebo Rayleigha zvlast}
      for hoh := 1 to prumnft do begin
        //writeln(modeldisp, prumtperiod[hoh]: 12: 4, prumuvelocity[hoh]: 12: 7, (1 / prumtperiod[hoh]): 12: 5, (prumuvelocity[hoh] * 1000): 12: 4);
        writeln(modeldisp, prumtperiod[hoh]: 8: 3, prumuvelocity[hoh]: 6: 3);
      end;
    end;
    if ityprl = 3 then begin {pro spolecnou ivnerzi}
      for hoh := 1 to prumnft do begin
        writeln(modeldisp, prumtperiod[hoh]: 12: 4, prumuvelocity[hoh]: 12: 4, prumuvelocity2[hoh]: 12: 4, (1 / prumtperiod[hoh]): 12: 5, (prumuvelocity[hoh] * 1000): 12: 4, (prumuvelocity2[hoh] * 1000): 12: 4);
      end;
    end;
    closefile(modeldisp);
  end;  {if Dinar = false or prumernabatch = true}
end; {teoreticka disperzni krivka ulozena}

procedure TNoSVALform.Button22Click(Sender: TObject);
var {natahuje soubor s vrstvama}
  i, h             : integer;
  numoflaystrg     : string;
  hhalfspacestrg   : string;
  hloubka          : double;
  Bdinar1strg      : string;
  chciWaves        : word;
begin
  hhalfspace := 0.0;
  hlayers := 0;
  for i := 1 to 30 do begin
    DD[i] := 0.0; {vynuluju tloustky vrstev}
  end;
  PlotPanel4.ClearData;
  OpenDialog3.Execute;
  if length(OpenDialog3.FileName) < 1 then exit;
  part2 := '          Layers file:  ' + OpenDialog3.FileName;
  NoSVALform.Caption := part1 + part2 + refcaption;  {co analyzujeme nebo co jsme naloadovali a jaky je layers file}
  assignfile(layers, OpenDialog3.FileName);
  reset(layers);
  readln(layers, numoflay); {nacte z prvni radky pocet vrstev bez poloprostoru}
  str(numoflay, numoflaystrg);
  memo1.Lines.Add('------------------------------------------------------------------------');
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - number of layers is ' + numoflaystrg);
  hloubka := 0;
  for i := 1 to numoflay do begin
    if (Dinar = false) and (KTB = false) then begin
      readln(layers, DD[i]); {nacte tloustky vrstev}
    end;
    if (Dinar = true) or (KTB = true) then begin
      readln(layers, DD[i], Bdinar[i]); {nacte tloustky vrstev a startovaci rychlosti S-vln}
    end;
    hhalfspace := hhalfspace + DD[i];
    midD[i] := hloubka + DD[i]/2;    {spoctu hloubky stredu vrstev - predchozi hloubka plus pulka nove vrstvy}
    hloubka := hloubka + DD[i];      {a zvestim si hloubku}
  end; {for i}
  if (Dinar = true) or (KTB = true) then begin
    readln(layers, Bdinar[numoflay+1]); {nacte startovaci hodnotu pro poloprostor}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - DEEP / KTB format including the starting model is used');
    str(Bdinar[1]:6:4, Bdinar1strg); {S wave v prvni vrstve}
    edit15.Text := Bdinar1strg;
  end;
  midD[numoflay+1] := hhalfspace + DD[numoflay]; {pro poloprostor zvolim stredni hloubku o tu posledni vrstvu nize}
  closefile(layers);
  str(hhalfspace: 7: 3, hhalfspacestrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - halfspace begins in the depth of ' + hhalfspacestrg + ' km');
  if (Dinar = false) and (KTB = false) then begin
    RadioButton2.Checked := False;  {odskrtnu rozliseni Rayleigh X Love, aby se to muselo zmacknout znova}
  end;

  if (Dinar = true) or (KTB = true) then begin
    chciWaves := QuestionDlg(' ','Select Rayleigh or Love', mtConfirmation, [mrOK, 'Rayleigh', mrYes, 'Love'], 0);
    if chciWaves = mrOK then begin
      RadioButton2.Checked := true;   {zaskrtnu, ze chci Rayleigha, a to spusti i procedurku, kde se nastavuji dalsi veci}
      memo1.Lines.Add(radekstrg + ' | Rayleigh waves selected');
    end;
    if chciWaves = mrYes then begin
      RadioButton1.Checked := true;   {zaskrtnu, ze chci Love, a to spusti i procedurku, kde se nastavuji dalsi veci}
      memo1.Lines.Add(radekstrg + ' | Love waves selected');
    end;
  end;

  //RadioButton1.Checked := False;  {odskrtnu rozliseni Rayleigh X Love, aby se to muselo zmacknout znova}
  RadioButton3.Checked := False;  {a nastavily se tak pripadne nove pocty hledanych vrstev}

  if (Dinar = false) and (KTB = false) then ityprl := 2; {jakoze neni znamy typ vln}
  {nastaveni hranic pro vykreslovani strukturniho modelu}
  PlotPanel4.Xmin := 1.5;
  PlotPanel4.Xmax := 7.5;
  PlotPanel4.XInterval := 0.5;
  PlotPanel4.Ymax := 0.0;
  PlotPanel4.Ymin := ((-hhalfspace * 0.25) - hhalfspace);
  hloubkykrok := -PlotPanel4.Ymin / 400; {pro kresleni strukturnich rezu}
  if DD[1] < 0.01 then begin {pokud je prvni vrstva hodne tenka, zameri se to rovnou na nizsi rychlosti}
    PlotPanel4.Xmin := 0.0;
    PlotPanel4.Xmax := 4.0;
    PlotPanel4.YInterval := 0.01;
  end;
  if PlotPanel4.Ymin < -0.00 then PlotPanel4.YInterval := 0.001;
  if PlotPanel4.Ymin < -0.01 then PlotPanel4.YInterval := 0.002;
  if PlotPanel4.Ymin < -0.02 then PlotPanel4.YInterval := 0.004;
  if PlotPanel4.Ymin < -0.05 then PlotPanel4.YInterval := 0.010;
  if PlotPanel4.Ymin < -0.10 then PlotPanel4.YInterval := 0.020;
  if PlotPanel4.Ymin < -0.20 then PlotPanel4.YInterval := 0.040;
  if PlotPanel4.Ymin < -0.50 then PlotPanel4.YInterval := 0.100;
  if PlotPanel4.Ymin < -1.00 then PlotPanel4.YInterval := 0.200;
  if PlotPanel4.Ymin < -2.00 then PlotPanel4.YInterval := 0.400;
  if PlotPanel4.Ymin < -5.00 then PlotPanel4.YInterval := 1.000;
  if PlotPanel4.Ymin < -10.0 then PlotPanel4.YInterval := 2.000;
  if PlotPanel4.Ymin < -20.0 then PlotPanel4.YInterval := 4.000;
  if PlotPanel4.Ymin < -50.0 then PlotPanel4.YInterval := 10;
  if PlotPanel4.Ymin < -100 then PlotPanel4.YInterval := 20;
  if PlotPanel4.Ymin < -200 then PlotPanel4.YInterval := 40;
  if PlotPanel4.Ymin < -500 then PlotPanel4.YInterval := 100;
  PlotPanel4.XMarks := True;
  PlotPanel4.YMarks := True;
  lay := lay + 1;
  with PlotPanel4 do begin
    LayerOptions(lay, pmLine, 2);
  end;
  for h := 1 to numoflay do begin
    lay := lay + 1;
    hlayers := hlayers + DD[h];
    PlotPanel4.AddXY(0.0, -hlayers, clWhite, lay);
    PlotPanel4.AddXY(20.0, -hlayers, clWhite, lay);
  end;
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
  layload := True;
  Button42.Enabled := True;
  Button43.Enabled := True;
  Button44.Enabled := True;
  Button45.Enabled := True;
  Button35.Enabled := True;
  Button48.Enabled := True;
  PlotPanel4.Enabled := True;
  if ((inverindexf <> 0) and (inverindexl <> 0)) then begin {tedy pokud mam vybrane obe hranice period range}
    Button23.Enabled := True;                               { Inversion }
    if (Dinar = false) and (KTB = false) then begin
      RadioGroup1.Enabled := True;                            {dovoluju vybrat typ vln}
      RadioButton1.Enabled := True;                           {Love}
      RadioButton2.Enabled := True;                           {Rayleigh}
    end;
    zarad := False;
    if joint then begin
      RadioButton3.Enabled := True;                         {Joint}
      RadioButton3.Checked := True;                         {Joint}
    end;
    zarad := True;
    if (Dinar = false) and (KTB = false) then begin
      RadioGroup6.Enabled := True;                            {velocity Phase / Group}
      RadioGroup3.Enabled := True;
    end;
  end; {if mam vybrany range}
end; {konec natahovani souboru s vrstvama}

procedure TNoSVALform.RadioGroup2Click(Sender: TObject);
begin {vybiram mezi A, L a O - jak se bude skladat vysledna disperzni krivka}
  memo1.Lines.Add('------------------------------------------------------------------------');
  if RadioGroup2.ItemIndex = 0 then
  begin {tedy je zaskrtnuto A}
    skladej := 1;   {zvoleno skladani od absolutniho maxima celeho spektrogramu}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg +
      ' | - dispersion will be compiled according to the highest spectrogram maximum');
    Edit27.Enabled := False;
  end;
  if RadioGroup2.ItemIndex = 1 then
  begin {tedy je zaskrtnuto L}
    skladej := 2;   {zvoleno skladani od nejdelsiho filtru spektrogramu}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg +
      ' | - dispersion will be compiled according to the longest filter maximum');
    Edit27.Enabled := False;
  end;
  if RadioGroup2.ItemIndex = 2 then
  begin {tedy je zaskrtnuto O jako Optimal}
    skladej := 3;   {zvoleno skladani od zvoleneho filtru spektrogramu}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg +
      ' | - dispersion will be compiled according to the selected filter maximum');
    Edit27.Enabled := True;
  end;
end; {zvolen zpusob skladani vysledne disperzni krivky}

procedure TNoSVALform.UpDown1ChangingEx(Sender: TObject; var AllowChange: boolean; NewValue: smallint; Direction: TUpDownDirection);
begin
  case Direction of
    updUp:
    begin
      if ((nsampl <> 0) and (kresgrveli[1] <> 0)) then
      begin
        Ukazrychlosti;
      end;
      PlotPanel2.Ymin := PlotPanel2.Ymin * 0.9;
      PlotPanel2.Ymax := PlotPanel2.Ymax * 0.9;
    end;
    updDown:
    begin
      if ((nsampl <> 0) and (kresgrveli[1] <> 0)) then
      begin
        Ukazrychlosti;
      end;
      PlotPanel2.Ymin := PlotPanel2.Ymin * 1.1;
      PlotPanel2.Ymax := PlotPanel2.Ymax * 1.1;
    end;
  end; {of case}
end; {of procedure na zmenu amplitudy seismogramu}

procedure TNoSVALform.UpDown2ChangingEx(Sender: TObject; var AllowChange: boolean; NewValue: smallint; Direction: TUpDownDirection);
begin
  case Direction of
    updUp:
    begin
      PlotPanel1.Ymin := PlotPanel1.Ymin * 0.9;
      PlotPanel1.Ymax := PlotPanel1.Ymax * 0.9;
      if index <> 0 then
      begin
        Posunnapisu(Sender);
        if (nasilne and truncx) then
        begin
          label36.Visible := True; {fixed}
          label36.BringToFront;    {fixed}
          label37.Visible := True; {fixed}
          label37.BringToFront;    {fixed}
          label38.Visible := True; {fixed}
          label38.BringToFront;    {fixed}
        end;
        if (nasilne = False or truncx = False) then
        begin
          label36.Visible := False;{fixed}
          label37.Visible := False;{fixed}
          label38.Visible := False;{fixed}
        end;
      end; {if index}
    end; {updUP}
    updDown:
    begin
      PlotPanel1.Ymin := PlotPanel1.Ymin * 1.1;
      PlotPanel1.Ymax := PlotPanel1.Ymax * 1.1;
      if index <> 0 then
      begin
        Posunnapisu(Sender);
        if (nasilne and truncx) then
        begin
          label36.Visible := True; {fixed}
          label36.BringToFront;    {fixed}
          label37.Visible := True; {fixed}
          label37.BringToFront;    {fixed}
          label38.Visible := True; {fixed}
          label38.BringToFront;    {fixed}
        end;
        if (nasilne = False or truncx = False) then
        begin
          label36.Visible := False;{fixed}
          label37.Visible := False;{fixed}
          label38.Visible := False;{fixed}
        end;
      end; {if index}
    end; {updDown}
  end; {of case}
end; {konec procedury na zmenu amplitudy v hornim PlotPanelu - monochromaticke signaly}

procedure TNoSVALform.Button45Click(Sender: TObject);
begin {diva se na mensi rozsah rychlosti}
  if PlotPanel4.Xmin > 0.0 then
  begin
    PlotPanel4.Xmin := PlotPanel4.Xmin - 0.25;
  end;
  PlotPanel4.Xmax := PlotPanel4.Xmax + 0.25;
  hlayers := 0.0;
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then
    label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
end;

procedure TNoSVALform.Button44Click(Sender: TObject);
begin {diva se na vetsi rozsah rychlosti}
  if (PlotPanel4.Xmax - PlotPanel4.Xmin) <= 1 then begin
    exit;
  end;
  PlotPanel4.Xmin := PlotPanel4.Xmin + 0.25;
  PlotPanel4.Xmax := PlotPanel4.Xmax - 0.25;
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
end;

procedure TNoSVALform.Button42Click(Sender: TObject);
begin {posouva pohled strukturniho okna doleva}
  if PlotPanel4.Xmin > 0.0 then begin
    PlotPanel4.Xmin := PlotPanel4.Xmin - 0.25;
    PlotPanel4.Xmax := PlotPanel4.Xmax - 0.25;
  end;
  hlayers := 0.0;
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
end;

procedure TNoSVALform.Button43Click(Sender: TObject);
begin {posouva pohled strukturniho okna doprava}
  PlotPanel4.Xmin := PlotPanel4.Xmin + 0.25;
  PlotPanel4.Xmax := PlotPanel4.Xmax + 0.25;
  hlayers := 0.0;
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then
    label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
end;

procedure TNoSVALform.Button41Click(Sender: TObject);
begin {zoom out == zoomuje na puvodni velikost okno spektrogramu}
  if useloaded = False then begin {delam to pro analyzu}
    PlotPanel3.Xmin := (instper[1, locmx[1]]);
    if PlotPanel3.XMin <= 0 then PlotPanel3.XMin := 0;
    PlotPanel3.Xmax := (instper[nflt, locmx[nflt]]) * 1.15;
    PlotPanel3.XInterval := (PlotPanel3.XMax - PlotPanel3.Xmin) / 6;
    PlotPanel3.Xmin := (instper[1, locmx[1]]) - (PlotPanel3.XInterval) / 4;
    original01 := PlotPanel3.XInterval;
    if ((PlotPanel3.XInterval <= 100.0) and (PlotPanel3.XInterval > 10.0)) then PlotPanel3.XInterval := 10.0
    else if ((PlotPanel3.XInterval <= 10.00) and (PlotPanel3.XInterval > 1.00)) then PlotPanel3.XInterval := 1.0
    else if ((PlotPanel3.XInterval <= 1.000) and (PlotPanel3.XInterval > 0.10)) then PlotPanel3.XInterval := 0.1
    else if ((PlotPanel3.XInterval <= 0.100) and (PlotPanel3.XInterval > 0.01)) then PlotPanel3.XInterval := 0.01
    else if (PlotPanel3.XInterval <= 0.01) then PlotPanel3.XInterval := 0.001;
    if PlotPanel3.XInterval <= original01 then PlotPanel3.XInterval := PlotPanel3.XInterval * (trunc(original01 / PlotPanel3.XInterval));
    PlotPanel3.XMarks := True;
    PlotPanel3.Ymin := grvel[nsampl];
    PlotPanel3.Ymax := grvel[1];
    PlotPanel3.YInterval := (PlotPanel3.Ymax - PlotPanel3.Ymin) / 6;
    original02 := PlotPanel3.YInterval;
    PlotPanel3.Ymin := grvel[nsampl] - ((grvel[1] - grvel[nsampl]) / 12);
    PlotPanel3.Ymax := grvel[1] + ((grvel[1] - grvel[nsampl]) / 12);
    if ((PlotPanel3.YInterval <= 100.0) and (PlotPanel3.YInterval > 10.0)) then PlotPanel3.YInterval := 10.0
    else if ((PlotPanel3.YInterval <= 10.00) and (PlotPanel3.YInterval > 1.00)) then PlotPanel3.YInterval := 1.0
    else if ((PlotPanel3.YInterval <= 1.000) and (PlotPanel3.YInterval > 0.10)) then PlotPanel3.YInterval := 0.1
    else if ((PlotPanel3.YInterval <= 0.100) and (PlotPanel3.YInterval > 0.01)) then PlotPanel3.YInterval := 0.01
    else if (PlotPanel3.YInterval <= 0.01) then PlotPanel3.YInterval := 0.001;
    if PlotPanel3.YInterval <= original02 then PlotPanel3.YInterval := PlotPanel3.YInterval * (trunc(original02 / PlotPanel3.YInterval));
    PlotPanel3.YMarks := True;
    label15.BringToFront;
    label17.Visible := True;
    label17.BringToFront;
  end; {if pro analyzovanou disperzi}
  if useloaded then begin {pokud to delam pro naloadovanou disperzi, jedu tudy}
    PlotPanel3.Xmin := minjointload;
    if PlotPanel3.XMin <= 0 then  PlotPanel3.XMin := 0;
    PlotPanel3.Xmax := maxjointload * 1.15;
    PlotPanel3.XInterval := (PlotPanel3.XMax - PlotPanel3.Xmin) / 6;
    PlotPanel3.Xmin := (minjointload) - (PlotPanel3.XInterval) / 4;
    original01 := PlotPanel3.XInterval;
    if ((PlotPanel3.XInterval <= 100.0) and (PlotPanel3.XInterval > 10.0)) then PlotPanel3.XInterval := 10.0
    else if ((PlotPanel3.XInterval <= 10.00) and (PlotPanel3.XInterval > 1.00)) then PlotPanel3.XInterval := 1.0
    else if ((PlotPanel3.XInterval <= 1.000) and (PlotPanel3.XInterval > 0.10)) then PlotPanel3.XInterval := 0.1
    else if ((PlotPanel3.XInterval <= 0.100) and (PlotPanel3.XInterval > 0.01)) then PlotPanel3.XInterval := 0.01
    else if (PlotPanel3.XInterval <= 0.01) then PlotPanel3.XInterval := 0.001;
    if PlotPanel3.XInterval <= original01 then PlotPanel3.XInterval := PlotPanel3.XInterval * (trunc(original01 / PlotPanel3.XInterval));
    PlotPanel3.XMarks := True;
    PlotPanel3.Ymin := loadgrvelmin;
    PlotPanel3.Ymax := loadgrvelmax;
    PlotPanel3.YInterval := (PlotPanel3.Ymax - PlotPanel3.Ymin) / 6;
    original02 := PlotPanel3.YInterval;
    PlotPanel3.Ymin := loadgrvelmin - (PlotPanel3.YInterval) / 4;
    PlotPanel3.Ymax := loadgrvelmax + (PlotPanel3.YInterval) / 4;
    if ((PlotPanel3.YInterval <= 100.0) and (PlotPanel3.YInterval > 10.0)) then PlotPanel3.YInterval := 10.0
    else if ((PlotPanel3.YInterval <= 10.00) and (PlotPanel3.YInterval > 1.00)) then PlotPanel3.YInterval := 1.0
    else if ((PlotPanel3.YInterval <= 1.000) and (PlotPanel3.YInterval > 0.10)) then PlotPanel3.YInterval := 0.1
    else if ((PlotPanel3.YInterval <= 0.100) and (PlotPanel3.YInterval > 0.01)) then PlotPanel3.YInterval := 0.01
    else if (PlotPanel3.YInterval <= 0.01) then PlotPanel3.YInterval := 0.001;
    if PlotPanel3.YInterval <= original02 then PlotPanel3.YInterval := PlotPanel3.YInterval * (trunc(original02 / PlotPanel3.YInterval));
    PlotPanel3.YMarks := True;    {konec nastavovani mezi plotpanelu podle naloadovane disperze}
  end; {if pro naloadovanou disperzi}
end; {konec zoomovani okna spektrogramu na jeho puvodni velikost}

procedure TNoSVALform.Button46Click(Sender: TObject);
var   {maluje rozlozeni alfy}
  cita: integer;
  perkrok: double;
begin
  alphadirstrg := edit10.Text;
  val(alphadirstrg, alphadir, cd);
  if alphadir >= 0 then
  begin
    ShowMessage('The slope of the ALPHA coefficient must be negative!');
    exit;
  end;
  alphaabsstrg := edit11.Text;
  val(alphaabsstrg, alphaabs, cd);
  perminstrg := edit6.Text;
  val(perminstrg, permin, cd);     {minimal period to be computed}
  permaxstrg := edit7.Text;
  val(permaxstrg, permax, cd);     {maximal period to be computed}
  PlotPanel3.Xmin := (permin);
  if PlotPanel3.XMin <= 0 then
    PlotPanel3.XMin := 0;
  PlotPanel3.Xmax := permax * 1.05;
  PlotPanel3.XInterval := (PlotPanel3.XMax - PlotPanel3.Xmin) / 6;
  PlotPanel3.Xmin := (permin) - (PlotPanel3.XInterval) / 4;
  original01 := PlotPanel3.XInterval;
  if ((PlotPanel3.XInterval <= 100.0) and (PlotPanel3.XInterval > 10.0)) then
    PlotPanel3.XInterval := 10.0
  else if ((PlotPanel3.XInterval <= 10.00) and (PlotPanel3.XInterval > 1.00)) then
    PlotPanel3.XInterval := 1.0
  else if ((PlotPanel3.XInterval <= 1.000) and (PlotPanel3.XInterval > 0.10)) then
    PlotPanel3.XInterval := 0.1
  else if ((PlotPanel3.XInterval <= 0.100) and (PlotPanel3.XInterval > 0.01)) then
    PlotPanel3.XInterval := 0.01
  else if (PlotPanel3.XInterval <= 0.01) then
    PlotPanel3.XInterval := 0.001;
  if PlotPanel3.XInterval <= original01 then
    PlotPanel3.XInterval := PlotPanel3.XInterval * (trunc(original01 / PlotPanel3.XInterval));
  PlotPanel3.XMarks := True;
  PlotPanel3.Ymin := 0.0;
  PlotPanel3.Ymax := alphaabs;
  PlotPanel3.YInterval := (PlotPanel3.Ymax - PlotPanel3.Ymin) / 6;
  original02 := PlotPanel3.YInterval;
  if ((PlotPanel3.YInterval <= 1000.00) and (PlotPanel3.YInterval > 100.000)) then
    PlotPanel3.YInterval := 100.00
  else if ((PlotPanel3.YInterval <= 100.00) and (PlotPanel3.YInterval > 10.000)) then
    PlotPanel3.YInterval := 10.00
  else if ((PlotPanel3.YInterval <= 10.00) and (PlotPanel3.YInterval > 1.000)) then
    PlotPanel3.YInterval := 1.00
  else if ((PlotPanel3.YInterval <= 1.00) and (PlotPanel3.YInterval > 0.100)) then
    PlotPanel3.YInterval := 0.10
  else if ((PlotPanel3.YInterval <= 0.10) and (PlotPanel3.YInterval > 0.010)) then
    PlotPanel3.YInterval := 0.01
  else if (PlotPanel3.YInterval <= 0.01) then
    PlotPanel3.YInterval := 0.001;
  if PlotPanel3.YInterval <= original02 then
    PlotPanel3.YInterval := PlotPanel3.YInterval * (trunc(original02 / PlotPanel3.YInterval));
  PlotPanel3.YMarks := True;         {to jen nastavovalo plotpanel}
  pp3 := pp3 + 1;
  with PlotPanel3 do
  begin
    LayerOptions(pp3, pmLine, 5{tloustka cary});
  end;
  perkrok := ((permax - permin) / maxnflt);
  for cita := 1 to maxnflt do
  begin
    alpha[cita] := alphaabs + (alphadir * (permin + (cita * perkrok)));
    if alphacheck = False then
    begin
      if (alpha[cita] < 0.00001) then
      begin
        alpha[cita] := 0.00001;
      end;
    end;
    if alphacheck = True then
    begin
      if (alpha[cita] < 7) then
      begin
        alpha[cita] := 7;
      end;
    end;
    PlotPanel3.AddXY(permin + (cita * perkrok), alpha[cita], clyellow, pp3);
  end;
  label15.BringToFront;
  label17.Visible := False;
  label31.Visible := True;
  label31.BringToFront;
end; {konec malovani rozlozeni alfy}

procedure TNoSVALform.RadioGroup4Click(Sender: TObject);
begin {vybiram mezi vsemi maximy a jenom opravdickymi}
  memo1.Lines.Add('------------------------------------------------------------------------');
  if RadioGroup4.ItemIndex = 0 then
  begin
    allbods := True; {budu delat vsechny maxima i inflexe}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg +
      ' | - both real maxima and infection points will be considered');
  end;
  if RadioGroup4.ItemIndex = 1 then
  begin
    allbods := False; {budu delat jenom opravdicka maxima}
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg +
      ' | - only real maxima (no inflection points) will be considered');
  end;
end; {vybrano, zda udelam vsechna maxima nebo jenom opravdicka}

procedure TNoSVALform.RadioGroup8Click(Sender: TObject);
begin {vybiram, jestli budu zadavat rychlost nebo cas}
  memo1.Lines.Add('------------------------------------------------------------------------');
  if RadioGroup8.ItemIndex = 0 then begin {rychlost nebo datum}
    if hydro = False then begin
      rozmezivel := True;
      Label1.Caption := 'Max gr vel';
      Label2.Caption := 'Min gr vel';
      Label1.Left := 61;
      Label2.Left := 64;
      Edit4.Text := '6.0';
      Edit5.Text := '2.5';
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - time window by velocity range');
    end;
    if hydro = True then begin
      rozmezivel := False;
      hydrovel := True;
      Label1.Caption := 'EndDt';
      Label2.Caption := 'StrDt';
      Label1.Left := 61;
      Label2.Left := 61;
      Edit5.Visible := False; {neni videt zadavani casu/rychlosti}
      Edit4.Visible := False; {neni videt zadavani casu/rychlosti}
      MaskEdit2.Visible := True;  {je videt zadavani datumu pro rozmezi - zacatek}
      MaskEdit3.Visible := True;  {je videt zadavani datumu pro rozmeni - konec}
      Edit4.Text := '';
      Edit5.Text := '';
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - time window by dates');
    end;
  end;
  if RadioGroup8.ItemIndex = 1 then begin {cas}
    rozmezivel := False;
    hydrovel := False;
    Label1.Caption := 'Max gr time';
    Label2.Caption := 'Min gr time';
    Label1.Left := 61;
    Label2.Left := 64;
    Edit5.Visible := True;      {je videt zadavani casu/rychlosti}
    Edit4.Visible := True;      {je videt zadavani casu/rychlosti}
    MaskEdit2.Visible := False;     {neni videt zadavani datumu pro zacatek rozmezi}
    MaskEdit3.Visible := False;     {neni videt zadavani datumu pro konec rozmezi}
    Edit4.Text := '';
    Edit5.Text := '';
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - time window by time range');
  end;
end; {vybrano, jestli zadavam rychlost nebo cas nebo datumy}

procedure TNoSVALform.PlotPanel3MouseMove(Sender: TObject; Shift: TShiftState; xx, yy: integer);
var {vypisuje souradnice do PlotPanelu3}
  Test: boolean;
begin
  Test := PlotPanel3.ConvertS2W(xx, yy, WX, WY);
  if Test = False then
  begin
    Label21.Visible := False;
    Label32.Visible := False;
    Label57.Visible := False;
  end
  else
  begin
    Label21.Visible := True;
    Label32.Visible := True;
    Label57.Visible := True;
  end;
  Label21.Caption := '  period = ' + FloatToStrF(WX, ffFixed, 5, 2) + ' s';
  Label32.Caption := 'velocity = ' + FloatToStrF(WY, ffFixed, 5, 2) + ' km/s';
  Label57.Caption := '      time = ' + FloatToStrF(distkm / WY, ffFixed, 5, 2) + ' s';
end; {konec vypisovani souradnic do PlotPanelu}

procedure TNoSVALform.PlotPanel3Click(Sender: TObject);
var
  jx, p, j: integer;
  klikperiodastrg: string;
  klikrychloststrg: string;
  clickindexstrg: string;
  whatorderstrg: string;
  actminpervel: double; {aktualni nejmensi vzdalenost klikance a nejakeho bodu}
begin {uklada si hodnoty disperznich bodu, na ktere jsem kliknul v spektrogramovem plotpanelu}
  {predpoklada se, ze sem vstupuji hodnoty WX a WY, ktere se zjistuji v procedure vyse, jak pohybuji s mysi}
  {zjistim, jestli v blizkosti klinuti je nejaky bod - pro vsechny filtry a vsech pet stupnu maxim}
  nasel := False;
  Timer2.Enabled := False; {zrusim blikani vybraneho bodiku}
  memo1.Lines.Add('------------------------------------------------------------------------');
  if grupka then
  begin {pokud jsem naposledy maloval grupovou rychlost}
    PlotPanel3.HideLayer(clicks);
    with PlotPanel3 do
    begin
      LayerOptions(clicks, pmDot, 5);
    end;
    PlotPanel3.AddXY(minclickedper, minclickedvel, RGB(255, 131, 255), clicks);
    Label21.Visible := True;
    Label32.Visible := True;
    Label57.Visible := True;
    for jx := 1 to nflt do
    begin
      clickedper1[jx] := 0;
      clickedvel1[jx] := 0;
      clickedper2[jx] := 0;
      clickedvel2[jx] := 0;
      clickedper3[jx] := 0;
      clickedvel3[jx] := 0;
      clickedper4[jx] := 0;
      clickedvel4[jx] := 0;
      clickedper5[jx] := 0;
      clickedvel5[jx] := 0;
      clickedper6[jx] := 0;
      clickedvel6[jx] := 0;
      clickedper7[jx] := 0;
      clickedvel7[jx] := 0;
      clickedper8[jx] := 0;
      clickedvel8[jx] := 0;
    end;
    minclickedper := 0; {vysledna hodnota bodu nejblize klikanci}
    minclickedvel := 0; {vysledna hodnota bodu nejblize klikanci}
    actminpervel := 100;
    {podle aktualne kliknute hodnoty WX musim zjistit, jaka je asi vzdalenost bodu disperzni krivky v okoli tohoto bodu a nastavit}
    {klikaci parametr trosku mensi}

    for jx := 1 to nflt do
    begin {kdyz kliknu na nejake maximum}
      {primarni}
      if (((WX - 0.20) <= instper[jx, max1locmx[jx]]) and
        ((WX + 0.20) >= instper[jx, max1locmx[jx]]) and ((WY - 0.02) <=
        grvel[max1locmx[jx]]) and ((WY + 0.02) >= grvel[max1locmx[jx]])) then
      begin
        nasel := True;
        clickedper1[jx] := instper[jx, max1locmx[jx]];
        clickedvel1[jx] := grvel[max1locmx[jx]];
      end;{if}
      {sekundarni}
      if max2locmx[jx] <> 0 then
      begin
        if (((WX - 0.20) <= instper[jx, max2locmx[jx]]) and
          ((WX + 0.20) >= instper[jx, max2locmx[jx]]) and ((WY - 0.02) <=
          grvel[max2locmx[jx]]) and ((WY + 0.02) >= grvel[max2locmx[jx]])) then
        begin
          nasel := True;
          clickedper2[jx] := instper[jx, max2locmx[jx]];
          clickedvel2[jx] := grvel[max2locmx[jx]];
        end;{if}
      end;{if}
      {tercierni}
      if max3locmx[jx] <> 0 then
      begin
        if (((WX - 0.20) <= instper[jx, max3locmx[jx]]) and
          ((WX + 0.20) >= instper[jx, max3locmx[jx]]) and ((WY - 0.02) <=
          grvel[max3locmx[jx]]) and ((WY + 0.02) >= grvel[max3locmx[jx]])) then
        begin
          nasel := True;
          clickedper3[jx] := instper[jx, max3locmx[jx]];
          clickedvel3[jx] := grvel[max3locmx[jx]];
        end;{if}
      end;{if}
      {quarterni}
      if max4locmx[jx] <> 0 then
      begin
        if (((WX - 0.20) <= instper[jx, max4locmx[jx]]) and
          ((WX + 0.20) >= instper[jx, max4locmx[jx]]) and ((WY - 0.02) <=
          grvel[max4locmx[jx]]) and ((WY + 0.02) >= grvel[max4locmx[jx]])) then
        begin
          nasel := True;
          clickedper4[jx] := instper[jx, max4locmx[jx]];
          clickedvel4[jx] := grvel[max4locmx[jx]];
        end;{if}
      end;{if}
      {quinterni}
      if max5locmx[jx] <> 0 then
      begin
        if (((WX - 0.20) <= instper[jx, max5locmx[jx]]) and
          ((WX + 0.20) >= instper[jx, max5locmx[jx]]) and ((WY - 0.02) <=
          grvel[max5locmx[jx]]) and ((WY + 0.02) >= grvel[max5locmx[jx]])) then
        begin
          nasel := True;
          clickedper5[jx] := instper[jx, max5locmx[jx]];
          clickedvel5[jx] := grvel[max5locmx[jx]];
        end;{if}
      end;{if}
      {seste}
      if max6locmx[jx] <> 0 then
      begin
        if (((WX - 0.20) <= instper[jx, max6locmx[jx]]) and
          ((WX + 0.20) >= instper[jx, max6locmx[jx]]) and ((WY - 0.02) <=
          grvel[max6locmx[jx]]) and ((WY + 0.02) >= grvel[max6locmx[jx]])) then
        begin
          nasel := True;
          clickedper6[jx] := instper[jx, max6locmx[jx]];
          clickedvel6[jx] := grvel[max6locmx[jx]];
        end;{if}
      end;{if}
      {sedme}
      if max7locmx[jx] <> 0 then
      begin
        if (((WX - 0.20) <= instper[jx, max7locmx[jx]]) and
          ((WX + 0.20) >= instper[jx, max7locmx[jx]]) and ((WY - 0.02) <=
          grvel[max7locmx[jx]]) and ((WY + 0.02) >= grvel[max7locmx[jx]])) then
        begin
          nasel := True;
          clickedper7[jx] := instper[jx, max7locmx[jx]];
          clickedvel7[jx] := grvel[max7locmx[jx]];
        end;{if}
      end;{if}
      {osme}
      if max8locmx[jx] <> 0 then
      begin
        if (((WX - 0.20) <= instper[jx, max8locmx[jx]]) and
          ((WX + 0.20) >= instper[jx, max8locmx[jx]]) and ((WY - 0.02) <=
          grvel[max8locmx[jx]]) and ((WY + 0.02) >= grvel[max8locmx[jx]])) then
        begin
          nasel := True;
          clickedper8[jx] := instper[jx, max8locmx[jx]];
          clickedvel8[jx] := grvel[max8locmx[jx]];
        end;{if}
      end;{if}
    end;  {for jx - konec cyklu pro kazdy filtr}

    for jx := 1 to nflt do
    begin {hledam minimalni vzdalenost od klikance a tim vybiram, ktery z tech peti to je}
      {pro jakekoli :jx: (tedy filtr) a pro kterekoli z peti maxim se vzdycky zjisti vzdalenost}
      {od klikance a je-li mensi nez nejaka drive nalezena, prepise se nekolik velicin a hlavne string :whatoredrstrg:}
      {pomoci ktereho se pak v dalsim kole priradi kliknuty bod do puvodni disperzni krivky}
      {primarni}
      if ((sqrt(power((clickedper1[jx] - WX), 2) + power((clickedvel1[jx] - WY), 2)) <
        actminpervel) and (clickedper1[jx] > 0) and
        (clickedvel1[jx] > 0)) then
      begin
        minclickedper := clickedper1[jx];
        clickindex := jx;
        whatorderstrg := 'primary';
        actminpervel := sqrt(power((clickedper1[jx] - WX), 2) + power(
          (clickedvel1[jx] - WY), 2));
        nahrada := True;
        nahrada2 := True;
        minclickedvel := clickedvel1[jx];
      end;
      {sekundarni}
      if ((sqrt(power((clickedper2[jx] - WX), 2) + power((clickedvel2[jx] - WY), 2)) <
        actminpervel) and (clickedper2[jx] > 0) and
        (clickedvel2[jx] > 0)) then
      begin
        minclickedper := clickedper2[jx];
        clickindex := jx;
        whatorderstrg := 'secondary';
        actminpervel := sqrt(power((clickedper2[jx] - WX), 2) + power(
          (clickedvel2[jx] - WY), 2));
        nahrada := True;
        nahrada2 := True;
        minclickedvel := clickedvel2[jx];
      end;
      {tercierni}
      if ((sqrt(power((clickedper3[jx] - WX), 2) + power((clickedvel3[jx] - WY), 2)) <
        actminpervel) and (clickedper3[jx] > 0) and
        (clickedvel3[jx] > 0)) then
      begin
        minclickedper := clickedper3[jx];
        clickindex := jx;
        whatorderstrg := 'tertiary';
        actminpervel := sqrt(power((clickedper3[jx] - WX), 2) + power(
          (clickedvel3[jx] - WY), 2));
        nahrada := True;
        nahrada2 := True;
        minclickedvel := clickedvel3[jx];
      end;
      {quarterni}
      if ((sqrt(power((clickedper4[jx] - WX), 2) + power((clickedvel4[jx] - WY), 2)) <
        actminpervel) and (clickedper4[jx] > 0) and
        (clickedvel4[jx] > 0)) then
      begin
        minclickedper := clickedper4[jx];
        clickindex := jx;
        whatorderstrg := 'quarternary';
        actminpervel := sqrt(power((clickedper4[jx] - WX), 2) + power(
          (clickedvel4[jx] - WY), 2));
        nahrada := True;
        nahrada2 := True;
        minclickedvel := clickedvel4[jx];
      end;
      {quinterni}
      if ((sqrt(power((clickedper5[jx] - WX), 2) + power((clickedvel5[jx] - WY), 2)) <
        actminpervel) and (clickedper5[jx] > 0) and
        (clickedvel5[jx] > 0)) then
      begin
        minclickedper := clickedper5[jx];
        clickindex := jx;
        whatorderstrg := 'quinternary';
        actminpervel := sqrt(power((clickedper5[jx] - WX), 2) + power(
          (clickedvel5[jx] - WY), 2));
        nahrada := True;
        nahrada2 := True;
        minclickedvel := clickedvel5[jx];
      end;
      {seste}
      if ((sqrt(power((clickedper6[jx] - WX), 2) + power((clickedvel6[jx] - WY), 2)) <
        actminpervel) and (clickedper6[jx] > 0) and
        (clickedvel6[jx] > 0)) then
      begin
        minclickedper := clickedper6[jx];
        clickindex := jx;
        whatorderstrg := 'sixth';
        actminpervel := sqrt(power((clickedper6[jx] - WX), 2) + power(
          (clickedvel6[jx] - WY), 2));
        nahrada := True;
        nahrada2 := True;
        minclickedvel := clickedvel6[jx];
      end;
      {sedme}
      if ((sqrt(power((clickedper7[jx] - WX), 2) + power((clickedvel7[jx] - WY), 2)) <
        actminpervel) and (clickedper7[jx] > 0) and
        (clickedvel7[jx] > 0)) then
      begin
        minclickedper := clickedper7[jx];
        clickindex := jx;
        whatorderstrg := 'seventh';
        actminpervel := sqrt(power((clickedper7[jx] - WX), 2) + power(
          (clickedvel7[jx] - WY), 2));
        nahrada := True;
        nahrada2 := True;
        minclickedvel := clickedvel7[jx];
      end;
      {osme}
      if ((sqrt(power((clickedper8[jx] - WX), 2) + power((clickedvel8[jx] - WY), 2)) <
        actminpervel) and (clickedper8[jx] > 0) and
        (clickedvel8[jx] > 0)) then
      begin
        minclickedper := clickedper8[jx];
        clickindex := jx;
        whatorderstrg := 'eighth';
        actminpervel := sqrt(power((clickedper8[jx] - WX), 2) + power(
          (clickedvel8[jx] - WY), 2));
        nahrada := True;
        nahrada2 := True;
        minclickedvel := clickedvel8[jx];
      end;
    end;{for jx - hledani nejmensi vzdalenosti - konec cyklu pro kazdy fjakeiltr}
    {ted jen to vybrane ulozim do locmx[filtr] }
    if whatorderstrg = 'primary' then
    begin
      locmx[clickindex] := max1locmx[clickindex]; {nahradim primarnim maximem}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - you clicked the ' + whatorderstrg + ' maximum ...');
    end;
    if whatorderstrg = 'secondary' then
    begin
      locmx[clickindex] := max2locmx[clickindex]; {nahradim secondarnim maximem}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - you clicked the ' + whatorderstrg + ' maximum ...');
    end;
    if whatorderstrg = 'tertiary' then
    begin
      locmx[clickindex] := max3locmx[clickindex]; {nahradim tertiarnim maximem}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - you clicked the ' + whatorderstrg + ' maximum ...');
    end;
    if whatorderstrg = 'quarternary' then
    begin
      locmx[clickindex] := max4locmx[clickindex]; {nahradim quarternim maximem}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - you clicked the ' + whatorderstrg + ' maximum ...');
    end;
    if whatorderstrg = 'quinternary' then
    begin
      locmx[clickindex] := max5locmx[clickindex]; {nahradim quinternim maximem}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - you clicked the ' + whatorderstrg + ' maximum ...');
    end;
    if whatorderstrg = 'sixth' then
    begin
      locmx[clickindex] := max6locmx[clickindex]; {nahradim quinternim maximem}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - you clicked the ' + whatorderstrg + ' maximum ...');
    end;
    if whatorderstrg = 'seventh' then
    begin
      locmx[clickindex] := max7locmx[clickindex]; {nahradim quinternim maximem}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - you clicked the ' + whatorderstrg + ' maximum ...');
    end;
    if whatorderstrg = 'eighth' then
    begin
      locmx[clickindex] := max8locmx[clickindex]; {nahradim quinternim maximem}
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - you clicked the ' + whatorderstrg + ' maximum ...');
    end;

    if nasel then
    begin
      str(minclickedper: 8: 4, klikperiodastrg);
      str(minclickedvel: 8: 4, klikrychloststrg);
      str(clickindex: 4, clickindexstrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - ... formerly estimated point was at ' +
        jake[clickindex] + ' maximum');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - you clicked the filter number ' + clickindexstrg);
      jake[clickindex] := whatorderstrg;
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - period of the selected point is ' +
        klikperiodastrg + ' s');
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - velocity of the selected point is ' +
        klikrychloststrg + ' km/s');
      kuki := 0;
      clicks := clicks + 1;
      Timer2.Enabled := True; {spustim blikani vybraneho bodiku}
    end;{if nasel}
    if nasel = False then
    begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg +
        ' | - sorry, no group velocity dispersion point matched');
    end;{if nasel = false}
    if nasel then begin             {tady zrusim okenka pro nastavovani parametru filtrace}
      Edit1.Enabled := False;       {epicentralni vzdalenost}
      Edit2.Enabled := False;       {time interval}
      Edit3.Enabled := False;       {sampling frequency}
      Edit5.Enabled := False;       {min group velocity}
      Edit4.Enabled := False;       {max group velocity}
      Edit6.Enabled := False;       {minimal period}
      Edit7.Enabled := False;       {maximal period}
      Edit8.Enabled := False;       {number of filters}
      Edit9.Enabled := False;       {smoothing window}
      Edit10.Enabled := False;      {alpha slope}
      Edit11.Enabled := False;      {alpha intercept point}
      Button13.Enabled := False;    {Open data file...}
      RadioGroup4.Enabled := False; {inflex / maxi option}
      RadioGroup2.Enabled := False; {A / L / O option}
      RadioGroup7.Enabled := False; {N / X option}
      RadioGroup5.Enabled := False; {R / F option}
      RadioGroup8.Enabled := False; {vel / time option}
    end;
    Label21.Visible := True;
    Label32.Visible := True;
    Label57.Visible := True;
  end; {konec if grupka je true, pokud jsem tedy naposledy maloval grupovou rychlost}

  if grupka = False then
  begin {pokud jsem ale naposledy malovat fazovou, delam si jinou klikaci procedurku}
    for jx := 1 to nflt do
    begin {kdyz kliknu na nejake maximum}
      if ((WX - 0.04) <= instper[jx, locmx[jx]]) and
        ((WX + 0.04) >= instper[jx, locmx[jx]]) then
      begin
        clickindex := jx;
        str(clickindex: 4, clickindexstrg);
        clickedperfaz := instper[jx, locmx[jx]];
        str(clickedperfaz: 8: 4, klikperiodastrg);
        for p := 0 to 2 * fazky do
        begin
          if ((WY - 0.04) <= fazovaP[p, jx]) and ((WY + 0.04) >= fazovaP[p, jx]) then
          begin
            nasel := True;
            clickedvelfaz := fazovaP[p, jx];
            str(clickedvelfaz: 8: 4, klikrychloststrg);
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - you clicked the phase vel. at filter No. ' +
              clickindexstrg);
            radek := radek + 1;
            str(radek: 4, radekstrg);
            memo1.Lines.Add(radekstrg + ' | - period ' + klikperiodastrg +
              ' velocity ' + klikrychloststrg);
          end {if to trefilou nejaky bud fazove rychlost};
        end; {for p - tedy ruzne vetve fazovych krivek}
      end;{if to naslo instper}
    end; {jx - vsechny filtry}
    if nasel = False then
    begin
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg +
        ' | - sorry, no phase velocity dispersion point matched');
    end;{if nasel = false}
    for j := 1 to nflt do
    begin
      fazova[j] := -50000;   {zadam nesmyslnou hodnotu}
    end;
    if nasel then
    begin {pokud jsem nakliknul nejaky fazovy bod}
      fazova[clickindex] := clickedvelfaz;
      {tam, kde jsem klik, bude v te vysledne primo ten kliknuty bod}
      for jx := clickindex to nflt - 1 do
      begin {kdyz kliknu na nejake maximum}
        for p := 0 to 2 * fazky do
        begin
          if (abs(fazova[jx] - fazovaP[p, jx + 1]) < abs(fazova[jx] - fazova[jx + 1])) then
            fazova[jx + 1] := fazovaP[p, jx + 1];
        end; {konec pres vsechny vetve}
      end; {konec od kliknuteho indexu nahoru}
      for jx := clickindex downto 2 do
      begin
        for p := 0 to 2 * fazky do
        begin
          if (abs(fazova[jx] - fazovaP[p, jx - 1]) < abs(fazova[jx] - fazova[jx - 1])) then
            fazova[jx - 1] := fazovaP[p, jx - 1];
        end; {konec pres vsechny vetve}
      end; {konec od kliknuteho indexu dolu}
      pp3 := pp3 + 1;
      with PlotPanel3 do
      begin
        LayerOptions(pp3, pmLine, 2); {to posledni je tloustka tecek v pixelech}
      end;
      if ((inverindexf <> 0) and (inverindexl <> 0)) then
      begin
        for j := inverindexf to inverindexl do
        begin {namaluju tu jen pro vybrany obor, protoze pro ten to pak ulozim, tak abych to videl, ze je jen omezeny}
          if (instper[j, locmx[j]] > PlotPanel3.Xmin) and
            (instper[j, locmx[j]] < PlotPanel3.Xmax) and (fazova[j] > PlotPanel3.Ymin) and
            (fazova[j] < PlotPanel3.Ymax) then
          begin
            PlotPanel3.AddXY({log10}(instper[j, locmx[j]]), fazova[j], RGB(55, 255, 55), pp3);
          end;
        end;
      end;
      for j := 1 to nflt do
      begin {pokud ale nemam zadny dolni a horni malovaci index vybrany, namaluju to pro vsechny}
        if (instper[j, locmx[j]] > PlotPanel3.Xmin) and
          (instper[j, locmx[j]] < PlotPanel3.Xmax) and (fazova[j] > PlotPanel3.Ymin) and
          (fazova[j] < PlotPanel3.Ymax) then
        begin
          PlotPanel3.AddXY({log10}(instper[j, locmx[j]]), fazova[j], RGB(55, 255, 55), pp3);
        end;
      end;
    end; {if nasel}
  end; {konec, pokud jsem klikal na fazovou}
end; {konec procedurky na ukladani naklikanych disperznich bodu}

procedure TNoSVALform.Timer2Timer(Sender: TObject);
begin {blikani nakliknuteho disperzniho bodu}
  with PlotPanel3 do
  begin
    LayerOptions(clicks, pmDot, 10);
  end;
  if ks = 0 then
  begin
    PlotPanel3.AddXY(minclickedper, minclickedvel, RGB(255, 131, 255), clicks);
    ks := 1;
    Label21.Visible := True;
    Label32.Visible := True;
    Label57.Visible := True;
    kuki := kuki + 1;
    if kuki = 20 then
    begin
      Timer2.Enabled := False; {zrusim blikani vybraneho bodiku}
      PlotPanel3.HideLayer(clicks);
      with PlotPanel3 do
      begin
        LayerOptions(clicks, pmDot, 5);
      end;
      PlotPanel3.AddXY(minclickedper, minclickedvel, RGB(255, 131, 255), clicks);
      Label21.Visible := True;
      Label32.Visible := True;
      Label57.Visible := True;
    end;
    exit;
  end;
  if ks = 1 then
  begin
    PlotPanel3.AddXY(minclickedper, minclickedvel, RGB(107, 255, 128), clicks);
    {ukaze to bod na disperzni krivce}
    ks := 0;
    Label21.Visible := True;
    Label32.Visible := True;
    Label57.Visible := True;
    kuki := kuki + 1;
    if kuki = 20 then
    begin
      Timer2.Enabled := False; {zrusim blikani vybraneho bodiku}
      PlotPanel3.HideLayer(clicks);
      with PlotPanel3 do
      begin
        LayerOptions(clicks, pmDot, 5);
      end;
      PlotPanel3.AddXY(minclickedper, minclickedvel, RGB(255, 131, 255), clicks);
      Label21.Visible := True;
      Label32.Visible := True;
      Label57.Visible := True;
    end;
    exit;
  end;
end;{konec blikani nakliknuteho bodiku}

procedure TNoSVALform.PlotPanel1MouseMove(Sender: TObject; Shift: TShiftState; xxx, yyy: integer);
var {vypisuje souradnici casu od PlotPanelu 1 i 2}
  WXX, WYY: extended;
  Test1: boolean;
begin
  WXX := 0;
  WYY := 0;
  Test1 := PlotPanel2.ConvertS2W(xxx, yyy, WXX, WYY);
  {testuje, jestli mam mys vubec nad PlotPanelem a kdyz jo, tak do WXX a WYY nacpe souradnice}
  if Test1 = False then
  begin
    Label33.Visible := False;
    Label44.Visible := False;
  end
  else
  begin
    Label33.Visible := True;
    Label44.Visible := True;
  end;
  if hydro = false then begin
    Label33.Caption := '      time = ' + FloatToStrF(WXX, ffFixed, 5, 2) + ' s      ';
    Label44.Caption := '      velocity = ' + FloatToStrF(distkm / WXX, ffFixed, 5, 2) + ' km/s   ';
  end;
  if hydro = true then begin
    Label33.Caption := '      date and time = ' + FormatDateTime('dd.mm.yy hh:nn:ss',(hydrodatum + (WXX/86400)));
  end;
end; {vypisuje souradnici casu od PlotPanelu 1 i 2}

procedure TNoSVALform.PlotPanel4MouseMove(Sender: TObject; Shift: TShiftState; xxxx, yyyy: integer);
var {vypisuje hloubku a rychlost do PlotPanelu 4}
  Test4: boolean;
begin
  Test4 := PlotPanel4.ConvertS2W(xxxx, yyyy, WXXX, WYYY);
  if Test4 = False then
  begin
    Label34.Visible := False;
    Label35.Visible := False;
  end
  else
  begin
    Label34.Visible := True;
    Label35.Visible := True;
  end;
  Label34.Caption := 'Vel. = ' + FloatToStrF(WXXX, ffFixed, 6, 3) + ' km/s';
  Label35.Caption := 'H = ' + FloatToStrF(-WYYY, ffFixed, 6, 3) + ' km';
end; {vypisuje hloubku a rychlost do PlotPanelu 4}

procedure TNoSVALform.PlotPanel4Click(Sender: TObject);
var {ukladam kliknute hodnoty S-vln}
  hloubka: double;
  istrg: string;
  Binterstrg: string;
  i: integer;
  mazuesko: integer;
begin
  if interaktivni then begin {cela tahle procedurka funguje, jenom kdyz jsem v interaktivnim modu}
    hloubka := 0;
    for i := 1 to numoflay do begin {numoflay je pocet vrstev bez poloprostoru}
      hloubka := hloubka + DD[i];
      if ((-WYYY > hloubka - DD[i]) and (-WYYY < hloubka)) then begin
        Binter[i] := WXXX;
        str(i: 3, istrg);
        mazuesko := eskai[i];
        PlotPanel4.HideLayer(mazuesko);
        str(Binter[i]: 7: 3, Binterstrg);
        with PlotPanel4 do begin
          LayerOptions(mazuesko, pmLine, 4);
        end;
        PlotPanel4.AddXY(Binter[i], -hloubka + DD[i], clRed, mazuesko);        {vykresluje rychlosti S-vln}
        PlotPanel4.AddXY(Binter[i], -hloubka, clRed, mazuesko);                {vykresluje rychlosti S-vln}
      end;
    end; {cyklu pro i}
    if (-WYYY > hloubka) then begin {pro poloprostor}
      Binter[numoflay + 1] := WXXX;
      istrg := 'halfspace';
      mazuesko := eskai[numoflay] + 1;
      PlotPanel4.HideLayer(mazuesko);
      str(Binter[numoflay + 1]: 7: 3, Binterstrg);
      with PlotPanel4 do begin
        LayerOptions(mazuesko, pmLine, 4);
      end;
      PlotPanel4.AddXY(Binter[numoflay + 1], -hloubka, clRed, mazuesko);        {vykresluje rychlosti S-vln}
      PlotPanel4.AddXY(Binter[numoflay + 1], -hloubka * 1.25, clRed, mazuesko); {vykresluje rychlosti S-vln}
    end;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - you clicked in the ' + istrg + ' layer');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - you choose the ' + Binterstrg + ' km/s S-velocity');
  end; {if interaktivni}
end; {konec procedurky na ukladani nakliknutych hodnot S-vln}

procedure TNoSVALform.RadioGroup5Click(Sender: TObject);
var  {vybira mezi puvodnim a filtrovanym zaznamem}
  i: integer;
begin
  memo1.Lines.Add('------------------------------------------------------------------------');
  if RadioGroup5.ItemIndex = 0 then
  begin {kdyz chci pouzit puvodni zaznam}
    for i := 1 to nsampl do
    begin
      sre[i] := rawsre[i]; {ten pracovni sre nahradim uplne puvodnim ze souboru}
    end;
    usefiltered := False;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - raw record will be used for analysis');
  end;
  if RadioGroup5.ItemIndex = 1 then
  begin {kdyz chci pouzit filtrovany}
    for i := 1 to nsampl do
    begin
      sre[i] := complfsre[i]; {ten pracovni nahradim completne filtrovanym}
    end;
    usefiltered := True;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - filtered record will be used for analysis');
    if batchproces = False then
    begin {upozorneni zobrazuju jen kdyz nejsem v batch processingu}
      ShowMessage(
        'If you want to use the bandpass filtered record with instrumental transfer function, press the Analysis button first and after that press the FilterCorr button. In case you use the FilterCorr button directly, the bandpass filtered record will NOT be used.');
    end;
  end;
end; {konec procedurky na vybirani mezi puvodnim a filtrovanym zaznamem}

procedure TNoSVALform.RadioGroup6Click(Sender: TObject);
begin {vybira mezi fazovou a grupovou rychlosti}
  memo1.Lines.Add('------------------------------------------------------------------------');
  if RadioGroup6.ItemIndex = 0 then begin {kdyz chci pouzit grupovou}
    usegroup := True;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - GROUP velocity set for inversion');
  end;
  if RadioGroup6.ItemIndex = 1 then begin {kdyz chci pouzit fazovou}
    usegroup := False;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - PHASE velocity set for inversion');
  end;
end; {konec procedurky na vybirani mezi fazovou a grupovou rychlosti}

procedure TNoSVALform.RadioGroup7Click(Sender: TObject);
begin{vybira zpusob orezavani bobanku}
  memo1.Lines.Add('------------------------------------------------------------------------');
  if RadioGroup7.ItemIndex = 0 then
  begin {kdyz chci pouzit orezani podle inflexnich bodu}
    nasilne := False;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - truncating according to the inflection points will be provided');
  end;
  if RadioGroup7.ItemIndex = 1 then
  begin {kdyz chci pouzit fixni nasilne hodnoty orezani}
    nasilne := True;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - fixed truncating values will be used');
  end;
end; {konec procedury na vybirani zpusobu orezavani bobanku}

procedure TNoSVALform.Button12Click(Sender: TObject);
var {pocita a vykresluje se kompletni zaznam, ale cely je opraveny na pristroj}
  i, uu: integer;
begin
  for i := 1 to n do
  begin   {nyni se prevede opravene spektrum zpet do casu,}
    cinput[2 * i - 1] := CorrFRe[i];   {slozi se vstupni datove pole pro inverzni FFT}
    cinput[2 * i] := CorrFIm[i];
  end;
  four1(cinput, n, -1);
  {spocte se signal (casova oblast) k danemu opravenemu spektru}
  for i := 1 to n do
  begin
    ;        {a opet se rozlozi vystupni datove pole na realnou a popripade i imaginarni cast}
    CorrSRe[i] := cinput[2 * i - 1];
    CorrSIm[i] := cinput[2 * i];
  end;
  for i := 1 to n do
  begin   {pocitani obalky opraveneho signalu v case}
    EnvCorrS[i] := sqrt(CorrSRe[i] * CorrSRe[i] + CorrSIm[i] * CorrSIm[i]);
    {spocte se amplituda obalky}
  end; {for i}
  corrsigmaxi := 0;
  for i := 1 to n do begin {najdeme maximum toho correctovaneho signalu}
    if CorrSRe[i] > corrsigmaxi then begin
      corrsigmaxi := CorrSRe[i];
    end;
  end;
  cfs := cfs + 1;
  with PlotPanel2 do begin
    LayerOptions(cfs, pmLine, 1);
  end;
  for uu := 2 to trunc(nsampl / kraceni) do begin {for uu:= 2 to nsampl do begin}
    PlotPanel2.AddXY(SVALtime[uu * kraceni], CorrSre[uu * kraceni] / corrsigmaxi{*scalefactor*0.01}, RGB(0, 255, 0), cfs);
  end; {delim to maximalni amlitudou, aby to byla maximalne = 1}

  if doublebandpass then
  begin        {jen pokud delam doublebandpass}
    cfs := cfs + 1;                   {nakresli obalku corrected seismogramu}
    with PlotPanel2 do
    begin
      LayerOptions(cfs, pmLine, 3);
    end;
    for uu := 2 to trunc(nsampl / kraceni) do
    begin {for uu:= 2 to nsampl do begin}
      PlotPanel2.AddXY(SVALtime[uu * kraceni], EnvCorrS[uu * kraceni] / corrsigmaxi{*scalefactor*0.01}, RGB(100, 255, 100), cfs);
    end; {delim to maximalni amlitudou, aby to byla maximalne = 1}
  end;
  if hydro = false then begin
    Ukazcarky;
    Ukazrychlosti;
  end;
  udelalopraveny := True;
  Button2.Enabled := True; {dovolim kreslit i obalku bandpassfiltru}
end; {konec pocitani a vykreslovani kompletniho korigovaneho zaznamu}

procedure TNoSVALform.CheckBox1Click(Sender: TObject);
var   {volba interaktivniho ovladani rychlosti S-vln}
  hah: integer;
  j: integer;
begin
  if CheckBox1.Checked = True then begin
    interaktivni := True;    {kdyz to bude true, spadne to do cyklu, kde volim rucne hodnoty S-vln}
    CheckBox1.Color := clRed;
    CheckBox1.Font.Color := clYellow;
    if prumernabatch = False then begin
      PlotPanel4.HideLayer(eska);    {zmizim vrstvu, ve ktere je namalovan posledni rez S-vln a vykreslim kazdou rychlost v kazde vrstve Zeme do jine vrstvy PlotPanelu}
      hlayers2 := 0.0;
      puvodnieska := eska;
      for hah := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
        with PlotPanel4 do begin
          LayerOptions(eskai[hah], pmLine, 4);
        end;
        PlotPanel4.AddXY(B[hah], -hlayers2, clRed, eskai[hah]);        {vykresluje rychlosti S-vln}
        hlayers2 := hlayers2 + DD[hah];
        PlotPanel4.AddXY(B[hah], -hlayers2, clRed, eskai[hah]);        {vykresluje rychlosti S-vln}
      end; {konec pro kazdou vrstvu}
      with PlotPanel4 do begin
        LayerOptions(eskai[numoflay + 1], pmLine, 4);
      end;
      PlotPanel4.AddXY(B[numoflay + 1], -hlayers2, clRed, eskai[numoflay + 1]);           {vykresluje rychlost S-vln}
      PlotPanel4.AddXY(B[numoflay + 1], -hlayers2 * 1.25, clRed, eskai[numoflay + 1]);    {vykresluje rychlost S-vln}
      for j := 1 to numoflay + 1 do begin
        Binter[j] := B[j];        {nacpu do Binteru povodni hodnoty, aby ty, ktere nezmenim, zustaly puvodni}
      end;
    end; {kdyz to NENI prumerna struktura}
    if prumernabatch = True then begin  {kdyz maluju disperzi pro prumernou stukturu}
      for j := 1 to numoflay + 1 do begin
        Binter[j] := batchprumerS[j];   {nacpu do Binteru hodnoty prumerne struktury - misto abych na strukturu klikal, tak to tam jednoduse nacpu}
        {v pripade Rayleigha musim jeste nejak nacpat to prumerovane Vp/Vs, ale to delam az v Unit1, protoze jinak se to zase jinde premaze tim, co je zadane v okenku jako startovaci vp/vs}
      end;
    end;
    label14.Enabled := False;
    label16.Enabled := False;
    label20.Enabled := False;
    label24.Enabled := False;
    label25.Enabled := False;
    label26.Enabled := False;
  end;  {if Checked je true}
  if CheckBox1.Checked = False then begin
    interaktivni := False;
    CheckBox1.Color := clBtnFace;
    CheckBox1.Font.Color := clBlack;
    for j := 1 to numoflay + 1 do begin
      Binter[j] := 0; {vynulujeme}
    end;
    if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.Enabled := True;    {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
    label16.Enabled := True;
    label20.Enabled := True;
    label24.Enabled := True;
    label25.Enabled := True;
    label26.Enabled := True;
    if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;       {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
    label16.BringToFront;
    label20.BringToFront;
    label24.BringToFront;
    label25.BringToFront;
    label26.BringToFront;
  end;
end;  {konec volby interaktivniho ovladani rychlosti S-vln}

procedure TNoSVALform.Button35Click(Sender: TObject);
begin {PLUS == zoomuje dovnitr == zmensuje do rozsahu hloubek}
  PlotPanel4.Ymin := PlotPanel4.Ymin / 2;
  if PlotPanel4.Ymin < -0.00 then PlotPanel4.YInterval := 0.001;
  if PlotPanel4.Ymin < -0.01 then PlotPanel4.YInterval := 0.002;
  if PlotPanel4.Ymin < -0.02 then PlotPanel4.YInterval := 0.004;
  if PlotPanel4.Ymin < -0.05 then PlotPanel4.YInterval := 0.010;
  if PlotPanel4.Ymin < -0.10 then PlotPanel4.YInterval := 0.020;
  if PlotPanel4.Ymin < -0.20 then PlotPanel4.YInterval := 0.040;
  if PlotPanel4.Ymin < -0.50 then PlotPanel4.YInterval := 0.100;
  if PlotPanel4.Ymin < -1.00 then PlotPanel4.YInterval := 0.200;
  if PlotPanel4.Ymin < -2.00 then PlotPanel4.YInterval := 0.400;
  if PlotPanel4.Ymin < -5.00 then PlotPanel4.YInterval := 1.000;
  if PlotPanel4.Ymin < -10.0 then PlotPanel4.YInterval := 2.000;
  if PlotPanel4.Ymin < -20.0 then PlotPanel4.YInterval := 4.000;
  if PlotPanel4.Ymin < -50.0 then PlotPanel4.YInterval := 10;
  if PlotPanel4.Ymin < -100 then  PlotPanel4.YInterval := 20;
  if PlotPanel4.Ymin < -200 then  PlotPanel4.YInterval := 40;
  if PlotPanel4.Ymin < -500 then  PlotPanel4.YInterval := 100;
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
end;

procedure TNoSVALform.Button48Click(Sender: TObject);
begin {MINUS == zoomuje ven == zvetsuje rozsah hloubek}
  PlotPanel4.Ymin := PlotPanel4.Ymin * 2;
  if PlotPanel4.Ymin < -0.00 then PlotPanel4.YInterval := 0.001;
  if PlotPanel4.Ymin < -0.01 then PlotPanel4.YInterval := 0.002;
  if PlotPanel4.Ymin < -0.02 then PlotPanel4.YInterval := 0.004;
  if PlotPanel4.Ymin < -0.05 then PlotPanel4.YInterval := 0.010;
  if PlotPanel4.Ymin < -0.10 then PlotPanel4.YInterval := 0.020;
  if PlotPanel4.Ymin < -0.20 then PlotPanel4.YInterval := 0.040;
  if PlotPanel4.Ymin < -0.50 then PlotPanel4.YInterval := 0.100;
  if PlotPanel4.Ymin < -1.00 then PlotPanel4.YInterval := 0.200;
  if PlotPanel4.Ymin < -2.00 then PlotPanel4.YInterval := 0.400;
  if PlotPanel4.Ymin < -5.00 then PlotPanel4.YInterval := 1.000;
  if PlotPanel4.Ymin < -10.0 then PlotPanel4.YInterval := 2.000;
  if PlotPanel4.Ymin < -20.0 then PlotPanel4.YInterval := 4.000;
  if PlotPanel4.Ymin < -50.0 then PlotPanel4.YInterval := 10;
  if PlotPanel4.Ymin < -100 then  PlotPanel4.YInterval := 20;
  if PlotPanel4.Ymin < -200 then  PlotPanel4.YInterval := 40;
  if PlotPanel4.Ymin < -500 then  PlotPanel4.YInterval := 100;
  if (PlotPanel4.Ymin <= ((-hhalfspace * 0.25) - hhalfspace)) then label14.BringToFront;
  {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  label16.BringToFront;
  label20.BringToFront;
  label24.BringToFront;
  label25.BringToFront;
  label26.BringToFront;
end;

procedure TNoSVALform.CheckBox2Click(Sender: TObject);
begin {ConDen == Constant Density}
  if CheckBox2.Checked = True then begin
    menise := False;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - density will be kept constant during the inversion');
  end;
  if CheckBox2.Checked = False then begin
    menise := True;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - density will be changed during the inversion');
  end;
end;

procedure TNoSVALform.Posunnapisu(Sender: TObject);
begin {posunuje napisy :fixed: v hornim PlotPanelu}
  if (nasilne and truncx) then
  begin
    label36.Top := trunc(((PlotPanel1.Height - 20) / 2) -
      ({plotsigmaxi}1 / 2 / PlotPanel1.Ymax * (PlotPanel1.Height - 20) / 2)) - 6;
    label36.Left := trunc(locmx[index] / nsampl * PlotPanel1.Width) - 12;
    label37.Top := trunc(((PlotPanel1.Height - 20) / 2) +
      ({plotsigmaxi}1 / 2 / PlotPanel1.YMax * (PlotPanel1.Height - 20) / 2)) - 6;
    label37.Left := trunc(((lowersampl[index] + lowerzerosampl[index]) / 2) /
      nsampl * PlotPanel1.Width) - 12;
    label38.Top := trunc(((PlotPanel1.Height - 20) / 2) +
      ({plotsigmaxi}1 / 2 / PlotPanel1.YMax * (PlotPanel1.Height - 20) / 2)) - 6;
    label38.Left := trunc(((upperzerosampl[index] + uppersampl[index]) / 2) /
      nsampl * PlotPanel1.Width) - 12;
  end;
end;  {konec procedury Posunnapisu}

procedure TNoSVALform.CheckBox4Click(Sender: TObject);
begin   {lvz == Low Velocity Zone == zapina / vypina LVZ pro inverzi}
  if CheckBox4.Checked = True then
  begin
    lvz := True;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - low velocity zone enabled');
  end;
  if CheckBox4.Checked = False then
  begin
    lvz := False;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - low velocity zone disabled');
  end;
end;

procedure TNoSVALform.Button7Click(Sender: TObject);
begin
  BatchForm.Show;      {vola okno pro batch processing}
end; {ukaze se nove okno, kde nastavim vsechno pro batch processing, a kdyz tam pak zmacknu cudlik, tak se to vrati sem na nasledujici proceduru Zbatchokna}

procedure TNoSVALform.Zbatchokna(Sender: TObject);
var
  {Batch proc == davkovy rezim SVALu - tuto procedurku poustim z BatchForm macknutim cudliku pote, co jsou nastaveny vsechny parametry pro Batch}
  k                      : integer;    {tato procedurka se pta jenom na SuperBatch, a dalsi pak na dalsi parametry, je to rozdeleno z historickych duvodu}
  finalkolikatystrg      : string;
  totalbatchstationsstrg : string;
begin  {tenhle cudlik se jen zepta, jestli chci SuperBatch nebo obycenjny Batch a v obou pripadech pusti nasledujici proceduru Davka}
  if superbatchyesno = True then begin {super batch znamena, ze to budu delat pro vice jevu (adresaru), jejich seznam si prectu ze zvlastniho souboru}
    OpenDialog4.FileName := '';
    ShowMessage('Open the file with the list of events. The file must be at the same directory as the folders for all the events.');
    OpenDialog4.Execute; {musim kliknout na soubor, ktery je VEDLE tech adresaru, ktere jsou na seznamu v tom souboru}
    pozice := 1;
    repeat
      posledni := misto;  {sem nactu posledni nalezenou pozici zpetneho lomitka}
      misto := PosEx('/', OpenDialog4.FileName, pozice);
      pozice := misto + 1;
    until misto = 0;
    supercesta := Copy(OpenDialog4.FileName, 1, posledni);
    if length(supercesta) < 1 then begin
      exit;
    end;
    {prectu si seznam, co mam zpracovavat}
    assignfile(seznam, OpenDialog4.FileName);  {priradim jmeno souboru se seznamem adresaru}
    reset(seznam);
    nacetadresaru := 0;
    repeat
      readln(seznam, adr);
      nacetadresaru := nacetadresaru + 1;
    until EOF(seznam);                       {tim jen zjistim, kolik jich tam je}
    reset(seznam);
    setlength(adresar, nacetadresaru + 1);
    //setlength(eventstations, nacetadresaru + 1);
    //setlength(redstationN, nacetadresaru + 1);
    //setlength(yellowstationN, nacetadresaru + 1);
    for k := 1 to nacetadresaru do begin
      readln(seznam, adresar[k]);             {a tady je fakt prectu}
    end;
    closefile(seznam);
    kolikatysuper := 0;   {pocitadlo, kolik tech adresaru jsem fakt uz zpracoval}
    aktualnijev   := 0;   {stejne pocitadlo ktere se bude ale updateovat v procedure pod cudlikem Analysis jen kdyz skocim na dalsi jev}
    totalbatchstations := 0;
    {v tomto miste budu pro SuperBatch pouze jedno, na zacatku, vsechno cyklovani se dela az v procedure Vsechnytri}
  end; {if to JE superbatch}

  Vsechnytri(Sender);   {tam zkontroluju, jestli mam nebo nemam vsechny tri a pusti to proceduru Davka, proceduru Vsechnytri spustim at uz mam nebo nemam Superbatch}

  if superbatchyesno = True then begin {pro superbatch vypisu hlasku nakonec}
    str(kolikatysuper: 4, finalkolikatystrg);
    str(totalbatchstations: 4, totalbatchstationsstrg);
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - SUPER BATCH processing finished after ' +finalkolikatystrg+ ' earthquakes');
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - SUPER BATCH processed ' +totalbatchstationsstrg+ ' stations/components in total');
  end;
end; {konec procedury Zbatchokna - mam nastaveno, jestli chci delat Batch nebo SuperBatch, zavolal jsem proceduru Vsechnytri a ta spusti nasledujici Davka}

procedure TNoSVALform.Davka(Sender: TObject);
var    {vlastni batch processing a nastavovani dalsich parametru, hodnoty true nebo false jsou vzaty z BatchForm, tedy s jineho okna, kde je zaskrtavam}
  sr: TSearchRec;
  prvnirefstrg          : string;
  dalsirefstrg          : string;
  nacet                 : integer;
  nacetstrg             : string;
  nacetflipstrg         : string;
  mj, jiji              : integer;
  nico                  : double;     {nacitam tam hodnoty, ktere k nicemu nepotrebuju}
  ii, k, j              : integer;
  odchylka              : double;
  odchylkastrg          : string;
  mindevper             : double;
  mindevperstrg         : string;
  maxdevper             : double;
  maxdevperstrg         : string;
  nazevALLbez           : string;
  nazevALLvyr           : string;
  mindistkm             : double;
  maxdistkm             : double;
  centraldistkm         : double;
  closestkm             : double;
  indexclosest          : integer;
  KUKdistkmStationstrg  : string;
  centraldistkmstrg     : string;
  centralphasevel       : array of double;

begin  {davkovy rezim SVALu}
  setlength(centralphasevel, maxnflt + 1);
  batchproces := True;                    {jakmile jednou zmacknu gombik, uz to bude v rezimu davkoveho zpracovani}
  prvnihlavicka := False;                 {ze jsem jeste nezapsal hlavicku do nejakeho souboru, kam ji chci zapsat jenom jednou a pak uz pro dalsi stanice ne}
  prvnihlavickasavewhole := False;
  pocetblbejch := 0;                      {pocet disperznich krivek, ktere se moc odlisuji od prumeru}
  odchylkastrg := BatchForm.Edit1.Text;   {pri prekroceni teto odchylky to disperzi oznaci jako spatnou, namaluje ji to cervene}
  val(odchylkastrg, odchylka, cd);
  mindevperstrg := BatchForm.Edit2.Text;  {minimalni a maximalni perioda, pro kterou se hodnoti odchylka disperzi}
  val(mindevperstrg, mindevper, cd);
  maxdevperstrg := BatchForm.Edit3.Text;
  val(maxdevperstrg, maxdevper, cd);
  if (allthreeyes = False) or ((allthreeyes = True) and (Form2.RadioGroup2.ItemIndex = 0)) then begin     {pokud bud NEDELAM vsechny tri anebo je sice delam ale jen pro prvni komponentu Z}
    {tak uz se to znova nepta a necha to stejne parametry i pro dalsi komponenty}
    {ptani bylo puvodne pomoci jednotlivych okynek a pak jsem to predelal do noveho okna, kde jsou zasrktavaci cudlicky pro nastaveni vsech parametru batch processingu}
    if POLAR = True then begin   {kdyz chci delat polarizacni analyzu}
      POLARflip   := False;        {tohle bude true jenom kdyz budu delat tu druhou slozku, takze ted je to jeste false, protoze zacnu s prvni}
      POLARflipZT := False;
    end
    else if POLAR = False then begin
      POLARflip   := False;
      POLARflipZT := False;
    end;
    if (reference = true) then begin {kdyz chci nacitat referencni disperzni krivku pro truncatingovani}
      ShowMessage('Open the file with the reference dispersion');
      OpenDialog5.FileName := '';
      OpenDialog5.Execute;   {otevru soubor s disperzni krivkou, kterou jsem si predtim ulozil SVALem, cte to prave jenom SVALi format}
      if length(OpenDialog5.FileName) < 1 then exit; {kdyz zadny soubor nechci otevrit, vypadne to z procedurky}
      refcaption := '        reference dispersion file: ' + OpenDialog5.FileName;
      assignfile(referencefile, OpenDialog5.FileName);
      reset(referencefile);


      readln(referencefile, prvnirefstrg);    {ctu prvni radek}

      if Copy(prvnirefstrg,1,14) = '    InstPeriod' then begin {pokud je to SVALi format 10 sloupcu}
        nacet := 0;
        repeat
          readln(referencefile, dalsirefstrg);  {ctu vsechny dalsi radky}
          nacet := nacet + 1;                   {pocitam radky}
        until EOF(referencefile);
        str(nacet: 4, nacetstrg);
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - reference dispersion file has ' + nacetstrg + ' filters');
        reset(referencefile);
        readln(referencefile, prvnirefstrg);
        for mj := 1 to nacet do begin  {soubor ma 10 sloupcu, ale zajimaji me jenom dva}
          readln(referencefile, refper[mj], nico, nico, refgrpvel[mj]{, nico, nico, nico, nico, nico, nico});
        end;
      end {if to byl SVALi format 10 sloupcu}
      else begin {pokud je to jiny format, doufam, ze jsou to jen dva sloupce bez hlavicky, tedy average disperze}
        reset(referencefile);
        nacet := 0;
        repeat
          readln(referencefile, dalsirefstrg);  {ctu vsechny dalsi radky}
          nacet := nacet + 1;                   {pocitam radky}
        until EOF(referencefile);
        str(nacet: 4, nacetstrg);
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - reference dispersion file has ' + nacetstrg + ' filters');
        reset(referencefile);
        for mj := 1 to nacet do begin  {soubor ma 10 sloupcu, ale zajimaji me jenom dva}
          readln(referencefile, refper[mj], refgrpvel[mj]);
        end;
      end; {else, tedy average disperze}


      closefile(referencefile);
      pp3 := pp3 + 1;
      with PlotPanel3 do begin
        LayerOptions(pp3, pmLine, 5);
      end;
      for jiji := 1 to nacet do begin
        PlotPanel3.AddXY({log10}(refper[jiji]), refgrpvel[jiji], RGB(25, 255, 25), pp3);
      end;
    end; {if reference - nacitani}             {zde to bylo oznaceno jako konec ptani, ale ted tu uz zadne ptani neni}

    if fliprec then begin {pokud chci obracet nejake zaznamy}
      OpenDialog6.FileName := '';
      ShowMessage('Open the file with the list of stations to be flipped');
      OpenDialog6.Execute;
      assignfile(fliplist, OpenDialog6.FileName);
      reset(fliplist);
      nacetflip := 0;
      repeat
        nacetflip := nacetflip + 1;
        readln(fliplist, forflip[nacetflip]);
      until EOF(fliplist);
      closefile(fliplist);
      str(nacetflip: 4, nacetflipstrg);
      radek := radek + 1;
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - ' + nacetflipstrg + ' stations to be flipped');
    end; {if fliprec}

    if superbatchyesno = False then begin {pokud NENI superbatch, tak jedu normalne dal a otevru adresar - pokud to byl superbatch, tak uz jsem to udelal driv}
      ShowMessage('Open the files for batch processing');  {upozornuju, ze mam otevrit soubory pro batch}
      OpenDialog4.FileName := '';
      OpenDialog4.Execute;
      pozice := 1;
      repeat
        posledni := misto; {sem nactu posledni nalezenou pozici zpetneho lomitka}
        misto := PosEx('/', OpenDialog4.FileName, pozice);
        pozice := misto + 1;
      until misto = 0;
      cesta := Copy(OpenDialog4.FileName, 1, posledni);
      if length(cesta) < 1 then begin
        exit;
      end;
    end; {if superbatch = false}
  end; {konec pro to, kdyz nedelam vsechny tri nebo jsem tu poprve}

  {zahajuju batch processing}
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - SVAL batch processing started ...');

  FindFirst(cesta + '*.dat', faAnyFile, sr);

  if jmenoposledniho <> '' then begin        {kdyz bude jmenoposledniho neprazdne, znamena to, ze jsem zastavil batch processing a vleze to do tohodle ifu}
    FindFirst(cesta + '*.dat', faAnyFile, sr);   {najdu znova jmeno toho prvniho}
    if sr.Name <> jmenoposledniho then begin {zkontroluju, jestli nahodou ten posledni neni ten prvni, kdyz ne, projedu nasledujici repeat - until}
      repeat
        FindNext(sr);
      until sr.Name = jmenoposledniho;
    end; {kdyz ten posledni byl prvni v adresari, tak repeat - until preskocim a jdu rovnou dal}
    jmenoposledniho := '';
    FindNext(sr); {a posunu to jeste na ten nasledujici soubor}
  end;
  //  assignfile(logik,'rdg/logfile.log'); {soubor pro zapis, co bylo ulozeno}
  //  rewrite(logik);
  ChDir(cesta);
  {tady potrebuju zmenit adresar a vlezt dovnitr}
  if compon = 1 then begin                    {uklada se soubor se vsema ridges}
    if savecorrected then begin
      CreateDir('Zcrr');
    end;
    if saverdg then begin
      CreateDir('Zrdg');
      dotsALL := 'Zrdg/AALLdots.dat';         {ulozim to do specialniho adresare}
    end;
    if batchdisperze then begin
      CreateDir('Zdsp');                      {vytvori se jen kdyz chci disperzi v batchi}
      CreateDir('Z-AALL');                    {vytvori se jen kdyz chci disperzi v batchi}
      dispALLampli     := 'Z-AALL/AALLdispAMPLI.dat';       {ulozim to do specialniho adresare - soubor pro vsechny disperze}
      dispALLphase     := 'Z-AALL/AALLdispPHASE.dat';       {ulozim to do specialniho adresare - soubor pro vsechny disperze}
      dispALLphaseS    := 'Z-AALL/AALLdispSELECT.dat';      {ulozim to do specialniho adresare - soubor pro vsechny disperze}
      dispALLdiffgrvel := 'Z-AALL/AALLdispDIFFGRVEL.dat';   {ulozim to do specialniho adresare - soubor pro vsechny disperze}
      dispALLgroup     := 'Z-AALL/AALLdispENVEL.dat';       {ulozim to do specialniho adresare - soubor pro vsechny disperze}
      redsts    := 'Z-AALL/red.sts';
      redlab    := 'Z-AALL/red.lab';
      yellowsts := 'Z-AALL/yellow.sts';
      yellowlab := 'Z-AALL/yellow.lab';
      if savewave then begin
        CreateDir('Zwgr');                    {vytvori se jenom kdyz chci ulozit vybranou skupinu povrchovek, coz je vnoreno v tom, ze chci disperzi}
        phaseALLstrg := 'Zwgr/AALLwavesPHASE.wgr';      {ulozim to do specialniho adresare}
        groupALLstrg := 'Zwgr/AALLwavesENVEL.wgr';      {ulozim to do specialniho adresare}
      end;
    end;
    if savewhole then begin
      {vytvori se jen kdyz chci ukladat cely, coz je vnoreno v tom, ze chci bandpass, ale tady to nemusim testovat, protoze kdyz nechci pouzit bandpaa, tak savewhole bude urcite false}
      CreateDir('Zbps');
      CreateDir('Zeqz');
      nazevAllbez := 'Zbps/AALLseism.bps';
      {vytvori se specialni soubor, jen kdyz chci savewhole, ale do adresare, ktery uz tam je vzdycky}
      nazevAllvyr := 'Zeqz/AALLequil.eqz';
    end;
    if saverdg then begin
      dots1 := 'Zrdg/' + '01.dat';
      dots2 := 'Zrdg/' + '02.dat';
      dots3 := 'Zrdg/' + '03.dat';
      dots4 := 'Zrdg/' + '04.dat';
      dots5 := 'Zrdg/' + '05.dat';
      dots6 := 'Zrdg/' + '06.dat';
      dots7 := 'Zrdg/' + '07.dat';
      dots8 := 'Zrdg/' + '08.dat';
      dotsPERcas := 'Zrdg/AAcas.dat';
      dotsPERcasBEZ1 := 'Zrdg/AAcasBEZ1.dat';
    end;
  end; {compon = 1}
  if compon = 2 then begin
    if savecorrected then begin
      CreateDir('Rcrr');
    end;
    if saverdg then begin
      CreateDir('Rrdg');
      dotsALL := 'Rrdg/AALLdots.dat';    {ulozim to do specialniho adresare}
    end;
    if batchdisperze then begin
      CreateDir('Rdsp');
      CreateDir('R-AALL');                    {vytvori se jen kdyz chci disperzi v batchi}
      dispALLampli     := 'R-AALL/AALLdispAMPLI.dat';  {ulozim to do specialniho adresare}
      dispALLphase     := 'R-AALL/AALLdispPHASE.dat';  {ulozim to do specialniho adresare}
      dispALLphaseS    := 'R-AALL/AALLdispSELECT.dat'; {ulozim to do specialniho adresare}
      dispALLdiffgrvel := 'R-AALL/AALLdispDIFFGRVEL.dat'; {ulozim to do specialniho adresare}
      dispALLgroup     := 'R-AALL/AALLdispENVEL.dat';  {ulozim to do specialniho adresare}
      redsts    := 'R-AALL/red.sts';
      redlab    := 'R-AALL/red.lab';
      yellowsts := 'R-AALL/yellow.sts';
      yellowlab := 'R-AALL/yellow.lab';
      if savewave then begin
        CreateDir('Rwgr');
        phaseALLstrg := 'Rwgr/AALLwavesPHASE.wgr';  {ulozim to do specialniho adresare}
        groupALLstrg := 'Rwgr/AALLwavesENVEL.wgr';  {ulozim to do specialniho adresare}
      end;
    end;
    if savewhole then begin
      CreateDir('Rbps');
      CreateDir('Reqz');
      nazevAllbez := 'Rbps/AALLseism.bps';
      nazevAllvyr := 'Reqz/AALLequil.eqz';
    end;
    if saverdg then begin
      dots1 := 'Rrdg/' + '01.dat';
      dots2 := 'Rrdg/' + '02.dat';
      dots3 := 'Rrdg/' + '03.dat';
      dots4 := 'Rrdg/' + '04.dat';
      dots5 := 'Rrdg/' + '05.dat';
      dots6 := 'Rrdg/' + '06.dat';
      dots7 := 'Rrdg/' + '07.dat';
      dots8 := 'Rrdg/' + '08.dat';
      dotsPERcas := 'Rrdg/AAcas.dat';
      dotsPERcasBEZ1 := 'Rrdg/AAcasBEZ1.dat';
    end;
  end; {compon = 2}
  if compon = 3 then begin
    if savecorrected then begin
      CreateDir('Tcrr');
    end;
    if saverdg then begin
      CreateDir('Trdg');
      dotsALL := 'Trdg/AALLdots.dat';    {ulozim to do specialniho adresare}
    end;
    if batchdisperze then begin
      CreateDir('Tdsp');
      CreateDir('T-AALL');
      dispALLampli     := 'T-AALL/AALLdispAMPLI.dat';  {ulozim to do specialniho adresare}
      dispALLphase     := 'T-AALL/AALLdispPHASE.dat';  {ulozim to do specialniho adresare}
      dispALLphaseS    := 'T-AALL/AALLdispSELECT.dat'; {ulozim to do specialniho adresare}
      dispALLdiffgrvel := 'T-AALL/AALLdispDIFFGRVEL.dat'; {ulozim to do specialniho adresare}
      dispALLgroup     := 'T-AALL/AALLdispENVEL.dat';  {ulozim to do specialniho adresare}
      redsts    := 'T-AALL/red.sts';
      redlab    := 'T-AALL/red.lab';
      yellowsts := 'T-AALL/yellow.sts';
      yellowlab := 'T-AALL/yellow.lab';
      if savewave then begin
        CreateDir('Twgr');
        phaseALLstrg := 'Twgr/AALLwavesPHASE.wgr';  {ulozim to do specialniho adresare}
        groupALLstrg := 'Twgr/AALLwavesENVEL.wgr';  {ulozim to do specialniho adresare}
      end;
    end;
    if savewhole then begin
      CreateDir('Tbps');
      CreateDir('Teqz');
      nazevAllbez := 'Tbps/AALLseism.bps';
      nazevAllvyr := 'Teqz/AALLequil.eqz';
    end;
    if saverdg then begin
      dots1 := 'Trdg/' + '01.dat';
      dots2 := 'Trdg/' + '02.dat';
      dots3 := 'Trdg/' + '03.dat';
      dots4 := 'Trdg/' + '04.dat';
      dots5 := 'Trdg/' + '05.dat';
      dots6 := 'Trdg/' + '06.dat';
      dots7 := 'Trdg/' + '07.dat';
      dots8 := 'Trdg/' + '08.dat';
      dotsPERcas := 'Trdg/AAcas.dat';
      dotsPERcasBEZ1 := 'Trdg/AAcasBEZ1.dat';
    end;
  end; {compon = 3}
  if compon = 4 then begin
    if savecorrected then begin
      CreateDir('RZcrr');
    end;
    if saverdg then begin
      CreateDir('RZrdg');
      dotsALL := 'RZrdg/AALLdots.dat';    {ulozim to do specialniho adresare}
    end;
    if batchdisperze then begin
      CreateDir('RZdsp');
      CreateDir('RZ-AALL');
      dispALLampli     := 'RZ-AALL/AALLdispAMPLI.dat';  {ulozim to do specialniho adresare}
      dispALLphase     := 'RZ-AALL/AALLdispPHASE.dat';  {ulozim to do specialniho adresare}
      dispALLphaseS    := 'RZ-AALL/AALLdispSELECT.dat'; {ulozim to do specialniho adresare}
      dispALLdiffgrvel := 'RZ-AALL/AALLdispDIFFGRVEL.dat'; {ulozim to do specialniho adresare}
      dispALLgroup     := 'RZ-AALL/AALLdispENVEL.dat';  {ulozim to do specialniho adresare}
      redsts    := 'RZ-AALL/red.sts';
      redlab    := 'RZ-AALL/red.lab';
      yellowsts := 'RZ-AALL/yellow.sts';
      yellowlab := 'RZ-AALL/yellow.lab';
    end;
    if saverdg then begin
      dots1 := 'RZrdg/' + '01.dat';
      dots2 := 'RZrdg/' + '02.dat';
      dots3 := 'RZrdg/' + '03.dat';
      dots4 := 'RZrdg/' + '04.dat';
      dots5 := 'RZrdg/' + '05.dat';
      dots6 := 'RZrdg/' + '06.dat';
      dots7 := 'RZrdg/' + '07.dat';
      dots8 := 'RZrdg/' + '08.dat';
      dotsPERcas := 'RZrdg/AAcas.dat';
      dotsPERcasBEZ1 := 'RZrdg/AAcasBEZ1.dat';
    end;
  end; {compon = 4}
  if compon = 5 then begin
    if savecorrected then begin
      CreateDir('ZRcrr');
    end;
    if saverdg then begin
      CreateDir('ZRrdg');
      dotsALL := 'ZRrdg/AALLdots.dat';    {ulozim to do specialniho adresare}
    end;
    if batchdisperze then begin
      CreateDir('ZRdsp');
      CreateDir('ZR-AALL');
      dispALLampli     := 'ZR-AALL/AALLdispAMPLI.dat';  {ulozim to do specialniho adresare}
      dispALLphase     := 'ZR-AALL/AALLdispPHASE.dat';  {ulozim to do specialniho adresare}
      dispALLphaseS    := 'ZR-AALL/AALLdispSELECT.dat';  {ulozim to do specialniho adresare}
      dispALLdiffgrvel := 'ZR-AALL/AALLdispDIFFGRVEL.dat';  {ulozim to do specialniho adresare}
      dispALLgroup     := 'ZR-AALL/AALLdispGROUP.dat';  {ulozim to do specialniho adresare}
      redsts    := 'ZR-AALL/red.sts';
      redlab    := 'ZR-AALL/red.lab';
      yellowsts := 'ZR-AALL/yellow.sts';
      yellowlab := 'ZR-AALL/yellow.lab';
    end;
    if saverdg then begin
      dots1 := 'ZRrdg/' + '01.dat';
      dots2 := 'ZRrdg/' + '02.dat';
      dots3 := 'ZRrdg/' + '03.dat';
      dots4 := 'ZRrdg/' + '04.dat';
      dots5 := 'ZRrdg/' + '05.dat';
      dots6 := 'ZRrdg/' + '06.dat';
      dots7 := 'ZRrdg/' + '07.dat';
      dots8 := 'ZRrdg/' + '08.dat';
      dotsPERcas := 'ZRrdg/AAcas.dat';
      dotsPERcasBEZ1 := 'ZRrdg/AAcasBEZ1.dat';
    end;
  end; {compon = 5}
  if saverdg then begin
    assignfile(dispersionXdotALL, dotsALL);   {otevru soubor, kam budu slintat vsechny tecky ze vsech stanic - jen pro batch}
    rewrite(dispersionXdotALL);
    assignfile(dotsmax1, dots1);              {otevru soubor, kam budu slintat primarni tecky ze vsech stanic}
    rewrite(dotsmax1);
    assignfile(dotsmax2, dots2);              {otevru soubor, kam budu slintat sekundarni tecky ze vsech stanic}
    rewrite(dotsmax2);
    assignfile(dotsmax3, dots3);              {otevru soubor, kam budu slintat terciarni tecky ze vsech stanic}
    rewrite(dotsmax3);
    assignfile(dotsmax4, dots4);              {otevru soubor, kam budu slintat quarterni tecky ze vsech stanic}
    rewrite(dotsmax4);
    assignfile(dotsmax5, dots5);              {otevru soubor, kam budu slintat quinterni tecky ze vsech stanic}
    rewrite(dotsmax5);
    assignfile(dotsmax6, dots6);              {otevru soubor, kam budu slintat seste tecky ze vsech stanic}
    rewrite(dotsmax6);
    assignfile(dotsmax7, dots7);              {otevru soubor, kam budu slintat sedme tecky ze vsech stanic}
    rewrite(dotsmax7);
    assignfile(dotsmax8, dots8);              {otevru soubor, kam budu slintat osme tecky ze vsech stanic}
    rewrite(dotsmax8);
    assignfile(dotsmaxPERcas, dotsPERcas);    {otevru soubor, kam budu slintat tecky ze vsech stanic serazene podle periodu pro cas}
    rewrite(dotsmaxPERcas);
    assignfile(dotsmaxPERcasBEZ1, dotsPERcasBEZ1); {otevru soubor, kam budu slintat tecky ze vsech stanic serazene podle periody pro rychlost bez prvnich maxim}
    rewrite(dotsmaxPERcasBEZ1);
  end; {if saverdg}
  if batchdisperze then begin
    assignfile(ALLdispersionsAMPLI , dispALLampli ); {otevru soubor, kam budu slintat vsechny disperze ze vsech stanic}
    assignfile(ALLdispersionsPHASE , dispALLphase ); {otevru soubor, kam budu slintat vsechny disperze ze vsech stanic}
    assignfile(ALLdispersionsGROUP , dispALLgroup ); {otevru soubor, kam budu slintat vsechny disperze ze vsech stanic}
    assignfile(redstation, redsts);
    assignfile(redlabel, redlab);
    assignfile(yellowstation, yellowsts);
    assignfile(yellowlabel, yellowlab);
    rewrite(ALLdispersionsAMPLI);   {tady se to seka, kdyz zastavim batch a zase ho pustim, ten soubor se nejak nezavre a pak nejde znova otevrit nebo nevim}
    rewrite(ALLdispersionsPHASE);   {tady se to seka, kdyz zastavim batch a zase ho pustim, ten soubor se nejak nezavre a pak nejde znova otevrit nebo nevim}
    rewrite(ALLdispersionsGROUP);
    rewrite(redstation);
    rewrite(redlabel);
    rewrite(yellowstation);
    rewrite(yellowlabel);
  end;
  if savewave then begin
    assignfile(phaseALL, phaseALLstrg);
    assignfile(groupALL, groupALLstrg);
    rewrite(phaseALL);
    rewrite(groupALL);
  end;
  if savewhole then begin                {otevru soubory pro vsechny cele seismogramy}
    assignfile(aallbez, nazevAllbez);
    rewrite(aallbez);
    assignfile(aallvyr, nazevAllvyr);
    rewrite(aallvyr);
  end;
  if saverdg then begin
    if (corrbatchyes = False) then begin  {kdyz nemam korekci}
      writeln(dispersionXdotALL,'Station  epicdist    InstPeriod InstFrequency    PropagTime    GroupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax1,         'Station  epicdist    InstPeriod InstFrequency    PropagTime    GroupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax2,         'Station  epicdist    InstPeriod InstFrequency    PropagTime    GroupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax3,         'Station  epicdist    InstPeriod InstFrequency    PropagTime    GroupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax4,         'Station  epicdist    InstPeriod InstFrequency    PropagTime    GroupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax5,         'Station  epicdist    InstPeriod InstFrequency    PropagTime    GroupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax6,         'Station  epicdist    InstPeriod InstFrequency    PropagTime    GroupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax7,         'Station  epicdist    InstPeriod InstFrequency    PropagTime    GroupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax8,         'Station  epicdist    InstPeriod InstFrequency    PropagTime    GroupVeloc     Amplitude CentralPeriod');
    end;
    if corrbatchyes then begin            {kdyz mam korekci}
      writeln(dispersionXdotALL,'Station  epicdist    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax1,         'Station  epicdist    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax2,         'Station  epicdist    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax3,         'Station  epicdist    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax4,         'Station  epicdist    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax5,         'Station  epicdist    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax6,         'Station  epicdist    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax7,         'Station  epicdist    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc     Amplitude CentralPeriod');
      writeln(dotsmax8,         'Station  epicdist    InstPeriod CorrInstFrqnc CorrPropgTime CorrGrupVeloc     Amplitude CentralPeriod');
    end;
  end; {if saverdg}
  repeat
    NoSVALform.Refresh;
    application.ProcessMessages;
    if batchproces = False then begin  {pokud jsem to zastavil nasilne pri behu stisknutim Open file... , bude to zaporny a vyskoci to}
      jmenoposledniho := '';
      exit;
    end;
    assignfile(signal, sr.Name);
    jmenofilu := sr.Name;
    pocitadlofile := pocitadlofile + 1;
    str(pocitadlofile: 4, pocitadlofilestrg);
    zbatche := True;
    {odtud zacinam mackat cudliky  -----------------------------------  MACKANI CUDLIKU  ---------------------------------------------------}
    Button13Click(Sender);         {Open data file ...}
    if notvalidfile = false then begin     {pokud to je dobry soubor, pokracuju, tedy pokud neni, nic dal se neprovede a skocim na dalsi soubor, tedy efektivne znovu zmacku Button13Click}
      if batchbandpass then begin      {kdyz budu chtit delat batch processing analyzu na bandpass filtrovanych zaznamech}
        Button1Click(Sender);          {Analysis}
        Button8Click(Sender);          {Clear - maze PlotPanel pro vykresleni seismogramu}
        label41.Caption := jmenostanice;
        label41.Visible := True;
        Button6Click(Sender);          {Raw seism - soucasti tohoto je nalezeni prvniho nasazeni, ktere se ale v pripade pouziti doublebandpass premaze tim z toho prvniho bandpassu}
        if doublebandpass then begin {pokud to chci napred filtrovat abych nasel prvni nasazeni a pak az pouzit nejaky sirsi filtr}
          prvnidoublebandpass := True;          {aby to v bandpass procedurce nacetlo prvni rozmezi period}
          Button47Click(Sender);                {Bandpass - prvni kolo pro nejake uzsi nastaveni}
          Najdinasazeni(Sender, complfsre);     {zavolam procedurku na nalezeni prvniho nasazeni na kompletne filtrovanym signalu pro nejaky uzky obor period}
          prvnidoublebandpass := False;         {a pri dalsi zavolani bandpass procedurky nize to uz nacte druhou dvojici period}
        end; {if doublebandpass}
        Button47Click(Sender);                  {Bandpass - bud poprve pro obor nastaveny v hlavnim okne, anebo podruhe pro obor precteny z okna Batch inverze}
        RadioGroup5.ItemIndex := 1;             {ze chci pouzit filtrovany zaznam}
        RadioGroup5Click(Sender);               {vyber R / F - pustim procedurku s tim, ze jsem jako predtim kliknul na to, ze chci F, jako bandpass}
      end; {if batchbandpass}
      {tady to pusteni procedurky je dulezite, protoze JEN kdyz se pusti, tak se do toho pracovniho signalu nactu ten bandpass, a pokud byl predtim whitened, tak se tam nacte bandpass whitened}
      {pokud jsem tedy drive zadal, ze chci pouzit bandpass pro batch, tak se ten cudlik Analysis macka dvakrat}

      vynuceneukonceni := False;        {boolean vynuceneukonceni dela vlastne to same, jako booleand nenulovy, zkratka po Analysis si to pamatuje, jestli tam bylo neco spatne, a kdyz jo, tak to nepusti dal}
      Button1Click(Sender);             {Analysis ... v pripade batchbandpass uz ho mackam podruhe}
      if ((nenulovy = true) and (vynuceneukonceni = false)) then begin     {po Analysis mam vyhodnoceni, jestli jsou tam nenulove vzorky, pokud je to false, tak to dal nepokracuje}
        //if vynuceneukonceni then begin  {pokud se analyza ukoncila proto, ze nemam v pameti dost vzorku, nebo ze je interval rychlosti moc velky nebo proto, ze jsem se snazil sahnout mimo input file}
        //  jmenoposledniho := jmenofilu;
        //  pocitadlofile := pocitadlofile - 1;
        //  exit;
        //end;

        if batchbandpass = False then begin {kdyz nebudu pouzivat bandpass filtrovane, vymazu panel a namaluju RAW seismogram}
          {pokud pouzivam bandpass, tak uz jsem tyhle dve veci udelal pred chvili}
          memo1.Lines.Add(radekstrg + ' | - before ClearPlotPanel - seismogram');
          Button8Click(Sender);             {Clear - maze PlotPanel pro vykresleni seismogramu}
          memo1.Lines.Add(radekstrg + ' | - after ClearPlotPanel - seismogram');
          label41.Caption := jmenostanice;
          label41.Visible := True;
          Button6Click(Sender);             {Raw seism}
          memo1.Lines.Add(radekstrg + ' | - after plotting raw seismogram');
        end;

        if corrbatchyes then begin                {kdyz chci delat opravy na pristroj - nezavisle na tom to delam pro puvodni nebo bandpass filtrovany}
          Button21Click(Sender);                  {otevru okno se Spektrama, ani ne tak kvuli tomu obrazku okna, jako kvuli procedurkam, ktere si pri tom spousteji}
          instrument := KUKsensor;                {priradim hodnotu prectenou ze souboru s daty do promenne :instrument:, ktera vstupuje do nasledujici procedury}
          Spectrumform.Combobox2CloseUp(Sender);  {priradi patricne poly a nuly}
          {z toho prirazeni se sama zavola procedura Charakteristika, ktera spocte prenosovou funkci, takze tu tady volat nemusim}
          {a v te Charakteristika se take zahladi dlouhe periody, aby tam neprekazely prilis zesilene}
          if spektrayesno then begin              {kdyz chci kreslit spektra}
            Spectrumform.Button2Click(Sender);    {nakreslim puvodni spektrum - zlute}
            Spectrumform.Button18Click(Sender);   {nakreslim opravene spektrum - cervene}
          end;
          Spectrumform.Button21Click(Sender);     {Filter Corr - ten uz sam namaluje opraveny zaznam zelene}
          if savewhole then begin                 {pokud chci ukladat cely seismogram v batch}
            Button12Click(Sender);                {Corr seism - vypocte obalku corrected seismogramu a namaluje ji}
            Button2Click(Sender);                 {vypocte zhlazenou obalku - k tomu je potreba mit tu povodni, coz dela cudlik :Corr seism: vyse}
            Button56Click(Sender);                {namaluje zaznam vyrovnany tou zhlazenou obalkou}
          end;
          {takze tady mam bud puvodni nebo bandpass filtrovany, bud puvodni nebo whitened, mam ho corrected a mam vyrovnane amplitudy}
          {a ted jde o to, co ulozim}
          {v promenne :vyrovnany: mam ten bandpass vyrovnany zhlazenou obalkou}
          {v promenne :CorrSRe: mam ten bandpass ale nevyrovnany}
          Button15Click(Sender);                  {SvRc - ukladani seismogramu, v tomto pripade to ulozi bandpass filtrovany a jeste na pristroj opraveny seismogram}
        end; {if corrbatchyes}

        if demoyes then begin       {maluje monochromaticky signal pro periodu uprostred spektra, jen pro demonstracni ucely, nic se z toho nepocita}
          PlotPanel1.ClearData;     {mazu panel pro monochromy}
          ComboBox1CloseUp(Sender); {vybrani periody}
          Button3Click(Sender);     {maluju monochromaticky signal obalku}
          Button5Click(Sender);     {maluju truncated monochromaticky signal a obalku}
        end;

        {resim, kolik maxim budu kreslit na monitor}
        if kolikjichchci = 1 then begin
          Button17Click(Sender);  {Prim}
        end;
        if kolikjichchci = 2 then begin
          Button17Click(Sender);  {Prim}
          Button16Click(Sender);  {Sec}
        end;
        if kolikjichchci = 3 then begin
          Button17Click(Sender);  {Prim}
          Button16Click(Sender);  {Sec}
          Button36Click(Sender);  {Ter}
        end;
        if kolikjichchci = 4 then begin
          Button17Click(Sender);  {Prim}
          Button16Click(Sender);  {Sec}
          Button36Click(Sender);  {Ter}
          Button37Click(Sender);  {Quar}
        end;
        if kolikjichchci = 5 then begin
          Button17Click(Sender);  {Prim}
          Button16Click(Sender);  {Sec}
          Button36Click(Sender);  {Ter}
          Button37Click(Sender);  {Quar}
          Button40Click(Sender);  {Quint}
        end;
        if kolikjichchci = 6 then begin {mam zvoleno, ze chci kreslit automaticky vybranou disperzni krivku, a zaroven budu kontrolovat, jestli kazda dalsi neni moc mimo prumer}
          memo1.Lines.Add(radekstrg + ' | - before HideLayer');
          PlotPanel3.HideLayer(1000);   {fixni vrstva, protoze ji porad dokola schovavam a maluju}
          with PlotPanel3 do begin
            LayerOptions(1000, pmDot, 5);
          end;
          jeblba := False;
          for jiji := 1 to nflt do begin {cyklus pres filtry}
            if pocitadlofile > 1 then begin
              if ((batchinstper[jiji] > mindevper) and (batchinstper[jiji] < maxdevper)) then begin {pokud je perioda prumerne krivky mezi hodnotami, ktere me zajimaji}
                if ((abs(grvel[locmx[jiji]] - batchgrvel[jiji])) > (batchgrvel[jiji] * (odchylka / 100))) then begin        {pokud se nova disperze lisi od prumeru o vic nez 5 procent pro jakykoli bod}
                  jeblba := True;    {tedy pokud to najde aspon jeden filtr, kde je to blby, bude stanice oznacena jako blba}
                end;
              end; {if jsem v rozmezi}
            end; {if je to druha a dalsi stanice}
          end; {for jiji}
          if jeblba = True then begin {pokud je blba, zapamatuju si jeji jmeno}
            pocetblbejch := pocetblbejch + 1;
            blbyjmeno[pocetblbejch] := jmenostanice;
          end; {if jeblba = true}
          if jeblba = False then begin {pokud je dobra, prictu ji do prumeru - prvni stanici sem nactu tak jako tak, prvni musi byt proste dobra}
            memo1.Lines.Add(radekstrg + ' | - pred malovanim prumerne disperze');
            for jiji := 1 to nflt do begin {cyklus pres filtry}
              batchinstper[jiji] :=  ((batchinstper[jiji] * (pocitadlofile - 1)) + instper[jiji, locmx[jiji]]) / pocitadlofile;   {budu si sem nacitat hodnoty period a udelam prumer i s pridanim kazde dalsi}
              batchgrvel[jiji]   :=  ((batchgrvel[jiji]   * (pocitadlofile - 1)) + grvel[locmx[jiji]])         / pocitadlofile;   {nacitam si hodnoty rychlosti}
              if (batchinstper[jiji] > PlotPanel3.XMin) and (batchinstper[jiji] < PlotPanel3.XMax) and (batchgrvel[jiji] > PlotPanel3.YMin) and (batchgrvel[jiji] < PlotPanel3.YMax) then begin
                PlotPanel3.AddXY((batchinstper[jiji]), batchgrvel[jiji], RGB(255, 155, 155), 1000);    {namaluju tu prumernou}
              end;
            end;
            memo1.Lines.Add(radekstrg + ' | - po malovani prumerne disperze');
          end; {if jeblba = false}
          if superbatchyesno then begin
            Button9Click(Sender);   {mazu spektrogramovy plotpanel,tedy smazu predchozi disperzni krivku}
          end;
          memo1.Lines.Add(radekstrg + ' | - pred malovanim aktualni disperze');
          Button11Click(Sender);    {Dispersion - namaluju automaticky vybranou disperzni krivku}
          memo1.Lines.Add(radekstrg + ' | - po malovani aktualni disperze');
        end; {if kolikjichchci = 6}
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - before CloseUp');
        posilamnacombo2 := True;    {odsud uz je to stejne pro analyzu RAW jako i pro analyzu CORR}
        offirst := instper[1, locmx[1]];    {zadam, ze chci vybrat prvni filtr jako minimalni periodu pro ukladani}
        ComboBox2CloseUp(Sender);
        posilamnacombo3 := True;
        oflast := instper[nflt, locmx[nflt]];
        if (oflast > (period[nflt] * 3)) then oflast := instper[nflt - 1, locmx[nflt - 1]]; {kdyz je okamzita perioda posledniho filtru nesmyslne velika, da to tam tu predchozi}
        ComboBox3CloseUp(Sender);
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - the first and the last period selected');
        Vyrobjmeno;      {vytvori ruzna jmena pro ruzne soubory, jmeno je v promenne "jmenouloz"}
        if savewave then begin
          Button34Click(Sender); {create and plot selected wavegroup}
        end;
        Button19Click(Sender);   {Save disp}
        radek := radek + 1;
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - Save disp button pressed');
        if harmoniky = True then begin
          Ulozharmoniku;   {spoustim proceduru na ulozeni souboru *.hrm, ale protoze ji potrebuju nekdy pouzit i odjinud, mam ji oddelene}
        end; {if harmoniky}

        if yesno then begin {pokud jsem si na zacatku zvolil interaktivni mod, zepta se to, jestli chci pokracovat}
          if MessageDlg('Is it OK?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
            jmenoposledniho := jmenofilu;   {ulozim si jmeno souboru, po jehoz cteni jsem to ukoncil}
            exit; {kdyz zmackno No, tak se batch processing prerusi}
          end;
        end;
        {tady mam ulozeny hrm soubor pro danou slozku a pokud delam POLAR, tak se ted musi spustit to same jeste pro tu druhou horizontalu ze STEJNEHO souboru}
        if POLAR then begin
          if POLARflip = False then begin {pokud jsem v rezimu POLAR, ale delal jsem zatim jen prvni slozku, tedy POLARflip je false}
            POLARflip := True;            {prepnu ho, protoze v dalsim behu delam tu druhou slozku}
            Switchpolar(Sender);          {a pustim analyzu te druhe slozky - na jejim konci ale musim ten POLARflip zase prepnout do false}
          end;
          if POLARflipZT = False and (compon = 1) then begin {pokud jsem v rezimu POLAR, ale delal jsem zatim jen prvni a druhou slozku, tedy POLARflipZT je false}
            POLARflipZT := True;            {prepnu ho, protoze v dalsim behu delam tu treti slozku}
            Switchpolar(Sender);          {a pustim analyzu te treti slozky - na jejim konci ale musim ten POLARflipZT zase prepnout do false}
          end;
        end; {POLAR}
      end; {if tem nebyly same nuly}
    end; {if to bylo dobre jmeno souboru}
  until FindNext(sr) <> 0;
  FindClose(sr);
  //  closefile(logik);

  {----------------- tedy ma projete jednotlive stanice -----------------}

  {ulozim si prumernou disperzi ze vsech}
  if batchdisperze then begin   {delam jen kdyz jsem zamerne zvolil, ze CHCI ukladat disperzi i v Batchi}
    if compon = 1 then begin
      assignfile(averbatchdispfile,'Z-AALL/averagedispfile.dat');
    end;
    if compon = 2 then begin
      assignfile(averbatchdispfile,'R-AALL/averagedispfile.dat');
    end;
    if compon = 3 then begin
      assignfile(averbatchdispfile,'T-AALL/averagedispfile.dat');
    end;
    rewrite(averbatchdispfile);
    for jiji := 1 to nflt do begin
      writeln(averbatchdispfile, batchinstper[jiji]:14:4 , batchgrvel[jiji]:14:4 );
    end;
    closefile(averbatchdispfile);
  end;

  {preberu zeropositions}
  mindistkm := 1000000;
  maxdistkm := 0;
  for k := 1 to pocitadlofile do begin {zjistim maximalni a minimalni epicentralni vzdalenost}
    if KUKdistkmStation[k] >= maxdistkm then maxdistkm := KUKdistkmStation[k];
    if KUKdistkmStation[k] <= mindistkm then mindistkm := KUKdistkmStation[k];
  end;
  centraldistkm := (maxdistkm + mindistkm) / 2;
  closestkm := 100000;
  for k := 1 to pocitadlofile do begin {zjistim maximalni a minimalni epicentralni vzdalenost}
    if abs(KUKdistkmStation[k] - centraldistkm) < closestkm then begin
      closestkm := abs(KUKdistkmStation[k] - centraldistkm); {vzdalenost nejblizsi stanice od prostredni vzdalenosti centraldistkm}
      indexclosest := k; {index stanice nejbliz k prostredni vzdalenosti}
    end;
  end;

  str(centraldistkm:11:4, centraldistkmstrg);
  str(KUKdistkmStation[indexclosest]:11:4, KUKdistkmStationstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - central distance: ' + centraldistkmstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - central station: ' + druhyradekstrgStation[indexclosest]);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - central epicentral: ' + KUKdistkmStationstrg);

  {pro kazdy filtr j pro tu centralni stanici s indexem indexclosest zjistim, jestli je bliz k maximu grupy ta zeroposition 1 nebo 2}
  {jednicku uz mam nactenou v te vysledne, takze jen zkontroluju, jestli je dvojka bliz, a kdyz jo, tak ji vymenim v te vysledne}
  for j := 1 to nflt do begin
  //  if abs(SVALtime[zeropositionStation2[j,indexclosest]] - SVALtimeStation[j, indexclosest]) <
  //     abs(SVALtime[zeropositionStation1[j,indexclosest]] - SVALtimeStation[j, indexclosest]) then  zeropositionStation[j,indexclosest] := zeropositionStation2[j,indexclosest];
    centralphasevel[j] := KUKdistkmStation[indexclosest]  / SVALtime[zeropositionStation[j,indexclosest]]; {fazova rychlost pro tu centralni stanici}
  end;

  {z tech pruchodu 1 a 2 pro tu centralni stanici vyberu takovy, aby to utvorilo hladkou disperzni krivku, zacnu od te optimalni periody nekde uprostred
   a pojedu na obe strany kriteriem kontinuity, stejne jako kdyz kompiluju grupovou krivku}
  for j := selectedindex to nflt - 1 do begin {od zvoleneho filtru projedu filtry nahoru}
    if (abs(SVALtime[zeropositionStation2[j+1,indexclosest]] - SVALtime[zeropositionStation[j,indexclosest]]) < abs(SVALtime[zeropositionStation1[j+1,indexclosest]] - SVALtime[zeropositionStation[j,indexclosest]])) then begin {pokud je osme maximum bliz nez primarni}
      zeropositionStation[j+1,indexclosest] := zeropositionStation2[j+1,indexclosest];
      centralphasevel[j+1] := KUKdistkmStation[indexclosest]  / SVALtime[zeropositionStation[j+1,indexclosest]]; {fazova rychlost pro tu centralni stanici}
    end; {if}
    if (abs(SVALtime[zeropositionStation1[j+1,indexclosest]] - SVALtime[zeropositionStation[j,indexclosest]]) < abs(SVALtime[zeropositionStation2[j+1,indexclosest]] - SVALtime[zeropositionStation[j,indexclosest]])) then begin {pokud je osme maximum bliz nez primarni}
      zeropositionStation[j+1,indexclosest] := zeropositionStation1[j+1,indexclosest];
      centralphasevel[j+1] := KUKdistkmStation[indexclosest]  / SVALtime[zeropositionStation[j+1,indexclosest]]; {fazova rychlost pro tu centralni stanici}
    end; {if}
  end; {j - nahoru}
  for j := selectedindex downto 2 do begin {od zvoleneho filtru projedu filtry dolu}
    if (abs(SVALtime[zeropositionStation2[j-1,indexclosest]] - SVALtime[zeropositionStation[j,indexclosest]]) < abs(SVALtime[zeropositionStation1[j-1,indexclosest]] - SVALtime[zeropositionStation[j,indexclosest]])) then begin {pokud je osme maximum bliz nez primarni}
      zeropositionStation[j-1,indexclosest] := zeropositionStation2[j-1,indexclosest];
      centralphasevel[j-1] := KUKdistkmStation[indexclosest]  / SVALtime[zeropositionStation[j-1,indexclosest]]; {fazova rychlost pro tu centralni stanici}
    end; {if}
    if (abs(SVALtime[zeropositionStation1[j-1,indexclosest]] - SVALtime[zeropositionStation[j,indexclosest]]) < abs(SVALtime[zeropositionStation2[j-1,indexclosest]] - SVALtime[zeropositionStation[j,indexclosest]])) then begin {pokud je osme maximum bliz nez primarni}
      zeropositionStation[j-1,indexclosest] := zeropositionStation1[j-1,indexclosest];
      centralphasevel[j-1] := KUKdistkmStation[indexclosest]  / SVALtime[zeropositionStation[j-1,indexclosest]]; {fazova rychlost pro tu centralni stanici}
    end; {if}
  end;

  {tady namaluju tu disperzi na te centralni stanici, nema to vyznam rychlosti v absolutnich hodnotach, ale melo by to byt hladke}
  pp3 := pp3 + 1;
  with PlotPanel3 do begin
    LayerOptions(pp3, pmDot, 5);
  end;
  for j := 1 to nflt do begin
    PlotPanel3.AddXY((instper[j, locmx[j]]), centralphasevel[j], RGB(100, 100, 255), pp3);
  end;

  {a ted na kazde stanici najdu zeroposition, ktera je nejbliz te rychlosti cetralphasevel a udelam to pro kazdy filtr zvlast}
  for k := 1 to pocitadlofile do begin
    for j := 1 to nflt do begin
      {rozhodnu mezi 1 a 2}
      if abs((KUKdistkmStation[k]/centralphasevel[j]) - SVALtime[zeropositionStation2[j,k]]) <
         abs((KUKdistkmStation[k]/centralphasevel[j]) - SVALtime[zeropositionStation[j,k]] ) then zeropositionStation[j,k] := zeropositionStation2[j,k];
      if abs((KUKdistkmStation[k]/centralphasevel[j]) - SVALtime[zeropositionStation1[j,k]]) <
         abs((KUKdistkmStation[k]/centralphasevel[j]) - SVALtime[zeropositionStation[j,k]] ) then zeropositionStation[j,k] := zeropositionStation1[j,k];
      {zkontroluju 3}
      if abs((KUKdistkmStation[k]/centralphasevel[j]) - SVALtime[zeropositionStation3[j,k]]) <
         abs((KUKdistkmStation[k]/centralphasevel[j]) - SVALtime[zeropositionStation[j,k]] ) then zeropositionStation[j,k] := zeropositionStation3[j,k];
      {zkontroluju 4}
      if abs((KUKdistkmStation[k]/centralphasevel[j]) - SVALtime[zeropositionStation4[j,k]]) <
         abs((KUKdistkmStation[k]/centralphasevel[j]) - SVALtime[zeropositionStation[j,k]] ) then zeropositionStation[j,k] := zeropositionStation4[j,k];
    end; {j}
  end; {k}

  assignfile(ALLdispersionsSELECT, dispALLphaseS); {otevru soubor, kam budu slintat vsechny disperze ze vsech stanic vybrane touto novou metodou}
  rewrite(ALLdispersionsSELECT);
  write(ALLdispersionsSELECT, '    1         2         3'); {prvni radek}
  for j := inverindexf to inverindexl do begin              {zapise to cisla filtru plus 3 do prvniho radku}
    write(ALLdispersionsSELECT,(j+3):8);
  end;
  writeln(ALLdispersionsSELECT);                            {a odradkuju dal}
  write(ALLdispersionsSELECT, 'stati      Long      Lati'); {druhy radek}
  for j := inverindexf to inverindexl do begin              {zapise to cisla filtru do prvniho radku}
    write(ALLdispersionsSELECT, period[j]: 8: 3);           {hlavicka pro soubor s disperzema - pokracovani prvniho radku}
  end;
  writeln(ALLdispersionsSELECT);                            {a odradkuju dal}
  for k := 1 to pocitadlofile do begin
    write(ALLdispersionsSELECT, druhyradekstrgStation[k]: 5, KUKlonStation[k]: 10: 4, KUKlatStation[k]: 10: 4); {do tretiho (a vsech dalsich) radku zapisu jmeno stanice a jeji souradnice}
    for j := inverindexf to inverindexl do begin
      write(ALLdispersionsSELECT, SVALtime[zeropositionStation[j,k]]:8:2);    {tady zapisu fazovy cas}
    end;
    writeln(ALLdispersionsSELECT);                                        {a odradkuju dal}
  end; {k}
  closefile(ALLdispersionsSELECT);    {zavru soubor se vsema disperzema ze vsech stanic}

  {ulozim soubor, kde budou rozdily grupovych rychlosti k prumerne grupove rychlosti}
  assignfile(ALLdispersionsDIFFGRVEL, dispALLdiffgrvel); {otevru soubor, kam budu slintat vsechny disperze ze vsech stanic vybrane touto novou metodou}
  rewrite(ALLdispersionsDIFFGRVEL);
  write(ALLdispersionsDIFFGRVEL, '    1         2         3'); {prvni radek}
  for j := inverindexf to inverindexl do begin              {zapise to cisla filtru plus 3 do prvniho radku}
    write(ALLdispersionsDIFFGRVEL,(j+3):8);
  end;
  writeln(ALLdispersionsDIFFGRVEL);                            {a odradkuju dal}
  write(ALLdispersionsDIFFGRVEL, 'stati      Long      Lati'); {druhy radek}
  for j := inverindexf to inverindexl do begin              {zapise to cisla filtru do prvniho radku}
    write(ALLdispersionsDIFFGRVEL, period[j]: 8: 3);           {hlavicka pro soubor s disperzema - pokracovani prvniho radku}
  end;
  writeln(ALLdispersionsDIFFGRVEL);                            {a odradkuju dal}
  for k := 1 to pocitadlofile do begin
    write(ALLdispersionsDIFFGRVEL, druhyradekstrgStation[k]: 5, KUKlonStation[k]: 10: 4, KUKlatStation[k]: 10: 4); {do tretiho (a vsech dalsich) radku zapisu jmeno stanice a jeji souradnice}
    for j := inverindexf to inverindexl do begin
      write(ALLdispersionsDIFFGRVEL, (grvelStation[j,k]-batchgrvel[j]):8:4);    {tady zapisu rozdil te namerene grupovky k prumerne grupovce}
      // MODIFY for homogeneous velocity:
      //write(ALLdispersionsDIFFGRVEL, (grvelStation[j,k] - 0.53 ):8:4);    {tady zapisu rozdil te namerene grupovky k zadane homogenni grupovce, pouzivam pro OMV X-corss od Sven}
    end;
    writeln(ALLdispersionsDIFFGRVEL);                                        {a odradkuju dal}
  end; {k}
  closefile(ALLdispersionsDIFFGRVEL);    {zavru soubor se vsema disperzema ze vsech stanic}

  if batchdisperze then begin
    closefile(ALLdispersionsAMPLI);    {zavru soubor se vsema disperzema ze vsech stanic}
    closefile(ALLdispersionsPHASE);    {zavru soubor se vsema disperzema ze vsech stanic}
    closefile(ALLdispersionsGROUP);    {zavru soubor se vsema disperzema ze vsech stanic}
    closefile(redstation);
    closefile(redlabel);
    closefile(yellowstation);
    closefile(yellowlabel);
  end;
  if saverdg then begin
    closefile(dispersionXdotALL); {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmax1);          {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmax2);          {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmax3);          {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmax4);          {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmax5);          {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmax6);          {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmax7);          {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmax8);          {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmaxPERcas);     {zavru soubor se vsema teckama ze vsech stanic}
    closefile(dotsmaxPERcasBEZ1);
    {zavru soubor se vsema teckama ze vsech stanic bez prvniho maxima}
  end; {if saverdg}
  if savewave then begin
    closefile(phaseALL);
    closefile(groupALL);
  end;
  if savewhole then begin
    closefile(aallbez);
    closefile(aallvyr);
  end;
  logiksezavrel := True;  {kdyz se tady sam zavre ten soubor, tak je to true a to pouziju, abych ho nezaviral znova, kdyz zmacknu Open file ...}
  str(pocetblbejch: 4, pocetblbejchstrg);
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - number of wrong dispersions: ' + pocetblbejchstrg);
  for ii := 1 to pocetblbejch do begin
    memo1.Lines.Add(radekstrg + ' | - ' + blbyjmeno[ii]);    {vypisu jmena tech, co se moc lisily}
  end;
  radek := radek + 1;
  str(radek: 4, radekstrg);
  memo1.Lines.Add(radekstrg + ' | - SVAL batch processing finished, ' + pocitadlofilestrg + ' files were processed');
  pocitadlofile := 0;
  partdir := '';
  partpocitad := '';
end; {konec batch processingu - procedura Davka}

procedure TNoSVALform.Switchpolar(Sender: TObject);
begin
  Button1Click(Sender);         {Analysis}
  Button6Click(Sender);         {Raw seism}
  if demoyes then begin         {maluje monochromaticky signal pro periodu uprostred spektra, jen pro demonstracni ucely, nic se z toho nepocita}
    ComboBox1CloseUp(Sender);   {vybrani periody}
    Button3Click(Sender);       {maluju monochromaticky signal a obalku}
    Button5Click(Sender);       {maluju truncated monochromaticky signal a obalku}
  end;
  posilamnacombo2 := True;
  {odsud uz je to stejne pro analyzu RAW jako i pro analyzu CORR}
  offirst := instper[1, locmx[1]];
  {zadam, ze chci vybrat prvni filtr jako minimalni periodu pro ukladani}
  ComboBox2CloseUp(Sender);
  posilamnacombo3 := True;
  oflast := instper[nflt, locmx[nflt]];
  if (oflast > (period[nflt] * 3)) then
    oflast := instper[nflt - 1, locmx[nflt - 1]];
  {kdyz je okamzita perioda posledniho filtru nesmyslne velika, da to tam tu predchozi}
  ComboBox3CloseUp(Sender);
  if harmoniky = True then begin {jsem v POLAR POLAR POLAR}
    Ulozharmoniku;   {spoustim proceduru na ulozeni souboru *.hrm, ale protoze ji potrebuju nekdy pouzit i odjinud, mam ji oddelene}
  end; {if harmoniky}
  POLARflip   := False;
  if compon = 1 then begin {pokud jsem delal POLAR pro Z, tedy chci vyrezat vsechny 3 komponenty}
    POLARflipZT := False;
  end;
  {to bylo posledni, co jsem potreboval udelat pro druhou slozku, takze prepinam na false, aby pro dalsi stanici to delalo zase tu prvni}
end;

procedure TNoSVALform.Vsechnytri(Sender: TObject);
var
  eventlog          : textfile;
  kolikatysuperstrg : string;
  kompa             : string[14];
  skippedfilestrg   : string;
begin {tato procedura je volana z procedury Zbatchokna a rozhodne, jestli prenastavi nebo neprenastavi komponentu, a pusti proceduru Davka}
  if allthreeyes = false then begin                 {pokud zpracovavam jenom jednu komponentu, jen to pusti Davka, a nic jineho to neudela}
    if superbatchyesno = False then begin           {nemam SuperBatch}
      Davka(Sender);                                {pustim Batch}
    end;
    if superbatchyesno = True then begin            {mam SuperBatch}
      assignfile(eventlog,supercesta+'eventlog.txt');
      rewrite(eventlog);
      writeln(eventlog,'   #  folder                             Component    FFTsamples NumOfStations    YellowStat       RedStat   SkippedFile');
      repeat
        kolikatysuper := kolikatysuper + 1;         {posunu pocitadlo adresaru o jednicku dal}
        str(kolikatysuper: 4, kolikatysuperstrg);
        BatchForm.Caption := '     SuperBatch: event # ' + kolikatysuperstrg;
        cesta := supercesta + adresar[kolikatysuper] + '/' + adresar[kolikatysuper] + '/';
        skippedfile := 0;
        skippedfilestrg := '              ';
        eventstations := 0;
        yellowstationN := 0;
        redstationN := 0;
        Davka(Sender);                              {poustim Batch opakovane dokud nedosahnu vsech adresaru}
        radek := radek + 1;                         {napisu, ze skoncilo zpracovani vsech tri komponent}
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - one component for all stations of one event were processed');
        if kolikatysuper < nacetadresaru then begin {kdyz to jeste neni posledni}
          radek := radek + 1;
          str(radek: 4, radekstrg);
          memo1.Lines.Add(radekstrg + ' | - going to next event');
        end; {kdyz to jeste nebyl posledni}
        if compon = 1 then kompa := '             Z';
        if compon = 2 then kompa := '             R';
        if compon = 3 then kompa := '             T';
        if skippedfile > 0 then str(skippedfile:14, skippedfilestrg);
        writeln(eventlog, kolikatysuper:4, '  ', supercesta + adresar[kolikatysuper], kompa, n:14, eventstations:14, yellowstationN:14, redstationN:14, skippedfilestrg);        {tady zapisu do log souboru udaje pro jednotlive jevy}
      until kolikatysuper = nacetadresaru;          {nacetadresaru je fixni cislo, kolik jich chci udelat, a kolikatysuper se meni podle toho, kolik jsem jich uz fakt udelal}
      closefile(eventlog);
      if kolikatysuper = nacetadresaru then begin   {kdyz uz jsem je udelal vsechny adresare}
        exit;                                       {skoncim}
      end;
    end; {if SuperBatch}
  end; {pro jednu komponentu}

  if allthreeyes = true then begin                  {v Zbatchokna mam zajisteno, ze na zacatku budu mit dycky komponentu Z}
    if superbatchyesno = False then begin           {pokud jsem NEmel SuperBatch}
      Form2.RadioGroup2.ItemIndex := 0;             {udelam dycky Z}
      Form2.Runsval(Sender);                        {zmacknu cudlik Run SVAL}
      Davka(Sender);                                {pustim Batch - tedy pobezi pro Z}
      Form2.RadioGroup2.ItemIndex := 1;             {udelam z toho R}
      Form2.Runsval(Sender);                        {zmacknu cudlik Run SVAL}
      Davka(Sender);                                {a pustim znova Batch - tedy pobezi pro R}
      Form2.RadioGroup2.ItemIndex := 2;             {udelam z toho T}
      Form2.Runsval(Sender);                        {zmacknu cudlik Run SVAL}
      Davka(Sender);                                {a pustim znova Batch - tedy pobezi pro T}
      radek := radek + 1;                           {napisu, ze skoncilo zpracovani vsech tri komponent}
      str(radek: 4, radekstrg);
      memo1.Lines.Add(radekstrg + ' | - all three components for one event were processed');
      exit;                                         {a skoncim, protoze po T uz nic neni}
    end;                                            {kdyz nemam SuperBatch}
    if superbatchyesno = True then begin            {kdyz mam SuperBatch}
      assignfile(eventlog,supercesta+'eventlog.txt');
      rewrite(eventlog);
      writeln(eventlog,'   #  folder                             Component    FFTsamples NumOfStations    YellowStat       RedStat   SkippedFile');
      repeat
        kolikatysuper := kolikatysuper + 1;           {posunu pocitadlo adresaru o jednicku dal}
        str(kolikatysuper: 4, kolikatysuperstrg);
        BatchForm.Caption := '     SuperBatch: event # ' + kolikatysuperstrg;
        cesta := supercesta + adresar[kolikatysuper] + '/' + adresar[kolikatysuper] + '/';

        Form2.RadioGroup2.ItemIndex := 0;           {udelam dycky Z}
        Form2.Runsval(Sender);                      {zmacknu cudlik Run SVAL}
        skippedfile := 0;
        skippedfilestrg := '              ';
        eventstations := 0;
        yellowstationN := 0;
        redstationN := 0;
        Davka(Sender);                              {pustim Batch - tedy pobezi pro Z}
        if skippedfile > 0 then str(skippedfile:14, skippedfilestrg);
        writeln(eventlog, kolikatysuper:4, '  ', supercesta + adresar[kolikatysuper], '             Z', n:14, eventstations:14, yellowstationN:14, redstationN:14, skippedfilestrg);                {tady zapisu do log souboru udaje pro jednotlive jevy}

        Form2.RadioGroup2.ItemIndex := 1;           {udelam z toho R}
        Form2.Runsval(Sender);                      {zmacknu cudlik Run SVAL}
        skippedfile := 0;
        skippedfilestrg := '              ';
        eventstations := 0;
        yellowstationN := 0;
        redstationN := 0;
        Davka(Sender);                              {a pustim znova Batch - tedy pobezi pro R}
        if skippedfile > 0 then str(skippedfile:14, skippedfilestrg);
        writeln(eventlog, kolikatysuper:4, '  ', supercesta + adresar[kolikatysuper], '             R', n:14, eventstations:14, yellowstationN:14, redstationN:14, skippedfilestrg);                {tady zapisu do log souboru udaje pro jednotlive jevy}

        Form2.RadioGroup2.ItemIndex := 2;           {udelam z toho T}
        Form2.Runsval(Sender);                      {zmacknu cudlik Run SVAL}
        skippedfile := 0;
        skippedfilestrg := '              ';
        eventstations := 0;
        yellowstationN := 0;
        redstationN := 0;
        Davka(Sender);                              {a pustim znova Batch - tedy pobezi pro T}
        if skippedfile > 0 then str(skippedfile:14, skippedfilestrg);
        writeln(eventlog, kolikatysuper:4, '  ', supercesta + adresar[kolikatysuper], '             T', n:14, eventstations:14, yellowstationN:14, redstationN:14, skippedfilestrg);                {tady zapisu do log souboru udaje pro jednotlive jevy}

        radek := radek + 1;                         {napisu, ze skoncilo zpracovani vsech tri komponent}
        str(radek: 4, radekstrg);
        memo1.Lines.Add(radekstrg + ' | - all three components for all stations of one event were processed');
        if kolikatysuper < nacetadresaru then begin {kdyz to jeste neni posledni}
          radek := radek + 1;
          str(radek: 4, radekstrg);
          memo1.Lines.Add(radekstrg + ' | - going to next event');
        end; {kdyz to jeste nebyl posledni}
      until kolikatysuper = nacetadresaru;          {nacetadresaru je fixni cislo, kolik jich chci udelat, a kolikatysuper se meni podle toho, kolik jsem jich uz fakt udelal}
      closefile(eventlog);
      if kolikatysuper = nacetadresaru then begin   {kdyz uz jsem je udelal vsechny adresare}
        exit;                                       {skoncim}
      end;
    end; {if SuperBatch}
  end; {if allthreeyes = true}

end; {procedury Vsechnytri}


procedure TNoSVALform.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked = True then
  begin
    removeoffset := True;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - removing of the offset is enabled');
  end;
  if CheckBox5.Checked = False then
  begin
    removeoffset := False;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - removing of the offset is disabled');
  end;
end;

procedure TNoSVALform.CheckBox6Click(Sender: TObject);
begin
  if CheckBox6.Checked = True then
  begin
    alphacheck := True;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - checking of the alpha coefficient is enabled');
  end;
  if CheckBox6.Checked = False then
  begin
    alphacheck := False;
    radek := radek + 1;
    str(radek: 4, radekstrg);
    memo1.Lines.Add(radekstrg + ' | - checking of the alpha coefficient is disabled');
  end;
end;

procedure TNoSVALform.Button30Click(Sender: TObject);
begin                           { << left resizing // resizing right >> }
  if puvodno = True then
  begin {kdyz chci menit pravy PlotPanel}
    puvodno := False;
    PlotPanel3.Anchors := [akLeft, akTop, akBottom]; {levy}
    PlotPanel4.Anchors := [akLeft, akTop, akRight, akBottom]; {pravy}
    Button17.Anchors := [akLeft, akTop];
    Button16.Anchors := [akLeft, akTop];
    Button27.Anchors := [akLeft, akTop];
    Label19.Anchors := [akLeft, akTop];
    ComboBox2.Anchors := [akLeft, akTop];
    Button22.Anchors := [akLeft, akTop];
    Button36.Anchors := [akLeft, akTop];
    Button37.Anchors := [akLeft, akTop];
    Button20.Anchors := [akLeft, akTop];
    Label22.Anchors := [akLeft, akTop];
    ComboBox3.Anchors := [akLeft, akTop];
    Button25.Anchors := [akLeft, akTop];
    Button40.Anchors := [akLeft, akTop];
    button50.Anchors := [akLeft, akTop];
    button51.Anchors := [akLeft, akTop];
    button52.Anchors := [akLeft, akTop];
    Button41.Anchors := [akLeft, akTop];
    Label18.Anchors := [akLeft, akTop];
    Edit12.Anchors := [akLeft, akTop];
    Label39.Anchors := [akLeft, akTop];
    CheckBox4.Anchors := [akLeft, akTop];
    Button28.Anchors := [akLeft, akTop];
    Button11.Anchors := [akLeft, akTop];
    Button53.Anchors := [akLeft, akTop];
    Button54.Anchors := [akLeft, akTop];
    Button55.Anchors := [akLeft, akTop];
    Button19.Anchors := [akLeft, akTop];
    Label28.Anchors := [akLeft, akTop];
    Edit15.Anchors := [akLeft, akTop];
    Label30.Anchors := [akLeft, akTop];
    Button26.Anchors := [akLeft, akTop];
    Button30.Anchors := [akLeft, akTop]; {to je ten, kterym se to meni}
    Label23.Anchors := [akLeft, akTop];
    Edit17.Anchors := [akLeft, akTop];
    Label29.Anchors := [akLeft, akTop];
    Edit18.Anchors := [akLeft, akTop];
    Button24.Anchors := [akLeft, akTop];
    Button29.Anchors := [akLeft, akTop];
    Label13.Anchors := [akLeft, akTop];
    Edit13.Anchors := [akLeft, akTop];
    RadioButton1.Anchors := [akLeft, akTop];
    RadioButton2.Anchors := [akLeft, akTop];
    RadioButton3.Anchors := [akLeft, akTop];
    RadioGroup1.Anchors := [akLeft, akTop];
    RadioGroup6.Anchors := [akLeft, akTop];
    RadioGroup3.Anchors := [akLeft, akTop];
    CheckBox2.Anchors := [akLeft, akTop];
    Button31.Anchors := [akLeft, akTop];
    Button32.Anchors := [akLeft, akTop];
    Edit23.Anchors := [akLeft, akTop];
    Label10.Anchors := [akLeft, akTop];
    Edit16.Anchors := [akLeft, akTop];
    Edit14.Anchors := [akLeft, akTop];
    Edit21.Anchors := [akLeft, akTop]; {range prvni vrstvy}
    Label27.Anchors := [akLeft, akTop];
    Button33.Anchors := [akLeft, akTop];
    Button39.Anchors := [akLeft, akTop];
    Memo1.Anchors := [akLeft, akTop, akBottom];
    Label24.Anchors := [akTop, akRight];
    Label25.Anchors := [akTop, akRight];
    Label26.Anchors := [akTop, akRight];
    Button30.Caption := '>> right >>';
    exit;
  end;
  if puvodno = False then
  begin  {kdyz chci menit levy PlotPanel}
    puvodno := True;
    PlotPanel3.Anchors := [akLeft, akTop, akRight, akBottom]; {levy}
    PlotPanel4.Anchors := [akTop, akRight, akBottom]; {pravy}
    Button17.Anchors := [akTop, akRight];
    Button16.Anchors := [akTop, akRight];
    Button27.Anchors := [akTop, akRight];
    Label19.Anchors := [akTop, akRight];
    ComboBox2.Anchors := [akTop, akRight];
    Button22.Anchors := [akTop, akRight];
    Button36.Anchors := [akTop, akRight];
    Button37.Anchors := [akTop, akRight];
    Button20.Anchors := [akTop, akRight];
    Label22.Anchors := [akTop, akRight];
    ComboBox3.Anchors := [akTop, akRight];
    Button25.Anchors := [akTop, akRight];
    Button40.Anchors := [akTop, akRight];
    Button50.Anchors := [akTop, akRight];
    Button51.Anchors := [akTop, akRight];
    Button52.Anchors := [akTop, akRight];
    Button41.Anchors := [akTop, akRight];
    Label18.Anchors := [akTop, akRight];
    Edit12.Anchors := [akTop, akRight];
    Label39.Anchors := [akTop, akRight];
    CheckBox4.Anchors := [akTop, akRight];
    Button28.Anchors := [akTop, akRight];
    Button11.Anchors := [akTop, akRight];
    Button53.Anchors := [akTop, akRight];
    Button54.Anchors := [akTop, akRight];
    Button55.Anchors := [akTop, akRight];
    Button19.Anchors := [akTop, akRight];
    Label28.Anchors := [akTop, akRight];
    Edit15.Anchors := [akTop, akRight];
    Label30.Anchors := [akTop, akRight];
    Button26.Anchors := [akTop, akRight];
    Button30.Anchors := [akTop, akRight]; {to je ten, kterym se to meni}
    Label23.Anchors := [akTop, akRight];
    Edit17.Anchors := [akTop, akRight];
    Label29.Anchors := [akTop, akRight];
    Edit18.Anchors := [akTop, akRight];
    Button24.Anchors := [akTop, akRight];
    Button29.Anchors := [akTop, akRight];
    Label13.Anchors := [akTop, akRight];
    Edit13.Anchors := [akTop, akRight];
    RadioGroup1.Anchors := [akTop, akRight];
    RadioGroup6.Anchors := [akTop, akRight];
    RadioGroup3.Anchors := [akTop, akRight];
    RadioButton1.Anchors := [akTop, akRight];
    RadioButton2.Anchors := [akTop, akRight];
    RadioButton3.Anchors := [akTop, akRight];
    CheckBox2.Anchors := [akTop, akRight];
    Button31.Anchors := [akTop, akRight];
    Button32.Anchors := [akTop, akRight];
    Edit23.Anchors := [akTop, akRight];
    Label10.Anchors := [akTop, akRight];
    Edit16.Anchors := [akTop, akRight];
    Edit14.Anchors := [akTop, akRight];
    Edit21.Anchors := [akTop, akRight];
    Label27.Anchors := [akTop, akRight];
    Button33.Anchors := [akTop, akRight];
    Button39.Anchors := [akTop, akRight];
    Memo1.Anchors := [akTop, akRight, akBottom];
    Label24.Anchors := [akLeft, akTop, akRight];
    Label25.Anchors := [akLeft, akTop, akRight];
    Label26.Anchors := [akLeft, akTop, akRight];
    Button30.Caption := '<< left <<';
  end;
end;  { << left resizing // resizing right >> }

procedure TNoSVALform.Vyrobjmeno;
var
  kamaz          : integer;
  zatimposledni  : integer;
begin
  jmenouloz := druhyradekstrg; {vyrobim nazev souboru pro *.rdg a *.hrm}
  if length(jmenouloz) = 4 then
    jmenouloz := jmenouloz + '0';
  if length(jmenouloz) = 3 then
    jmenouloz := jmenouloz + '00';
  if sloupec = 3 then begin
    if (compon = 1) and (POLARflip = False) and (POLARflipZT = False) then begin
      jmenouloz := jmenouloz + '_Z';
    end;
    if (compon = 1) and (POLARflip = True)  and (POLARflipZT = False) then begin
      jmenouloz := jmenouloz + '_R';
    end;
    if (compon = 1) and (POLARflip = False) and (POLARflipZT = True) then begin
      jmenouloz := jmenouloz + '_T';
    end;
    if compon = 2 then begin
      if (POLAR = False) then begin
        ; {pokud vubec nedelam POLAR}
        jmenouloz := jmenouloz + '_R';
      end;
      if ((POLAR = True) and (POLARflip = False)) then begin
        ; {pokud delam POLAR, ale jsem v prvni slozce}
        jmenouloz := jmenouloz + '_RayR';
      end;
      if ((POLAR = True) and (POLARflip = True)) then begin
        ; {pokud delam POLAR, ale jsem ve druhe slozce}
        jmenouloz := jmenouloz + '_RayT';
        {tedy orezavam Rayleighovy vlny, ale na T slozce}
      end;
    end; {if compon = 2}
    if compon = 3 then begin
      if (POLAR = False) then begin
        ; {pokud vubec nedelam POLAR}
        jmenouloz := jmenouloz + '_T';
      end;
      if ((POLAR = True) and (POLARflip = False)) then begin
        ; {pokud delam POLAR, ale jsem v prvni slozce}
        jmenouloz := jmenouloz + '_LovT';
      end;
      if ((POLAR = True) and (POLARflip = True)) then begin
        ; {pokud delam POLAR, ale jsem ve druhe slozce}
        jmenouloz := jmenouloz + '_LovR';
        {tedy orezavam Rayleighovy vlny, ale na T slozce}
      end;
    end; {if compon = 3}
  end; {if sloupec = 3}
  if sloupec = 5 then begin

    pozice := 1;                                    {zacnu hledat od zacatku}
    misto := PosEx(' ', druhyradekstrg, pozice);    {najdu, kde je mezera, tedy ta za prvni stanici}
    jmenouloz := Copy(druhyradekstrg, 1, misto-1);  {ulozim to k te mezere, tedy mam jmeno prvni stanice}

    //pozice := misto + 3;                            {posunu se dal, radsi o kus vic}
    //misto := PosEx(' ', druhyradekstrg, pozice);    {najdu, kde je dalsi mezera, to je ta mezi souradnicema, takze ta me nezajima}
    //pozice := misto + 4;                            {posunu to zase o kus dal}
    //misto := PosEx(' ', druhyradekstrg, pozice);    {najdu, kde je dalsi mezera, tedy ta pred druhou stanici}

    //pozice := misto + 5;                            {posunu to zase o kus dal dovnitr do jmena te druhe stanice}
    pozice := 32;                                   {nazev druhe stanice zacina dycky na sloupci 32}
    misto2 := PosEx(' ', druhyradekstrg, pozice);   {najdu, kde je dalsi mezera, tedy ta za druhou stanici}
    kamaz := (misto2-1)- 32 + 1;
    jmenouloz := jmenouloz + '_' + Copy(druhyradekstrg, 32, kamaz);  {ulozim to k te mezere}
    zatimposledni := length(jmenouloz);
    if jmenouloz[zatimposledni] = '.' then jmenouloz := Copy(jmenouloz, 1, zatimposledni-1);

    if compon = 1 then begin
      jmenouloz := jmenouloz + '_ZZ';
    end;
    if compon = 2 then begin
      jmenouloz := jmenouloz + '_RR';
    end;
    if compon = 3 then begin
      jmenouloz := jmenouloz + '_TT';
    end;
    if compon = 4 then begin
      jmenouloz := jmenouloz + '_RZ';
    end;
    if compon = 5 then begin
      jmenouloz := jmenouloz + '_ZR';
    end;
  end; {if sloupec = 5}
end; {procedury Vyrobjmeno}

procedure TNoSVALform.Ukazcarky;
var
  krokro1: double;
  mvel: double;
  m, i, k: integer;
begin {namaluju do PlotPanelu znacky pro rychlost - carky a k nim popisky}
  PlotPanel2.HideLayer(crych);
  krokro1 := (PlotPanel2.Ymax - PlotPanel2.YMin) / 30;  {krok pro malovani bodiku misto cary}
  mvel := 8;                          {nejvyssi rychlost pro nakresleni}
  m := 1;
  for i := 1 to nsampl do begin       {projedu vsechny vzorky}
    if mvel > 2 then begin            {pro vetsi rychlosti to budu delat po 1 km/s}
      if grvel[i] < mvel then begin   {zjistim, kdy rychlost daneho vzorku podleze (tedy cas preleze) tu prednastavenou}
        kresgrveli[m] := i;           {a zapamatuju si ten vzorek, kdy se to stalo}
        mvel := mvel - 1;             {a hned tu rychlost zmensim o jednicku}
        m := m + 1;                   {index}
      end;
      {a ten vzorek pak pouziju, abych ty prednastavene rychlosti nakreslil}
    end;
    if ((mvel <= 2) and (mvel > 1)) then begin {pro mensi rychlosti to budu delat po 0.5 km/s}
      if grvel[i] < mvel then begin   {zjistim, kdy rychlost daneho vzorku podleze (tedy cas preleze) tu prednastavenou}
        kresgrveli[m] := i;           {a zapamatuju si ten vzorek, kdy se to stalo}
        mvel := mvel - 0.5;           {a hned tu rychlost zmensim}
        m := m + 1;                   {index}
      end;
      {a ten vzorek pak pouziju, abych ty prednastavene rychlosti nakreslil}
    end;
    if mvel <= 1 then begin           {pro jeste mensi rychlosti to budu delat po 0.2 km/s}
      if grvel[i] < mvel then begin   {zjistim, kdy rychlost daneho vzorku podleze (tedy cas preleze) tu prednastavenou}
        kresgrveli[m] := i;           {a zapamatuju si ten vzorek, kdy se to stalo}
        mvel := mvel - 0.2;           {a hned tu rychlost zmensim}
        m := m + 1;                   {index}
      end;
      {a ten vzorek pak pouziju, abych ty prednastavene rychlosti nakreslil}
    end;
  end;
  crych := crych + 1;
  with PlotPanel2 do begin
    LayerOptions(crych, pmDot, 1);
  end;
  for m := 1 to 20 do begin           {pro prednastavene rychlosti}
    for k := 0 to 30 do begin
      if ((SVALtime[kresgrveli[m]] > PlotPanel2.XMin) and (SVALtime[kresgrveli[m]] < PlotPanel2.XMax)) then begin
        PlotPanel2.AddXY(SVALtime[kresgrveli[m]], (PlotPanel2.YMin + k * krokro1), clWhite, crych);
      end;
    end;
  end;
end; {konec procedury na malovani znacek rychlosti}

procedure TNoSVALform.Ukazrychlosti;
begin
  if ((nsampl <> 0) and (kresgrveli[1] <> 0)) then begin
    label45.Left := trunc(kresgrveli[1] / nsampl * PlotPanel2.Width) + 1; {vel = 8.0}
    label45.Visible := True;
    label45.BringToFront;
    label46.Left := trunc(kresgrveli[2] / nsampl * PlotPanel2.Width) + 1; {vel = 7.0}
    label46.Visible := True;
    label46.BringToFront;
    label47.Left := trunc(kresgrveli[3] / nsampl * PlotPanel2.Width) + 1; {vel = 6.0}
    label47.Visible := True;
    label47.BringToFront;
    label48.Left := trunc(kresgrveli[4] / nsampl * PlotPanel2.Width) + 1; {vel = 5.0}
    label48.Visible := True;
    label48.BringToFront;
    label49.Left := trunc(kresgrveli[5] / nsampl * PlotPanel2.Width) + 1; {vel = 4.0}
    label49.Visible := True;
    label49.BringToFront;
    label50.Left := trunc(kresgrveli[6] / nsampl * PlotPanel2.Width) - 0; {vel = 3.0}
    label50.Visible := True;
    label50.BringToFront;
    label51.Left := trunc(kresgrveli[7] / nsampl * PlotPanel2.Width) - 4; {vel = 2.0}
    label51.Visible := True;
    label51.BringToFront;
    label52.Left := trunc(kresgrveli[8] / nsampl * PlotPanel2.Width) - 4; {vel = 1.5}
    label52.Visible := True;
    label52.BringToFront;
    label53.Left := trunc(kresgrveli[9] / nsampl * PlotPanel2.Width) - 5; {vel = 1.0}
    label53.Visible := True;
    label53.BringToFront;
    label54.Left := trunc(kresgrveli[10] / nsampl * PlotPanel2.Width) - 6; {vel = 0.8}
    label54.Visible := True;
    label54.BringToFront;
    label55.Left := trunc(kresgrveli[11] / nsampl * PlotPanel2.Width) - 7; {vel = 0.6}
    label55.Visible := True;
    label55.BringToFront;
    label56.Left := trunc(kresgrveli[12] / nsampl * PlotPanel2.Width) - 9; {vel = 0.4}
    label56.Visible := True;
    label56.BringToFront;
  end; {if to nejsou nuly}
end; {konec procedury Ukazrychlosti}

procedure TNoSVALform.Ulozharmoniku;
var
  j, hh: integer;
begin {soubor pro ukladani fazoveho vlneni vsech vybranych filtru}
  Vyrobjmeno;
  if compon <> 0 then hrm := jmenouloz;
  if compon =  0 then begin
    dohromady := SaveDialog1.FileName;
    hrm := dohromady + '.hrm';
  end;
  if prorenatu then begin
    delkarenaty := length(jmenofilu);
    hrm := Copy(jmenofilu, 1, delkarenaty - 4);
  end;

  if batchproces = False then begin {pokud nejsem v Batchi, tak musim najit cestu, kde se ma vytvorit Xhrm adresar, kdyz ji nezadam, tak se udela tam, kde je SVAL.exe a nikoli tam, kde jsou data}
    ChDir(cestamanu); {vlezu do adresare, kde jsem precetl soubor s daty, a timpadem pak i tam vytvorim adresar Xhrm, i kdyz jsem to delal rucne cele}
  end;
  if compon = 1 then begin
    CreateDir('Zhrm');
    hrm := 'Zhrm/' + jmenouloz + '.hrm'; {ulozim to do specialniho adresare}
    if POLAR then begin
      CreateDir('Rhrm');
      if POLARflip then begin
       hrm := 'Rhrm/' + jmenouloz + '.hrm'; {ulozim to do specialniho adresare}
      end;
      CreateDir('Thrm');
      if POLARflipZT then begin
        hrm := 'Thrm/' + jmenouloz + '.hrm'; {ulozim to do specialniho adresare}
      end;
    end; {if POLAR}
  end;
  if compon = 2 then begin
    CreateDir('Rhrm');
    hrm := 'Rhrm/' + hrm + '.hrm'; {ulozim to do specialniho adresare}
  end;
  if compon = 3 then begin
    CreateDir('Thrm');
    hrm := 'Thrm/' + hrm + '.hrm'; {ulozim to do specialniho adresare}
  end;
  if compon = 4 then begin
    CreateDir('RZhrm');
    hrm := 'RZhrm/' + hrm + '.hrm'; {ulozim to do specialniho adresare}
  end;
  if compon = 5 then begin
    CreateDir('ZRhrm');
    hrm := 'ZRhrm/' + hrm + '.hrm'; {ulozim to do specialniho adresare}
  end;
  if batchproces = False then begin
    syrovky := MessageDlg('Do you want to save raw signals?', mtConfirmation,[mbYes, mbNo], 0);
    if syrovky = mrYes then begin {pokud chci syrove zaznamy}
      syrovkyyes := True;
    end
    else if syrovky = mrNo then begin
      syrovkyyes := False;
    end
    else
      exit;
  end;
  assignfile(harmonics, hrm);
  rewrite(harmonics);
  if filtrujuopravovany then begin
    if trcyesno = False then begin
      if compon = 0 then begin
        Write(harmonics, distkm: 12: 4);
      end;
      if compon <> 0 then begin
        Write(harmonics, distkm: 12: 4, '  ', KUKsensor: 10, KUKlat: 10: 4, KUKlon: 10: 4, bazi: 10: 4);
      end;
      Write(harmonics, '    COMPLETE monochromatic signals   INSTRUMENT-CORRECTED SIGNALS IN THIS FILE!!!');
    end;
    if trcyesno = True then begin
      if compon = 0 then begin
        Write(harmonics, distkm: 12: 4);
      end;
      if compon <> 0 then begin
        Write(harmonics, distkm: 12: 4, '  ', KUKsensor: 10, KUKlat: 10: 4, KUKlon: 10: 4, bazi: 10: 4);
      end;
      Write(harmonics, '    TRUNCATED monochromatic signals   INSTRUMENT-CORRECTED SIGNALS IN THIS FILE!!!');
    end;
  end;
  if filtrujuopravovany = False then begin
    if trcyesno = False then begin
      if compon = 0 then begin
        Write(harmonics, distkm: 12: 4);
      end;
      if compon <> 0 then begin
        Write(harmonics, distkm: 12: 4, '  ', KUKsensor: 10, KUKlat: 10: 4, KUKlon: 10: 4, bazi: 10: 4);
      end;
      Write(harmonics, '    COMPLETE monochromatic signals   RAW SIGNALS IN THIS FILE!!!');
    end;
    if trcyesno = True then begin
      if compon = 0 then begin
        Write(harmonics, distkm: 12: 4);
      end;
      if compon <> 0 then begin
        Write(harmonics, distkm: 12: 4, '  ', KUKsensor: 10, KUKlat: 10: 4, KUKlon: 10: 4, bazi: 10: 4);
      end;
      Write(harmonics, '    TRUNCATED monochromatic signals   RAW SIGNALS IN THIS FILE!!!');
    end;
  end;
  writeln(harmonics);
  Write(harmonics, 'Filter.No.'); {zapise to nazev prvniho radku do prvniho sloupce}
  if syrovkyyes then begin {kdyz chci ulozit i syrovy zaznam}
    Write(harmonics, '            RawRecord');
  end;
  for j := inverindexf to inverindexl do begin {zapise to cisla filtru do prvniho radku}
    Write(harmonics, '    FtNo.', j: 6);
  end;
  writeln(harmonics);
  Write(harmonics, 'CentralPer'); {zapise to nazev druheho radku do prvniho sloupce}
  if syrovkyyes then begin {kdyz chci ulozit i syrovy zaznam}
    Write(harmonics, '                     ');
  end;
  for j := inverindexf to inverindexl do begin {zapise to hodnoty centralni periody do druheho radku}
    Write(harmonics, period[j]: 15: 4);
  end;
  writeln(harmonics);
  Write(harmonics, 'Time/InsPr');
  {zapise to nazev tretiho radku a prvniho sloupce do prvniho sloupce}
  if syrovkyyes then begin {kdyz chci ulozit i syrovy zaznam}
    Write(harmonics, '                     ');
  end;
  for j := inverindexf to inverindexl do begin {zapise to hodnoty okamzite periody do tretiho radku}
    Write(harmonics, instper[j, locmx[j]]: 15: 4);
  end;
  writeln(harmonics);
  for j := 1 to maxnflt do begin
    maxmono[j] := 0;
    maxmonox[j] := 0;
  end;
  for j := inverindexf to inverindexl do begin {normalizuju jednotlive filtriky, aby to aspon radove bylo podobne s jinym zaznamem}
    for hh := 1 to nsampl do begin  {najdu nejvetsi kladnou amplitudu}
      if (fsre[j, hh] > maxmono[j]) then maxmono[j] := fsre[j, hh]; {normuju na OREZANY signal}
      if (fxsre[j, hh] > maxmonox[j]) then maxmonox[j] := fxsre[j, hh]; {normuju na CELY signal}
    end;
  end;
  for hh := 1 to nsampl do begin {zapise to tabulku vsech fazovych vlneni vsech vybranych filtru}
    Write(harmonics, SVALtime[hh]: 10: 3); {zapise hodnotu casu do prvniho sloupce}
    if syrovkyyes then begin {kdyz chci ulozit i syrovy zaznam}
      Write(harmonics, sre[hh]: 21: 8); {ulozim syrovy zaznam}
    end;
    for j := inverindexf to inverindexl do begin {zapise to amplitudy do vsech ostatnich sloupcu}
      if (chcesnormalizovany = mrYes) then begin {chci normalizovany}
        if trcyesno = False then begin {kdyz jsem dal odpoved NO na to, jestli chci TRUNCATED vlny, ukladam CELKOVE}
          Write(harmonics, (fxsre[j, hh] / maxmonox[j] * maxhrmampl): 15: 3);
          {vypisuju jednotlive harmonicke signaly, NEOREZANE, tedy celkovou harmoniku bez vybrane grupy}
        end;
        if trcyesno = True then begin {kdyz jsem dal odpoved YES na to, jestli chci TRUNCATED vlny, ukladam TRUNCATED, je to pro testovani ArrayCorru, v praxi asi k nicemu}
          Write(harmonics, (fsre[j, hh] / maxmono[j] * maxhrmampl): 15: 3);
          {vypisuju jednotlive harmonicke signaly, OREZANE, tedy jen vybrane grupy}
        end;
      end;
      if (chcesnormalizovany = mrNo) then begin {chci puvodni}
        if trcyesno = False then begin {kdyz jsem dal odpoved NO na to, jestli chci TRUNCATED vlny, ukladam CELKOVE}
          Write(harmonics, (fxsre[j, hh]): 15: 3);
          {vypisuju jednotlive harmonicke signaly, NEOREZANE, tedy celkovou harmoniku bez vybrane grupy}
        end;
        if trcyesno = True then begin {kdyz jsem dal odpoved YES na to, jestli chci TRUNCATED vlny, ukladam TRUNCATED, je to pro testovani ArrayCorru, v praxi asi k nicemu}
          Write(harmonics, (fsre[j, hh]): 15: 3);
          {vypisuju jednotlive harmonicke signaly, OREZANE, tedy jen vybrane grupy}
        end;
      end;
    end;{for j}
    writeln(harmonics);
  end; {for hh}
  closefile(harmonics);
  //  writeln(logik,hrm,' ',inverindexf:4,inverindexl:4, SVALtime[2]:9:3,SVALtime[nsampl]:9:3);
end; {procedury Ulozharmoniku}

procedure TNoSVALform.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked = True then begin {pokud chci alfu zavislou na vzdalenosti - to same je jeste v procedure pro analyzu a v procedure pro otvirani souboru}
    if distkm <> 0 then begin
      alphaabs := 0.3759905681 * distkm + 27.4032116;
      str(alphaabs: 5: 1, alphaabsstrg);
      edit11.Text := alphaabsstrg;
    end;
    if distkm = 0 then begin
      edit11.Text := '';
    end;
    edit11.Enabled := False;
  end;
  if CheckBox3.Checked = False then begin
    edit11.Text := '70';
    edit11.Enabled := True;
  end;
end;

{a zde je vlastni telo cele unity, ve kterem - priznejme si to otevrene - toho moc neni...}
begin {of the unit body}

end.
