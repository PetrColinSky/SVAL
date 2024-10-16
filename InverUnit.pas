unit InverUnit;
               {unita od Jirky Malka, ktera ovlada inverzi IM, s primou ulohou od Oldricha Novotneho}
interface      {a kompletne predelana mnou s mnoha vsuvkami}
uses
  LCLIntf, LCLType, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, PrumetUnit, ExtCtrls, Math, SvalUnit, PlotPanel;
const
  mode      = 0;    	      {mode  = 0 means fundamental or an even higher mode, mode = 1 means an odd higher mode - v pripade zmeny teto konstanty je potreba odkomentovat prislusne casti kodu nize}
  ift       = 1;     	      {ift   = 0 means constant step in frequency, ift = 1 means constant step in period}
  {tyhle dve veci jsou jako konstanty uvedene tady nahore, aby se snadno nasly, kdyby bylo potreba je menit, ale nize jsou vykomentovane casti kodu pro ty ostatni moznosti}
  {protoze jinak to hlasi "unreachable code", protoze pri konstante nastavene na nejakou hodnotu to nikdy nemuze vlezt do if, ktery pozaduje hodnotu jinou}
  cstep     = 0.01;           {cstep : the step in phase velocity}
  caccur    = 0.000001;       {caccur: required accuracy of phase velocity computing ORIG: caccur    = 0.000001;}
  eps       = 0.00001;        {eps   : the small number for Taylor series computing}
  amax      = 4.0;    	      {amax  : maximal argument of exponencial function}
  pvsvratio = 1.73;           {pro vypocet rychlosti P-vln, jen abych tam mel nejake realisticke hodnoty, kdyz to pocitam pro Loveovy vlny}

type
  ptest=^ttest;                                       {ukazatel na objekt}
  TTest=object(Tsi)                                   {objekt pro inverzi}
    procedure Funkce(var pa:tpa;var fit:tda);virtual; {prima uloha}
    procedure Ctidat;virtual;                         {zadani dat}
    procedure CtiPar;virtual;                         {zadani parametru}
    procedure Kresli;virtual;
    procedure Option;virtual;
  end;

  { TForm1 }

  TForm1 = class(TForm)
  PlotPanel1: TPlotPanel;
  Image1: TImage;
  Inverse: TButton;
  Button1: TButton;
  Button2: TButton;
  Button3: TButton;
  Button4: TButton;
  Button5: TButton;
  Button6: TButton;
  Button7: TButton;
  Misfit: TEdit;
  Edit1: TEdit;
  Edit2: TEdit;
  Edit3: TEdit;
  Edit4: TEdit;
  Edit5: TEdit;
  Edit6: TEdit;
  Edit7: TEdit;
  Label1: TLabel;
  Label2: TLabel;
  Label3: TLabel;
  Label4: TLabel;
  Label5: TLabel;
  Label6: TLabel;
  Label7: TLabel;
  Label8: TLabel;
  Label20: TLabel;
  CheckBox1: TCheckBox;
  CheckBox2: TCheckBox;
  procedure Button7Click(Sender: TObject);
  procedure InverseClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure DatPar(Sender: TObject);
  procedure Button1Click(Sender: TObject);
  procedure Button2Click(Sender: TObject);
  procedure Button3Click(Sender: TObject);
  procedure Button4Click(Sender: TObject);
  procedure Button5Click(Sender: TObject);
  procedure Button6Click(Sender: TObject);
  procedure spustit;
  procedure nastavplot;
  procedure CheckBox1Click(Sender: TObject);
  procedure CheckBox2Click(Sender: TObject);
  private { Private declarations }
  public  { Public declarations }
end;

var
  Form1     : TForm1;
  Te        : PTest;
implementation
{$R *.lfm}
type
  arrayofextended = array of extended;

var {declaring variables for the whole unit}
  n,n1,nft                        : integer;
  ft,cappro,freq,c,t,u,aresp,dcdf : extended;
  ur, cr, ul, cl                  : extended;
  aux,aux2                        : arrayofextended;
  poc                             : integer;
  {promenne pro funkci MULT5}
  x1,x2,x3,x4,x5,zz1,zz2,zz3,zz4  : extended;
  m,i1,i2,i3,i4,i5                : integer;
  {konec promennych pro funkci MULT5}
  maxLovenorm                     : double;
  zastavka                        : integer;
  vyska                           : integer;
  sirka                           : integer;
  kreslit                         : boolean;
  batchstopka                     : boolean;
  koneccasuBI, trvaniBI           : double;
  trvaniBIstrg                    : string;
  zacatekcasuBI                   : double;
  minutyBI                        : integer;
  sekundyBI                       : double;
  minutyBIstrg                    : string;
  sekundyBIstrg                   : string;
  zakladnicaption                 : string;
  dodatecnacaption                : string;

procedure TTest.Option;
{parametry programu - obracena uloha isometrickou metodou}
begin
  maxnk := 200;         {maximalni pocet vypoctu /np - puvodne tu ma byt 200}
  nspat := 2;           {po kolika spatnych vypoctech to vypadne /np}
  ckk   := 100;         {maxim.pocet prumetu v jedne iteraci}
  croz  := 0.0001/ckk;  {kriterium pro ukonceni prumetu}
  cspat := 0.99;        {kriterium pro prijatelny spat/vmin}
  cmind := 1;           {nastaveni mind a maxd na zacatku}
  copak := 1;           {maximalni pocet opakovani vypoctu}
end;

procedure MULT5(n: integer;Y: arrayofextended; X,Z: arrayofextended);
{potrebna pro vypocet prime ulohy maticovou metodou}
begin
    m     := (n-1)*5;
    i1    := m+1;
    i2    := m+2;
    i3    := m+3;
    i4    := m+4;
    i5    := m+5;
    x1    := X[I1];
    x2    := X[I2];
    x3    := X[I3];
    x4    := X[I4];
    x5    := X[I5];
    zz1   := Y[1]*x1+Y[6]*x2+Y[10]*x3+Y[13]*x4+Y[15]*x5;
    zz2   := Y[2]*x1+Y[7]*x2+Y[11]*x3+Y[14]*x4+Y[13]*x5;
    zz3   := Y[3]*x1+Y[8]*x2+Y[12]*x3+Y[11]*x4+Y[10]*x5;
    zz4   := Y[4]*x1+Y[9]*x2+Y[8] *x3+Y[7] *x4+Y[6] *x5;
    Z[I5] := Y[5]*x1+Y[4]*x2+Y[3] *x3+Y[2] *x4+Y[1] *x5;
    Z[I1] := zz1;
    Z[I2] := zz2;
    Z[I3] := zz3*2.0;
    Z[I4] := zz4;
end; {end of the procedure MULT5}

procedure VRAL; {computation of Rayleigh wave dispersion curves}
var             {prelozene z FORTRANskeho kodu, ktery napsal doc. Oldrich Novotny}
                {je to hodne upraveno, snazil jsem se vyhodit vsechna "goto", ale ve dvou pripadech se mi to nepodarilo}
  jcpcq,jcpcqc,jcpcqo,om,oc,od,ra2,redp,p,cp,sp,rsp             : extended;
  e,ex,p2,spr,rb2,redq,q,cq,sq,rsq,eq,exq,q2,sqqr,one           : extended;
  g,g1,g2,g3,g4,g12,g13,g14,gg1,dgg1,dg1,cpcq,cprsq,cpsqr       : extended;
  cqrsp,cqspr,rsprsq,sprsqr,r1,r2,dc,odc,cpo,cqo,spro,sqro      : extended;
  rspo,rsqo,cpc,cqc,s15,s16,rspc,od2,brac,sprc,rsqc,sqrc        : extended;
  gc,g2c,g3c,g4c,g12c,g13c,g14c,gg1c,dgg1c,dg1c,cpcqc,cprsqc    : extended;
  cpsqrc,cqrspc,cqsprc,rprqc,prqrc,cpcqo,cprsqo,cpsqro,cqrspo   : extended;
  cqspro,rprqo,prqro,pc,po,qc,qo,rarb,y11,y12,y13,y14,y15,f,rac : extended;
  rbc,rarbc,yc11,yc12,yc13,yc14,yc15,fc,fo,dco,fres,c1,c2       : extended;
  ra,rb                                                         : extended;
  i,ik,jj,ihalv,icup,ieqsol                                     : integer;
  X,XC,XO                                                       : arrayofextended;
  Y,YC,YO                                                       : arrayofextended;
label 4,9;
begin
    setlength(X ,16);
    setlength(XC,16);
    setlength(XO,16);
    setlength(Y ,16);
    setlength(YC,16);
    setlength(YO,16);
    for i := 0 to 15 do begin
      X[i]  := 0.0;
      XC[i] := 0.0;
      XO[i] := 0.0;
      Y[i]  := 0.0;
      YC[i] := 0.0;
      YO[i] := 0.0;
    end;
    n1      := n-1;
    om      := 6.2831853*freq;
    i       := 0;
    ihalv   := 0;
    icup    := 0;
    ieqsol  := 0;
    for ik  := 1 to 10 do begin
      X[ik]  := 0.0;
      XC[ik] := 0.0;
      XO[ik] := 0.0;
    end;
    X[7]    :=1.0;
    c       := cappro-cstep;
4:  c       := c+cstep;
    if (c-B[n]) >= 0 then begin
      c       := c-cstep;
      u       := 0;
      aresp   := 0;
      dcdf    := 0;
      exit; {the procedure terminates here if (c-B[n]) >= 0}
    end;
9:  i       := i+1;
    icup    := icup+1;
    oc      := om/c;
    X[1]    := 1.0;
    for ik  := 2 to 5 do begin
      X[ik] := 0.0;
    end;
    for jj    := 1 to N1 do begin {cycle for the layers (from the top to bottom)}
      od    := oc*DD[jj];
      ra2   := power(c/A[jj],2)-1.0; {expressions for P-waves}
      redp  := 1.0;
      if ra2 <  0 then begin
        ra    := -sqrt(-ra2);
        p     := od*ra;
        if (p+amax) <  0 then begin
          e     := exp(p+p+amax); {reduced expressions (multiplied by exp(p+amax))}
          ex    := exp(amax);
          redp  := exp(p+amax);
        end;
        if (p+amax) >= 0 then begin
          e     := exp(p);
          ex    := 1.0/e;
        end;
        cp    := (e+ex)/2.0;
        sp    := (e-ex)/2.0;
        rsp   := -ra*sp;
      end;
      if ra2 >= 0 then begin
        ra    := sqrt(ra2);
        p     := od*ra;
        cp    := cos(p);
        sp    := sin(p);
        rsp   := ra*sp;
      end;
      if abs(p) <= eps then begin
        p2    := p*p;
        spr   := ((p2/20.0-1.0)*p2/6.0+1.0)*od;
      end;
      if abs(p) >  eps then begin
        spr   := sp/ra;
      end;
      rb2   := power(c/B[jj],2)-1.; {expressions for S-waves}
      redq  := 1.0;
      if rb2 <  0 then begin
        rb    := -sqrt(-rb2);
        q     := od*rb;
        if (q+amax) <  0 then begin
          eq    := exp(q+q+amax); {reduced expressions (multiplied by exp(q+amax))}
          exq   := exp(amax);
          redq  := exp(q+amax);
        end;
        if (q+amax) >= 0 then begin
          eq    := exp(q);
          exq   := 1.0/eq;
        end;
        cq    := (eq+exq)/2.0;
        sq    := (eq-exq)/2.0;
        rsq   := -rb*sq;
      end;
      if rb2 >= 0 then begin
        rb    := sqrt(rb2);
        q     := od*rb;
        cq    := cos(q);
        sq    := sin(q);
        rsq   := rb*sq;
      end;
      if abs(q) > eps then begin
        sqqr  := sq/rb;
      end;
      if abs(q) <= eps then begin
        q2    := q*q;
        sqqr  := ((q2/20.0-1.0)*q2/6.0+1.0)*od;
      end;
      one   := redp*redq; {elements of the layer matrix Y}
      g     := 2.0*power(B[jj]/c,2);
      g1    := g-1.0;
      g2    := g*g;
      g3    := g*g2;
      g4    := g2*g2;
      g12   := g1*g1;
      g13   := g1*g12;
      g14   := g12*g12;
      gg1   := g*g1;
      dgg1  := 2.0*gg1;
      dg1   := 2.0*g-1.0;
      cpcq  := cp*cq;
      jcpcq := one-cpcq;
      cprsq := cp*rsq;
      cpsqr := cp*sqqr;
      cqrsp := cq*rsp;
      cqspr := cq*spr;
      rsprsq:= rsp*rsq;
      sprsqr:= spr*sqqr;
      r1    := R[jj];
      r2    := r1*r1;
      Y[1]  := -dgg1*one+(dgg1+1.0)*cpcq-G2*rsprsq-g12*sprsqr;
      Y[2]  := (g2*cprsq+g12*cqspr)*r1;
      Y[3]  := (gg1*dg1*jcpcq+g3*rsprsq+g13*sprsqr)*r1;
      Y[4]  := (g12*cpsqr+g2*cqrsp)*r1;
      Y[5]  := (dgg1*gg1*jcpcq+g4*rsprsq+g14*sprsqr)*r2;
      Y[6]  := -(cpsqr+cqrsp)/r1;
      Y[7]  := cpcq;
      Y[8]  := g1*cpsqr+g*cqrsp;
      Y[9]  := -rsp*sqqr;
      Y[10] := -(dg1*jcpcq+g1*sprsqr+g*rsprsq)/r1;
      Y[11] := g*cprsq+g1*cqspr;
      Y[12] := dgg1*jcpcq+g2*rsprsq+g12*sprsqr+one/2.0;
      Y[13] := -(cprsq+cqspr)/r1;
      Y[14] := -spr*rsq;
      Y[15] := (2.0*jcpcq+rsprsq+sprsqr)/r2;
      if ieqsol <> 0 then begin
        dc    := DD[jj]/c; {first derivatives with respect to phase velocity c and angular frequency om}
        odc   := od/c;
        cpo   := -rsp*dc;
        cqo   := -rsq*dc;
        spro  := cp*dc;
        sqro  := cq*dc;
        rspo  := spro*ra2;
        rsqo  := sqro*rb2;
        cpc   := -odc*spr;
        cqc   := -odc*sqqr;
        s15   := (ra2+1.0)*spr/c;
        s16   := odc*cp;
        rspc  := s15+s16;
        if abs(p) > eps then begin
          sprc  := (-s15+s16)/ra2;
        end;
        if abs(p) <= eps then begin
          p2    := P*P;
          od2   := od*od;
          brac  := (od2/7.0+1.0)*p2/20.0-od2/5.0-1.0;
          sprc  := -(brac*p2/6.0+od2/3.0+1.0)*odc;
        end;
        s15   := (rb2+1.0)*sqqr/c;
        s16   := odc*cq;
        rsqc  := s15+s16;
        if abs(q) > eps then begin
          sqrc  := (-s15+s16)/rb2;
        end;
        if abs(q) <= eps then begin
          q2    := q*q;
          od2   := od*od;
          brac  := (od2/7.0+1.0)*q2/20.0-od2/5.0-1.0;
          sqrc  := -(brac*q2/6.0+od2/3.0+1.0)*odc;
        end;
        gc    := -2.0*g/c;
        g2c   := 2.0*g*gc;
        g3c   := 3.0*g2*gc;
        g4c   := 4.0*g3*gc;
        g12c  := 2.0*g1*gc;
        g13c  := 3.0*g12*gc;
        g14c  := 4.0*g13*gc;
        gg1c  := g2c-gc;
        dgg1c := 2.0*gg1c;
        dg1c  := 2.0*gc;
        cpcqc := cpc*cq+cp*cqc;
        jcpcqc:= -cpcqc;
        cprsqc:= cpc*rsq+cp*rsqc;
        cpsqrc:= cpc*sqqr+cp*sqrc;
        cqrspc:= cqc*rsp+cq*rspc;
        cqsprc:= cqc*spr+cq*sprc;
        rprqc := rspc*rsq+rsp*rsqc;
        prqrc := sprc*sqqr+spr*sqrc;
        cpcqo := cpo*cq+cp*cqo;
        jcpcqo:= -cpcqo;
        cprsqo:= cpo*rsq+cp*rsqo;
        cpsqro:= cpo*sqqr+cp*sqro;
        cqrspo:= cqo*rsp+cq*rspo;
        cqspro:= cqo*spr+cq*spro;
        rprqo := rspo*rsq+rsp*rsqo;
        prqro := spro*sqqr+spr*sqro;
        YC[1] := dgg1c*(-one+cpcq)+(dgg1+1.0)*cpcqc-g2c*rsprsq-g2*rprqc-g12c*sprsqr-g12*prqrc;
        YC[2] := (g2c*cprsq+g2*cprsqc+g12c*cqspr+g12*cqsprc)*r1;
        YC[3] := ((GG1C*DG1+GG1*DG1C)*JCPCQ+GG1*DG1*JCPCQC+G3C*RSPRSQ+G3*RPRQC+G13C*SPRSQR+G13*PRQRC)*R1;
        YC[4] := (g12c*cpsqr+g12*cpsqrc+g2c*cqrsp+g2*cqrspc)*r1;
        YC[5] := ((dgg1c*gg1+dgg1*gg1c)*jcpcq+dgg1*gg1*jcpcqc+g4c*rsprsq+g4*rprqc+g14c*sprsqr+g14*prqrc)*r2;
        YC[6] := -(cpsqrc+cqrspc)/r1;
        YC[7] := cpcqc;
        YC[8] := (cpsqr+cqrsp)*gc+g1*cpsqrc+g*cqrspc;
        YC[9] := -rspc*sqqr-rsp*sqrc;
        YC[10]:= -((2.0*jcpcq+sprsqr+rsprsq)*gc+dg1*jcpcqc+g1*prqrc+g*rprqc)/r1;
        YC[11]:= (cprsq+cqspr)*gc+g*cprsqc+g1*cqsprc;
        YC[12]:= dgg1c*jcpcq+dgg1*jcpcqc+g2c*rsprsq+g2*rprqc+g12c*sprsqr+g12*prqrc;
        YC[13]:= -(cprsqc+cqsprc)/r1;
        YC[14]:= -sprc*rsq-spr*rsqc;
        YC[15]:= (2.0*jcpcqc+rprqc+prqrc)/r2;
        YO[1] := (dgg1+1.0)*cpcqo-g2*rprqo-g12*prqro;
        YO[2] := (g2*cprsqo+g12*cqspro)*r1;
        YO[3] := (gg1*dg1*jcpcqo+g3*rprqo+g13* prqro)*r1;
        YO[4] := (g12*cpsqro+g2*cqrspo)*r1;
        YO[5] := (dgg1*gg1*jcpcqo+g4*rprqo+g14*prqro)*r2;
        YO[6] := -(cpsqro+cqrspo)/r1;
        YO[7] := cpcqo;
        YO[8] := g1*cpsqro+g*cqrspo;
        YO[9] := -rspo*sqqr-rsp*sqro;
        YO[10]:= -(dg1*jcpcqo+g1*prqro+g*rprqo)/r1;
        YO[11]:= g*cprsqo+g1*cqspro;
        YO[12]:= dgg1*jcpcqo+g2*rprqo+g12*prqro;
        YO[13]:= -(cprsqo+cqspro)/r1;
        YO[14]:= -spro*rsq-spr*rsqo;
        YO[15]:= (2.0*jcpcqo+rprqo+prqro)/r2;
        if (p+amax) <  0 then begin
          pc    := -od*odc/p;
          po    := p/om;
          for ik  :=1 to 15 do begin
            YC[ik] := YC[ik]+Y[ik]*pc;
            YO[ik] := YO[ik]+Y[ik]*po;
          end;
          if (q+amax) <  0 then begin
            qc    := -od*odc/q;
            qo    := q/om;
            for ik  := 1 to 15 do begin
              YC[ik] := YC[ik]+Y[ik]*qc;
              YO[ik] := YO[ik]+Y[ik]*qo;
            end;
          end;
        end;
        MULT5(1,Y,XC,AUX);
        MULT5(1,YC,X,AUX2);
        for ik := 1 to 5 do begin
          XC[ik] := AUX[ik]+AUX2[ik];
        end;
        MULT5(1,Y,XO,AUX);
        MULT5(1,YO,X,AUX2);
        for ik := 1 to 5 do begin
          XO[ik] := AUX[ik]+AUX2[ik];
        end;
        MULT5(2,Y,X,X);  {end of the formulae for derivatives}
      end; {end of the block for condition ieqsol <> 0}
      MULT5(1,Y,X,X);
    end; {end of the cycle for the layers}
    g       := 2.0*power(B[n]/C,2); {expressions for the halfspace}
    g1      := g-1.0;
    g2      := g*g;
    g12     := g1*g1;
    r1      := R[n];
    ra      := -sqrt(1.0-power((c/A[n]),2));
    rb      := -sqrt(1.0-power((c/B[n]),2));
    rarb    := ra*rb;
    y11     := (g2*rarb-g12)*r1;
    y12     := ra;
    y13     := g*rarb-g1;
    y14     := rb;
    y15     := (1.0-rarb)/r1;
    f       := -y11*X[1]-y12*X[2]-y13*X[3]-y14*X[4]-y15*X[5];
    if ieqsol <> 0 then begin
      gc      := -2.0*g/c; {first derivatives}
      rac     := -c/(ra*power(A[n],2));
      rbc     := -C/(rb*power(B[n],2));
      rarbc   := rac*rb+ra*rbc;
      yc11    := ((g*rarb-g1)*2.*gc+g2*rarbc)*r1;
      yc12    := rac;
      yc13    := (rarb-1.0)*gc+g*rarbc;
      yc14    := rbc;
      yc15    := -rarbc/r1;
      poc := poc +1;
      fc      := -yc11*X[1]-y11*XC[1]-yc12*X[2]-y12*XC[2]-yc13*X[3]-y13*XC[3]-yc14*X[4]-y14*XC[4]-yc15*X[5]-y15*XC[5];
      fo      := -y11*XO[1]-y12*XO[2]-y13*XO[3]-y14*XO[4]-y15*XO[5];
      dco     := -fo/fc; {dco is the derivative of phase velocity with respect to angular frequency}
      u       := c/(1.0-oc*dco);
      fres    := -y11*X[6]-y12*X[7]-y13*X[8]-y14*X[9]-y15*X[10];
      aresp   := fres*oc/c/fc;
      aresp   := aresp/power(c,2);
      dcdf    := dco*om;
      exit; {the procedure terminates here, the group velocity u is already estimated}
    end; {for ieqsol <> 0}
    if i > 100 then begin{solving the dispersion equation (computing the phase velocity c)}
      u       := 0;
      aresp   := 0;
      dcdf    := 0;
      exit; {the procedure terminates here if i > 100}
    end; {for i > 100}
