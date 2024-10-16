unit PrumetUnit;    {Verze 4.7.2004, Opakovani vypoctu, Data jsou 0}
                    {unita od Jirky Malka s mojima vsuvkami a doplnenimi pro konkretni vypocet struktury z disperze}
interface
uses LCLIntf, LCLType, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, SvalUnit, PlotPanel;
const
  cnd    = 200;     {maximum dat - tady bylo puvodne 200, ale pro joint inverzi sla udelat jenom krivka do 92 bodu a vic ne, tak jsem to prodlouzil, pak tu bylo 20000, nove 2000 a pak 200}
  cnp    = 80;      {maximum parametru - bylo 1000}
  Zero   = 1e-100;  {nejmensi cislo}
  MalCis = 1e-5;    {male cislo}
  VelCis = 1e5;     {velke cislo}

type
  pda=^tda;
  tda=array[1..cnd] of double;
  ppa=^tpa;
  tpa=array[1..cnp] of double;
  ppar=^tpar;
  tpar=record
    vzda:double;
    p:tpa;
    d:tda;
  end;
  tsimp=array[0..cnp] of ppar;
  psi=^tsi;
  tsi=object
    datsoub:string;                              {definice dat}
    parsoub:string;                              {definice parametru}
    vyssoub:string;                              {vystupni soubor}
    konsoub:string;                              {soubor s konecnym resenim}
    np,nd:integer;                               {pocet parametru dat}
    jprob:string[80];                            {jmeno problemu, z parsoub}
    juloh:string[20];                            {jmeno ulohy a take konsoub}
    nk:longint;                                  {pocet vypoctu prime ulohy}
    ckra:double;                                 {kraceni pro Monte Carlo}
    unk:longint;                                 {posledni uspesne nk}
    ilok:integer;                                {kolikate minimum}
    sim:tsimp;                                   {body simplexu}
    jpar:array[1..cnp] of string[4];             {jmena parametru}
    mip,map:ppa;                                 {minimum a maximum parametru}
    soub:text;                                   {vystupni soubor}
    maxnk:longint;                               {maximum vypoctu}
    nspat:integer;                               {po kolika vypoctech to vypadne}
    ckk:integer;                                 {maximum prumetu}
    croz:double;                                 {ukonceni prumetu}
    cspat:double;                                {hranice spat/vmin}
    der:array[1..cnp] of double;                 {odhad derivaci}
    dal:tpar;                                    {pocitany bod}
    krok,krokm:double;                           {delka kroku}
    spat:double;                                 {zbytek po kroku}
    nelin:double;                                {nelinearita kroku}
    medstr:string[12];                           {prave pouzita metoda}
    nbod:integer;                                {pocet platnych bodu}
    bmon:boolean;                                {metoda Monte Carlo}
    odnp:double;                                 {odmocnina z np}
    inej:integer;                                {nejhorsi bod}
    vnej:double;                                 {vzdalenost nejh. bodu}
    vmin:double;                                 {vzdalenost nejlep. bodu}
    maxd,mind,cmind:double;                      {meze nasobeni}
    copak:integer;                               {max.pocet opakovani}
    fkon:Text;                                   {soubor s celkovymi vypocty}
    constructor Init;
    destructor Done;
    procedure CtiDat;virtual;
    function Vzdalen(var pa:tpa;var fit:tda)
                              :double;virtual;   {vzdalenost par !!!}
    function Pokracuj:boolean;virtual;           {podminka pokracovani}
    function Hranice(p:tpa):boolean;             {hranice parametru}
    procedure Option;virtual;                    {hodnoty maxnk atd. !!!}
    procedure ZacTisk;virtual;                   {zacatek tisku}
    procedure Tisk;virtual;                      {zprava do vystupniho souboru}
    procedure KonecTisk;virtual;                 {konecny tisk}
    procedure Kresli;virtual;                    {kresleni simplexu !!!}
    procedure Funkce(var pa:tpa;var fit:tda);
                                     virtual;    {prima uloha !!!}
    function Vzdal(var da,db:tda):double;virtual;{vzdal v prostoru dat}
    function SkalD(var da,db:tda):double;virtual;{skal.s. v prost.dat}
    procedure Rozdil(var da,db,dc:tda);virtual;  {rozdil v prostoru dat}
    procedure Zacatek;virtual;                   {inicializace ulohy}
    procedure Konec;virtual;                     {ukonceni ulohy}
    procedure Ctipar;virtual;                    {cteni parametru}
    procedure Ctijmena;virtual;                  {cteni jmen souboru}
    procedure StartMod;virtual;                  {prvni bod ve stredu}
    procedure Iterace;virtual;                   {iterovani k vysledku}
    procedure Run;virtual;                       {hlavni procedura}
    procedure Nejhor;virtual;                    {hleda nejhorsi bod}
    function BGlob:boolean;                      {ukonceni global.hledani}
  end;
