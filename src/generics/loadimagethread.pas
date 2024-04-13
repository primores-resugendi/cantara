unit loadimagethread;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, PresentationCanvas, Slides, Graphics, Forms, PresentationModels;

type

  { TLoadImageThread }

  TLoadImageThread = class(TThread)
  public
    constructor Create(CreateSuspended: Boolean);
    procedure LoadData(PresentationStyleSettings: TPresentationStyleSettings;
      SlideSettings: TSlideSettings;
      PresentationCanvas: TPresentationCanvasHandler;
      Screen: TScreen; ChangeBackground: Boolean; Slide: TSlide;
      TargetPicture: TPicture);
    procedure RunOnce;
  private
    blocked: Boolean;
    PresentationStyleSettings: TPresentationStyleSettings;
    SlideSettings: TSlideSettings;
    TargetPicture: TPicture;
    PresentationCanvas: TPresentationCanvasHandler;
    Screen: TScreen;
    ChangeBackground: Boolean;
    Slide: TSlide;
    halted: Boolean;
    Paused: Boolean;
    procedure LoadImage;
  protected
    procedure Execute; override;
  end;

implementation

uses Settings;

  { TLoadImageThread }

constructor TLoadImageThread.Create(CreateSuspended: Boolean);
begin
  FreeOnTerminate := False;
  inherited Create(CreateSuspended);
  halted := True;
  blocked := False;
end;

procedure TLoadImageThread.LoadData(PresentationStyleSettings:
  TPresentationStyleSettings;
  SlideSettings: TSlideSettings; PresentationCanvas: TPresentationCanvasHandler;
  Screen: TScreen; ChangeBackground: Boolean; Slide: TSlide; TargetPicture: TPicture);
begin
  self.ChangeBackground := ChangeBackground;
  if self.PresentationStyleSettings.Transparency <>
    PresentationStyleSettings.Transparency then
  begin
    blocked := False;
    self.ChangeBackground := True;
  end;
  self.PresentationStyleSettings := PresentationStyleSettings;
  self.SlideSettings := SlideSettings;
  self.PresentationCanvas := PresentationCanvas;
  self.Screen := Screen;
  self.Slide := Slide;
  self.TargetPicture := TargetPicture;
end;

procedure TLoadImageThread.RunOnce;
begin
  halted := False;
end;

procedure TLoadImageThread.LoadImage;
begin
  TargetPicture.Assign(PresentationCanvas.PaintSlide(Slide));
end;

procedure TLoadImageThread.Execute;
var
  Skip: Boolean;
  i: 0..2;
begin
  if Blocked then Exit
  else
    Blocked := True;
  while (Not Terminated) do
  begin
    if Not halted And frmSettings.Visible then
    begin

      Skip := False;
      if Not Assigned(PresentationCanvas) then Skip := True;
      if Not Assigned(Screen) then Skip := True;
      if Screen.Width = 0 then Skip := True;
      if Screen.Height = 0 then Skip := True;
      if Not Assigned(TargetPicture) then Skip := True;

      if Not Skip then
      begin
        for i := 0 to 2 do
        begin
          PresentationCanvas.SlideSettings := self.SlideSettings;
          PresentationCanvas.PresentationStyleSettings := self.PresentationStyleSettings;
          PresentationCanvas.Width := self.Screen.Width;
          PresentationCanvas.Height := self.Screen.Height;
          if ChangeBackground then
            PresentationCanvas.LoadBackgroundBitmap;
          PresentationCanvas.ResizeBackgroundBitmap;
          Synchronize(@LoadImage);
        end;
      end;

      halted := True;
    end
    else
      Sleep(2);
  end;
  Blocked := False;
end;

end.
