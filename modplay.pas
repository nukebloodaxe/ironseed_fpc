unit modplay;
{$L c_utils.o}
interface
	
	procedure setmodvolumeto(vol:word);cdecl ; external;
	procedure haltmod;cdecl ; external;
	procedure initializemod;
	procedure stopmod;       // stop music + unload
	procedure ampsetpanning(n:smallint;pantype:smallint);
	procedure playmod(looping: boolean;s: string);  // load & play mod
	procedure soundeffect(s: string; rate: word);
	procedure pausemod;cdecl ; external;
	procedure continuemod;cdecl ; external;
	procedure setmodvolume;
	function playing: boolean;cdecl ; external;
implementation

uses strings, data, utils_;

	procedure sdl_mixer_init;cdecl ; external;
	procedure musicDone;cdecl ; external;
	procedure play_mod(loop:byte; filename:pchar);cdecl ; external;
	procedure play_sound(filename:pchar; rate:word);cdecl ; external;
	
procedure playmod(looping: boolean;s: string);  // load & play mod
Var p : Pchar;
begin
    if ship.options[3]=0 then exit;
    p:=StrAlloc (length(s)+1);
    StrPCopy (P,s);
    play_mod(byte(looping),P);
    StrDispose(P);
    setmodvolumeto(ship.options[9]);
end;

	

procedure initializemod;  //SDL mod
begin
    sdl_mixer_init;
end;

procedure stopmod;       // stop music + unload
var i: integer;
begin
 for i:=ship.options[9] downto 0 do
  begin
   setmodvolumeto(i);
   delay(10);
  end;
 musicDone;
end;


procedure ampsetpanning(n:smallint;pantype:smallint);
begin
end;




procedure soundeffect(s: string; rate: word);
Var p : Pchar;
begin
    if ship.options[3]=0 then exit;
    
    p:=StrAlloc (length(s)+1);
    StrPCopy (P,s);
    play_sound(P,rate);
    StrDispose(P);
end;

procedure setmodvolume;
begin
	//if (not playing) then exit;
	setmodvolumeto(ship.options[9])
end;

end.
