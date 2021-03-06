program eventmake;
(********************************************************************
    This file is part of Ironseed.

    Ironseed is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Ironseed is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Ironseed.  If not, see <http://www.gnu.org/licenses/>.
********************************************************************)

{*********************************************
   Data Generator: Extra events dependencies

   Copyright:
    1994 Channel 7, Destiny: Virtual
    2020 Matija Nalis <mnalis-git@voyager.hr>
**********************************************}

{$PACKRECORDS 1}

uses crt;

type
 eventtype=
  record
   want,give: integer;
   msg: string[255];
  end;
var
 t: eventtype;
 ft: text;
 f: file of eventtype;
 j,i: integer;
 ans: char;

begin
 clrscr;
 assign(ft,'Data_Generators/makedata/event.txt');
 reset(ft);
 assign(f,'data/event.dta');
 rewrite(f);
 for j:=0 to 10 do
  begin
   readln(ft,t.msg);
   for i:=0 to 9 do
    begin
     fillchar(t.msg,255,$20);
     read(ft,t.want);
     read(ft,t.give);
     if (t.want>0) or (t.give>0) then
      begin
       read(ft,ans);
       read(ft,ans);
       readln(ft,t.msg);
       t.msg := UpCase(t.msg);
      end
     else
      begin
       t.msg:='Nothing happens.';
       readln(ft);
      end;
     writeln(t.want:6,t.give:6,'  ',t.msg);
     write(f,t);
    end;
  end;
 close(f);
 close(ft);
end.