var
  stopka    : boolean;                           {aby bezela inverze, musi tohle byt :true:, mam moznost to tim zastavit}
  unlimited : boolean;

implementation
var
  zacatekcasu : double;

constructor TSi.Init;
begin
end;

destructor TSi.Done;
begin
end;

procedure TSi.CtiJmena;
var
  silok:string[3];
begin
  datsoub := 'normal.dat';
  parsoub := 'normal.par';
  str(ilok:2,silok);
  if(silok[1] = ' ') then silok[1] := '0';
  if(silok[2] = ' ') then silok[2] := '0';
  vyssoub := 'normal_' + silok + '.out';
end;

procedure TSi.CtiDat;
begin {stejna vec je jeste i v unite 'InverUnit'}
  if ((ityprl = 1) or (ityprl = 0)) then begin
    nd := numofdat + numoflay + 1;     {tedy je to pocet dat (namerenych) plus pocet vrstev a poloprostor, protoze}
  end;
  if ityprl = 3 then begin             {ve vrstvach a v poloprostoru vyrabim umela data pro hustoty}
    nd := (numofdat*2) + numoflay + 1; {pro spolecnou inverzi je namerenych dat dvakrat vic}
  end;
  setlength(moje,nd+1);
end;

procedure Tsi.CtiPar; {cteni parametru}
var sou : text;
    i   : integer;
begin
  assign(sou,parsoub);
  reset(sou);
  readln(sou,jprob);
  readln(sou,np);
  np := numofpar;
  readln(sou);
  for i:=1 to np do begin
    read(sou,jpar[i],mip^[i],map^[i]);     {nazev a hranice paramatru}
  end;
  close(sou);
end;

procedure Tsi.Zacatek; {Pocatecni hodnoty a akce}
var i:integer;
begin
  new(mip);
  new(map);
  ctipar;
  for i := 0 to np do new(sim[i]);
  ctidat;
  if(nd<=np) then odnp:=0.1
  else odnp := sqrt(nd-np);
  randomize;
  konsoub := juloh + '.kon';
end;

function Tsi.Vzdal(var da,db:tda):double; {vzdalenost v prostoru dat}
var
  hd:tda;
  i : integer;                            {doplneno zari 2018}
begin
  for i := 1 to cnd do begin
    hd[i] := 0.0;                         {doplneno zari 2018, protoze to nadavalo, ze promenna hd neni inicializovana, i kdyz je to vystup z funkce rozdil}
  end;
  rozdil(hd,da,db);
  vzdal := sqrt(SkalD(hd,hd));
end;

procedure TSi.Funkce(var pa:tpa;var fit:tda); {prima uloha}
var i:integer;
begin
  for i :=    1 to nd do fit[i] := pa[i mod np + 1];     {data=parametry}
end;

function TSi.Vzdalen(var pa:tpa;var fit:tda):double;  {vzdalenost parametru od spravneho reseni}
var
  i : integer;
