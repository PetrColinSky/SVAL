unit BatchUnit;
{unita, kde se nastavuji parametry pro davkove zpracovani, takze obsahuje jen formular, kde se neco zaskrtava}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, SvalUnit;
type
  { TBatchForm }
  TBatchForm = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup10: TRadioGroup;
    RadioGroup11: TRadioGroup;
    RadioGroup12: TRadioGroup;
    RadioGroup13: TRadioGroup;
    RadioGroup14: TRadioGroup;
    RadioGroup15: TRadioGroup;
    RadioGroup16: TRadioGroup;
    RadioGroup17: TRadioGroup;
    RadioGroup18: TRadioGroup;
    RadioGroup19: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup20: TRadioGroup;
    RadioGroup21: TRadioGroup;
    RadioGroup22: TRadioGroup;
    RadioGroup23: TRadioGroup;
    RadioGroup24: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    RadioGroup8: TRadioGroup;
    RadioGroup9: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup11Click(Sender: TObject);
    procedure RadioGroup14Click(Sender: TObject);
    procedure RadioGroup24Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure RadioGroup7Click(Sender: TObject);
    procedure RadioGroup8Click(Sender: TObject);
    procedure RadioGroup9Click(Sender: TObject);
    private
    public
  end;

var
  BatchForm: TBatchForm;
implementation
{$R *.lfm}
{ TBatchForm }

procedure TBatchForm.RadioGroup3Click(Sender: TObject);
begin                                                        {klikani na saving harmonic signals meni nastaveni dalsich RadioGroup}
  if RadioGroup3.ItemIndex = 0 then begin                    {saving harmonic signals - YES}
    RadioGroup4.Enabled   := true;                           {truncated RadioGroup - muzu si vybrat, jestli chci nebo nechci truncated}
    RadioGroup5.Enabled   := true;                           {normalize RadioGroup - muzu si vybrat, jestli chci nebo nechci normalized}
    RadioGroup6.Enabled   := true;                           {normalize RadioGroup - muzu si vybrat, jestli chci nebo nechci raw}
  end;
  if RadioGroup3.ItemIndex = 1 then begin                    {saving harmonic singals - NO}
    RadioGroup4.ItemIndex := 1;                              {a nastavim, ze truncated nebudou, protoze kdyz vubec harmoniky nebudou, nebudou ani truncated, ale musim to prenastavit, protoze dale se na to ptam}
    RadioGroup4.Enabled   := false;                          {truncated - uz si nemuzu vybrat}
    RadioGroup5.ItemIndex := 1;                              {a nastavim, ze normalized nebudou, protoze kdyz vubec harmoniky nebudou, nebudou ani normalized, ale musim to prenastavit, protoze dale se na to ptam}
    RadioGroup5.Enabled   := false;                          {normalized - uz si nemuzu vybrat}
    RadioGroup6.ItemIndex := 1;                              {a nastavim, ze raw nebudou, protoze kdyz vubec harmoniky nebudou, nebudou ani raw, ale musim to prenastavit, protoze dale se na to ptam}
    RadioGroup6.Enabled   := false;                          {raw - uz si nemuzu vybrat}
  end;
end;

procedure TBatchForm.RadioGroup7Click(Sender: TObject);      {chci - nechci ukladat compilovane disperze}
begin
  if RadioGroup7.ItemIndex = 0 then begin                    {YES disperze}
    RadioGroup17.Enabled   := true;                          {umoznim volit jestli chci ulozit selected wavegroup, ale nemenim jestli to bylo ano nebo ne, protoze to dycky bude NE}
  end;
  if RadioGroup7.ItemIndex = 1 then begin                    {NO disperze}
    RadioGroup17.Enabled   := false;                         {znemoznim volit ukladani selected wavegroups}
    RadioGroup17.ItemIndex := 1;                             {a prehodim to na NE, jakoze se nebudou ukladat selected wavegroups}
  end;
end;