//    if mode  = 1 then f := -f;
    if ihalv <= 0 then begin
      if f < 0 then goto 4;
      if f = 0 then begin
        ieqsol:= 1; {phase velocity if found with the required accuracy}
        goto 9;
      end; {for f = 0}
      if f > 0 then begin
        if (icup-1) <= 0 then begin
          c     := c-cstep;
          icup  := 0;
          goto 9;
        end; {for (icup-1) <= 0 }
        if (icup-1) >  0 then begin
          c1    := c-cstep;
          c2    := c;
          ihalv := 1;
          c     := (c1+c2)/2.0;
          goto 9;
        end; {for (icup-1) > 0 }
      end; {for f > 0}
    end; {for ihalv <= 0}
    if ihalv >  0 then begin
      if f < 0 then begin
        c1    :=c;
      end; {for f < 0}
      if f = 0 then begin
        ieqsol :=1;
        goto 9
      end; {for f = 0}
      if f > 0 then begin
        c2    := c;
      end; {for f > 0}
      c     := (c1+c2)/2.0;
      if abs(c2-c1) > caccur then goto 9; {after the condition is kept, the program leaves the procedure}
    end; {for ihalv > 0}
    ieqsol := 1;                          {and continues by setting ieqsol := 1}
    goto 9;
end; {end of the procedure VRAL}

procedure VLOV; {computation of Love wave dispersion curves}
                {prelozene z FORTRANskeho kodu, ktery napsal doc. Oldrich Novotny}
                {je to hodne upraveno, snazil jsem se vyhodit vsechna "goto", ale ve dvou pripadech se mi to nepodarilo}
var
  mi,min,mrbn,om,ihalv,icup,ieqsol,x12,x22,xc11,xc21,xo11 : extended;
  xo21,oc,x11,x21,od,rb2,rb,q,cq,sq,rsq,eq,exq,q2,sqqr    : extended;
  y11,y12,y21,dc,odc,cqo,sqro,rsqo,cqc,s15,s16,rsqc       : extended;
  od2,brac,sqrc,yc11,yc12,yc21,yo11,yo12,yo21,qo,qc       : extended;
  xx11,xx12,f,rbc,fc,dco,c1,c2                            : extended;
  i,jj                                                    : integer;
label 4,9;
begin
    n1    := n-1;
    om    := 6.2831853*freq;
    i     := 0;
    ihalv := 0;
    icup  := 0;
    ieqsol:= 0;
    x12   := 0.0;
    x22   := 1.0;
    xc11  := 0.0;
    xc21  := 0.0;
    xo11  := 0.0;
    xo21  := 0.0;
    c     := cappro-cstep;
4:  c     := c+cstep;
    if (c-b[n]) >= 0 then begin
      c     := c-cstep;
      u     := 0.0;
      aresp := 0.0;
      dcdf  := 0.0;
      exit; {the procedure terminates here if (c-b[n]) >= 0}
    end;
9:  i     := i+1;
    icup  := icup+1;
    oc    := om/c;
    x11   := 1.0;
    x21   := 0.0;
    for jj := 1 to n1 do begin {cycle for the layers (from the top to bottom)}
      od    := oc*DD[jj];
      rb2   := power((c/B[jj]),2)-1.0;
      if rb2 <  0 then begin
        rb    := -sqrt(-rb2);
        q     := od*rb;
        if (q+amax) <  0 then begin
          eq    := exp(q+q+amax); {reduced expressions (multiplied by exp(q+amax))}
          exq   := exp(amax);
        end;
        if (q+amax) >= 0 then begin
          eq    := exp(q);
          exq   := 1.0/eq;
        end;
        cq    := (eq+exq)/2.0;
        sq    := (eq-exq)/2.0;
        rsq   := -rb*sq;
      end;
      if rb2 >= 0 then begin
        rb    := sqrt(rb2);
        q     := od*rb;
        cq    := cos(q);
        sq    := sin(q);
        rsq   := rb*sq;
      end;
      if abs(q) > eps then begin
        sqqr  := sq/rb;
      end;
      if abs(q) <= eps then begin
        q2    := q*q;
        sqqr  := ((q2/20.0-1.0)*q2/6.0+1.0)*od;
      end;
      mi    := R[jj]*power(B[jj],2);
      y11   := cq;
      y12   := sqqr/mi;
      y21   := -mi*rsq;
      if ieqsol <> 0 then begin
        dc    := DD[jj]/c; {first derivatives with respect to phase velocity c and angular frequency om}
        odc   := od/c;
        cqo   := -rsq*dc;
        sqro  := cq*dc;
        rsqo  := sqro*rb2;
        cqc   := -odc*sqqr;
        s15   := (rb2+1.0)*sqqr/c;
        s16   := odc*cq;
        rsqc  := s15+s16;
        if abs(q) > eps then begin
          sqrc  := (-s15+s16)/rb2;
        end;
        if abs(q) <= eps then begin
          q2    := q*q;
          od2   := od*od;
          brac  := (od2/7.0+1.0)*q2/20.0-od2/5.0-1.0;
          sqrc  := -(brac*q2/6.0+od2/3.0+1.0)*odc;
        end;
        yc11  := cqc;
        yc12  := sqrc/mi;
        yc21  := -mi*rsqc;
        yo11  := cqo;
        yo12  := sqro/mi;
        yo21  := -mi*rsqo;
        if (q+amax) <  0 then begin
          qc    := -od*odc/q;
          qo    := q/om;
          yc11  := yc11+y11*qc;
          yc12  := yc12+y12*qc;
          yc21  := yc21+y21*qc;
          yo11  := yo11+y11*qo;
          yo12  := yo12+y12*qo;
          yo21  := yo21+y21*qo;
        end;
        xx11  := yc11*x11+y11*xc11+yc12*x21+y12*xc21;
        xc21  := yc21*x11+y21*xc11+yc11*x21+y11*xc21;
        xc11  := xx11;
        xx11  := yo11*x11+y11*xo11+yo12*x21+y12*xo21;
        xo21  := yo21*x11+y21*xo11+yo11*x21+y11*xo21;
        xo11  := xx11; {end of the formulae for derivatives}
        xx12  := y11*x12+y12*x22;
        x22   := y21*x12+y11*x22;
        x12   := xx12;
      end;
      xx11  := y11*x11+y12*x21;
      x21   := y21*x11+y11*x21;
      x11   := xx11;
    end; {end of the cycle for the layers}
    rb    := -sqrt(1.0-power((c/B[n]),2)); {expressions for the halfspace}
    min   := R[n]*power(B[n],2);
    mrbn  := min*rb;
    f     := mrbn*x11-x21;
    if ieqsol <> 0 then begin {first derivatives}
      rbc   := -c/(rb*power(B[n],2));
      fc    := (rbc*x11+rb*xc11)*min-xc21;
      dco   := (-mrbn*xo11+xo21)/fc; {dco is the derivative of phase velocity with respect to angular frequency}
      u     := c/(1.0-oc*dco);
      aresp := (x22-mrbn*x12)*oc/c/fc;
      dcdf  := dco*om;
      exit; {the procedure terminates here, the group velocity u is already estimated}
    end;
    if i > 100 then begin {solving the dispersion equation (computing the phase velocity c)}
      u     := 0.0;
      aresp := 0.0;
      dcdf  := 0.0;
      exit; {the procedure terminates here if i > 100}
    end;
//    if mode = 1 then f := -f;
    if ihalv <= 0 then begin
      if f < 0 then goto 4;
      if f = 0 then begin
        ieqsol:= 1; {phase velocity if found with the required accuracy}
        goto 9
      end;
      if f > 0 then begin
        if icup-1 <= 0 then begin
          c     := c-cstep;
          icup  := 0;
          goto 9;
        end;
        if icup-1 >  0 then begin
          c1    := c-cstep;
          c2    := c;
          ihalv := 1;
          c     := (c1+c2)/2.0;
          goto 9;
        end; {for icup-1 >}
      end;{for f > 0}
    end; {for ihalv <= 0}
    if ihalv > 0 then begin
      if f < 0 then begin
        c1    := c;
      end;
      if f = 0 then begin
        ieqsol:= 1; {phase velocity if found with the required accuracy}
        goto 9
      end;
      if f > 0 then begin
        c2    := c;
      end;
      c     := (c1+c2)/2.0;
      if abs(c2-c1) > caccur then goto 9;
    end; {for ihalv > 0}
    ieqsol:= 1; {phase velocity if found with the required accuracy}
    goto 9
end; {end of the procedure VLOV}

procedure TTest.Funkce(var pa:tpa;var fit:tda);
var                   {prima uloha - toto je opet cast isometricke metody, kde se pocita prima uloha}
  i,j,ii  : integer;  {a skladaji se zde napocitane parametry a data}
//  Astrg, Bstrg, Rstrg, ABstrg : string;
  curvestep : double;
