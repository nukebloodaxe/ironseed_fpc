program makeartifact;
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
   Data Generator: Artifact names generator

   Copyright:
    1994 Channel 7, Destiny: Virtual
    2020 Matija Nalis <mnalis-git@voyager.hr>
**********************************************}

{$PACKRECORDS 1}

type
 artifacttype=string[10];
var
 f: file of artifacttype;
 temp: artifacttype;
 ft: text;
 i: integer;

begin
 assign(ft,'Data_Generators/makedata/anom.txt');
 reset(ft);
 assign(f,'data/artifact.dta');
 rewrite(f);
 for i:=1 to 60 do
  begin
   readln(ft,temp);
   writeln(temp);
   write(f,temp);
  end;
 close(ft);
 close(f);
end.