procedure TBatchForm.RadioGroup8Click(Sender: TObject);      {klikani na vyber poctu maxim - jen kdyz dam, ze chci malovat disperze, umozni mi to nastavit oznacovani spatnych disperzi}
begin
  if RadioGroup8.ItemIndex = 5 then begin                    {kdyz chci malovat disperze}
    Edit1.Enabled  := true;                                  {umoznim nastavovat parametry pro oznacovani blbych disperzi}
    Edit2.Enabled  := true;
    Edit3.Enabled  := true;
    Label1.Enabled := true;
    Label4.Enabled := true;
  end;
  if (RadioGroup8.ItemIndex = 0) or (RadioGroup8.ItemIndex = 1) or (RadioGroup8.ItemIndex = 2) or (RadioGroup8.ItemIndex = 3) or (RadioGroup8.ItemIndex = 4) then begin {kdyz to bude cokoli jineho}
    Edit1.Enabled  := false;
    Edit2.Enabled  := false;
    Edit3.Enabled  := false;
    Label1.Enabled := false;
    Label4.Enabled := false;
  end;
end;

procedure TBatchForm.RadioGroup9Click(Sender: TObject);
begin
  if RadioGroup9.ItemIndex = 0 then begin {chci instrument correction}
    RadioGroup10.Enabled   := true;
  end;
  if RadioGroup9.ItemIndex = 1 then begin {nechci instrument correction}
    RadioGroup10.Enabled   := false;
    RadioGroup10.ItemIndex := 1;          {a kdyz nechci, tak to nebudu ani malovat, takze prehodim na NO}
  end;
end;

procedure TBatchForm.RadioGroup11Click(Sender: TObject);
begin
  if RadioGroup11.ItemIndex = 0 then begin {chci bandpass}
    RadioGroup19.Enabled   := true;        {umoznim vybrat ze chci i ulozit cely (a tedy bandpassfiltrovany)}
    RadioGroup20.Enabled   := true;        {a umoznim double bandpass}
  end;
  if RadioGroup11.ItemIndex = 1 then begin {nechci bandpass}
    RadioGroup19.Enabled   := false;       {znemoznim vybrat ze chci cely}
    RadioGroup19.ItemIndex := 1;           {a jeste nastavim, ze se zadny cely ukladat nebude}
    RadioGroup20.Enabled   := false;       {znemoznim double bandpass}
    RadioGroup20.ItemIndex := 1;           {a jeste nastavim, ze se zadny double bandpass delat nebude}
  end;
end;

procedure TBatchForm.RadioGroup14Click(Sender: TObject); {polarization analysis}
begin
  if RadioGroup14.ItemIndex = 0 then begin {chci polarization}
    RadioGroup15.Enabled   := true;        {umoznim vybrat zpusoba taperovani}
  end;
  if RadioGroup14.ItemIndex = 1 then begin {nechci polarization}
    RadioGroup15.Enabled   := false;       {znemoznim vybrat zpusoba taperovani}
  end;
end;

procedure TBatchForm.RadioGroup24Click(Sender: TObject); {FIXED CUT}
begin
  if RadioGroup24.ItemIndex = 0 then begin     {fixed cut = TRUE}
    fixedcut := true;
    PREMlimit := true;
    RadioGroup23.ItemIndex := 0; {PREM limit dam na YES}
    RadioGroup23.Enabled := false; {PREM limits}
    Edit9.Text  := '1.00';
    Edit10.Text := 'N/A';
    Edit10.Enabled := false;
  end;
  if RadioGroup24.ItemIndex = 1 then begin     {fixed cut = FALSE}
    fixedcut := false;
    PREMlimit := false;
    RadioGroup23.ItemIndex := 1; {PREM limit dam na NO}
    RadioGroup23.Enabled := true;  {PREM limits}
    Edit9.Text  := '1.15';
    Edit10.Text := '0.90';
    Edit10.Enabled := true;
  end;
end;