begin
  setlength(aux ,16);
  setlength(aux2,16);
  for i := 0 to 15 do begin
    aux[i] := 0.0;
    aux2[i] := 0.0;
  end;
  pocitadlo := pocitadlo + 1;
  str(pocitadlo:8,pocitadlostrg);
  with Form1 do begin
    Form1.Edit2.Text := pocitadlostrg;
    Form1.Edit2.refresh;
  end;
  {urcovane parametry jsou serazeny nasledovne B[i], R[i], A[i], tedy Sv, Hustota a Pv pro Rayleigha a B[i] a R[i] pro Loveho}
  B[1] := setvelocitys + pa[1]; {Sv v 1. vrstve urcuju jako rozdil k zadane pocatecni rychlosti}
  for j := 2 to n do begin      {cycle for each layer}
    B[j] := B[j-1] + pa[j];     {Sv v dalsich vrstvach urcuju jako rozdil k predchozi vrstve}
  end;                          {rychlosti S-vln to nacte v kazdem pripade (Love i Rayleigh)}

  if (Dinar = true) or (KTB = true) then begin {i pro KTB}

    if prvniDinar then begin
      B[1] := Bdinar[1];             {nastavim jak rychlosti B[i] tak i parametry pa[i]}
      pa[1] := B[1] - setvelocitys;  {v tom setvelocitys je od zacatku ta Bdinar[1], takze pa[1] = 0 pro prvni beh}
      for j := 2 to n do begin
        B[j] := Bdinar[j];           {do B[j] nactu ze souboru nactene hodnoty Bdinar[j]}
        pa[j] := B[j] - B[j-1];
      end;
      setvelocitys := Bdinar[1];     {jako zadanou rychlost v prvni vrstve drzim tu, na co jsem kliknul, protoze vickrat to sem pri inverzi uz nevleze a potrebuju, aby se propriste v tom standardnim napocitavani to B[1] pocitalo k tomu NOVEMU setvelocitys, na ktere jsem kliknul}
    end; {if prvniDinar - plati i pro KTB}

    if jenjedna = false then begin   {pokud jsem spustil primou ulohu tlacitkem STARTING DISP, tak se tohle NEPROVEDE, tedy i nadale budu mit startovaci Dinar nebo KTB}
      prvniDinar := false;           {aby to sem vlezlo jen jednou}
    end;
  end; {if Dinar = true or KTB = true}

  //if (Dinar = true) then begin
    //if fixedcrust then begin {kdyz fixuju kuru, tak do prvnich sesti dam porad ten startovaci model opakovane}
  //    for j := 1 to 6 do begin
  //      B[j] := Bdinar[j];
  //    end;
    //end;
  //end;

  if interaktivni then begin    {pokud byl zvolen interaktivni mod, nastavim rychlosti S-vln rucne}
    B[1] := Binter[1];          {nastavim jak rychlosti B[i] tak i parametry pa[i]}
    pa[1] := B[1] - setvelocitys;
    for j := 2 to n do begin
      B[j] := Binter[j];        {do B[j] nactu rucne zvolene hodnoty Binter[j]}
      pa[j] := B[j] - B[j-1];
    end;
    setvelocitys := Binter[1];  {jako zadanou rychlost v prvni vrstve drzim tu, na co jsem kliknul, protoze vickrat to sem pri inverzi uz nevleze a potrebuju, aby se propriste v tom standardnim napocitavani to B[1] pocitalo k tomu NOVEMU setvelocitys, na ktere jsem kliknul}
    if jenjedna = false then begin            {pokud jsem spustil primou ulohu tlacitkem STARTING DISP, tak se tohle NEPROVEDE}
      NoSVALform.CheckBox1.Checked := false;  {pokud jsem to spustil tlacitkem INVERSE, tak se vypne interaktivni mod}
    end;                                      {a timpadem to v dalsich iteracich uz nepoleze do tohodle cyklu}
  end; {if interaktivni}

  if (Dinar = false) and (KTB = false) then begin
    if menise = false then begin {pokud nemenim hustotu, dycky to pa[n+j] nastavim zase na startovaci hodnotu, takze do dalsiho kola jde zase startovaci hustota}
      pa[n+1] := 0.0;
      for j := 2 to n do begin
        pa[n+j] := densitystep;
      end;
    end;
    R[1] := setdensity + pa[n+1]; {hustotu v 1. vrstve urcuju jako rozdil k zadane pocatecni hustote}
    for j := 2 to n do begin      {cycle for each layer}
      R[j] := R[j-1] + pa[n+j];   {hustotu v dalsich vrstvach urcuju jako rozdil k predchozi vrstve}
    end;
  end; {if Dinar = false and KTB = false}

  if (Dinar = true) then begin {menise je automaticky false, tedy hustota se nemeni}
    R[1] := setdensity;                        {prvni vrstvu necham povrchovou, at je jak chce hluboka}
    for j := 2 to n do begin               {cycle for each layer}
      if midD[j] <= 3.3  then R[j] := 2.0; {coz je vlastne porad setdensity, tedy ta na povrchu, hodnoty jsou podle modelu AK135}
      if midD[j] >  3.3  then R[j] := 2.6;
      if midD[j] >  10   then R[j] := 2.92;
      if midD[j] >  18   then R[j] := (midD[j] - 2167.976335) / (-593.8988859); {z Grapheru odectene linearni trendy pro negativni ...}  {Equation Y = -593.8988859 * X + 2167.976335}
      if midD[j] >  210  then R[j] := (midD[j] + 3425.918919) / (+1094.543838); {... a positivni sklon hustoty - do hloubky 410 km}      {Equation Y = +1094.543838 * X - 3425.918919}
      if midD[j] >  410  then R[j] := (midD[j] - 56445.3445 ) / (-14253.69031); {a tohle je od 410 km dolu}                              {Equation Y = -14253.69031 * X + 56445.34450}
    end;
  end; {if Dinar = true}

  if (KTB = true) then begin {menise je automaticky false, tedy hustota se nemeni}
    R[1] := setdensity;                        {prvni vrstvu necham povrchovou, at je jak chce hluboka}
    for j := 2 to n do begin               {cycle for each layer}
      if midD[j] <= 3.0  then R[j] := 1.02; {coz je vlastne porad setdensity, tedy ta na povrchu, hodnoty jsou podle modelu AK135}
      if midD[j] >  3.0  then R[j] := 2.00;
      if midD[j] >  3.3  then R[j] := 2.60;
      if midD[j] >  10   then R[j] := 2.92;
      if midD[j] >  18   then R[j] := (midD[j] - 2167.976335) / (-593.8988859); {z Grapheru odectene linearni trendy pro negativni ...}
      if midD[j] >  210  then R[j] := (midD[j] + 3425.918919) / (+1094.543838); {... a positivni sklon hustoty s hloubkou - toto plati do hloubky 410 km}
    end;
  end; {if KTB = true}

  if prumernabatch then begin {kdyz pocitam posledni krivku pro prumerny model, nacpu do hustot ty prumerne hodnoty}
    for j := 1 to n do begin
      R[j] := batchprumerH[j];
    end;
  end;

  if ((ityprl = 0) or (ityprl = 3)) then begin  {kdyz je to Rayleigh nebo kdyz je to dohromady}
    if prumernabatch then begin                 {pokud pocitam krivku pro prumerny model, nacpu do setPVSV ty vysledne prumerne hodnoty pomeru}
      for j := 1 to n do begin
        setPVSV[j] := batchprumerP[j]/batchprumerS[j];
      end;
    end; {konec if prumernabatch}
    //A[1]   := setvelocitys * (pa[(2*n)+1] + setPVSV[1]); {Pv v 1. vrstve urcuju jako soucin zadane pocatecni rychlosti S vln a souctu zadaneho PvSv pomeru mezi nima a nalezeneho rozdilu tohoto pomeru}
    {tohle vyse jsem vykomentil v cervnu 2019 - nevim, proc se s prvni vrstvou zachazelo jinak, nez s ostatnimi - nasledujici loop jsem zadal od 1, predtim byl od 2}
    for j := 1 to n do begin                             {cycle for each layer}
      A[j] :=         B[j] * (pa[(2*n)+j] + setPVSV[j]); {reads Pv of the layer}
    end;
  end;                          {konec pro Rayleigha nebo pro dohromady}

  if ityprl = 1 then begin      {kdyz je to Love}
    for j := 1 to n do begin    {cycle for each layer}
      A[j] := B[j]*pvsvratio;   {tupe to priradi Pv of the layer}
    end;
  end;                          {konec prace s parametry obracene ulohy}

  //NoSVALform.memo1.Lines.Add('------------------------------------------------------------------------');
  //for j := 1 to n do begin      {vypisu do textoveho okna hodnoty stukturnich parametru pouzitych pro vypocet prime ulohy}
  //  str(A[j]       :10:4,Astrg);
  //  str(B[j]       :10:4,Bstrg);
  //  str(R[j]       :10:4,Rstrg);
  //  str((A[j]/B[j]):10:4,ABstrg);
  //  radek := radek +1;
  //  str(radek:4,radekstrg);
  //  NoSVALform.memo1.Lines.Add(radekstrg+' | - '  +  Astrg + Bstrg + Rstrg + ABstrg);
  //end;

  {tedy mam nacpane hodnoty, ktere vylezly z IM, do poli, ktera vstupuji do maticove metody}
  {odsud je to opet preklad z FORTRANU, originalne sepsaneho programu doc. Oldricha Novotneho}
  {dosti pozmeneneho s pridanim dalsich potrebnych ukonu pro inverzi}
  if (Dinar = false) and (KTB = false) then begin   {pro tento pripad je fstep nastaveno uz drive v unite SvalUnit}
    nft   := trunc((flast-ffirst)/fstep+1.1); {nft = number of frequency / period points}
  end;
  if Dinar = true then begin
    if fromPhaseCorr then begin
      //nft   := 2 + trunc(logn(curvestep,(flast/ffirst)));  {tohle je pocet bodu krivky}
      nft   := numofdat;  {tohle je pocet bodu krivky - kveten 2023 - nacitam to primo z poctu dat v souboru, predtim jsem to vypocitaval, viz radek vyse}
      curvestep := power((flast/ffirst), (1/(nft-1)));  {multiplicative step between two consecutive periods in the loaded dispersion curve}
    end; {ten curvestep sem pridavam v kvetnu 2023 pro pocitani AdriaCrust z ambient noise, aby to dycky naladilo ten curvestep primo pro danou disperzi, i kdyz hodnota je 1.05, ale lepsi je to vypocitat nez to mit natvrdo}
         {pro Dinarides totiz byla ta hodnota 1.04}
    if fromArrayCorr then begin
      //ffirst := trunc(ffirst*100000);
      //flast := trunc(flast*100000);
      //nft   := 2 + trunc(logn(1.025,(flast/ffirst)));  {tohle je pocet bodu krivky}
      nft   := loadnflt; //2 + trunc(logn(1.025,(flast/ffirst)));  {tohle je pocet bodu krivky}
    end;
    fstep := 0;
  end;
  if KTB = true then begin
    nft   := 65; {natvrdo dam pocet bodu krivky, je pro vsechny krivky stejny}
    fstep := 0;
  end;

  prumnft := nft;                             {to same pro ucely unity "prumet"}
  ft      := ffirst-fstep;                    {difference between the first value of frequency / period and the value of step to enable using the formula "ft = ft + fstep" already for the first cycle computation}
  cappro  := cstart;
  if ift > 0 then begin                       {control block for constant step in period}
    t     := ft;
    if t <= 0 then begin                      {if the first period is negative, the program terminates}
      exit;                                   {the end of the main program if t <= 0}
    end;
  end;                                        {end of the control block for constant step in period}

  for ii := 1 to nft do begin                 {cycle for all the frequency / period values}
    if ((Dinar) and (ii > 1)) then begin      {fstep bude promenny pro Dinary, bude se zvetsovat}
      if fromPhaseCorr then begin
        fstep := (ft*curvestep) - ft;         {bude to ta nova perioda minus stara}
      end;
      if fromArrayCorr then begin
        fstep := (ft*1.025) - ft;             {bude to ta nova perioda minus stara}
      end;
      {-------------------------------------------------------------------------------- pro vstup z ArrayCorr je potreba to tady zmenit na 1.025}
    end;
    if ((KTB)   and (ii = 1)) then begin      {fstep bude nejaky zvlastni pro KTB, bude 0.1 pro prvni krok}
      fstep := 0.0;                           {bude to ta nova perioda minus stara}
    end;
    if ((KTB)   and (ii = 2)) then begin      {fstep bude nejaky zvlastni pro KTB, bude 0.1 pro prvni krok}
      fstep := 0.1;                           {bude to ta nova perioda minus stara}
    end;
    if ((KTB)   and (ii >= 3)) then begin     {fstep bude nejaky zvlastni pro KTB, bude 0.2 pro dalsi kroky}
      fstep := 0.2;                           {bude to ta nova perioda minus stara}
    end;

    ft    := ft + fstep;                        {for the first run  "ft" equals "ffirst" and then "ft" increases of the "fstep" values}
//    if ift <= 0 then begin                    {cycle for constant step in frequency}
//      freq  := ft;                            {setting the actual frequency for computation}
//      t := (1./freq);                         {actual period}
//    end;                                      {the end of computation of frequencies and periods for constant step in frequency}
    if ift >  0 then begin                    {cycle for constant step in period}
      t     := ft;                            {setting the actual period for computation}
      freq  := (1./t);                        {actual frequency}
    end;                                      {the end of computation of periods and frequencies for constant step in period}
    if ityprl = 0 then begin
      VRAL;                                   {calls the procedure for Rayleigh waves}
    end;
    if ityprl = 1 then begin
      VLOV;                                   {calls the procedure for Love waves}
    end;
    if ityprl = 3 then begin                  {pro spojenou inverzi to zavola obe procedurky}
      VRAL;                                   {calls the procedure for Rayleigh waves}
      ur := u;                                {nahradim si rychlosti do jinych promennych, aby se lisily}
      cr := c;                                {pro Loveho a Rayleigha}
      VLOV;                                   {calls the procedure for Love waves}
      ul := u;
      cl := c;
    end;
    {t - to jsou postupne jednotlive periody, pro ktere pocitam primou ulohu}
    {c - to jsou postupne jednotlive hodnoty fazove rychlosti, ktere z prime ulohy vypadly}
    {u - to jsou postupne jednotlive hodnoty grupove rychlosti, ktere z prime ulohy vypadly}
    {fit[i] - tam nacpu rozdil mezi rychlosti, ktera vypadla z prime ulohy 'c' nebo 'u' a mezi namerenym datickem 'ca[i]'}
    {cper[i] jsou hodnoty namerenych period}
    {ca[i] jsou hodnoty namerenych rychlosti a umele dodane hodnoty 'jakoby namerenych' hustot}
    {rychlosti jsou v ca[1] az ca[numofdat] a hustoty jsou potom tedy od ca[numofdat+1] az do ca[numofdat+numoflay+1]}
    {v pripade spolecne inverze je to tak, ze v}
    {ca[1 az numofdat] jsou hodnoty prvni krivky, v ca[numofdat+1 az numofdat+numoflay+1] je hustota a v ca[numofdat+numoflay+1+1 az nd] je druha krivka}
    if ((ityprl = 1) or (ityprl = 0)) then begin {jen pro jednoduchou inverzi}
      if usegroup then begin {pokud to delam pro grupovou rychlost}
        for i := 1 to numofdat do begin    {delam cyklus jen pro opravdicka data z disperze}
          if ((abs(t - cper[i]) <= (fstep)) and (t > cper[i])) then begin {pro dane t, pro ktere jsem spocital u, zkusim najit nejake blizke cper, kteremu odpovida daticko ca}
            fit[i] := (u - ca[i])/({t*}chybaL[i]);   {a delim to chybou zavislou na periode "t"}
            trefa := trefa + 1;
          end;
        end;
      end; {if pro grupovou}
      if (usegroup = false) then begin {pokud to delam pro fazovou rychlost}
        if (Dinar = false) and (KTB = false) then begin {iteruju pres vsechna daticka}
          for i := 1 to numofdat do begin    {delam cyklus jen pro opravdicka data z disperze}
            if ((abs(t - cper[i]) <= (fstep)) and (t > cper[i])) then begin {pro dane t, pro ktere jsem spocital u, zkusim najit nejake blizke cper, kteremu odpovida daticko ca}
              fit[i] := (c - ca[i])/({t*}chybaL[i]);   {a delim to chybou zavislou na periode "t"}
              trefa := trefa + 1;
            end;
          end;  {i ... numofdat}
        end; {if Dinar = false a KTB = false}

        if (Dinar = true) or (KTB = true) then begin  {pokud mam daticek stejne jako hodnot modelove disperze, nemusim nic hledat a jen priradim kazdy ke svemu}
          fit[ii] := (c - ca[ii])/({t*}chybaL[ii]);   {a delim to chybou zavislou na periode "t"}
          trefa := trefa + 1;
        end; {if Dinar = true or KTB = true}

      end; {if pro fazovou}
    end;   {if Rayleigh nebo Love}

    if ityprl = 3 then begin  {pro spolecnou inverzi}
      if usegroup then begin  {pokud to delam pro grupovou rychlost}
        for i := 1 to numofdat do begin    {delam cyklus jen pro opravdicka data z disperze}
          if ((abs(t - cper[i]) <= (fstep)) and (t > cper[i])) then begin {pro dane t, pro ktere jsem spocital u, zkusim najit nejake blizke cper, kteremu odpovida daticko ca}
            fit[i] := (ul - ca[i])/({t*}chybaL[i]);   {a delim to chybou zavislou na periode "t"}
            trefa := trefa + 1;
          end;
        end;{pro prvni krivku}
        for i := 1 to numofdat do begin    {delam cyklus jen pro opravdicka data z disperze}
          if ((abs(t - cper2[i]) <= (fstep)) and (t > cper2[i])) then begin {pro dane t, pro ktere jsem spocital u, zkusim najit nejake blizke cper, kteremu odpovida daticko ca}
            fit[i+numofdat+numoflay+1] := (ur - ca[i+numofdat+numoflay+1])/({t*}chybaR[i]{/t});   {a delim to chybou zavislou na periode "t"}
            trefa := trefa + 1;
          end;
        end;{pro druhou krivku}
      end;  {if pro grupovou}
      if (usegroup = false) then begin {pokud to delam pro fazovou rychlost}
        for i := 1 to numofdat do begin    {delam cyklus jen pro opravdicka data z disperze}
          if ((abs(t - cper[i]) <= (fstep)) and (t > cper[i])) then begin {pro dane t, pro ktere jsem spocital u, zkusim najit nejake blizke cper, kteremu odpovida daticko ca}
            fit[i] := (cl - ca[i])/({t*}chybaL[i]);   {a delim to chybou zavislou na periode "t"}
            trefa := trefa + 1;
          end;
        end;{pro prvni krivku}
        for i := 1 to numofdat do begin    {delam cyklus jen pro opravdicka data z disperze}
          if ((abs(t - cper2[i]) <= (fstep)) and (t > cper2[i])) then begin {pro dane t, pro ktere jsem spocital u, zkusim najit nejake blizke cper, kteremu odpovida daticko ca}
            fit[i+numofdat+numoflay+1] := (cr - ca[i+numofdat+numoflay+1])/({t*}chybaR[i]{/t});   {a delim to chybou zavislou na periode "t"}
            trefa := trefa + 1;
          end;
        end;{pro druhou krivku}
      end;  {if pro fazovou}
    end;    {if je to spolecna inverze}