begin
  for i := 1 to cnd do fit[i] := 0; {doplneno zari 2018, protoze pri prvnim behu v tom fit byly nesmyslne hodnoty, i kdyz to je vystup z funkce funkce}
  funkce(pa,fit);
  vzdalen := sqrt(SkalD(fit,fit));
  inc(nk);
end;

procedure Tsi.ZacTisk;  {zacatek vypisu}
begin
end;

procedure TSi.Tisk;     {tisk po kazdem kroku}
begin
end;

procedure TSi.KonecTisk;{tisk vysledku}
var
  i,jeje,heh        :integer;
  finaltrefa        : double;
  finaltrefastrg    : string;
  koneccasu, trvani : double;
  trvanistrg        : string;
  minuty            : integer;
  sekundy           : double;
  minutystrg        : string;
  sekundystrg       : string;
begin {zacatek procedury}
  depth      := 0.0;
  hlayers2   := 0.0;
  finaltrefa := trefa/pocitadlo;
  str(finaltrefa:3:0,finaltrefastrg);
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - the inversion fits '+ finaltrefastrg+' points of the curve');
  if ((ityprl = 1) or (ityprl = 0)) then begin {pro Rayleigha nebo Loveho}
    if (finaltrefa = numofdat) then begin
      radek := radek +1;
      str(radek:4,radekstrg);
      NoSVALform.memo1.Lines.Add(radekstrg+' | - what means it fits all the required data');
    end
    else begin
      radek := radek +1;
      str(radek:4,radekstrg);
      NoSVALform.memo1.Lines.Add(radekstrg+' | - what means it doesn''t fit exactly all the data');
    end;
  end;
  if ityprl = 3 then begin {pro spolecnou inverzi}
    if (finaltrefa = (numofdat*2)) then begin
      radek := radek +1;
      str(radek:4,radekstrg);
      NoSVALform.memo1.Lines.Add(radekstrg+' | - what means it fits all the required data');
    end
    else begin
      radek := radek +1;
      str(radek:4,radekstrg);
      NoSVALform.memo1.Lines.Add(radekstrg+' | - what means it doesn''t fit exactly all the data');
    end;
  end;
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - forward problem was solved '+pocitadlostrg+' times');
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - the inversion run '+niteracestrg+' iterations');
  with sim[0]^ do begin {zacatek "with sim[0]"}
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - Love: final measured-to-fitted distance is '+Lovenormstrg+' m/s for one dispersion point');
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - Rayl: final measured-to-fitted distance is '+Raylnormstrg+' m/s for one dispersion point');
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - Dens: final measured-to-fitted distance is '+Hustnormstrg+' g/m3 for one point');
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - Total final misfit is '+vzdastrg);
    if batchinver = true then begin {kdyz budu delat batch inverzi, tak si ulozim ty jednotlive misfity}
      batchvzda[ibp] := vzda;       {ibp je poradove cislo inverze}
      greenvzda := vzda;            {to pouziju pro zobrazeni posledniho misfitu pro krivku odpovidajici prumernemu modelu}
    end;
    for i := 1 to np do begin
      pip[i] := p[i];
    end;
    hlayers2 := 0.0;
    depth := 0.0;
    eska := eska +1;
    husto := husto +1;
    pecka := pecka +1;
    with NoSVALform.PlotPanel4 do begin
      LayerOptions(eska,pmLine,4);
    end;
    with NoSVALform.PlotPanel4 do begin
      LayerOptions(husto,pmLine,4);
    end;
    with NoSVALform.PlotPanel4 do begin
      LayerOptions(pecka,pmLine,4);
    end;
    if prumernabatch = false then begin
      bfdRed    := 255; {bfd = barva fitovane disperze, zadavam ji zde, abych pri ukonceni batchinver mohl zmenit tu barvu}
      bfdGreen  := 0;
      bfdBlue   := 0;
    end;
    if prumernabatch = true then begin {kdyz maluju disperzi pro prumernou stukturu}
      bfdRed    := 0; {bfd = barva fitovane disperze, zadavam ji zde, abych pri ukonceni batchinver mohl zmenit tu barvu}
      bfdGreen  := 255;
      bfdBlue   := 0;
    end;
    for heh := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
      //if (B[heh] > NoSVALform.PlotPanel4.Xmin) and (B[heh] < NoSVALform.PlotPanel4.Xmax) and (-hlayers2 > NoSVALform.PlotPanel4.Ymin) and (-hlayers2 < NoSVALform.PlotPanel4.Ymax) then begin
        NoSVALform.PlotPanel4.AddXY(B[heh] , -hlayers2 , RGB(bfdRed,bfdGreen,bfdBlue)   ,eska);  {vykresluje rychlosti S-vln}
      //end;
      //if (R[heh] > NoSVALform.PlotPanel4.Xmin) and (R[heh] < NoSVALform.PlotPanel4.Xmax) and (-hlayers2 > NoSVALform.PlotPanel4.Ymin) and (-hlayers2 < NoSVALform.PlotPanel4.Ymax) then begin
        NoSVALform.PlotPanel4.AddXY(R[heh] , -hlayers2 , clYellow,husto);                        {vykresluje hustotu}
      //end;
      if ((ityprl = 0) or (ityprl = 3)) then begin                                             {kdyz jsem pocital Rayleigha nebo spolecnou}
        //if (A[heh] > NoSVALform.PlotPanel4.Xmin) and (A[heh] < NoSVALform.PlotPanel4.Xmax) and (-hlayers2 > NoSVALform.PlotPanel4.Ymin) and (-hlayers2 < NoSVALform.PlotPanel4.Ymax) then begin
          NoSVALform.PlotPanel4.AddXY(A[heh] , -hlayers2 , RGB(124,219,230),pecka);              {vykresluje rychlosti P-vln}
        //end;
      end;
      hlayers2 := hlayers2 + DD[heh];
      //if (B[heh] > NoSVALform.PlotPanel4.Xmin) and (B[heh] < NoSVALform.PlotPanel4.Xmax) and (-hlayers2 > NoSVALform.PlotPanel4.Ymin) and (-hlayers2 < NoSVALform.PlotPanel4.Ymax) then begin
        NoSVALform.PlotPanel4.AddXY(B[heh] , -hlayers2,RGB(bfdRed,bfdGreen,bfdBlue)   ,eska);    {vykresluje rychlosti S-vln}
      //end;
      //if (R[heh] > NoSVALform.PlotPanel4.Xmin) and (R[heh] < NoSVALform.PlotPanel4.Xmax) and (-hlayers2 > NoSVALform.PlotPanel4.Ymin) and (-hlayers2 < NoSVALform.PlotPanel4.Ymax) then begin
        NoSVALform.PlotPanel4.AddXY(R[heh] , -hlayers2,clYellow,husto);                          {vykresluje hustotu}
      //end;
      if ((ityprl = 0) or (ityprl = 3)) then begin                                             {kdyz jsem pocital Rayleigha nebo spolecnou}
        //if (A[heh] > NoSVALform.PlotPanel4.Xmin) and (A[heh] < NoSVALform.PlotPanel4.Xmax) and (-hlayers2 > NoSVALform.PlotPanel4.Ymin) and (-hlayers2 < NoSVALform.PlotPanel4.Ymax) then begin
          NoSVALform.PlotPanel4.AddXY(A[heh] , -hlayers2,RGB(124,219,230),pecka);                {vykresluje rychlosti P-vln}
        //end;
      end;
    end; {konec pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(B[numoflay+1] , -hlayers2,RGB(bfdRed,bfdGreen,bfdBlue)   ,eska);        {vykresluje rychlost S-vln}
    NoSVALform.PlotPanel4.AddXY(R[numoflay+1] , -hlayers2,clYellow,husto);                              {vykresluje hustotu}
    NoSVALform.PlotPanel4.AddXY(B[numoflay+1] , -hlayers2*1.25,RGB(bfdRed,bfdGreen,bfdBlue)   ,eska );  {vykresluje rychlost S-vln}
    NoSVALform.PlotPanel4.AddXY(R[numoflay+1] , -hlayers2*1.25,clYellow,husto);                         {vykresluje hustotu}
    if ((ityprl = 0) or (ityprl = 3)) then begin {kdyz jsem pocital Rayleigha nebo spolecnou}
      NoSVALform.PlotPanel4.AddXY(A[numoflay+1] , -hlayers2,RGB(124,219,230),pecka);                    {vykresluje rychlost P-vln}
      NoSVALform.PlotPanel4.AddXY(A[numoflay+1] , -hlayers2*1.25,RGB(124,219,230),pecka);               {vykresluje rychlost P-vln}
    end;
  end; {konec "with sim[0]"}
  NoSVALform.label14.BringToFront;
  NoSVALform.label16.BringToFront;
  NoSVALform.label20.BringToFront;
  NoSVALform.label24.BringToFront;
  NoSVALform.label25.BringToFront;
  NoSVALform.label26.BringToFront;
  NoSVALform.Button25.Enabled := true; {dovoluju vykreslovat strukturu S-vln}
  NoSVALform.Button26.Enabled := true; {dovoluju vykreslovat strukturu hustoty}
  if ((ityprl = 0) or (ityprl = 3)) then begin {kdyz jsem pocital Rayleigha}
    NoSVALform.Button28.Enabled := true; {dovoluju vykreslovat strukturu P-vln}
  end;
  NoSVALform.Button39.Enabled := true; {dovoluju vykreslovat nafitovanou disperzni krivku / cervena cara}
  pp3 := pp3+1;
  with NoSVALform.PlotPanel3 do begin
    LayerOptions(pp3,pmLine,4);
  end;
 {VYKRESLUJE MODELOVOU DISPERZNI KRIVKU}
  NoSVALform.PlotPanel3.AddXY(prumtperiod[1],prumuvelocity[1],RGB(bfdRed,bfdGreen,bfdBlue),pp3); {prvni bod}
  for jeje := 1 to trunc(prumnft/4) do begin
    NoSVALform.PlotPanel3.AddXY(prumtperiod[jeje*4],prumuvelocity[jeje*4],RGB(bfdRed,bfdGreen,bfdBlue),pp3); {body uprostred}
  end;
  NoSVALform.PlotPanel3.AddXY(prumtperiod[prumnft],prumuvelocity[prumnft],RGB(bfdRed,bfdGreen,bfdBlue),pp3); {posledni bod}
  if ityprl = 3 then begin {pro spolecnou inverzi}
    pp3 := pp3+1;
    with NoSVALform.PlotPanel3 do begin
      LayerOptions(pp3,pmLine,4);
    end;
    {VYKRESLUJE druhou MODELOVOU DISPERZNI KRIVKU}
    NoSVALform.PlotPanel3.AddXY(prumtperiod[1],prumuvelocity2[1],RGB(bfdRed,bfdGreen,bfdBlue),pp3); {prvni bod}
    for jeje := 1 to trunc(prumnft/4) do begin
      NoSVALform.PlotPanel3.AddXY(prumtperiod[jeje*4],prumuvelocity2[jeje*4],RGB(bfdRed,bfdGreen,bfdBlue),pp3); {body uprostred}
    end;
    NoSVALform.PlotPanel3.AddXY(prumtperiod[prumnft],prumuvelocity2[prumnft],RGB(bfdRed,bfdGreen,bfdBlue),pp3); {posledni bod}
  end; {if ityprl = 3}
  NoSVALform.label15.BringToFront;
  NoSVALform.label17.BringToFront;
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - inversion ended at '+DateTimeToStr(Now));
  if (stopka = false) and (jenjedna = false) then begin {tedy kdyz jsem zmackl cudlik STOP}
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - inversion stopped by user ...');
  end;
  if (stopka = false) and (jenjedna = true) then begin {tedy kdyz jsem zmackl cudlik pro startovaci disperzi}
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - only starting dispersion was computed');
  end;
  NoSVALform.Button29.Enabled := True;
  NoSVALform.Button33.Enabled := True;
  NoSVALform.CheckBox1.Enabled := true;  {povolim interaktivni ovladani}
  koneccasu := Time;
  koneccasu := koneccasu*86400;
  trvani := koneccasu - zacatekcasu;
  if (trvani > 60) then begin
    minuty := trunc(trvani / 60);
    sekundy := trvani-(minuty*60);
    str(minuty,minutystrg);
    str(sekundy:5:2,sekundystrg);
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - time needed for inversion: '+minutystrg+' min '+sekundystrg+' s');
  end
  else begin  {kdyz je to mensi nez 60 sekund}
    str(trvani:5:2,trvanistrg);
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - time needed for inversion: '+ trvanistrg+' s');
  end;
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | ... end of the inversion');
  NoSVALform.memo1.Lines.Add('------------------------------------------------------------------------');
end; {konec procedury TSi.KonecTisk}

procedure TSi.Konec; {ukonceni programu}
var
  i:integer;
begin
  for i:=0 to np do dispose(sim[i]);
  dispose(mip);
  dispose(map);
end;

procedure TSi.Option; {parametry programu}
begin                 {tuhle procedurku to ale neposloucha - podobna je jeste v Unite InverUnit, a tu to posloucha}
  maxnk :=200;        {maximalni pocet vypoctu /np ... tedy tohle cislo krat parametry je maximalni dovoleny pocet primych uloh, originalne tu bylo maxnk = 200, coz pro 17+1 vrstev a Rayleigha dela 10800 primych uloh}
  nspat :=2;          {po kolika spatnych vypoctech to vypadne /np}
  ckk   :=100;        {maxim.pocet prumetu v jedne iteraci}
  croz  :=0.0001/ckk; {kriterium pro ukonceni prumetu}
  cspat :=0.99;       {kriterium pro prijatelny spat/vmin}
  cmind :=1;          {nastaveni mind a maxd na zacatku}
  copak :=200;        {maximalni pocet opakovani vypoctu}
end;

procedure Tsi.Kresli; {kresleni na obrazovku po kazdem kroku}
begin
end;

function Tsi.Pokracuj:boolean;  {kriterium pro pokracovani}
begin
  if unlimited then begin            {pokud je zaskrtnuto UNLIMITED ITRATION, tak se to zastavi jenom kdyz zmacknu STOP, jinak to bezi do nekonecna}
    pokracuj := stopka               {kdyz jsem zmacknul stopku, je toto :false:}
  end;
  if (unlimited = false) then begin  {kdyz je UNLIMITED ITRATION NEzaskrtnute, chova se to standardne a inverze se zastavi, az ji to prestane}
                                     {bavit z jednoho z nasledujicich duvodu:}
    pokracuj := (vmin>odnp)          {nalezeno reseni}
              and (nk<maxnk*np)      {moc iteraci}
              and (nk-unk<=nspat*np) {neco se zaseklo}
              and (stopka)           {kdyz jsem zmacknul stopku, je toto :false:}
  end;
end;

procedure TSi.StartMod; {start uprostred}
var
  i:integer;
begin
  with sim[0]^ do begin
    //for i := 1 to np do p[i] := (mip^[i]+map^[i])/2; {puvodne to startovalo na prumeru mezi maximem a minimem}
    if ityprl = 1 then begin {pro Loveho}
      for i := 1 to  1 do p[i] := (((map^[i]-mip^[i])/2)  )+mip^[i]; {prvni vrstva bude na pulce}
      for i := 2 to np do p[i] := (((map^[i]-mip^[i])/7)*2)+mip^[i]; {a ted to dame blize k minimu}
    end;
    if ((ityprl = 0) or (ityprl = 3)) then begin {pro Rayleigha nebo spolecnou}
      for i := 1                 to             1 do p[i]:=(((map^[i]-mip^[i])/2)  )+mip^[i]; {prvni vrstva bude na pulce}
      for i := 2                 to trunc(np/3*2) do p[i]:=(((map^[i]-mip^[i])/7)*2)+mip^[i]; {a ted to dame blize k minimu}
      for i := (trunc(np/3*2)+1) to np            do p[i]:= ((mip^[i]+map^[i])/2)           ; {Pro PvSv pomer je to v pulce}
    end;
  end;
end;

function Tsi.SkalD(var da,db:tda):double;
var
  k         : integer;
  hvel      : double;
begin
  hvel := 0;
  for k := 1 to nd do hvel := hvel + da[k] * db[k];
  SkalD := hvel;
end;

procedure Tsi.Rozdil(var da,db,dc:tda);
var
  k : integer;
begin
  for k := 1 to nd do da[k] := db[k] - dc[k];
end;

function TSi.Hranice(p:tpa):boolean;
var
  hb : boolean;
  i : integer;
begin
  hb := true;
  for i := 1 to np do begin
    if ((p[i] < mip^[i]) or (p[i] > map^[i])) then hb := false;
  end;
  Hranice := hb;
end;

procedure TSi.Nejhor;
var
  i : integer;
begin
  inej := 0;
  vnej := vmin;
  for i := 1 to nbod do begin
    if (vnej < sim[i]^.vzda) then begin
      inej := i;
      vnej := sim[i]^.vzda;
    end;
  end;
end;

procedure Tsi.Iterace;
var
  i,j,k     : integer;
  res       : tpa;
  zb        : pda;
  hd        : pda;
  hrozsah   : double;
  pmin,pmax : double;
  del2      : array[1..cnp] of double;
  hspat     : double;
  krat      : double;
  kk        : integer;
  hroz      : double;
begin
  new(hd);     {tady dam stopku s poctem 8405}
  new(zb);
  Medstr := 'Start';
  StartMod;
  with sim[0]^ do begin
    vzda := vzdalen(p,d);
    vmin := vzda
  end;
  for i := 1 to np do der[i] := 32 * vmin/(map^[i] - mip^[i]);
  kresli;
  tisk;
  nbod  := 0;
  inej  := 0;
  vnej  := vmin;
  unk   := nk;
  ckra  := 1;
  nelin := vmin;
  mind  := -cmind;
  maxd  := cmind+1;
  while pokracuj do begin
    if (nk>Unk) or (nbod<np) then with dal do begin //pri neuspechu nebo pri neuplnem simplexu
      medstr := 'Monte Carlo';
      if(ckra < MalCis) then ckra := MalCis;
      if(ckra > VelCis) then ckra := VelCis;
      for i := 1 to np do begin
        hrozsah := vmin / der[i] / ckra;
        pmax := sim[0]^.p[i] + hrozsah;
        pmin := sim[0]^.p[i] - hrozsah;
        if(pmax > map^[i]) then pmax := map^[i];
        if(pmin < mip^[i]) then pmin := mip^[i];
        p[i] := pmin + random*(pmax - pmin);
      end;
      vzda     := vzdalen(p,d);
      krokm := vzdal(sim[0]^.d,d);
      ckra := sqrt(ckra*ckra*2*krokm/vmin);
      if (vzda < vmin) then begin
        unk := nk;
        if (nbod < np) then begin
          inc(nbod);
          sim[nbod]^ := sim[0]^;
        end
        else begin
          sim[inej]^ := sim[0]^;
        end;
        vmin := vzda;
        sim[0]^ := dal;
      end
      else begin
        if(nbod<np) then begin
          inc(nbod);
          sim[nbod]^ := dal;
          unk := nk;
        end
        else begin
          if(dal.vzda<vnej) then begin
            unk := nk;
            sim[inej]^ := dal;
          end;
        end;
      end;
      nejhor;
    end
    else begin
      medstr := 'Prumety';
      for k := 1 to nbod do begin
        rozdil(hd^,sim[k]^.d,sim[0]^.d);
        del2[k] := SkalD(hd^,hd^);
        if(del2[k] < zero) then del2[k] := zero;
      end;
      for i := 1 to nd do zb^[i] := -sim[0]^.d[i];
      for k := 1 to nbod do res[k] := 0;
      spat := vmin;
      kk := 0;
      repeat
        inc(kk);
        for k := 1 to nbod do begin
          rozdil(hd^,sim[k]^.d,sim[0]^.d);
          krat := SkalD(zb^,hd^)/del2[k];
          if(krat + res[k] > maxd) then krat := maxd - res[k];
          if(krat + res[k] < mind) then krat := mind - res[k];
          for i := 1 to nd do hd^[i] := krat*hd^[i];
          res[k] := res[k] + krat;
          rozdil(zb^,zb^,hd^);
        end;
        hspat := sqrt(SkalD(zb^,zb^));
        hroz := spat-hspat;
        spat := hspat;
      until (hroz < croz*vmin) or (kk > ckk);
      if(spat/vmin < cspat) then begin
        dal.p := sim[0]^.p;
        for j:= 1 to nbod do begin
          for i:= 1 to np do begin
            dal.p[i] := dal.p[i] + res[j]*(sim[j]^.p[i] - sim[0]^.p[i]);
          end;
        end;
        if hranice(dal.p) then begin
          hd^ := sim[0]^.d;
          for j := 1 to nbod do begin
            for i := 1 to nd do begin
              hd^[i] := hd^[i] + res[j]*(sim[j]^.d[i] - sim[0]^.d[i]);
            end;
          end;
          with dal do begin
            vzda     := vzdalen(p,d);
          end;
          krok  := vzdal(dal.d,sim[0]^.d);
          nelin := vzdal(hd^,dal.d);
          if(spat > nelin) then begin
            if(mind > -1000000)then mind := mind - 0.5;
            if(maxd <  1000000)then maxd := maxd + 0.5;
          end
          else begin
            if(mind < -0.6) then mind := mind + 0.5;
            if(maxd >  1.6) then maxd := maxd - 0.5;
          end;
          if (dal.vzda < vmin) then begin
            unk := nk;
            sim[inej]^ := sim[0]^;
            sim[0]^ := dal;
            vmin := sim[0]^.vzda;
          end
          else begin
            if (dal.vzda < vnej) then begin
              sim[inej]^ := sim[0]^;
              unk := nk;
            end;
          end
        end
        else begin
          nelin := -1;    {mimo hranice}
          unk   := nk -1;
        end;
      end
      else begin
        nelin := -2;      {smer k reseni je skoro kolmy na vsechno v simplexu}
        unk   := nk-1;
      end;
      nejhor;
    end;
    tisk;
    kresli;
  end; {konec while Pokracuj}

  with sim[0]^ do vzda := vzdalen(p,d);

  dispose(hd);
  dispose(zb);
end; {konec procedury Iterace}

function TSi.BGlob:boolean;
begin
  BGlob := (sim[0]^.vzda < odnp) or (ilok >= copak);
end;

procedure Tsi.Run; {hlavni procedura}
begin              {sem to skoci poprvez Inver Unit}
  Zacatek;
  ilok := 0;
  repeat
    inc(ilok);
    Ctijmena;
    Option;
    ZacTisk;
    radek := radek + 1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - inversion started at '+DateTimeToStr(Now));
    zacatekcasu := Time;
    zacatekcasu := zacatekcasu*86400;
    nk := 0;
    Iterace;
    KonecTisk;
  until bglob;
  Konec;
end;

end.