procedure TBatchForm.Button1Click(Sender: TObject);
begin {zmacknu cudlik, kterym poustim batch processing}
  if RadioGroup1.ItemIndex = 0 then superbatchyesno := true;     {SuperBatch}
  if RadioGroup1.ItemIndex = 1 then superbatchyesno := false;
  if RadioGroup2.ItemIndex = 0 then yesno := true;               {Interactivity}
  if RadioGroup2.ItemIndex = 1 then yesno := false;
  if RadioGroup3.ItemIndex = 0 then harmoniky := true;           {saving harmonic signals - YES}
  if RadioGroup3.ItemIndex = 1 then harmoniky := false;          {saving harmonic singals - NO}
  if RadioGroup4.ItemIndex = 0 then trcyesno := true;            {saving truncated signals - YES}
  if RadioGroup4.ItemIndex = 1 then trcyesno := false;           {saving truncated singals - NO}
  if RadioGroup5.ItemIndex = 0 then chcesnormalizovany := mrYes; {saving normalized signals - YES}
  if RadioGroup5.ItemIndex = 1 then chcesnormalizovany := mrNo;  {saving normalized singals - NO}
  if RadioGroup6.ItemIndex = 0 then syrovkyyes := true;          {saving raw signals - YES}
  if RadioGroup6.ItemIndex = 1 then syrovkyyes := false;         {saving raw singals - NO}
  if RadioGroup7.ItemIndex = 0 then batchdisperze := true;       {saving dispersions - YES}
  if RadioGroup7.ItemIndex = 1 then batchdisperze := false;      {saving dispersions - NO}
  if RadioGroup8.ItemIndex = 0 then kolikjichchci := 1;
  if RadioGroup8.ItemIndex = 1 then kolikjichchci := 2;
  if RadioGroup8.ItemIndex = 2 then kolikjichchci := 3;
  if RadioGroup8.ItemIndex = 3 then kolikjichchci := 4;
  if RadioGroup8.ItemIndex = 4 then kolikjichchci := 5;
  if RadioGroup8.ItemIndex = 5 then kolikjichchci := 6;          {budu malovat disperzi a ne jednotliva maxima, defaultne vybrany cudlik}
  if RadioGroup9.ItemIndex = 0 then corrbatchyes := true;        {oprava na pristroj}
  if RadioGroup9.ItemIndex = 1 then corrbatchyes := false;
  if RadioGroup10.ItemIndex = 0 then spektrayesno := true;       {maluju spektrum}
  if RadioGroup10.ItemIndex = 1 then spektrayesno := false;
  if RadioGroup11.ItemIndex = 0 then batchbandpass := true;      {pouziti bandpass filtered}
  if RadioGroup11.ItemIndex = 1 then batchbandpass := false;
  if RadioGroup12.ItemIndex = 0 then demoyes := true;            {plot monochromatic signals}
  if RadioGroup12.ItemIndex = 1 then demoyes := false;
  if RadioGroup13.ItemIndex = 0 then allthreeyes := true;        {all 3 components}
  if RadioGroup13.ItemIndex = 1 then allthreeyes := false;
  if RadioGroup14.ItemIndex = 0 then POLAR := true;              {polarization analysis}
  if RadioGroup14.ItemIndex = 1 then POLAR := false;
  if RadioGroup15.ItemIndex = 0 then taper := true;              {tapering - cosine / boxcar}
  if RadioGroup15.ItemIndex = 1 then taper := false;
  if RadioGroup16.ItemIndex = 0 then reference := true;          {reference dispersion cut}
  if RadioGroup16.ItemIndex = 0 then NoSVALform.RadioGroup2.Enabled := false; {A / L / O option}
  if RadioGroup16.ItemIndex = 1 then reference := false;
  if RadioGroup16.ItemIndex = 1 then NoSVALform.RadioGroup2.Enabled := true;  {A / L / O option}
  if RadioGroup17.ItemIndex = 0 then savewave := true;           {ukladani vybrane skupiny}
  if RadioGroup17.ItemIndex = 1 then savewave := false;
  if RadioGroup18.ItemIndex = 0 then fliprec := true;            {preklapeni polarit}
  if RadioGroup18.ItemIndex = 1 then fliprec := false;
  if RadioGroup19.ItemIndex = 0 then savewhole := true;          {ukladani celych vecu}
  if RadioGroup19.ItemIndex = 1 then savewhole := false;
  if RadioGroup20.ItemIndex = 0 then doublebandpass := true;     {double band pass}
  if RadioGroup20.ItemIndex = 1 then doublebandpass := false;
  if RadioGroup21.ItemIndex = 0 then savecorrected := true;      {chci ukladat Zcrr, Rcrr, Tcrr}
  if RadioGroup21.ItemIndex = 1 then savecorrected := false;
  if RadioGroup22.ItemIndex = 0 then saverdg := true;            {chci ukladat vsechno mozne do adresare rdg}
  if RadioGroup22.ItemIndex = 1 then saverdg := false;
  if RadioGroup23.ItemIndex = 0 then PREMlimit := true;          {chci ukladat vsechno mozne do adresare rdg}
  if RadioGroup23.ItemIndex = 1 then PREMlimit := false;
  NoSVALform.Zbatchokna(Sender);
end; {konec mackani cudliku Batch! }


end.