//    if ift <= 0 then begin
//      cappro:= c+dcdf*fstep/2.0;              {for constant step in frequency a new phase velocity is computed - "dcdf" means derivation dc/df = phase velocity with respect to frequency}
//    end;
    if ift >  0 then begin
      cappro:= c-dcdf*fstep/2.0/power(t,2);   {for constant step in period a new phase velocity is computed}
    end;
    prumtperiod[ii]   := t;
    if usegroup then begin                    {pokud to delam pro grupovou rychlost}
      prumuvelocity[ii] := u;
      if ityprl = 3 then begin                {pokud je grupova a spolecna}
        prumuvelocity2[ii] := ur;
      end;
    end;
    if (usegroup = false) then begin          {pokud to delam pro fazovou rychlost}
      prumuvelocity[ii] := c;
      if ityprl = 3 then begin                {pokud je fazova a spolecna}
        prumuvelocity2[ii] := cr;
      end;
    end;
  end;{pro ii}                                {end of the cycle for each frequency / period}
  R[0] := setdensity;                         {pro prvni hustotu to resi rozdil k stanovene hustote na povrchu}
  for i := 1 to (numoflay+1) do begin         {cyklus pro ta nadbytecna daticka, kterymi drzim hustotu}
    fit[i+numofdat] := ((R[i+1]-R[i]) - ca[i+numofdat])/(ChybaHu); {rozdil hustot se ma rovnat daticku ca[i], ktere zadam}
  end;                                        {konec cyklu pro vsechny hustoty}
  for i := 1 to nd do begin
    moje[i] := fit[i];
  end;
end;  {konec prime ulohy}

procedure TForm1.DatPar(Sender: TObject);
begin {Jirka Malek / IM}
  if ityprl = 1 then begin {kdyz je to Love}
    numofpar := (numoflay+1)*2;
  end;
  if ityprl = 0 then begin {kdyz je to Rayleigh}
    numofpar := (numoflay+1)*3;
  end;
  if ityprl = 3 then begin {kdyz je to Rayleigh i Love dohromady}
    numofpar := (numoflay+1)*3;
  end;
  str(numofpar,numofparstrg);
end;

procedure TTest.Ctidat; {Cteni datoveho souboru, Jirka Malek / IM, zkraceno}
begin {stejna vec je jeste i v unite 'prumet'}
  if ((ityprl = 1) or (ityprl = 0)) then begin
    nd := numofdat + numoflay + 1;    {tedy je to pocet dat (namerenych) plus pocet vrstev a poloprostor, protoze}
  end;
  if ityprl = 3 then begin            {ve vrstvach a v poloprostoru vyrabim umela data pro hustoty}
    nd := (numofdat*2) + numoflay + 1;{pro spolecnou inverzi je namerenych dat dvakrat vic, vrstev a poloprostoru je furt stejne}
  end;
  setlength(moje,nd+1);
end;

procedure TTest.CtiPar; {Cteni datoveho souboru, Jirka Malek / IM, predelano, vlastni nastaveni}
var
  i:integer;
begin
  jprob := 'Multimodalni uloha';
  np    := numofpar;
  n1    := numoflay;
  n     := n1+1;      {n = number of layers including halfspace}
  {mam moznost ovlivnovat zvlast rozmezi v prvni vrstve - to delam proto, aby byl startovaci prvni rozdil roven nule}
  {tedy aby byl roven nule rozdil od rucne zadane hodnoty rychlosti a hustot na povrchu}
  {tedy p[1]=0, p[n+1]=0 a p[(2*n)+1]=0, tedy startovaci hodnoty parametru v prvni vrstve jsou rovne tem zadavanym rucne}
  {docilim toho tak, ze pro maximum i minimum parametru vezmu stejnou hodnotu, napriklad pokles S atd, takze parametr}
  {se zacne na prostredku mezi nima, tedy na nule}
  {pro Sv}
  {tohle je pro eSka, tedy pro kazdy pripad}
  mip^[1] := -dropofffirst;         {maximalni pokles Sv v 1. vrstve - pro tento pripad to startuje na hodnote presne v pulce mezi min a max, ale pro ostatni vrstvy to neplati}
  map^[1] := +dropofffirst;         {maximalni narust Sv v 1. vrstve}
  jpar[1] := '';                    {jmeno parametru}
  for i := 2 to n do begin
    mip^[i] := poklesS;             {maximalni pokles Sv v nizsi vrstve}
    map^[i] := narustS;             {maximalni narust Sv v nizsi vrstve}
    jpar[i] := '';                  {jmeno parametru}
  end;
  {tohle je pro hustotu, tedy taky pro kazdy pripad}
  mip^[n+1] := hustotypokles;       {maximalni pokles hustoty v 1. vrstve}
  map^[n+1] := hustotynarust*5/12;  {maximalni narust hustoty v 1. vrstve - protoze startovaci hodnoty jsou pro dalsi vrstvy dane}
                                    {ne do poloviny mezi min a max, ale blize k min, tak tady to vracim, aby to bylo presne na nule}
                                    {udelam to takto: rozdil mezi min a max je 7*pokles a ten start je jinde dany na 2/7 od toho minima}
                                    {tedy start je dany ve vzdalenosti 2*dilky od minima a 5*dilku od maxima (dilek je tu = pokles)}
                                    {ale ja ho chci dat zpatky na nulu, tedy na vzdalenost 1*dilek od minima a 6*dilku od maxima}
                                    {takze to maximum tady zmensim jen na 2.5 nasobek poklesu (a nikoli na 6 nasobek)}
                                    {a timpadem budu mit vzdalenosti minima 1*pokles a vzdalenost maxima 2.5* pokles}
                                    {tedy vzdalenosti budou 2*dilky ku 5*dilku, tedy celkem 7 dilku}
                                    {a kdyz pak zvolim start ve vzdalenosti 2/7 od minima, tak to bude prave ty dva dilky od minima, tedy na nule }
  jpar[n+1] := '';                  {jmeno parametru}
  for i := 2 to n do begin
   mip^[n+i] := hustotypokles;      {maximalni pokles hustoty v nizsi vrstve}
   map^[n+i] := hustotynarust;      {maximalni narust hustoty v nizsi vrstve}
   jpar[n+i] := '';                 {jmeno parametru}
  end;
  {tohle je pro Pv, tedy pro Rayleigha a pro Spolecnou}
  if ((ityprl = 0) or (ityprl = 3)) then begin
    mip^[(2*n)+1] := -narustP;      {maximalni pokles PvSv v 1. vrstve}
    map^[(2*n)+1] :=  narustP;      {maximalni narust PvSv v 1. vrstve - protoze nastavenim startovacich parametru se to souplo blize k minimu, musim to tady trochu zvednout}
    jpar[(2*n)+1] := '';            {jmeno parametru}
    for i := 2 to n do begin
      mip^[(2*n)+i] := -narustP;    {minimum Pv}
      map^[(2*n)+i] :=  narustP;    {maximum Pv}
      jpar[(2*n)+i] := '';          {jmeno parametru}
    end;
  end;
end; {procedury nastavovani pocatecnich parametru}

procedure TTest.Kresli; {kresleni po kazde iteraci, Jirka Malek / IM, predelano, zkraceno}
var                     {a doplneno o vlastni zpusoby vykreslovani a zobrazovani}
  i,k           :integer;
  hs            :string;
begin
  with sim[0]^ do with Form1 do begin
    niterace := niterace +1;
    for i:=1 to np do begin
      str(p[i]:8:3,hs);
    end;
    for i:=1 to nd do begin
      str(d[i]*0.02+ca[i]:8:3,hs);
    end;
    LovePART := 0; {vypocitavani normalizovanych misfit funkci}
    RaylPART := 0; {jen vzdy pro parametry prislusejici jedne velicine}
    hustPART := 0;
    if ityprl = 1 then begin  {pro Loveho}
      for k := 1 to numofdat do begin
        LovePART := LovePART + moje[k] * moje[k];     {misfit jen pro rychlosti}
      end;
    end;
    if ityprl = 0 then begin  {pro Rayleigha}
      for k := 1 to numofdat do begin
        RaylPART := RaylPART + moje[k] * moje[k];     {misfit jen pro rychlosti}
      end;
    end;
    if ityprl = 3 then begin  {pro spolecnou inverzi}
      for k :=                      1  to                      numofdat  do begin
        LovePART := LovePART + moje[k] * moje[k];
      end;
      for k := (numofdat+numoflay+1+1) to (numofdat+numoflay+1+numofdat) do begin
        RaylPART := RaylPART + moje[k] * moje[k];
      end;
    end;
    for k := (numofdat+1) to (numofdat+numoflay+1) do begin {pro hustoty}
      hustPART := hustPart + moje[k] * moje[k];
    end;
    Lovenorm := sqrt(LovePART / numofdat  )*chybaL[i]*1000; {pocitam normalizovanou misfit funkci, aby mela rozmer opravdove vzdalenosti bodu, tedy rychlost v m/s}
    Raylnorm := sqrt(RaylPART / numofdat  )*chybaR[i]*1000; {pocitam normalizovanou misfit funkci, aby mela rozmer opravdove vzdalenosti bodu, tedy rychlost v m/s}
    hustnorm := sqrt(hustPART / numoflay+1)*chybaHu*100; {jen tak to nasobim stem, aby to melo nejakou reprezentativni hodnotu}
    if (niterace = 1) then begin
      maxLovenorm := Lovenorm;
    end;
    str(hustnorm:8:3,hustnormstrg);
    str(Raylnorm:8:3,Raylnormstrg);
    str(Lovenorm:8:3,Lovenormstrg);
    str(vzda:10:5,vzdastrg);
    str(niterace:8,niteracestrg);

    if (Dinar = false) and (KTB = false) then begin
      if (niterace = sirka) then begin                {prodluzovani osy X}
        PlotPanel1.Xmax := PlotPanel1.Xmax + 250;
        PlotPanel1.Xmin := PlotPanel1.Xmax - 500;
        sirka := (trunc(niterace/250)+1)*250;
      end;
      repeat
        vyska := trunc(vyska / 2);
      until ((vyska/vzda)<2); {zkracovani osy Y}
      vyska := vyska*2;
      PlotPanel1.Ymax := vyska;
      PlotPanel1.YInterval := trunc(vyska / 5);
      if kreslit then begin {aby se to kreslilo, musi byt zaskrtnuty CheckBox2}
        PlotPanel1.AddXY(niterace,Lovenorm,clRed     ,miss1);
        PlotPanel1.AddXY(niterace,Raylnorm,clAqua    ,miss2);
        PlotPanel1.AddXY(niterace,hustnorm,clYellow  ,miss3);
      end;
      PlotPanel1.AddXY(niterace,vzda,RGB(255,0,255),miss4);
    end; {if Dinar = false and KTB = false}
    if (Dinar = false) and (KTB = false) then begin
      Edit5.Text  := Lovenormstrg;
      Edit3.Text  := Hustnormstrg;
      Edit4.Text  := Raylnormstrg;
      Edit5.Refresh;
      Edit3.Refresh;
      Edit4.Refresh;
    end;
    Misfit.Text := vzdastrg;
    Misfit.Refresh;
    Edit1.Text  := niteracestrg;
    Edit1.Refresh;
    Button3.Refresh;    {obnovi to "Stop" button}
    if (zastavka = (niterace/100)) then begin {kazdych 20 iteraci to da moznost neco udelat}
      zastavka := zastavka + 1; {coz se vyuzije hlavne pro preruseni behu inverze}
      application.ProcessMessages;
    end; {if}
  end; {pro :with:}
end; {konec TTest.Kresli - kresleni po kazde iteraci}

procedure TForm1.InverseClick(Sender: TObject);
begin {odkazuje na spusteni obracene ulohy, ale protoze ji potrebuju spoustet i odjinud, je to udelano jeste pres proceduru :spustit:}
  jenjedna := false;
  prvniDinar := true;
  spustit;
end;

procedure TForm1.Button7Click(Sender: TObject); {Dinarides nebo KTB batch inversion}
var
  pocetdisperzistrg : string;
begin
  ChDir(cestakdisperzi);
  CreateDir('batchS');
  CreateDir('batchP');
  CreateDir('batchD');
  CreateDir('batchdisp');
  CreateDir('batchfunnel');
  CreateDir('batchmisfit');
  CreateDir('batchstrucZAL');
  CreateDir('batchstrucDAT');
  repeat                                    {pojedu porad dal az do konce souboru}
    pecka  := 111; {vrstvy pro strukturu pecek                 plotpanel 4 - nastavim jako v zakladajici procedure celeho SVALu + 1}
    lay    := 211; {malovani vrstev, neboli vrstvy pro vrstvy  plotpanel 4}
    zacP   := 311; {malovani startovaciho modelu pecek         plotpanel 4}
    zacS   := 411; {malovani startovaciho modelu esek          plotpanel 4}
    zacR   := 511; {malovani startovaciho modelu hustot        plotpanel 4}
    husto  := 611; {vrstvy pro strukturu hustoty               plotpanel 4}
    eska   := 711; {vrstvy pro strukturu esek                  plotpanel 4}
    clicks := 600; {vrstvy pro nakliknute bodiky               plotpanel 3}
    chos   := 800; {vrstvy pro bodiky vybrane ze seznamu       plotpanel 3}
    miss1  :=   0; {plotpanel1 v okne inverze}
    miss2  := 200; {plotpanel1 v okne inverze}
    miss3  := 400; {plotpanel1 v okne inverze}
    miss4  := 600; {plotpanel1 v okne inverze}
    if pocetdisperzi = 0 then begin         {kdyz jsem tu poprve, tak uz mam vsechno nastaveno, jako kdybych delal standardni inverzi}
      pocetdisperzi := pocetdisperzi + 1;
      str(pocetdisperzi: 4, pocetdisperzistrg);
      if Dinar = true then dodatecnacaption := '  DeepIDispNo. ' + pocetdisperzistrg + ', node: ' + nodelatistrg +' '+ nodelongstrg;
      if KTB = true then   dodatecnacaption := '  KTB disp No. ' + pocetdisperzistrg + ', node: ' + nodelatistrg +' '+ nodelongstrg;
      Form1.Caption := zakladnicaption + dodatecnacaption;
      Button5Click(Sender);                 {zmacknu cudlik "Batch Invr", tedy davku pro jednu danou disperzi}
    end;                                    {kdyz jsem tu byl poprve}
    if pocetdisperzi > 0 then begin         {byla tu nula, ale sekalo se to pro startovaci jednu disperzi, takze tu dam jednicku, pro jednu disperzi se to tedy provadet dal nebude}
      NoSVALform.PlotPanel3.ClearData;
      pp3    := 1;   {vrstvy pro plotpanel3                      plotpanel 3}
      NoSVALform.PlotPanel4.ClearData;
      NoSVALform.CtiDinar;                  {zavolam znova procedurku na cteni krivky s velkeho souboru se vsema disperzema, uz by mel byt na dalsim radku}
      NoSVALform.MalujLoaded;               {namalovani naloadovane krivky a nastaveni dalsich veci}
      NoSVALform.Button32Click(Sender);     {cudlik "Use"}
      posilamnacombo2 := True;              {tedy musim vybrat min a max periodu}
      offirst := instper[1, locmx[1]];      {zadam, ze chci vybrat prvni filtr jako minimalni periodu pro ukladani}
      NoSVALform.ComboBox2CloseUp(Sender);
      posilamnacombo3 := True;
      oflast := instper[nflt, locmx[nflt]];
      NoSVALform.ComboBox3CloseUp(Sender);
      NoSVALform.Button23Click(Sender);     {cudlik "Inversion" v hlavnim okne SVALu}
      pocetdisperzi := pocetdisperzi + 1;
      str(pocetdisperzi: 4, pocetdisperzistrg);
      if Dinar = true then dodatecnacaption := ' DeepIDispNo. ' + pocetdisperzistrg + ', node: ' + nodelatistrg +' '+ nodelongstrg;
      if KTB   = true then dodatecnacaption := ' KTB disp No. ' + pocetdisperzistrg + ', node: ' + nodelatistrg +' '+ nodelongstrg;
      Form1.Caption := zakladnicaption + dodatecnacaption;
      Button5Click(Sender);                 {zmacknu cudlik "Batch Invr", tedy davku pro jednu danou disperzi}
    end;                                    {kdyz jsem tu byl podruhe a dal}
  until EOF(loadingf);                      {do konce souboru}
  closefile(loadingf);                      {zavru ho}
  radek := radek + 1;
  str(radek: 4, radekstrg);
  NoSVALform.Memo1.Lines.Add(radekstrg + ' | - end of the DEEP / KTB superbatch');
end; {konec procedury spoustejici super batch pro Dinarides a pro KTB}

procedure TForm1.Button4Click(Sender: TObject);
begin {nechava napocitat jen jednu primou ulohu, tedy vlastne take zastavuje inverzi}
  jenjedna := true;
  prvniDinar := true;
  spustit;
end;

procedure TForm1.spustit;
var        {spusteni samotne obracene ulohy,  Jirka Malek/ IM, ale z jeho procedurky zbyl jen obal}
  i        :integer;  {napln je cela nova}
begin
  if fromArrayCorr then begin
    NoSVALform.label66.Visible := True;
    NoSVALform.label66.BringToFront;
    Application.ProcessMessages;
  end;
  zastavka := 1;  {abych mohl znova kdykoli zmacknout cudlik STOP}
  trefa := 0;
  miss1 := miss1 + 1;
  miss2 := miss2 + 1;
  miss3 := miss3 + 1;
  miss4 := miss4 + 1;
  with PlotPanel1 do begin
    LayerOptions(miss1,pmLine,1);
  end;
  with PlotPanel1 do begin
    LayerOptions(miss2,pmLine,1);
  end;
  with PlotPanel1 do begin
    LayerOptions(miss3,pmLine,1);
  end;
  with PlotPanel1 do begin
    LayerOptions(miss4,pmLine,2);
  end;
  stopka := true;         {aby to bezelo, musi to byt true, kdyz zmacknu cudlik stop, zmeni se to na false}
  if jenjedna then begin  {pokud jsem zmacknul, ze chci jen startovaci disperzi, zmenim stopku na false}
    stopka := false;      {a ono to zastavi beh inverze hned po prvnim spocteni prime ulohy}
  end;                    {coz je dobre k tomu, ze si tak necham spocist disperzi pro startovaci model}
  c        := 0;
  niterace := 0;
  for i := 1 to maxnumoflayers do begin
    B[i] := 0.0;  {Sv}
    A[i] := 0.0;  {Pv}
    R[i] := 0.0;  {hustoty}
  end;
  n         := 0;     {nulovani promennych samotne prime ulohy}
  n1        := 0;
  nft       := 0;
  pocitadlo := 0;
  poc       := 0;
  ft        := 0.0;
  cappro    := 0.0;
  freq      := 0.0;
  t         := 0.0;
  u         := 0.0;
  aresp     := 0.0;
  dcdf      := 0.0;
  x1        := 0.0;   {nulovani promennych pro funkci MULT5}
  x2        := 0.0;
  x3        := 0.0;
  x4        := 0.0;
  x5        := 0.0;
  zz1       := 0.0;
  zz2       := 0.0;
  zz3       := 0.0;
  zz4       := 0.0;
  m         := 0;
  i1        := 0;
  i2        := 0;
  i3        := 0;
  i4        := 0;
  i5        := 0;     {konec nulovani promennych pro funkci MULT5}
  vyska := 1000; {zakladni nastaveni vysky PlotPanelu1 pro misfit funkce}
  sirka := 500;
  nastavplot;
  Te:=New(pTest,Init); {a tady spustim vlastni beh obracene ulohy}
  Te^.Run;
  Dispose(Te,Done);
end; {konec spousteni obracene ulohy}

procedure TForm1.nastavplot;
begin {nastavuje hodnoty hranic PlotPanelu1 pro misfit funkce}
  PlotPanel1.Xmin           := 000;
  PlotPanel1.Xmax           := 500;
  PlotPanel1.XInterval      := 100;
  PlotPanel1.XMarks         := True;
  PlotPanel1.Ymin           := 0;
  PlotPanel1.Ymax           := 2000;
  PlotPanel1.YInterval      := 200;
  PlotPanel1.YMarks         := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin                 {zakladni nastaveni obracene ulohy}
  stopka    := true;  {nastaveno, ze chci, aby to bezelo porad pryc}
  jenjedna  := false; {nastaveno, ze nechci pocitat jen jednu primou ulohu, tedy taky aby to bezelo porady pryc}
  niterace  := 0;
  zastavka  := 1;
  trefa     := 0;
  pocitadlo := 0;
  miss1 :=   0;
  miss2 := 200;
  miss3 := 400;
  miss4 := 600;
  vyska := 1000;      {zakladni nastaveni vysky PlotPanelu1 pro misfit funkce}
  sirka := 500;
  nastavplot;
  kreslit := false;   {nechci kreslit vsechno do PlotPanelu invere}
  batchstopka := false;
end;

function barva(m:double):TColor; {procedura made by Jirka Malek}
var
  R,G,B:byte;
begin
  if(m>1) then m:=1;
  if(m<0) then m:=0;
  if(m<0.25) then begin
    R:=255;
    G:=round(m*1020);
    B:=0;
  end
  else if(m<0.5) then begin
    R:=255-round((m-0.25)*1020);
    G:=255;
    B:=0;
  end
  else if(m<0.75) then begin
    R:=0;
    G:=255;
    B:=round((m-0.5)*1020);
  end
  else begin
    R:=0;
    G:=255-round((m-0.75)*1020);
    B:=255;
  end;
  Barva:=RGB(R,G,B);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin {ZOOM OUT - zobrazuje celou misfit funkci}
  PlotPanel1.Ymin := 0;
  PlotPanel1.Ymax := maxLovenorm;
  PlotPanel1.Xmin := 0;
  sirka := (trunc(niterace/250)+1)*250;
  PlotPanel1.Xmax := sirka;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin {CLEAR - maze obrazek misfit funkce}
  PlotPanel1.ClearData;
  nastavplot;
  Misfit.Text := 'not estim.';
  Edit1.Text := '0';
  Edit2.Text := '0';
  if (Dinar = false) and (KTB = false) then begin
    Edit3.Text := 'not estim.';
    Edit4.Text := 'not estim.';
    Edit5.Text := 'not estim.';
  end;
  if (Dinar = true) or (KTB = true) then begin
    Edit3.Text := 'N/A';
    Edit4.Text := 'N/A';
    Edit5.Text := 'N/A';
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin {STOP - zastavuje inverzi}
  stopka := false;
  showmessage('Inversion was canceled...');
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin {zaskrtnute Unlimited iteration meni hodnotu promenne unlimited}
  if CheckBox1.Checked = true then begin
    unlimited := true;
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - unlimited iteration mode enforced');
  end;
  if CheckBox1.Checked = false then begin
    unlimited := false;
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - normal mode for iteration canceling enforced');
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var {spousteni Batch Inversion, tedy davkove inverze}
  ib                  : integer;
  hoh                 : integer;
  jeje                : integer;
  nin                 : integer;
  strucgrafS          : textfile;
  strucgrafP          : textfile;
  strucgrafH          : textfile;
  misfitovy           : textfile;
  trychtyr            : textfile;
  hloubkab            : double;
  minmisfit           : double;
  maxmisfit           : double;
  pipiS               : array[1..maxnumoflayers,1..maxnumofinversions]  of double;
  pipiP               : array[1..maxnumoflayers,1..maxnumofinversions]  of double;
  pipiH               : array[1..maxnumoflayers,1..maxnumofinversions]  of double;
  zavorkaS            : array[1..maxnumoflayers]         of double;
  zavorkaP            : array[1..maxnumoflayers]         of double;
  zavorkaH            : array[1..maxnumoflayers]         of double;
  odchylkaS           : array[1..maxnumoflayers]         of double;
  odchylkaP           : array[1..maxnumoflayers]         of double;
  odchylkaH           : array[1..maxnumoflayers]         of double;
  zavorkamis          : double;
  odchylkamis         : double;
  odchylkamisstrg     : string;
  hladkS              : array[1..maxnumofinversions] of double;
  hladkSprum          : double;
  hladkSmin           : double;
  hladkSmax           : double;
  batchvzdaprumstrg   : string;
  minmisfitstrg       : string;
  maxmisfitstrg       : string;
  greenvzdastrg       : string;
  prumdiffDC          : double;
  diffDC              : array[1..maxnumoffitperiod]  of double;
  skoknum             : integer;
  skoknumstrg         : string;
  prumdiffDCstrg      : string;
  diffDCstrg          : string;
  zadanskok           : double;
  soucin              : array[1..maxnumofinversions] of double;
  soucinprum          : double;
  minsoucin           : double;
  maxsoucin           : double;
  ibstrg              : string;
begin
  radek := radek + 1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - BATCH inversion started at '+DateTimeToStr(Now));
  zacatekcasuBI := Time;
  zacatekcasuBI := zacatekcasuBI*86400;
  batchinver := true;
  batchstopka := false;
  val(edit6.Text, numofbatchinver, cd); {ctu zadany pocet inversi}
  for hoh := 1 to maxnumoffitperiod do begin {vynuluju si min a max hranici trychtyre disperznich krivek}
    minprumuvelocity[hoh] := 1000000000;
    maxprumuvelocity[hoh] := 0;
  end;
  skoknum := 0;
  str(skoknum:5,skoknumstrg);
  ibp := 0; {poradove cislo inverze}
  repeat
    skok := false; {napred nemam skok na DC}
    Button2Click(Sender); {Clear}
    ibp := ibp + 1;   {poradove cislo inverze}
    str(ibp,ibpstrg);
    zakladnicaption := 'Inversion/BatchInv No.:  ' + ibpstrg + ',  rejected: ' + skoknumstrg;
    Form1.Caption := zakladnicaption + dodatecnacaption;
    NoSVALform.Button23Click(Sender);     {zmacknu cudlik "Inversion" v hlavnim okne}
    InverseClick(Sender);                 {zmacknu cudlik "Inverse" v inverznim malem okne}
    {z toho mi vyleze nejaka disperzni krivka a ja zkontroluju jeji derivace, jestli je hladka}
    for hoh := 2 to prumnft do begin
      diffDC[hoh] := prumuvelocity[hoh] - prumuvelocity[hoh-1]; {derivace disperzni krivky}
    end;
    prumdiffDC := 0;
    for hoh := 2 to prumnft do begin
      prumdiffDC := prumdiffDC + diffDC[hoh]; {soucet vsech derivaci}
    end;
    prumdiffDC := prumdiffDC / (prumnft-1); {prumerna difference pres celou krivku}
    str(prumdiffDC:8:5,prumdiffDCstrg);
    val(edit7.Text, zadanskok, cd);
    for hoh := 2 to (prumnft-1) do begin
      if (diffDC[hoh] > zadanskok*prumdiffDC) then begin {pokud je na DC skok, tak se nastvu}
        str(diffDC[hoh]:8:5,diffDCstrg);
        skok := true;
        break;
      end;
    end;
    if skok = true then begin                 {pokud na krivce byl zub}
      ibp := ibp - 1;                         {zmensim pocet provedenych inverzi, protoze tuhle nechci pocitat}
      skoknum := skoknum + 1;                 {pocet takto spatnych krivek}
      str(skoknum:5,skoknumstrg);
      radek := radek +1;
      str(radek:4,radekstrg);
      NoSVALform.memo1.Lines.Add(radekstrg+' | - rejected run No.' + skoknumstrg + ', diff: ' + diffDCstrg + ' avr diff: ' + prumdiffDCstrg + ' km/s');
      NoSVALform.PlotPanel3.HideLayer(pp3);   {smazu vrstvu s tou hnusnou DC v plot panelu}
      NoSVALform.PlotPanel4.HideLayer(eska);  {smazu vrstvu s tou hnusnou S strukturou v plot panelu}
      NoSVALform.PlotPanel4.HideLayer(husto); {smazu vrstvu s tou hnusnou husto strukturou v plot panelu}
      NoSVALform.PlotPanel4.HideLayer(pecka); {smazu vrstvu s tou hnusnou P strukturou v plot panelu}
    end; {if skok = true}
    if skok = false then begin                {kdyz na disperzi neni skok, pokracuju dal a disperzi ulozim, nakreslim}
      NoSVALform.Button29Click(Sender);       {zmacknu cudlik "Save Struc"}
      NoSVALform.Button33Click(Sender);       {zmacknu cudlik "Save Fit Disp"}
      {ulozim si celou disperzi do pole, kde pak budou vsechny spolecne a z nich udelam odchylku a prumer}
      for hoh := 1 to prumnft do begin
        fitvelocbatch[hoh, ibp] := prumuvelocity[hoh];
      end;
      for nin :=1 to numoflay+1 do begin      {ulozim si S-vel do promenne, ktera ma i index "ibp" pro pocet inverzi}
        pipiS[nin,ibp] := B[nin];
        pipiH[nin,ibp] := R[nin];             {ulozim si jeste i hustotu}
        if ((ityprl = 0) or (ityprl = 3)) then begin {kdyz je to Rayleigh nebo dohromady}
          pipiP[nin,ibp] := A[nin];           {ulozim si jeste i P-vel}
        end;
      end; {nin - layers}
    end; {if skok = false}
    if batchstopka = true then begin          {kdyz jsem zmacknul Stop Batch, je to true a skonci tento cyklus}
      break;                                  {v ibp je skutecne probehly pocet pouzitelnych inverzi}
    end;
  until ibp = numofbatchinver; {konec cyklu pres inverze, opakuje se to, dokud to ibp nedosahne toho poctu, co jsem chtel, tedy, i kdyz nejakou inverzi vyhodim, tak}
  {zmensim to ibp za tu vyhozenou a timpadem to prida jeden beh, aby se ta vyhozena nahradila}
  {pokud to zastavim cudlikem, tak to vypadne z tohoto repet until cyklu a nebude se uz kontrolovat ta posledni podminka, ktera timpadem sice splnena nebude, ale presto to skonci diky tomu BREAK}

  {pridano se SvalUnit}
  {a tady si ulozim hranice minimalni a maximalni rychlosti pro vsechny periody, abych mohl namalovat trychtyr krivek pri batch inverzi}
  if prumernabatch = False then begin   {vynecham to jen pro tu posledni krivku pro prumerny model, i kdyz ta je vetsinou uvnitr trychtyre, takze by to stejne nezmenila}
    for hoh := 1 to prumnft do begin    {bude se to provadet pro vsechny behy vsech iteraci porad dal}
      for ibp := 1 to numofbatchinver do begin
        if minprumuvelocity[hoh] > fitvelocbatch[hoh, ibp] then minprumuvelocity[hoh] := fitvelocbatch[hoh, ibp];
        if maxprumuvelocity[hoh] < fitvelocbatch[hoh, ibp] then maxprumuvelocity[hoh] := fitvelocbatch[hoh, ibp];
      end; {ibp}
    end; {hoh}
  end;

  {odsud uz to dela jen veci specificky pro batchinverzi}
  for nin := 1 to numoflay+1 do begin               {cyklus pro kazdou vrstvu, ve kterem pocitam prumer a odchylky celeho setu inverzi}
    batchprumerS[nin] := 0;                         {prumerna rychlost S-vln v kazde vrstve}
    batchprumerP[nin] := 0;                         {prumerna rychlost P-vln v kazde vrstve}
    batchprumerH[nin] := 0;
    odchylkaS[nin]     := 0;
    odchylkaP[nin]     := 0;
    odchylkaH[nin]     := 0;
    zavorkaS[nin]      := 0;
    zavorkaP[nin]      := 0;
    zavorkaH[nin]      := 0;
    for ib := 1 to ibp do begin         {sectu rychlosti}
      batchprumerS[nin] := batchprumerS[nin] + pipiS[nin,ib];
      batchprumerP[nin] := batchprumerP[nin] + pipiP[nin,ib];
      batchprumerH[nin] := batchprumerH[nin] + pipiH[nin,ib];
    end;
    if ibp = 0 then ibp := 1; {kdyz se nepovede ani jeden beh, stane se, ze je to nula}
    batchprumerS[nin] := batchprumerS[nin]/ibp;     {spoctu prumernou rychlost pro kazdou vrstvu}
    batchprumerP[nin] := batchprumerP[nin]/ibp;     {spoctu prumernou rychlost pro kazdou vrstvu}
    batchprumerH[nin] := batchprumerH[nin]/ibp;     {spoctu prumernou rychlost pro kazdou vrstvu}
    for ib := 1 to ibp do begin         {sectu zavorky na druhou}
      zavorkaS[nin] := zavorkaS[nin] + ((pipiS[nin,ib]-batchprumerS[nin])*(pipiS[nin,ib]-batchprumerS[nin]));
      zavorkaP[nin] := zavorkaP[nin] + ((pipiP[nin,ib]-batchprumerP[nin])*(pipiP[nin,ib]-batchprumerP[nin]));
      zavorkaH[nin] := zavorkaH[nin] + ((pipiH[nin,ib]-batchprumerH[nin])*(pipiH[nin,ib]-batchprumerH[nin]));
    end;
    odchylkaS[nin] := zavorkaS[nin]/ibp;      {vydelim soucet zavorek na druhou poctem mereni}
    odchylkaS[nin] := sqrt(odchylkaS[nin]);   {odmocnim}
    odchylkaP[nin] := zavorkaP[nin]/ibp;      {vydelim soucet zavorek na druhou poctem mereni}
    odchylkaP[nin] := sqrt(odchylkaP[nin]);   {odmocnim}
    odchylkaH[nin] := zavorkaH[nin]/ibp;      {vydelim soucet zavorek na druhou poctem mereni}
    odchylkaH[nin] := sqrt(odchylkaH[nin]);   {odmocnim}
  end; {cyklus pres vrstvy}

  hladkSmin := 10000000;
  hladkSmax := -1;
  hladkSprum := 0;
  for ib := 1 to ibp do begin                       {vynuluju}
    hladkS[ib] := 0;
  end;
  for ib := 1 to ibp do begin                       {cyklus pres inverze - spocitam hladkost jednotlivych struktur}
    for nin := 1 to numoflay do begin
      hladkS[ib] := hladkS[ib] + abs(pipiS[nin+1,ib]-pipiS[nin,ib]);       {poscitam vsechny skoky v absolutni hodnote}
    end;
    hladkS[ib] := hladkS[ib] / numoflay;            {normalizuju to na pocet skoku}
    if hladkS[ib] < hladkSmin then hladkSmin := hladkS[ib];
    if hladkS[ib] > hladkSmax then hladkSmax := hladkS[ib];
  end;
  for nin := 1 to numoflay do begin                 {udelam tu hladkost i pro prumernou strukturu}
    hladkSprum := hladkSprum + abs(batchprumerS[nin+1]-batchprumerS[nin]); {poscitam vsechny skoky v absolutni hodnote}
  end;
  hladkSprum := hladkSprum / numoflay;              {normalizuju to na pocet skoku}
  batchvzdaprum := 0;                               {udelam to same pro misfity, tedy spoctu jejich prumer a odchylku}
  odchylkamis := 0;
  zavorkamis := 0;
  for ib := 1 to ibp do begin
    batchvzdaprum := batchvzdaprum + batchvzda[ib]; {sectu misfity}
  end;
  batchvzdaprum := batchvzdaprum/ibp;               {spoctu prumernou odchylku misfitu}
  for ib := 1 to ibp do begin                       {sectu zavorky na druhou}
    zavorkamis := zavorkamis + ((batchvzda[ib]-batchvzdaprum)*(batchvzda[ib]-batchvzdaprum));
  end;
  odchylkamis := zavorkamis/ibp;                    {vydelim soucet zavorek na druhou poctem mereni}
  odchylkamis := sqrt(odchylkamis);                 {odmocnim}
  for hoh := 1 to prumnft do begin                  {to same pro fitovane krivky: spoctu odchylku a prumer fitovanych krivek}
    prumfit[hoh]     := 0;                          {cyklus pres periody}
    odchylkafit[hoh] := 0;
    zavorkafit[hoh]   := 0;
    for ib := 1 to ibp do begin                     {udelam to same pro fitovane krivky}
      prumfit[hoh] := prumfit[hoh] + fitvelocbatch[hoh,ib]; {sectu fitovane rychlosti pro kazdou periodu}
    end;
    prumfit[hoh] := prumfit[hoh]/ibp;               {spoctu prumernou odchylku fitovanych krivek}
    for ib := 1 to ibp do begin                     {sectu zavorky na druhou}
      zavorkafit[hoh] := zavorkafit[hoh] + ((fitvelocbatch[hoh,ib]-prumfit[hoh])*(fitvelocbatch[hoh,ib]-prumfit[hoh]));
    end;
    odchylkafit[hoh] := zavorkafit[hoh]/ibp;        {vydelim soucet zavorek na druhou poctem mereni}
    odchylkafit[hoh] := sqrt(odchylkafit[hoh]);     {odmocnim}
  end; {konec pro periody}
  maxmisfit := 0;
  minmisfit := 10000000;                            {najdu nejmensi a nejvetsi misfit}
  for ib := 1 to ibp do begin
    if batchvzda[ib] > maxmisfit then maxmisfit := batchvzda[ib];
    if batchvzda[ib] < minmisfit then minmisfit := batchvzda[ib];
  end;
  hloubkab := 0;        {nakreslim prumerne struktury pro S i P vlny}
  eska := eska + 1;     {vykreslim prumer inverzi S-vln na obrazovku}
  with NoSVALform.PlotPanel4 do begin
    LayerOptions(eska,pmLine,4);
  end;
  for nin := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerS[       nin],-hloubkab     ,RGB(0,255,0),eska);  {vykresluje rychlosti S-vln}
    hloubkab := hloubkab + DD[nin];
    NoSVALform.PlotPanel4.AddXY(batchprumerS[       nin],-hloubkab     ,RGB(0,255,0),eska);  {vykresluje rychlosti S-vln}
  end; {konec pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerS[numoflay+1],-hloubkab     ,RGB(0,255,0),eska);  {vykresluje rychlost S-vln}
    NoSVALform.PlotPanel4.AddXY(batchprumerS[numoflay+1],-hloubkab*1.25,RGB(0,255,0),eska);  {vykresluje rychlost S-vln}
  hloubkab := 0;  {vykreslim prumer inverzi P-vln na obrazovku}
  eska := eska + 1;
  with NoSVALform.PlotPanel4 do begin
    LayerOptions(eska,pmLine,4);
  end;
  for nin := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerP[       nin],-hloubkab     ,RGB(0,255,0),eska);  {vykresluje rychlosti P-vln}
    hloubkab := hloubkab + DD[nin];
    NoSVALform.PlotPanel4.AddXY(batchprumerP[       nin],-hloubkab     ,RGB(0,255,0),eska);  {vykresluje rychlosti P-vln}
  end; {konec pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerP[numoflay+1],-hloubkab     ,RGB(0,255,0),eska);  {vykresluje rychlost P-vln}
    NoSVALform.PlotPanel4.AddXY(batchprumerP[numoflay+1],-hloubkab*1.25,RGB(0,255,0),eska);  {vykresluje rychlost P-vln}
  hloubkab := 0;  {vykreslim prumer inverzi hustoty na obrazovku}
  eska := eska + 1;
  with NoSVALform.PlotPanel4 do begin
    LayerOptions(eska,pmLine,4);
  end;
  for nin := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerH[       nin],-hloubkab     ,RGB(0,255,0),eska);  {vykresluje hustotu}
    hloubkab := hloubkab + DD[nin];
    NoSVALform.PlotPanel4.AddXY(batchprumerH[       nin],-hloubkab     ,RGB(0,255,0),eska);  {vykresluje hustotu}
  end; {konec pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerH[numoflay+1],-hloubkab     ,RGB(0,255,0),eska);  {vykresluje hustotu}
    NoSVALform.PlotPanel4.AddXY(batchprumerH[numoflay+1],-hloubkab*1.25,RGB(0,255,0),eska);  {vykresluje hustotu}
  if (NoSVALform.PlotPanel4.Ymin <= ((-hhalfspace*0.25)-hhalfspace)) then NoSVALform.label14.BringToFront; {zarucuju, ze napis "halfspace" se objevi jen v oblasti, kde skutecne je halfspace}
  NoSVALform.label16.BringToFront;
  NoSVALform.label20.BringToFront;
  NoSVALform.label24.BringToFront;
  NoSVALform.label25.BringToFront;
  NoSVALform.label26.BringToFront;
  NoSVALform.CheckBox1.Enabled := true;
  NoSVALform.CheckBox1.Checked := false; {konec kresleni prumerne struktury - prevzato z cudliku Button25 "S velocity"}
  hloubkab := 0;  {vykreslim zapornou odchylku inverzi S vln}
  eska := eska + 1;
  with NoSVALform.PlotPanel4 do begin
    LayerOptions(eska,pmLine,2);
  end;
  for nin := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerS[       nin]-odchylkaS[       nin],-hloubkab     ,RGB(255,0,255),eska);
    hloubkab := hloubkab + DD[nin];
    NoSVALform.PlotPanel4.AddXY(batchprumerS[       nin]-odchylkaS[       nin],-hloubkab     ,RGB(255,0,255),eska);
  end; {konec pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerS[numoflay+1]-odchylkaS[numoflay+1],-hloubkab     ,RGB(255,0,255),eska);
    NoSVALform.PlotPanel4.AddXY(batchprumerS[numoflay+1]-odchylkaS[numoflay+1],-hloubkab*1.25,RGB(255,0,255),eska);
  hloubkab := 0;  {vykreslim kladnou odchylku inverzi S vln}
  eska := eska + 1;
  with NoSVALform.PlotPanel4 do begin
    LayerOptions(eska,pmLine,2);
  end;
  for nin := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerS[       nin]+odchylkaS[       nin],-hloubkab     ,RGB(255,0,255),eska);
    hloubkab := hloubkab + DD[nin];
    NoSVALform.PlotPanel4.AddXY(batchprumerS[       nin]+odchylkaS[       nin],-hloubkab     ,RGB(255,0,255),eska);
  end; {konec pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerS[numoflay+1]+odchylkaS[numoflay+1],-hloubkab     ,RGB(255,0,255),eska);
    NoSVALform.PlotPanel4.AddXY(batchprumerS[numoflay+1]+odchylkaS[numoflay+1],-hloubkab*1.25,RGB(255,0,255),eska);
  if ((ityprl = 0) or (ityprl = 3)) then begin      {pro Rayleigha nebo pro dohromady vykreslim i Pecka}
    hloubkab := 0;  {vykreslim zapornou odchylku inverzi P vln}
    eska := eska + 1;
    with NoSVALform.PlotPanel4 do begin
      LayerOptions(eska,pmLine,2);
    end;
    for nin := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
      NoSVALform.PlotPanel4.AddXY(batchprumerP[       nin]-odchylkaP[       nin],-hloubkab     ,RGB(255,0,255),eska);
      hloubkab := hloubkab + DD[nin];
      NoSVALform.PlotPanel4.AddXY(batchprumerP[       nin]-odchylkaP[       nin],-hloubkab     ,RGB(255,0,255),eska);
    end; {konec pro kazdou vrstvu}
      NoSVALform.PlotPanel4.AddXY(batchprumerP[numoflay+1]-odchylkaP[numoflay+1],-hloubkab     ,RGB(255,0,255),eska);
      NoSVALform.PlotPanel4.AddXY(batchprumerP[numoflay+1]-odchylkaP[numoflay+1],-hloubkab*1.25,RGB(255,0,255),eska);
    hloubkab := 0;  {vykreslim kladnou odchylku inverzi P vln}
    eska := eska + 1;
    with NoSVALform.PlotPanel4 do begin
      LayerOptions(eska,pmLine,2);
    end;
    for nin := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
      NoSVALform.PlotPanel4.AddXY(batchprumerP[       nin]+odchylkaP[       nin],-hloubkab     ,RGB(255,0,255),eska);
      hloubkab := hloubkab + DD[nin];
      NoSVALform.PlotPanel4.AddXY(batchprumerP[       nin]+odchylkaP[       nin],-hloubkab     ,RGB(255,0,255),eska);
    end; {konec pro kazdou vrstvu}
      NoSVALform.PlotPanel4.AddXY(batchprumerP[numoflay+1]+odchylkaP[numoflay+1],-hloubkab     ,RGB(255,0,255),eska);
      NoSVALform.PlotPanel4.AddXY(batchprumerP[numoflay+1]+odchylkaP[numoflay+1],-hloubkab*1.25,RGB(255,0,255),eska);
  end; {konec pro Rayleigha anebo oboji}
  hloubkab := 0;  {vykreslim zapornou odchylku inverzi Hustot}
  eska := eska + 1;
  with NoSVALform.PlotPanel4 do begin
    LayerOptions(eska,pmLine,2);
  end;
  for nin := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerH[       nin]-odchylkaH[       nin],-hloubkab     ,RGB(255,0,255),eska);
    hloubkab := hloubkab + DD[nin];
    NoSVALform.PlotPanel4.AddXY(batchprumerH[       nin]-odchylkaH[       nin],-hloubkab     ,RGB(255,0,255),eska);
  end; {konec pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerH[numoflay+1]-odchylkaH[numoflay+1],-hloubkab     ,RGB(255,0,255),eska);
    NoSVALform.PlotPanel4.AddXY(batchprumerH[numoflay+1]-odchylkaH[numoflay+1],-hloubkab*1.25,RGB(255,0,255),eska);
  hloubkab := 0;  {vykreslim kladnou odchylku inverzi Hustot}
  eska := eska + 1;
  with NoSVALform.PlotPanel4 do begin
    LayerOptions(eska,pmLine,2);
  end;
  for nin := 1 to numoflay do begin {zacatek pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerH[       nin]+odchylkaH[       nin],-hloubkab     ,RGB(255,0,255),eska);
    hloubkab := hloubkab + DD[nin];
    NoSVALform.PlotPanel4.AddXY(batchprumerH[       nin]+odchylkaH[       nin],-hloubkab     ,RGB(255,0,255),eska);
  end; {konec pro kazdou vrstvu}
    NoSVALform.PlotPanel4.AddXY(batchprumerH[numoflay+1]+odchylkaH[numoflay+1],-hloubkab     ,RGB(255,0,255),eska);
    NoSVALform.PlotPanel4.AddXY(batchprumerH[numoflay+1]+odchylkaH[numoflay+1],-hloubkab*1.25,RGB(255,0,255),eska);
  {spoctu disperzi pro prumernou stukturu, udelam to tak, ze jakoby zvolim interaktivni mod, do Binter[i] zadam tu vyslednou strukturu a spoctu pro to startovaci disperzi}
  prumernabatch := true;                  {aby se mi zmenila barva krivky v PlotPanelu a delaly se i jine veci specialne pro tuhle prumernou strukturu}
  NoSVALform.CheckBox1.Checked := true;   {zaskrtnu prepinac  "Interactive"   }
  NoSVALform.CheckBox1Click(Sender);      {zmacknu prepinac   "Interactive"   }
  NoSVALform.Button23Click(Sender);       {zmacknu cudlik     "Inversion"     v hlavnim okne}
  Button2Click(Sender);                   {Clear}
  Button4Click(Sender);                   {zmacknu cudlik     "Starting disp" - ten spocte jen jednu iteraci, tedy model pro Binter, tedy pro prumernou strukturu}
  NoSVALform.Button29Click(Sender);       {zmacknu cudlik     "Save Struc"    }
  NoSVALform.Button33Click(Sender);       {zmacknu cudlik     "Save Fit Disp" }
  NoSVALform.CheckBox1.Checked := false;  {odskrtnu cudlik    "Interactive"   }
  prumernabatch := false;

  if (Dinar = false) and (KTB = false) then assignfile(strucgrafS,'batchS.dat');              {do specialniho souboru zapisu jak vsechny S-velocity, tak hlavne jejich prumer a odchylky}
  if fromPhaseCorr then begin
    if (Dinar = true) then assignfile(strucgrafS,'batchS/'+nodestrg+'batchS.dat');      {do specialniho souboru zapisu jak vsechny S-velocity, tak hlavne jejich prumer a odchylky}
  end;
  if fromArrayCorr then begin
    if (Dinar = true) then assignfile(strucgrafS,'batchS/'+nodestrg+'batchS-'+subarrayname+'.dat');      {do specialniho souboru zapisu jak vsechny S-velocity, tak hlavne jejich prumer a odchylky}
  end;
  if (KTB = true) then begin
    assignfile(strucgrafS,'batchS/'+nodestrg+'batchS.dat');      {do specialniho souboru zapisu jak vsechny S-velocity, tak hlavne jejich prumer a odchylky}
  end;

  rewrite(strucgrafS);                              {tento soubor se uklada JENOM v pripade batchinverze, jinak ne}
  hloubkab := 0;
  write(strucgrafS,'       depth');                 {hlavicka souboru - prvni sloupec}
  for ib := 1 to ibp do begin
    write(strucgrafS, ib:9,'b');                    {prvni radek dalsich sloupcu obsahuje cislo inverze + pismeno, aby to Grapher bral jako hlavicku a ne jako cislo}
  end;
  if (Dinar = false) and (KTB = false) then write(strucgrafS, '   averagS  averS-sd  averS+sd   depth-M averS-M/S avS-sdM/S avS+sdM/S');  {posledni sloupce jsou prumer a odchylky}
  if (Dinar = true)  or  (KTB = true)  then write(strucgrafS, '   averagS  averS-sd  averS+sd');  {posledni sloupce jsou prumer a odchylky}
  writeln(strucgrafS);
  for nin := 1 to numoflay do begin                 {cyklus pres vrstvy}
    if nin = 1 then begin                           {prvni vrstva}
      write(strucgrafS,'     0.00000');             {zacina v nulove hloubce}
      for ib := 1 to ibp do begin                   {cyklus pres vsechny inverze ale porad jsme jen v 1. vrstve}
        write(strucgrafS, pipiS[nin,ib]:10:4);      {zapisu vsechny S-velocity}
      end;
      if (Dinar = false) and (KTB = false) then write(strucgrafS, batchprumerS[nin]:10:4,(batchprumerS[nin]-odchylkaS[nin]):10:4,(batchprumerS[nin]+odchylkaS[nin]):10:4,'      0.00' , (batchprumerS[nin]*1000):10:3,((batchprumerS[nin]-odchylkaS[nin])*1000):10:3,((batchprumerS[nin]+odchylkaS[nin])*1000):10:3);  {zapisu prumer a odchylky}
      if (Dinar = true)  or  (KTB = true)  then write(strucgrafS, batchprumerS[nin]:10:4,(batchprumerS[nin]-odchylkaS[nin]):10:4,(batchprumerS[nin]+odchylkaS[nin]):10:4);  {zapisu prumer a odchylky}
      writeln(strucgrafS);                          {skocim na dalsi radek}
    end;                                            {konec 1. vrstvy}
    if nin <> 1 then begin                          {pro dalsi vrstvy udelam to same}
      write(strucgrafS,  hloubkab:12:5);
      for ib := 1 to ibp do begin
        write(strucgrafS, pipiS[nin,ib]:10:4);
      end;
      if (Dinar = false) and (KTB = false) then write(strucgrafS, batchprumerS[nin]:10:4,(batchprumerS[nin]-odchylkaS[nin]):10:4,(batchprumerS[nin]+odchylkaS[nin]):10:4 , (hloubkab*1000):10:2 , (batchprumerS[nin]*1000):10:3,((batchprumerS[nin]-odchylkaS[nin])*1000):10:3,((batchprumerS[nin]+odchylkaS[nin])*1000):10:3);
      if (Dinar = true)  or  (KTB = true)  then write(strucgrafS, batchprumerS[nin]:10:4,(batchprumerS[nin]-odchylkaS[nin]):10:4,(batchprumerS[nin]+odchylkaS[nin]):10:4);
      writeln(strucgrafS);
    end;                                            {konec pro jinou nez 1. vrstvu}
    hloubkab := hloubkab + DD[nin];                 {posunu si hloubku}
    write(strucgrafS,  hloubkab:12:5);              {zapisu hloubku}
    for ib := 1 to ibp do begin                     {a znova pro vsechny inverze zapisu S-velocity, podruhe stejnou, aby to Grapher maloval jako klikatici}
      write(strucgrafS, pipiS[nin,ib]:10:4);
    end;
    if (Dinar = false) and (KTB = false) then write(strucgrafS, batchprumerS[nin]:10:4,(batchprumerS[nin]-odchylkaS[nin]):10:4,(batchprumerS[nin]+odchylkaS[nin]):10:4, (hloubkab*1000):10:2 , (batchprumerS[nin]*1000):10:3,((batchprumerS[nin]-odchylkaS[nin])*1000):10:3,((batchprumerS[nin]+odchylkaS[nin])*1000):10:3);
    if (Dinar = true)  or  (KTB = true)  then write(strucgrafS, batchprumerS[nin]:10:4,(batchprumerS[nin]-odchylkaS[nin]):10:4,(batchprumerS[nin]+odchylkaS[nin]):10:4);
    writeln(strucgrafS);
  end;                                              {konec cyklu pres vrstvy bez poloprostoru}
  write(strucgrafS,  hloubkab:12:5);                {zapisu posledni dva radky pro poloprostor}
  for ib := 1 to ibp do begin
    write(strucgrafS, pipiS[numoflay+1,ib]:10:4);
  end;
  if (Dinar = false) and (KTB = false) then write(strucgrafS, batchprumerS[numoflay+1]:10:4,(batchprumerS[numoflay+1]-odchylkaS[numoflay+1]):10:4,(batchprumerS[numoflay+1]+odchylkaS[numoflay+1]):10:4 , (hloubkab*1000):10:2 , (batchprumerS[numoflay+1]*1000):10:3,((batchprumerS[numoflay+1]-odchylkaS[numoflay+1])*1000):10:3,((batchprumerS[numoflay+1]+odchylkaS[numoflay+1])*1000):10:3);
  if (Dinar = true)  or  (KTB = true)  then write(strucgrafS, batchprumerS[numoflay+1]:10:4,(batchprumerS[numoflay+1]-odchylkaS[numoflay+1]):10:4,(batchprumerS[numoflay+1]+odchylkaS[numoflay+1]):10:4);
  writeln(strucgrafS);
  write(strucgrafS,(hloubkab*1.25):12:5);
  for ib := 1 to ibp do begin
    write(strucgrafS, pipiS[numoflay+1,ib]:10:4);
  end;
  if (Dinar = false) and (KTB = false) then write(strucgrafS, batchprumerS[numoflay+1]:10:4,(batchprumerS[numoflay+1]-odchylkaS[numoflay+1]):10:4,(batchprumerS[numoflay+1]+odchylkaS[numoflay+1]):10:4 , (hloubkab*1.25*1000):10:2 , (batchprumerS[numoflay+1]*1000):10:3,((batchprumerS[numoflay+1]-odchylkaS[numoflay+1])*1000):10:3,((batchprumerS[numoflay+1]+odchylkaS[numoflay+1])*1000):10:3);
  if (Dinar = true)  or  (KTB = true)  then write(strucgrafS, batchprumerS[numoflay+1]:10:4,(batchprumerS[numoflay+1]-odchylkaS[numoflay+1]):10:4,(batchprumerS[numoflay+1]+odchylkaS[numoflay+1]):10:4);
  writeln(strucgrafS);                              {odradkuju a zapisu hladkost pro kazdou jednotlivou inverzi}
  write(strucgrafS,'  complexity');                 {hladkost strukturniho rezu prvni sloupec}
  for ib := 1 to ibp do begin
    write(strucgrafS, hladkS[ib]:9:4, 'h');         {hladkosti jednotlivych inverzi}
  end;                                              {dopisu hladkost pro prumernou strukturu a minimalni a maximalni hladkost z jednotlivych inverzi}
  write(strucgrafS, hladkSprum:9:4, 'h', hladkSmin:9:4, 'h', hladkSmax:9:4, 'h');
  writeln(strucgrafS);                              {odradkuju a zapisu misfit pro kazdou jednotlivou inverzi}
  write(strucgrafS,'      misfit');                 {misfit - nadpis prvniho sloupce}
  for ib := 1 to ibp do begin
    write(strucgrafS, batchvzda[ib]:9:4, 'm');      {misfiti jednotlivych inverzi}
  end;                                              {dopisu misfit pro prumernou strukturu a minimalni a maximalni misfit z jednotlivych inverzi}
  write(strucgrafS, greenvzda:9:4, 'm', minmisfit:9:4, 'm', maxmisfit:9:4, 'm');
  minsoucin := 1000000;
  maxsoucin := -1;
  for ib := 1 to ibp do begin
    batchvzda[ib] := batchvzda[ib] / maxmisfit;
    hladkS[ib] := hladkS[ib] / hladkSmax;
    soucin[ib] := hladkS[ib]/batchvzda[ib];
    if soucin[ib] < minsoucin then minsoucin := soucin[ib];
    if soucin[ib] > maxsoucin then maxsoucin := soucin[ib];
  end;
  soucinprum := (greenvzda/maxmisfit) * (hladkSprum/hladkSmax); {soucin pro prumernou strukturu}
  writeln(strucgrafS);                              {odradkuju a zapisu soucin pro kazdou jednotlivou inverzi}
  write(strucgrafS,'     product');                 {soucin - nadpis prvniho sloupce}
  for ib := 1 to ibp do begin
    write(strucgrafS, soucin[ib]:9:4, 'x');         {soucini jednotlivych inverzi}
  end;
  write(strucgrafS, soucinprum:9:4, 'x', minsoucin:9:4, 'x', maxsoucin:9:4, 'x');
  closefile(strucgrafS);                            {zavru soubor batchS.dat}
  if ((ityprl = 0) or (ityprl = 3)) then begin        {pro Rayleigha nebo pro dohromady zapisu i Pecka}
    if (Dinar = false) and (KTB = false) then assignfile(strucgrafP,'batchP.dat');              {do specialniho souboru zapisu P-velocity}
    if fromPhaseCorr then begin
      if (Dinar = true)  or  (KTB = true)  then assignfile(strucgrafP,'batchP/'+nodestrg+'batchP.dat');     {do specialniho souboru zapisu P-velocity}
    end;
    if fromArrayCorr then begin
      if (Dinar = true)  or  (KTB = true)  then assignfile(strucgrafP,'batchP/'+nodestrg+'batchP-'+subarrayname+'.dat');     {do specialniho souboru zapisu P-velocity}
    end;
    if (KTB = true) then begin
      assignfile(strucgrafP,'batchP/'+nodestrg+'batchP.dat');     {do specialniho souboru zapisu P-velocity}
    end;

    rewrite(strucgrafP);                              {tento soubor se uklada JENOM v pripade batchinverze, jinak ne}
    hloubkab := 0;
    write(strucgrafP,'       depth');                 {hlavicka souboru - prvni sloupec}
    for ib := 1 to ibp do begin
      write(strucgrafP, ib:9,'b');                    {prvni radek dalsich sloupcu obsahuje cislo inverze + pismeno, aby to Grapher bral jako hlavicku a ne jako cislo}
    end;
    if (Dinar = false) and (KTB = false) then write(strucgrafP, '   averagP  averP-sd  averP+sd   depth-M averP-M/S avP-sdM/S avP+sdM/S');  {posledni sloupce jsou prumer a odchylky}
    if (Dinar = true)  or  (KTB = true)  then write(strucgrafP, '   averagP  averP-sd  averP+sd');  {posledni sloupce jsou prumer a odchylky}
    writeln(strucgrafP);
    for nin := 1 to numoflay do begin                 {cyklus pres vrstvy}
      if nin = 1 then begin                           {prvni vrstva}
        write(strucgrafP,'     0.00000');             {zacina v nulove hloubce}
        for ib := 1 to ibp do begin                   {cyklus pres vsechny inverze ale porad jsme jen v 1. vrstve}
          write(strucgrafP, pipiP[nin,ib]:10:4);      {zapisu vsechny P-velocity}
        end;
        if (Dinar = false) and (KTB = false) then write(strucgrafP, batchprumerP[nin]:10:4,(batchprumerP[nin]-odchylkaP[nin]):10:4,(batchprumerP[nin]+odchylkaP[nin]):10:4,'      0.00' , (batchprumerP[nin]*1000):10:3,((batchprumerP[nin]-odchylkaP[nin])*1000):10:3,((batchprumerP[nin]+odchylkaP[nin])*1000):10:3);  {zapisu prumer a odchylky}
        if (Dinar = true)  or  (KTB = true)  then write(strucgrafP, batchprumerP[nin]:10:4,(batchprumerP[nin]-odchylkaP[nin]):10:4,(batchprumerP[nin]+odchylkaP[nin]):10:4);  {zapisu prumer a odchylky}
        writeln(strucgrafP);                          {skocim na dalsi radek}
      end;                                            {konec 1. vrstvy}
      if nin <> 1 then begin                          {pro dalsi vrstvy udelam to same}
        write(strucgrafP,  hloubkab:12:5);
        for ib := 1 to ibp do begin
          write(strucgrafP, pipiP[nin,ib]:10:4);
        end;
        if (Dinar = false) and (KTB = false) then write(strucgrafP, batchprumerP[nin]:10:4,(batchprumerP[nin]-odchylkaP[nin]):10:4,(batchprumerP[nin]+odchylkaP[nin]):10:4 , (hloubkab*1000):10:2 , (batchprumerP[nin]*1000):10:3,((batchprumerP[nin]-odchylkaP[nin])*1000):10:3,((batchprumerP[nin]+odchylkaP[nin])*1000):10:3);
        if (Dinar = true)  or  (KTB = true)  then write(strucgrafP, batchprumerP[nin]:10:4,(batchprumerP[nin]-odchylkaP[nin]):10:4,(batchprumerP[nin]+odchylkaP[nin]):10:4);
        writeln(strucgrafP);
      end;                                            {konec pro jinou nez 1. vrstvu}
      hloubkab := hloubkab + DD[nin];                 {posunu si hloubku}
      write(strucgrafP,  hloubkab:12:5);              {zapisu hloubku}
      for ib := 1 to ibp do begin                     {a znova pro vsechny inverze zapisu P-velocity, podruhe stejnou, aby to Grapher maloval jako klikatici}
        write(strucgrafP, pipiP[nin,ib]:10:4);
      end;
      if (Dinar = false) and (KTB = false) then write(strucgrafP, batchprumerP[nin]:10:4,(batchprumerP[nin]-odchylkaP[nin]):10:4,(batchprumerP[nin]+odchylkaP[nin]):10:4, (hloubkab*1000):10:2 , (batchprumerP[nin]*1000):10:3,((batchprumerP[nin]-odchylkaP[nin])*1000):10:3,((batchprumerP[nin]+odchylkaP[nin])*1000):10:3);
      if (Dinar = true)  or  (KTB = true)  then write(strucgrafP, batchprumerP[nin]:10:4,(batchprumerP[nin]-odchylkaP[nin]):10:4,(batchprumerP[nin]+odchylkaP[nin]):10:4);
      writeln(strucgrafP);
    end;                                              {konec cyklu pres vrstvy bez poloprostoru}
    write(strucgrafP,  hloubkab:12:5);                {zapisu posledni dva radky pro poloprostor}
    for ib := 1 to ibp do begin
      write(strucgrafP, pipiP[numoflay+1,ib]:10:4);
    end;
    if (Dinar = false) and (KTB = false) then write(strucgrafP, batchprumerP[numoflay+1]:10:4,(batchprumerP[numoflay+1]-odchylkaP[numoflay+1]):10:4,(batchprumerP[numoflay+1]+odchylkaP[numoflay+1]):10:4 , (hloubkab*1000):10:2 , (batchprumerP[numoflay+1]*1000):10:3,((batchprumerP[numoflay+1]-odchylkaP[numoflay+1])*1000):10:3,((batchprumerP[numoflay+1]+odchylkaP[numoflay+1])*1000):10:3);
    if (Dinar = true)  or  (KTB = true)  then write(strucgrafP, batchprumerP[numoflay+1]:10:4,(batchprumerP[numoflay+1]-odchylkaP[numoflay+1]):10:4,(batchprumerP[numoflay+1]+odchylkaP[numoflay+1]):10:4);
    writeln(strucgrafP);
    write(strucgrafP,(hloubkab*1.25):12:5);
    for ib := 1 to ibp do begin
      write(strucgrafP, pipiP[numoflay+1,ib]:10:4);
    end;
    if (Dinar = false) and (KTB = false) then write(strucgrafP, batchprumerP[numoflay+1]:10:4,(batchprumerP[numoflay+1]-odchylkaP[numoflay+1]):10:4,(batchprumerP[numoflay+1]+odchylkaP[numoflay+1]):10:4 , (hloubkab*1.25*1000):10:2 , (batchprumerP[numoflay+1]*1000):10:3,((batchprumerP[numoflay+1]-odchylkaP[numoflay+1])*1000):10:3,((batchprumerP[numoflay+1]+odchylkaP[numoflay+1])*1000):10:3);
    if (Dinar = true)  or  (KTB = true)  then write(strucgrafP, batchprumerP[numoflay+1]:10:4,(batchprumerP[numoflay+1]-odchylkaP[numoflay+1]):10:4,(batchprumerP[numoflay+1]+odchylkaP[numoflay+1]):10:4);
    closefile(strucgrafP);                            {zavru soubor batchP.dat}
  end; {kdyz to byl Rayleigh nebo oboji dohromady}
  if (Dinar = false) and (KTB = false) then assignfile(strucgrafH,'batchD.dat');              {do specialniho souboru zapisu hustoty, tak hlavne jejich prumer a odchylky}
  if fromPhaseCorr then begin
    if (Dinar = true)  or  (KTB = true)  then assignfile(strucgrafH,'batchD/'+nodestrg+'batchD.dat');              {do specialniho souboru zapisu hustoty, tak hlavne jejich prumer a odchylky}
  end;
  if fromArrayCorr then begin
    if (Dinar = true)  or  (KTB = true)  then assignfile(strucgrafH,'batchD/'+nodestrg+'batchD-'+subarrayname+'.dat');              {do specialniho souboru zapisu hustoty, tak hlavne jejich prumer a odchylky}
  end;
  if (KTB = true) then begin
    assignfile(strucgrafH,'batchD/'+nodestrg+'batchD.dat');              {do specialniho souboru zapisu hustoty, tak hlavne jejich prumer a odchylky}
  end;
  rewrite(strucgrafH);                              {tento soubor se uklada JENOM v pripade batchinverze, jinak ne}
  hloubkab := 0;
  write(strucgrafH,'       depth');                 {hlavicka souboru - prvni sloupec}
  for ib := 1 to ibp do begin
    write(strucgrafH, ib:9,'b');                    {prvni radek dalsich sloupcu obsahuje cislo inverze + pismeno, aby to Grapher bral jako hlavicku a ne jako cislo}
  end;
  if (Dinar = false) and (KTB = false) then write(strucgrafH, '   averagD  averD-sd  averD+sd   depth-M');  {posledni sloupce jsou prumer a odchylky}
  if (Dinar = true)  or  (KTB = true)  then write(strucgrafH, '   averagD  averD-sd  averD+sd');  {posledni sloupce jsou prumer a odchylky}
  writeln(strucgrafH);
  for nin := 1 to numoflay do begin                 {cyklus pres vrstvy}
    if nin = 1 then begin                           {prvni vrstva}
      write(strucgrafH,'     0.00000');             {zacina v nulove hloubce}
      for ib := 1 to ibp do begin                   {cyklus pres vsechny inverze ale porad jsme jen v 1. vrstve}
        write(strucgrafH, pipiH[nin,ib]:10:4);      {zapisu vsechny S-velocity}
      end;
      if (Dinar = false) and (KTB = false) then write(strucgrafH, batchprumerH[nin]:10:4,(batchprumerH[nin]-odchylkaH[nin]):10:4,(batchprumerH[nin]+odchylkaH[nin]):10:4,'      0.00');  {zapisu prumer a odchylky}
      if (Dinar = true)  or  (KTB = true)  then write(strucgrafH, batchprumerH[nin]:10:4,(batchprumerH[nin]-odchylkaH[nin]):10:4,(batchprumerH[nin]+odchylkaH[nin]):10:4);  {zapisu prumer a odchylky}
      writeln(strucgrafH);                          {skocim na dalsi radek}
    end;                                            {konec 1. vrstvy}
    if nin <> 1 then begin                          {pro dalsi vrstvy udelam to same}
      write(strucgrafH,  hloubkab:12:5);
      for ib := 1 to ibp do begin
        write(strucgrafH, pipiH[nin,ib]:10:4);
      end;
      if (Dinar = false) and (KTB = false) then write(strucgrafH, batchprumerH[nin]:10:4,(batchprumerH[nin]-odchylkaH[nin]):10:4,(batchprumerH[nin]+odchylkaH[nin]):10:4 , (hloubkab*1000):10:2);
      if (Dinar = true)  or  (KTB = true)  then write(strucgrafH, batchprumerH[nin]:10:4,(batchprumerH[nin]-odchylkaH[nin]):10:4,(batchprumerH[nin]+odchylkaH[nin]):10:4);
      writeln(strucgrafH);
    end;                                            {konec pro jinou nez 1. vrstvu}
    hloubkab := hloubkab + DD[nin];                 {posunu si hloubku}
    write(strucgrafH,  hloubkab:12:5);              {zapisu hloubku}
    for ib := 1 to ibp do begin                     {a znova pro vsechny inverze zapisu S-velocity, podruhe stejnou, aby to Grapher maloval jako klikatici}
      write(strucgrafH, pipiH[nin,ib]:10:4);
    end;
    if (Dinar = false) and (KTB = false) then write(strucgrafH, batchprumerH[nin]:10:4,(batchprumerH[nin]-odchylkaH[nin]):10:4,(batchprumerH[nin]+odchylkaH[nin]):10:4, (hloubkab*1000):10:2);
    if (Dinar = true)  or  (KTB = true)  then write(strucgrafH, batchprumerH[nin]:10:4,(batchprumerH[nin]-odchylkaH[nin]):10:4,(batchprumerH[nin]+odchylkaH[nin]):10:4);
    writeln(strucgrafH);
  end;                                              {konec cyklu pres vrstvy bez poloprostoru}
  write(strucgrafH,  hloubkab:12:5);                {zapisu posledni dva radky pro poloprostor}
  for ib := 1 to ibp do begin
    write(strucgrafH, pipiH[numoflay+1,ib]:10:4);
  end;
  if (Dinar = false) and (KTB = false) then write(strucgrafH, batchprumerH[numoflay+1]:10:4,(batchprumerH[numoflay+1]-odchylkaH[numoflay+1]):10:4,(batchprumerH[numoflay+1]+odchylkaH[numoflay+1]):10:4 , (hloubkab*1000):10:2);
  if (Dinar = true)  or  (KTB = true)  then write(strucgrafH, batchprumerH[numoflay+1]:10:4,(batchprumerH[numoflay+1]-odchylkaH[numoflay+1]):10:4,(batchprumerH[numoflay+1]+odchylkaH[numoflay+1]):10:4);
  writeln(strucgrafH);
  write(strucgrafH,(hloubkab*1.25):12:5);
  for ib := 1 to ibp do begin
    write(strucgrafH, pipiH[numoflay+1,ib]:10:4);
  end;
  if (Dinar = false) and (KTB = false) then write(strucgrafH, batchprumerH[numoflay+1]:10:4,(batchprumerH[numoflay+1]-odchylkaH[numoflay+1]):10:4,(batchprumerH[numoflay+1]+odchylkaH[numoflay+1]):10:4 , (hloubkab*1.25*1000):10:2);
  if (Dinar = true)  or  (KTB = true)  then write(strucgrafH, batchprumerH[numoflay+1]:10:4,(batchprumerH[numoflay+1]-odchylkaH[numoflay+1]):10:4,(batchprumerH[numoflay+1]+odchylkaH[numoflay+1]):10:4);
  closefile(strucgrafH);                            {zavru soubor batchH.dat}
  str(batchvzdaprum:12:8,batchvzdaprumstrg);
  str(odchylkamis:12:8,odchylkamisstrg);
  str(minmisfit:12:8,minmisfitstrg);
  str(maxmisfit:12:8,maxmisfitstrg);
  str(greenvzda:12:8,greenvzdastrg);
  if (Dinar = false) and (KTB = false) then assignfile(misfitovy,'batchmisfit.dat');          {do specialniho souboru zapisu info o misfitech celeho setu inverzi}
  if (Dinar = true)  or  (KTB = true)  then assignfile(misfitovy,'batchmisfit/'+nodestrg+'batchmisfit'+subarrayname+'.dat'); {do specialniho souboru zapisu info o misfitech celeho setu inverzi}
  rewrite(misfitovy);
  writeln(misfitovy, 'mean misfit is:                      ', batchvzdaprum:12:8 );
  writeln(misfitovy, 'standard deviation of the misfit is: ', odchylkamis:12:8 );
  writeln(misfitovy, 'the lowest misfit is:                ', minmisfit:12:8 );
  writeln(misfitovy, 'the highest misfit is:               ', maxmisfit:12:8 );
  writeln(misfitovy, 'misfit of the final curve is:        ', greenvzda:12:8 );
  writeln(misfitovy, 'number of inversion runs is:        ', ibp:6 );
  writeln(misfitovy, 'number of rejected runs is:        ', skoknum:6 );
  closefile(misfitovy);



  {ulozim si soubor s trychtyrem krivek}
  if (Dinar = false) and (KTB = false) then assignfile(trychtyr,'batchfunnel.dat');          {do specialniho souboru zapisu krivku spoctenou jako prumer a odchylky setu fitovanych krivek a take minimalni a maximalni hranice setu fitovanych krivek}
  if (Dinar = true)  or  (KTB = true)  then assignfile(trychtyr,'batchfunnel/'+nodestrg+'batchfunnel'+subarrayname+'.dat'); {do specialniho souboru zapisu krivku spoctenou jako prumer a odchylky setu fitovanych krivek a take minimalni a maximalni hranice setu fitovanych krivek}
  rewrite(trychtyr);
  //writeln(trychtyr,'      period   frequency    minVeloc    maxVeloc  minVel-M/S  maxVel-M/S    avgVeloc  avgVel-M/S      V+stdv      V-stdv    stdv+M/S    stdv-M/S');
  write(trychtyr,'  period');
  for ib := 1 to ibp do begin {pro vsechny jednotlive inverze ulozim jejich hlavicku}
    str(ib:5,ibstrg);
    write(trychtyr,ibstrg+'b');
  end;
  writeln(trychtyr,'  minV  maxV');
  for hoh := 1 to prumnft do begin
      //writeln(trychtyr , prumtperiod[hoh]:12:4 , (1/prumtperiod[hoh]):12:4 , minprumuvelocity[hoh]:12:7 , maxprumuvelocity[hoh]:12:7 , (minprumuvelocity[hoh]*1000):12:4 , (maxprumuvelocity[hoh]*1000):12:4 ,
      //prumfit[hoh]:12:7 , (prumfit[hoh]*1000):12:4 , (prumfit[hoh]+odchylkafit[hoh]):12:7 , (prumfit[hoh]-odchylkafit[hoh]):12:7 , ((prumfit[hoh]+odchylkafit[hoh])*1000):12:4 , ((prumfit[hoh]-odchylkafit[hoh])*1000):12:4 );
    write(trychtyr , prumtperiod[hoh]:8:3);
    for ib := 1 to ibp do begin {pro vsechny jednotlive inverze ulozim jejich hlavicku}
      write(trychtyr,fitvelocbatch[hoh,ib]:6:3);
    end;
    writeln(trychtyr, minprumuvelocity[hoh]:6:3 , maxprumuvelocity[hoh]:6:3); {odradkuju na dalsi filter}
  end; {hoh - filters}
  closefile(trychtyr);


  pp3 := pp3 + 1; {vykreslim do PlotPanelu minimalni a maximalni hranici fitovanych krivek}
  with NoSVALform.PlotPanel3 do begin
    LayerOptions(pp3,pmLine,2);
  end;
    NoSVALform.PlotPanel3.AddXY(prumtperiod[      1],minprumuvelocity[      1],RGB(255,0,255),pp3); {prvni bod}
  for jeje := 1 to trunc(prumnft/4) do begin
    NoSVALform.PlotPanel3.AddXY(prumtperiod[ jeje*4],minprumuvelocity[ jeje*4],RGB(255,0,255),pp3); {body uprostred}
  end;
    NoSVALform.PlotPanel3.AddXY(prumtperiod[prumnft],minprumuvelocity[prumnft],RGB(255,0,255),pp3); {posledni bod}
  pp3 := pp3 + 1; {a jeste maximum}
  with NoSVALform.PlotPanel3 do begin
    LayerOptions(pp3,pmLine,2);
  end;
    NoSVALform.PlotPanel3.AddXY(prumtperiod[      1],maxprumuvelocity[      1],RGB(255,0,255),pp3); {prvni bod}
  for jeje := 1 to trunc(prumnft/4) do begin
    NoSVALform.PlotPanel3.AddXY(prumtperiod[ jeje*4],maxprumuvelocity[ jeje*4],RGB(255,0,255),pp3); {body uprostred}
  end;
    NoSVALform.PlotPanel3.AddXY(prumtperiod[prumnft],maxprumuvelocity[prumnft],RGB(255,0,255),pp3); {posledni bod}
  {vypisu vysledky misfitu do textoveho okna}
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - mean misfit is:                                 ' + batchvzdaprumstrg);
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - standard deviation of the misfit is:  ' + odchylkamisstrg );
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - the lowest misfit is:                          ' + minmisfitstrg);
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - the highest misfit is:                        ' + maxmisfitstrg);
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - misfit of the final curve is:              ' + greenvzdastrg);
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - number of inversion runs is:              ' + ibpstrg);
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | - number of rejected runs is:              ' + skoknumstrg);
  batchinver := false;
  koneccasuBI := Time;
  koneccasuBI := koneccasuBI*86400;
  trvaniBI := koneccasuBI - zacatekcasuBI;
  if (trvaniBI > 60) then begin
    minutyBI := trunc(trvaniBI / 60);
    sekundyBI := trvaniBI-(minutyBI*60);
    str(minutyBI,minutyBIstrg);
    str(sekundyBI:5:2,sekundyBIstrg);
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - time needed for inversion: '+minutyBIstrg+' min '+sekundyBIstrg+' s');
  end
  else begin  {kdyz je to mensi nez 60 sekund}
    str(trvaniBI:5:2,trvaniBIstrg);
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - time needed for inversion: '+ trvaniBIstrg+' s');
  end;
  radek := radek +1;
  str(radek:4,radekstrg);
  NoSVALform.memo1.Lines.Add(radekstrg+' | ... end of the BATCH inversion');
end; {konec procedury Batch Inver}

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked = true then begin
    kreslit := true;
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - all misfits will be plotted');
  end;
  if CheckBox2.Checked = false then begin
    kreslit := false;
    radek := radek +1;
    str(radek:4,radekstrg);
    NoSVALform.memo1.Lines.Add(radekstrg+' | - only the general misfit will be plotted');
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  batchstopka := true;
end;

end.
