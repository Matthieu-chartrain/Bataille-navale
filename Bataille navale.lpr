program OceanPacifique;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,
  {Variables globales stockées dans unit1}Unit1,
  {Nécessaire pour clear l'écran}Crt
  { you can add units after this };



Procedure TableauJeu(blanc:integer);
var
 i,j,a,b: integer;
begin
Writeln('Plan de jeu:');
Writeln;
//Première Colonne
  TJ[0,0]:=(' \');
  TJ[1,0]:=(' 1');
  TJ[2,0]:=(' 2');
  TJ[3,0]:=(' 3');
  TJ[4,0]:=(' 4');
  TJ[5,0]:=(' 5');
  TJ[6,0]:=(' 6');
  TJ[7,0]:=(' 7');
  TJ[8,0]:=(' 8');
  TJ[9,0]:=(' 9');
  TJ[10,0]:=('10');
//Première Ligne
  TJ[0,1]:=('A');
  TJ[0,2]:=('B');
  TJ[0,3]:=('C');
  TJ[0,4]:=('D');
  TJ[0,5]:=('E');
  TJ[0,6]:=('F');
  TJ[0,7]:=('G');
  TJ[0,8]:=('H');
  TJ[0,9]:=('I');
  TJ[0,10]:=('J');
//Espaces dans les cases
If blanc=1 then
begin
For a:=1 to 10 do
   begin
    for b:=1 to 10 do
    begin
      TJ[a,b]:=(' ');
    end;
   end;
end;
//Ecriture Tableau
  For i:=0 to 10 do
   begin
    For j:=0 to 10 do
      begin
       If TJ[i,j]=('T') then
       begin
         TextColor(60);
       end
       Else
       If TJ[i,j]=('O') then
       begin
         TextColor(LightCyan);
       end;
       Write(TJ[i,j]);
       TextColor(White);
       Write('|');
      end;
     Writeln;
     Write('----------------------');
     If i=1 then
     begin
     If PAC=true then
     begin
      TextColor(Black);
       Write(' Porte-Avions');
      TextColor(White);
     end
     Else
      Write('  Porte-Avions');
     end;
     If i=2 then
     begin
     If SMC=true then
     begin
      TextColor(Black);
       Write(' Sous-Marin');
      TextColor(White);
     end
     Else
      Write('  Sous-Marin');
     end;
     If i=3 then
     begin
     If C1C=true then
     begin
      TextColor(Black);
       Write(' Croiseur');
      TextColor(White);
     end
     Else
      Write('  Croiseur');
     end;
     If i=4 then
     begin
     If C2C=true then
     begin
      TextColor(Black);
       Write(' Cuirasse');
      TextColor(White);
     end
     Else
      Write('  Cuirasse');
     end;
     If i=5 then
     begin
     If TC=true then
     begin
      TextColor(Black);
       Writeln(' Torpilleur');
      TextColor(White);
     end
     Else
      Writeln('  Torpilleur');
     end
     Else
     Writeln('');
end;
end;
Procedure TableauChasse(Blanc:integer);
var
 i,j,a,b: integer;
begin
ClrScr;
TextColor(White);
Writeln('Plan de chasse:');
Writeln;
//Première Colonne
  TB[0,0,1]:=(' \');
  TB[1,0,1]:=(' 1');
  TB[2,0,1]:=(' 2');
  TB[3,0,1]:=(' 3');
  TB[4,0,1]:=(' 4');
  TB[5,0,1]:=(' 5');
  TB[6,0,1]:=(' 6');
  TB[7,0,1]:=(' 7');
  TB[8,0,1]:=(' 8');
  TB[9,0,1]:=(' 9');
  TB[10,0,1]:=('10');
//Première Ligne
  TB[0,1,1]:=('A');
  TB[0,2,1]:=('B');
  TB[0,3,1]:=('C');
  TB[0,4,1]:=('D');
  TB[0,5,1]:=('E');
  TB[0,6,1]:=('F');
  TB[0,7,1]:=('G');
  TB[0,8,1]:=('H');
  TB[0,9,1]:=('I');
  TB[0,10,1]:=('J');
//Espaces dans les cases
If Blanc=1 then
begin
For a:=1 to 10 do
   begin
    for b:=1 to 10 do
    begin
      TB[a,b,1]:=(' ');
    end;
   end;
For a:=1 to 10 do
   begin
    for b:=1 to 10 do
    begin
      TB[a,b,2]:=(' ');
    end;
   end;
end;
{//Si victoire de l'IA : Affichage de ses bateaux
If PAbC=true then
    begin
     If SMbC=true then
       begin
        If C1bC=true then
          begin
           If C2bC=true then
             begin
              If TbC=true then
                begin
                 For i:=0 to 10 do
                  begin
                   For j:=0 to 10 do
                    begin
                     If TB[i,j,2]=('O') then
                       begin
                        TB[i,j,1]:=('O');
                       end;
                       Write(TB[i,j,1]);
                       TextColor(White);
                       Write('|');
                    end;
                     Writeln;
                     write('----------------------');
                   If i=1 then
                    begin
                     If PAbC=true then
                      begin
                       TextColor(Black);
                       Write(' Porte-Avions');
                       TextColor(White);
                      end
                     Else
                      Write('  Porte-Avions');
                     end;
                   If i=2 then
                    begin
                     If SMbC=true then
                      begin
                       TextColor(Black);
                       Write(' Sous-Marin');
                       TextColor(White);
                      end
                    Else
                     Write('  Sous-Marin');
                    end;
                   If i=3 then
                    begin
                     If C1bC=true then
                      begin
                       TextColor(Black);
                       Write(' Croiseur');
                       TextColor(White);
                      end
                     Else
                      Write('  Croiseur');
                    end;
                     If i=4 then
                      begin
                       If C2bC=true then
                        begin
                         TextColor(Black);
                         Write(' Cuirasse');
                         TextColor(White);
                        end
                       Else
                        Write('  Cuirasse');
                      end;
                       If i=5 then
                        begin
                         If TbC=true then
                          begin
                           TextColor(Black);
                           Writeln(' Torpilleur');
                           TextColor(White);
                          end
                         Else
                          Writeln('  Torpilleur');
                        end
                      Else
                      Writeln('');
                     end;
                   Writeln;
                   GoTo TheEnd;
                end;
             end;
          end;
       end;
    end;}
//Ecriture Tableau
  For i:=0 to 10 do
   begin
    For j:=0 to 10 do
      begin
       If TB[i,j,1]=('T') then
       begin
         TextColor(60);
       end;
       Write(TB[i,j,1]);
       TextColor(White);
       Write('|');
      end;
     Writeln;
     write('----------------------');
     If i=1 then
     begin
     If PAbC=true then
     begin
      TextColor(Black);
       Write(' Porte-Avions');
      TextColor(White);
     end
     Else
      Write('  Porte-Avions');
     end;
     If i=2 then
     begin
     If SMbC=true then
     begin
      TextColor(Black);
       Write(' Sous-Marin');
      TextColor(White);
     end
     Else
      Write('  Sous-Marin');
     end;
     If i=3 then
     begin
     If C1bC=true then
     begin
      TextColor(Black);
       Write(' Croiseur');
      TextColor(White);
     end
     Else
      Write('  Croiseur');
     end;
     If i=4 then
     begin
     If C2bC=true then
     begin
      TextColor(Black);
       Write(' Cuirasse');
      TextColor(White);
     end
     Else
      Write('  Cuirasse');
     end;
     If i=5 then
     begin
     If TbC=true then
     begin
      TextColor(Black);
       Writeln(' Torpilleur');
      TextColor(White);
     end
     Else
      Writeln('  Torpilleur');
     end
     Else
     Writeln('');
    end;
  Writeln;
end;
Procedure PlacerBateau(Boat:integer);
//j en est ABSCICE(vers la droite) et i en ORDONNEE(vers le bas) TJ[i,j]
Var
  Case1,Case2,CaseH,CaseB,CaseG,CaseD,Choix1,Choix2,Choix3,Choix4,Bateau:string;
  i,j,i2,j2,x,t,a,b,c,a2,b2,z,y,boatt:integer;
  Label Restart;
  Label RestartC;
  Label Restart1;
  Label ReCase2;
  Label Thend;
Begin
  Choix1:=(' ');
  Choix2:=(' ');
  Choix3:=(' ');
  Choix4:=(' ');
  If Boat=5 then
   Begin
    Bateau:=('Porte-Avions');
   end;
  If Boat=4 then
   Begin
     Bateau:=('Sous-Marin');
   end;
  If Boat=3 then
   Begin
     Bateau:=('Cuirasse');
   end;
  If Boat=2 then
   Begin
     Bateau:=('Torpilleur');
   end;
  If Boat=6 then
   Begin
    Bateau:=('Croiseur');
    Boatt:=6;
    Boat:=3;
   end;
    Restart1:
    Write('Ou veux-tu placer l''extremite de ton ');
    Write(Bateau);
    Write(' ?(');
    Write(Boat);
    Writeln(' cases de long) Mettez ''R'' pour un placement automatique ^^');
    Readln(Case1);
  If Case1=('R') then
begin
a:=0;
b:=0;
c:=0;
a2:=0;
b2:=0;
z:=0;
y:=0;
Restart:
randomize;
a:=random(10)+1;
b:=random(10)+1;
If TJ[a,b]=('O') then
begin
 GoTo Restart;
end;
If TJ[a,b]=(' ') then
 begin
  c:=random(4)+1;
  RestartC:
  //Check droite+place s'il peut
  If c=1 then
  begin
   b2:=b+1;
   If b2>10 then
    begin
     GoTo Restart;
    end
   Else
   begin
    For z:= 2 to Boat do
     begin
      If TJ[a,b2]=('O') then
       begin
        GoTo Restart;
       end;
      If TJ[a,b2]=(' ') then
      begin
       b2:=b2+1;
       If TJ[a,b2]=('O') then
       begin
        GoTo Restart;
       end;
       If b2>10 then
       begin
        GoTo Restart;
       end;
       If z=Boat then
        begin
        If Boat=5 then
           begin
             PAj:=b;
             PAi:=a;
             PAj2:=b+1;
             PAi2:=a;
             PAj3:=b+2;
             PAi3:=a;
             PAj4:=b+3;
             PAi4:=a;
             PAj5:=b+4;
             PAi5:=a;
           end;
        If Boat=4 then
           begin
             SMj:=b;
             SMi:=a;
             SMj2:=b+1;
             SMi2:=a;
             SMj3:=b+2;
             SMi3:=a;
             SMj4:=b+3;
             SMi4:=a;
           end;
        If Boatt=6 then
           begin
             C1j:=b;
             C1i:=a;
             C1j2:=b+1;
             C1i2:=a;
             C1j3:=b+2;
             C1i3:=a;
           end
        Else
        If Boat=3 then
           begin
              C2j:=b;
              C2i:=a;
              C2j2:=b+1;
              C2i2:=a;
              C2j3:=b+2;
              C2i3:=a;
           end;
        If Boat=2 then
           begin
             Toj:=b;
             Ti:=a;
             Tj2:=b+1;
             Ti2:=a;
           end;
          TJ[a,b]:=('O');
          b2:=b+1;
          For y:= 2 to Boat do
          begin
           TJ[a,b2]:=('O');
           b2:=b2+1;
        end;
       end;
      end;
     end;
   end;
  end;
  //Check bas+place s'il peut
  If c=2 then
  begin
   a2:=a+1;
   If a2>10 then
       begin
        GoTo Restart;
       end;
    For z:= 2 to Boat do
     begin
      If TJ[a2,b]=('O') then
       begin
        GoTo Restart;
       end;
      If TJ[a2,b]=(' ') then
      begin
       a2:=a2+1;
       If TJ[a2,b]=('O') then
       begin
        GoTo Restart;
       end;
       If a2>10 then
       begin
        GoTo Restart;
       end;
       If z=Boat then
        begin
         If Boat=5 then
           begin
             PAj:=b;
             PAi:=a;
             PAj2:=b;
             PAi2:=a+1;
             PAj3:=b;
             PAi3:=a+2;
             PAj4:=b;
             PAi4:=a+3;
             PAj5:=b;
             PAi5:=a+4;
           end;
         If Boat=4 then
           begin
             SMj:=b;
             SMi:=a;
             SMj2:=b;
             SMi2:=a+1;
             SMj3:=b;
             SMi3:=a+2;
             SMj4:=b;
             SMi4:=a+3;
           end;
         If Boatt=6 then
           begin
             C1j:=b;
             C1i:=a;
             C1j2:=b;
             C1i2:=a+1;
             C1j3:=b;
             C1i3:=a+2;
           end
        Else
        If Boat=3 then
           begin
              C2j:=b;
              C2i:=a;
              C2j2:=b;
              C2i2:=a+1;
              C2j3:=b;
              C2i3:=a+2;
           end;
         If Boat=2 then
           begin
             Toj:=b;
             Ti:=a;
             Tj2:=b;
             Ti2:=a+1;
           end;
          TJ[a,b]:=('O');
          a2:=a+1;
          For y:= 2 to Boat do
          begin
           TJ[a2,b]:=('O');
           a2:=a2+1;
          end;
        end;
      end;
     end;
  end;
  //Check gauche+place s'il peut
  If c=3 then
  begin
   b2:=b-1;
   If b2<1 then
   begin
    GoTo Restart;
   end
   Else
   Begin
    For z:= 2 to Boat do
     begin
      If TJ[a,b2]=('O') then
       begin
        GoTo Restart;
       end;
      If TJ[a,b2]=(' ') then
      begin
       b2:=b2-1;
       If TJ[a,b2]=('O') then
       begin
        GoTo Restart;
       end;
       If b2<1 then
          begin
            GoTo Restart;
          end;
       If z=Boat then
        begin
         If Boat=5 then
           begin
             PAj:=b;
             PAi:=a;
             PAj2:=b-1;
             PAi2:=a;
             PAj3:=b-2;
             PAi3:=a;
             PAj4:=b-3;
             PAi4:=a;
             PAj5:=b-4;
             PAi5:=a;
           end;
         If Boat=4 then
           begin
             SMj:=b;
             SMi:=a;
             SMj2:=b-1;
             SMi2:=a;
             SMj3:=b-2;
             SMi3:=a;
             SMj4:=b-3;
             SMi4:=a;
           end;
         If Boatt=6 then
           begin
             C1j:=b;
             C1i:=a;
             C1j2:=b-1;
             C1i2:=a;
             C1j3:=b-2;
             C1i3:=a;
           end
        Else
        If Boat=3 then
           begin
              C2j:=b;
              C2i:=a;
              C2j2:=b-1;
              C2i2:=a;
              C2j3:=b-2;
              C2i3:=a;
           end;
         If Boat=2 then
           begin
             Toj:=b;
             Ti:=a;
             Tj2:=b-1;
             Ti2:=a;
           end;
          TJ[a,b]:=('O');
          b2:=b-1;
          For y:= 2 to Boat do
          begin
           TJ[a,b2]:=('O');
           b2:=b2-1;
          end;
        end;
      end;
     end;
   end;
  end;
  //Check haut+place s'il peut
  If c=4 then
  begin
   a2:=a-1;
   If a2<1 then
   begin
    GoTo Restart;
   end
   Else
   begin
    For z:= 2 to Boat do
     begin
      If TJ[a2,b]=('O') then
       begin
        GoTo Restart;
       end;
      If TJ[a2,b]=(' ') then
      begin
       a2:=a2-1;
       If TJ[a2,b]=('O') then
       begin
        GoTo Restart;
       end;
       If a2<1 then
       begin
        GoTo Restart;
       end;
       If z=Boat then
        begin
         If Boat=5 then
           begin
             PAj:=b;
             PAi:=a;
             PAj2:=b;
             PAi2:=a-1;
             PAj3:=b;
             PAi3:=a-2;
             PAj4:=b;
             PAi4:=a-3;
             PAj5:=b;
             PAi5:=a-4;
           end;
         If Boat=4 then
           begin
             SMj:=b;
             SMi:=a;
             SMj2:=b;
             SMi2:=a-1;
             SMj3:=b;
             SMi3:=a-2;
             SMj4:=b;
             SMi4:=a-3;
           end;
         If Boatt=6 then
           begin
             C1j:=b;
             C1i:=a;
             C1j2:=b;
             C1i2:=a-1;
             C1j3:=b;
             C1i3:=a-2;
           end
        Else
        If Boat=3 then
           begin
              C2j:=b;
              C2i:=a;
              C2j2:=b;
              C2i2:=a-1;
              C2j3:=b;
              C2i3:=a-2;
           end;
         If Boat=2 then
           begin
             Toj:=b;
             Ti:=a;
             Tj2:=b;
             Ti2:=a-1;
           end;
          TJ[a,b]:=('O');
          a2:=a-1;
          For y:= 2 to Boat do
          begin
           TJ[a2,b]:=('O');
           a2:=a2-1;
          end;
        end;
      end;
     end;
   end;
  end;
  GoTo Thend;
end
Else
 begin
  GoTo Restart;
 end;
end;
  If Boat=5 then
     Begin
    If Case1=('A1') then
      begin
        i:=1;
        j:=1;
        CaseH:=(' ');        CaseB:=('A5');        CaseD:=('E1');        CaseG:=(' ');
      end
    Else
    If Case1=('A2') then
      begin
       i:=2;
       j:=1;
       CaseH:=(' ');       CaseB:=('A6');       CaseD:=('E2');       CaseG:=(' ');
      end
    Else
    If Case1=('A3') then
      begin
       i:=3;
       j:=1;
       CaseH:=(' ');       CaseB:=('A7');       CaseD:=('E3');       CaseG:=(' ');
      end
    Else
    If Case1=('A4') then
      begin
       i:=4;
       j:=1;
       CaseH:=(' ');       CaseB:=('A8');       CaseD:=('E4');       CaseG:=(' ');
      end
    Else
    If Case1=('A5') then
      begin
       i:=5;
       j:=1;
       CaseH:=('A1');       CaseB:=('A9');       CaseD:=('E5');       CaseG:=(' ');
      end
    Else
    If Case1=('A6') then
      begin
       i:=6;
       j:=1;
       CaseH:=('A2');       CaseB:=('A10');       CaseD:=('E6');       CaseG:=(' ');
      end
    Else
    If Case1=('A7') then
      begin
       i:=7;
       j:=1;
       CaseH:=('A3');       CaseB:=(' ');       CaseD:=('E7');       CaseG:=(' ');
      end
    Else
    If Case1=('A8') then
      begin
       i:=8;
       j:=1;
       CaseH:=('A4');       CaseB:=(' ');       CaseD:=('E8');       CaseG:=(' ');
      end
    Else
    If Case1=('A9') then
      begin
       i:=9;
       j:=1;
       CaseH:=('A5');       CaseB:=(' ');       CaseD:=('E9');       CaseG:=(' ');
      end
    Else
    If Case1=('A10') then
      begin
       i:=10;
       j:=1;
       CaseH:=('A6');       CaseB:=(' ');       CaseD:=('E10');       CaseG:=(' ');
      end
    Else

    If Case1=('B1') then
      begin
       i:=1;
       j:=2;
       CaseH:=(' ');        CaseB:=('B5');        CaseD:=('F1');        CaseG:=(' ');
      end
    Else
    If Case1=('B2') then
      begin
       i:=2;
       j:=2;
       CaseH:=(' ');       CaseB:=('B6');       CaseD:=('F2');       CaseG:=(' ');
      end
    Else
    If Case1=('B3') then
      begin
       i:=3;
       j:=2;
       CaseH:=(' ');       CaseB:=('B7');       CaseD:=('F3');       CaseG:=(' ');
      end
    Else
    If Case1=('B4') then
      begin
       i:=4;
       j:=2;
       CaseH:=(' ');       CaseB:=('B8');       CaseD:=('F4');       CaseG:=(' ');
      end
    Else
    If Case1=('B5') then
      begin
       i:=5;
       j:=2;
       CaseH:=('B1');       CaseB:=('B9');       CaseD:=('F5');       CaseG:=(' ');
      end
    Else
    If Case1=('B6') then
      begin
       i:=6;
       j:=2;
       CaseH:=('B2');       CaseB:=('B10');       CaseD:=('F6');       CaseG:=(' ');
      end
    Else
    If Case1=('B7') then
      begin
       i:=7;
       j:=2;
       CaseH:=('B3');       CaseB:=(' ');       CaseD:=('F7');       CaseG:=(' ');
      end
    Else
    If Case1=('B8') then
      begin
       i:=8;
       j:=2;
       CaseH:=('B4');       CaseB:=(' ');       CaseD:=('F8');       CaseG:=(' ');
      end
    Else
    If Case1=('B9') then
      begin
       i:=9;
       j:=2;
       CaseH:=('B5');       CaseB:=(' ');       CaseD:=('F9');       CaseG:=(' ');
      end
    Else
    If Case1=('B10') then
      begin
       i:=10;
       j:=2;
       CaseH:=('B6');       CaseB:=(' ');       CaseD:=('F10');       CaseG:=(' ');
      end
    Else

    If Case1=('C1') then
      begin
        i:=1;
        j:=3;
        CaseH:=(' ');        CaseB:=('C5');        CaseD:=('G1');        CaseG:=(' ');
      end
    Else
    If Case1=('C2') then
      begin
       i:=2;
       j:=3;
       CaseH:=(' ');       CaseB:=('C6');       CaseD:=('G2');       CaseG:=(' ');
      end
    Else
    If Case1=('C3') then
      begin
       i:=3;
       j:=3;
       CaseH:=(' ');       CaseB:=('C7');       CaseD:=('G3');       CaseG:=(' ');
      end
    Else
    If Case1=('C4') then
      begin
       i:=4;
       j:=3;
       CaseH:=(' ');       CaseB:=('C8');       CaseD:=('G4');       CaseG:=(' ');
      end
    Else
    If Case1=('C5') then
      begin
       i:=5;
       j:=3;
       CaseH:=('C1');       CaseB:=('C9');       CaseD:=('G5');       CaseG:=(' ');
      end
    Else
    If Case1=('C6') then
      begin
       i:=6;
       j:=3;
       CaseH:=('C2');       CaseB:=('C10');       CaseD:=('G6');       CaseG:=(' ');
      end
    Else
    If Case1=('C7') then
      begin
       i:=7;
       j:=3;
       CaseH:=('C3');       CaseB:=(' ');       CaseD:=('G7');       CaseG:=(' ');
      end
    Else
    If Case1=('C8') then
      begin
       i:=8;
       j:=3;
       CaseH:=('C4');       CaseB:=(' ');       CaseD:=('G8');       CaseG:=(' ');
      end
    Else
    If Case1=('C9') then
      begin
       i:=9;
       j:=3;
       CaseH:=('C5');       CaseB:=(' ');       CaseD:=('G9');       CaseG:=(' ');
      end
    Else
    If Case1=('C10') then
      begin
       i:=10;
       j:=3;
       CaseH:=('C6');       CaseB:=(' ');       CaseD:=('G10');       CaseG:=(' ');
      end
    Else

    If Case1=('D1') then
      begin
       i:=1;
       j:=4;
      CaseH:=(' ');        CaseB:=('D5');        CaseD:=('H1');        CaseG:=(' ');
      end
    Else
    If Case1=('D2') then
      begin
       i:=2;
       j:=4;
       CaseH:=(' ');       CaseB:=('D6');       CaseD:=('H2');       CaseG:=(' ');
      end
    Else
    If Case1=('D3') then
      begin
       i:=3;
       j:=4;
       CaseH:=(' ');       CaseB:=('D7');       CaseD:=('H3');       CaseG:=(' ');
      end
    Else
    If Case1=('D4') then
      begin
       i:=4;
       j:=4;
       CaseH:=(' ');       CaseB:=('D8');       CaseD:=('H4');       CaseG:=(' ');
      end
    Else
    If Case1=('D5') then
      begin
       i:=5;
       j:=4;
       CaseH:=('D1');       CaseB:=('D9');       CaseD:=('H5');       CaseG:=(' ');
      end
    Else
    If Case1=('D6') then
      begin
       i:=6;
       j:=4;
       CaseH:=('D2');       CaseB:=('D10');       CaseD:=('H6');       CaseG:=(' ');
      end
    Else
    If Case1=('D7') then
      begin
       i:=7;
       j:=4;
       CaseH:=('D3');       CaseB:=(' ');       CaseD:=('H7');       CaseG:=(' ');
      end
    Else
    If Case1=('D8') then
      begin
       i:=8;
       j:=4;
       CaseH:=('D4');       CaseB:=(' ');       CaseD:=('H8');       CaseG:=(' ');
      end
    Else
    If Case1=('D9') then
      begin
       i:=9;
       j:=4;
       CaseH:=('D5');       CaseB:=(' ');       CaseD:=('H9');       CaseG:=(' ');
      end
    Else
    If Case1=('D10') then
      begin
       i:=10;
       j:=4;
       CaseH:=('D6');       CaseB:=(' ');       CaseD:=('H10');       CaseG:=(' ');
      end
    Else

    If Case1=('E1') then
      begin
       i:=1;
       j:=5;
       CaseH:=(' ');        CaseB:=('E5');      CaseD:=('I1');        CaseG:=('A1');
      end
    Else
    If Case1=('E2') then
      begin
       i:=2;
       j:=5;
       CaseH:=(' ');        CaseB:=('E6');      CaseD:=('I2');       CaseG:=('A2');
      end
    Else
    If Case1=('E3') then
      begin
       i:=3;
       j:=5;
       CaseH:=(' ');       CaseB:=('E7');       CaseD:=('I3');       CaseG:=('A3');
      end
    Else
    If Case1=('E4') then
      begin
       i:=4;
       j:=5;
       CaseH:=(' ');       CaseB:=('E8');       CaseD:=('I4');       CaseG:=('A4');
      end
    Else
    If Case1=('E5') then
      begin
       i:=5;
       j:=5;
       CaseH:=('E1');       CaseB:=('E9');       CaseD:=('I5');       CaseG:=('A5');
      end
    Else
    If Case1=('E6') then
      begin
       i:=6;
       j:=5;
       CaseH:=('E2');       CaseB:=('E10');       CaseD:=('I6');       CaseG:=('A6');
      end
    Else
    If Case1=('E7') then
      begin
       i:=7;
       j:=5;
       CaseH:=('E3');       CaseB:=(' ');       CaseD:=('I7');       CaseG:=('A7');
      end
    Else
    If Case1=('E8') then
      begin
       i:=8;
       j:=5;
       CaseH:=('E4');       CaseB:=(' ');       CaseD:=('I8');       CaseG:=('A8');
      end
    Else
    If Case1=('E9') then
      begin
       i:=9;
       j:=5;
       CaseH:=('E5');       CaseB:=(' ');       CaseD:=('I9');       CaseG:=('A9');
      end
    Else
    If Case1=('E10') then
      begin
       i:=10;
       j:=5;
       CaseH:=('E6');       CaseB:=(' ');       CaseD:=('I10');       CaseG:=('A10');
      end
    Else

    If Case1=('F1') then
      begin
       i:=1;
       j:=6;
       CaseH:=(' ');        CaseB:=('F5');      CaseD:=('J1');        CaseG:=('B1');
      end
    Else
    If Case1=('F2') then
      begin
       i:=2;
       j:=6;
       CaseH:=(' ');        CaseB:=('F6');      CaseD:=('J2');       CaseG:=('B2');
      end
    Else
    If Case1=('F3') then
      begin
       i:=3;
       j:=6;
       CaseH:=(' ');       CaseB:=('F7');       CaseD:=('J3');       CaseG:=('B3');
      end
    Else
    If Case1=('F4') then
      begin
       i:=4;
       j:=6;
       CaseH:=(' ');       CaseB:=('F8');       CaseD:=('J4');       CaseG:=('B4');
      end
    Else
    If Case1=('F5') then
      begin
       i:=5;
       j:=6;
       CaseH:=('F1');       CaseB:=('F9');       CaseD:=('J5');       CaseG:=('B5');
      end
    Else
    If Case1=('F6') then
      begin
       i:=6;
       j:=6;
       CaseH:=('F2');       CaseB:=('F10');       CaseD:=('J6');       CaseG:=('B6');
      end
    Else
    If Case1=('F7') then
      begin
       i:=7;
       j:=6;
       CaseH:=('F3');       CaseB:=(' ');       CaseD:=('J7');       CaseG:=('B7');
      end
    Else
    If Case1=('F8') then
      begin
       i:=8;
       j:=6;
       CaseH:=('F4');       CaseB:=(' ');       CaseD:=('J8');       CaseG:=('B8');
      end
    Else
    If Case1=('F9') then
      begin
       i:=9;
       j:=6;
       CaseH:=('F5');       CaseB:=(' ');       CaseD:=('J9');       CaseG:=('B9');
      end
    Else
    If Case1=('F10') then
      begin
       i:=10;
       j:=6;
       CaseH:=('F6');       CaseB:=(' ');       CaseD:=('J10');       CaseG:=('B10');
      end
    Else

    If Case1=('G1') then
      begin
       i:=1;
       j:=7;
       CaseH:=(' ');        CaseB:=('G5');      CaseD:=(' ');        CaseG:=('C1');
      end
    Else
    If Case1=('G2') then
      begin
       i:=2;
       j:=7;
       CaseH:=(' ');        CaseB:=('G6');      CaseD:=(' ');       CaseG:=('C2');
      end
    Else
    If Case1=('G3') then
      begin
       i:=3;
       j:=7;
       CaseH:=(' ');       CaseB:=('G7');       CaseD:=(' ');       CaseG:=('C3');
      end
    Else
    If Case1=('G4') then
      begin
       i:=4;
       j:=7;
       CaseH:=(' ');       CaseB:=('G8');       CaseD:=(' ');       CaseG:=('C4');
      end
    Else
    If Case1=('G5') then
      begin
       i:=5;
       j:=7;
       CaseH:=('G1');       CaseB:=('G9');       CaseD:=(' ');       CaseG:=('C5');
      end
    Else
    If Case1=('G6') then
      begin
       i:=6;
       j:=7;
       CaseH:=('G2');       CaseB:=('G10');       CaseD:=(' ');       CaseG:=('C6');
      end
    Else
    If Case1=('G7') then
      begin
       i:=7;
       j:=7;
       CaseH:=('G3');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('C7');
      end
    Else
    If Case1=('G8') then
      begin
       i:=8;
       j:=7;
       CaseH:=('G4');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('C8');
      end
    Else
    If Case1=('G9') then
      begin
       i:=9;
       j:=7;
       CaseH:=('G5');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('C9');
      end
    Else
    If Case1=('G10') then
      begin
       i:=10;
       j:=7;
       CaseH:=('G6');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('C10');
      end
    Else

    If Case1=('H1') then
      begin
       i:=1;
       j:=8;
       CaseH:=(' ');        CaseB:=('H5');      CaseD:=(' ');        CaseG:=('D1');
      end
    Else
    If Case1=('H2') then
      begin
       i:=2;
       j:=8;
       CaseH:=(' ');        CaseB:=('H6');      CaseD:=(' ');       CaseG:=('D2');
      end
    Else
    If Case1=('H3') then
      begin
       i:=3;
       j:=8;
       CaseH:=(' ');       CaseB:=('H7');       CaseD:=(' ');       CaseG:=('D3');
      end
    Else
    If Case1=('H4') then
      begin
       i:=4;
       j:=8;
       CaseH:=(' ');       CaseB:=('H8');       CaseD:=(' ');       CaseG:=('D4');
      end
    Else
    If Case1=('H5') then
      begin
       i:=5;
       j:=8;
       CaseH:=('H1');       CaseB:=('H9');       CaseD:=(' ');       CaseG:=('D5');
      end
    Else
    If Case1=('H6') then
      begin
       i:=6;
       j:=8;
       CaseH:=('H2');       CaseB:=('H10');       CaseD:=(' ');       CaseG:=('D6');
      end
    Else
    If Case1=('H7') then
      begin
       i:=7;
       j:=8;
       CaseH:=('H3');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('D7');
      end
    Else
    If Case1=('H8') then
      begin
       i:=8;
       j:=8;
       CaseH:=('H4');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('D8');
      end
    Else
    If Case1=('H9') then
      begin
       i:=9;
       j:=8;
       CaseH:=('H5');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('D9');
      end
    Else
    If Case1=('H10') then
      begin
       i:=10;
       j:=8;
       CaseH:=('H6');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('D10');
      end
    Else

    If Case1=('I1') then
      begin
       i:=1;
       j:=9;
       CaseH:=(' ');        CaseB:=('I5');      CaseD:=(' ');        CaseG:=('E1');
      end
    Else
    If Case1=('I2') then
      begin
       i:=2;
       j:=9;
       CaseH:=(' ');        CaseB:=('I6');      CaseD:=(' ');       CaseG:=('E2');
      end
    Else
    If Case1=('I3') then
      begin
       i:=3;
       j:=9;
       CaseH:=(' ');       CaseB:=('I7');       CaseD:=(' ');       CaseG:=('E3');
      end
    Else
    If Case1=('I4') then
      begin
       i:=4;
       j:=9;
       CaseH:=(' ');       CaseB:=('I8');       CaseD:=(' ');       CaseG:=('E4');
      end
    Else
    If Case1=('I5') then
      begin
       i:=5;
       j:=9;
       CaseH:=('I1');       CaseB:=('I9');      CaseD:=(' ');       CaseG:=('E5');
      end
    Else
    If Case1=('I6') then
      begin
       i:=6;
       j:=9;
       CaseH:=('I2');       CaseB:=('I10');     CaseD:=(' ');       CaseG:=('E6');
      end
    Else
    If Case1=('I7') then
      begin
       i:=7;
       j:=9;
       CaseH:=('I3');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('E7');
      end
    Else
    If Case1=('I8') then
      begin
       i:=8;
       j:=9;
       CaseH:=('I4');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('E8');
      end
    Else
    If Case1=('I9') then
      begin
       i:=9;
       j:=9;
       CaseH:=('I5');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('E9');
      end
    Else
    If Case1=('I10') then
      begin
       i:=10;
       j:=9;
       CaseH:=('I6');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('E10');
      end
    Else

    If Case1=('J1') then
      begin
       i:=1;
       j:=10;
       CaseH:=(' ');        CaseB:=('J5');      CaseD:=(' ');        CaseG:=('F1');
      end
    Else
    If Case1=('J2') then
      begin
       i:=2;
       j:=10;
       CaseH:=(' ');        CaseB:=('J6');      CaseD:=(' ');       CaseG:=('F2');
      end
    Else
    If Case1=('J3') then
      begin
       i:=3;
       j:=10;
       CaseH:=(' ');       CaseB:=('J7');       CaseD:=(' ');       CaseG:=('F3');
      end
    Else
    If Case1=('J4') then
      begin
       i:=4;
       j:=10;
       CaseH:=(' ');       CaseB:=('J8');       CaseD:=(' ');       CaseG:=('F4');
      end
    Else
    If Case1=('J5') then
      begin
       i:=5;
       j:=10;
       CaseH:=('J1');       CaseB:=('J9');      CaseD:=(' ');       CaseG:=('F5');
      end
    Else
    If Case1=('J6') then
      begin
       i:=6;
       j:=10;
       CaseH:=('J2');       CaseB:=('J10');     CaseD:=(' ');       CaseG:=('F6');
      end
    Else
    If Case1=('J7') then
      begin
       i:=7;
       j:=10;
       CaseH:=('J3');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('F7');
      end
    Else
    If Case1=('J8') then
      begin
       i:=8;
       j:=10;
       CaseH:=('J4');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('F8');
      end
    Else
    If Case1=('J9') then
      begin
       i:=9;
       j:=10;
       CaseH:=('J5');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('F9');
      end
    Else
    If Case1=('J10') then
      begin
       i:=10;
       j:=10;
       CaseH:=('J6');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('F10');
      end
    Else
      begin
      GoTo Restart1;
      end;
    End;
  If Boat=4 then
     Begin
    If Case1=('A1') then
      begin
        i:=1;
        j:=1;
        CaseH:=(' ');        CaseB:=('A4');        CaseD:=('D1');        CaseG:=(' ');
      end
    Else
    If Case1=('A2') then
      begin
       i:=2;
       j:=1;
       CaseH:=(' ');       CaseB:=('A5');       CaseD:=('D2');       CaseG:=(' ');
      end
    Else
    If Case1=('A3') then
      begin
       i:=3;
       j:=1;
       CaseH:=(' ');       CaseB:=('A6');       CaseD:=('D3');       CaseG:=(' ');
      end
    Else
    If Case1=('A4') then
      begin
       i:=4;
       j:=1;
       CaseH:=('A1');       CaseB:=('A7');       CaseD:=('D4');       CaseG:=(' ');
      end
    Else
    If Case1=('A5') then
      begin
       i:=5;
       j:=1;
       CaseH:=('A2');       CaseB:=('A8');      CaseD:=('D5');       CaseG:=(' ');
      end
    Else
    If Case1=('A6') then
      begin
       i:=6;
       j:=1;
       CaseH:=('A3');       CaseB:=('A9');     CaseD:=('D6');       CaseG:=(' ');
      end
    Else
    If Case1=('A7') then
      begin
       i:=7;
       j:=1;
       CaseH:=('A4');       CaseB:=('A10');       CaseD:=('D7');       CaseG:=(' ');
      end
    Else
    If Case1=('A8') then
      begin
       i:=8;
       j:=1;
       CaseH:=('A5');       CaseB:=(' ');       CaseD:=('D8');       CaseG:=(' ');
      end
    Else
    If Case1=('A9') then
      begin
       i:=9;
       j:=1;
       CaseH:=('A6');       CaseB:=(' ');       CaseD:=('D9');       CaseG:=(' ');
      end
    Else
    If Case1=('A10') then
      begin
       i:=10;
       j:=1;
       CaseH:=('A7');       CaseB:=(' ');       CaseD:=('D10');       CaseG:=(' ');
      end
    Else

    If Case1=('B1') then
      begin
       i:=1;
       j:=2;
       CaseH:=(' ');       CaseB:=('B4');       CaseD:=('E1');       CaseG:=(' ');
      end
    Else
    If Case1=('B2') then
      begin
       i:=2;
       j:=2;
       CaseH:=(' ');       CaseB:=('B5');       CaseD:=('E2');       CaseG:=(' ');
      end
    Else
    If Case1=('B3') then
      begin
       i:=3;
       j:=2;
       CaseH:=(' ');       CaseB:=('B6');       CaseD:=('E3');       CaseG:=(' ');
      end
    Else
    If Case1=('B4') then
      begin
       i:=4;
       j:=2;
       CaseH:=('B1');       CaseB:=('B7');       CaseD:=('E4');       CaseG:=(' ');
      end
    Else
    If Case1=('B5') then
      begin
       i:=5;
       j:=2;
       CaseH:=('B2');       CaseB:=('B8');       CaseD:=('E5');       CaseG:=(' ');
      end
    Else
    If Case1=('B6') then
      begin
       i:=6;
       j:=2;
       CaseH:=('B3');       CaseB:=('B9');       CaseD:=('E6');       CaseG:=(' ');
      end
    Else
    If Case1=('B7') then
      begin
       i:=7;
       j:=2;
       CaseH:=('B4');       CaseB:=('B10');       CaseD:=('E7');       CaseG:=(' ');
      end
    Else
    If Case1=('B8') then
      begin
       i:=8;
       j:=2;
       CaseH:=('B5');       CaseB:=(' ');       CaseD:=('E8');       CaseG:=(' ');
      end
    Else
    If Case1=('B9') then
      begin
       i:=9;
       j:=2;
       CaseH:=('B6');       CaseB:=(' ');       CaseD:=('E9');       CaseG:=(' ');
      end
    Else
    If Case1=('B10') then
      begin
       i:=10;
       j:=2;
       CaseH:=('B7');       CaseB:=(' ');       CaseD:=('E10');       CaseG:=(' ');
      end
    Else

    If Case1=('C1') then
      begin
        i:=1;
        j:=3;
        CaseH:=(' ');        CaseB:=('C4');        CaseD:=('F1');        CaseG:=(' ');
      end
    Else
    If Case1=('C2') then
      begin
       i:=2;
       j:=3;
       CaseH:=(' ');       CaseB:=('C5');       CaseD:=('F2');       CaseG:=(' ');
      end
    Else
    If Case1=('C3') then
      begin
       i:=3;
       j:=3;
       CaseH:=(' ');       CaseB:=('C6');       CaseD:=('F3');       CaseG:=(' ');
      end
    Else
    If Case1=('C4') then
      begin
       i:=4;
       j:=3;
       CaseH:=('C1');       CaseB:=('C7');       CaseD:=('F4');       CaseG:=(' ');
      end
    Else
    If Case1=('C5') then
      begin
       i:=5;
       j:=3;
       CaseH:=('C2');       CaseB:=('C8');       CaseD:=('F5');       CaseG:=(' ');
      end
    Else
    If Case1=('C6') then
      begin
       i:=6;
       j:=3;
       CaseH:=('C3');       CaseB:=('C9');       CaseD:=('F6');       CaseG:=(' ');
      end
    Else
    If Case1=('C7') then
      begin
       i:=7;
       j:=3;
       CaseH:=('C4');       CaseB:=('C10');       CaseD:=('F7');       CaseG:=(' ');
      end
    Else
    If Case1=('C8') then
      begin
       i:=8;
       j:=3;
       CaseH:=('C5');       CaseB:=(' ');       CaseD:=('F8');       CaseG:=(' ');
      end
    Else
    If Case1=('C9') then
      begin
       i:=9;
       j:=3;
       CaseH:=('C6');       CaseB:=(' ');       CaseD:=('F9');       CaseG:=(' ');
      end
    Else
    If Case1=('C10') then
      begin
       i:=10;
       j:=3;
       CaseH:=('C7');       CaseB:=(' ');       CaseD:=('F10');       CaseG:=(' ');
      end
    Else

    If Case1=('D1') then
      begin
       i:=1;
       j:=4;
      CaseH:=(' ');        CaseB:=('D4');        CaseD:=('G1');        CaseG:=('A1');
      end
    Else
    If Case1=('D2') then
      begin
       i:=2;
       j:=4;
       CaseH:=(' ');       CaseB:=('D5');       CaseD:=('G2');       CaseG:=('A2');
      end
    Else
    If Case1=('D3') then
      begin
       i:=3;
       j:=4;
       CaseH:=(' ');       CaseB:=('D6');       CaseD:=('G3');       CaseG:=('A3');
      end
    Else
    If Case1=('D4') then
      begin
       i:=4;
       j:=4;
       CaseH:=('D1');       CaseB:=('D7');       CaseD:=('G4');       CaseG:=('A4');
      end
    Else
    If Case1=('D5') then
      begin
       i:=5;
       j:=4;
       CaseH:=('D2');       CaseB:=('D8');       CaseD:=('G5');       CaseG:=('A5');
      end
    Else
    If Case1=('D6') then
      begin
       i:=6;
       j:=4;
       CaseH:=('D3');       CaseB:=('D9');       CaseD:=('G6');       CaseG:=('A6');
      end
    Else
    If Case1=('D7') then
      begin
       i:=7;
       j:=4;
       CaseH:=('D4');       CaseB:=('D10');       CaseD:=('G7');       CaseG:=('A7');
      end
    Else
    If Case1=('D8') then
      begin
       i:=8;
       j:=4;
       CaseH:=('D5');       CaseB:=(' ');       CaseD:=('G8');       CaseG:=('A8');
      end
    Else
    If Case1=('D9') then
      begin
       i:=9;
       j:=4;
       CaseH:=('D6');       CaseB:=(' ');       CaseD:=('G9');       CaseG:=('A9');
      end
    Else
    If Case1=('D10') then
      begin
       i:=10;
       j:=4;
       CaseH:=('D7');       CaseB:=(' ');       CaseD:=('H10');       CaseG:=('A10');
      end
    Else

    If Case1=('E1') then
      begin
       i:=1;
       j:=5;
       CaseH:=(' ');        CaseB:=('E4');      CaseD:=('H1');        CaseG:=('B1');
      end
    Else
    If Case1=('E2') then
      begin
       i:=2;
       j:=5;
       CaseH:=(' ');        CaseB:=('E5');      CaseD:=('H2');       CaseG:=('B2');
      end
    Else
    If Case1=('E3') then
      begin
       i:=3;
       j:=5;
       CaseH:=(' ');       CaseB:=('E6');       CaseD:=('H3');       CaseG:=('B3');
      end
    Else
    If Case1=('E4') then
      begin
       i:=4;
       j:=5;
       CaseH:=('E1');       CaseB:=('E7');       CaseD:=('H4');       CaseG:=('B4');
      end
    Else
    If Case1=('E5') then
      begin
       i:=5;
       j:=5;
       CaseH:=('E2');       CaseB:=('E8');       CaseD:=('H5');       CaseG:=('B5');
      end
    Else
    If Case1=('E6') then
      begin
       i:=6;
       j:=5;
       CaseH:=('E3');       CaseB:=('E9');       CaseD:=('H6');       CaseG:=('B6');
      end
    Else
    If Case1=('E7') then
      begin
       i:=7;
       j:=5;
       CaseH:=('E4');       CaseB:=(' ');       CaseD:=('H7');       CaseG:=('B7');
      end
    Else
    If Case1=('E8') then
      begin
       i:=8;
       j:=5;
       CaseH:=('E5');       CaseB:=(' ');       CaseD:=('H8');       CaseG:=('B8');
      end
    Else
    If Case1=('E9') then
      begin
       i:=9;
       j:=5;
       CaseH:=('E6');       CaseB:=(' ');       CaseD:=('H9');       CaseG:=('B9');
      end
    Else
    If Case1=('E10') then
      begin
       i:=10;
       j:=5;
       CaseH:=('E7');       CaseB:=(' ');       CaseD:=('H10');       CaseG:=('B10');
      end
    Else

    If Case1=('F1') then
      begin
       i:=1;
       j:=6;
       CaseH:=(' ');        CaseB:=('F4');      CaseD:=('I1');        CaseG:=('C1');
      end
    Else
    If Case1=('F2') then
      begin
       i:=2;
       j:=6;
       CaseH:=(' ');        CaseB:=('F5');      CaseD:=('I2');       CaseG:=('C2');
      end
    Else
    If Case1=('F3') then
      begin
       i:=3;
       j:=6;
       CaseH:=(' ');       CaseB:=('F6');       CaseD:=('I3');       CaseG:=('C3');
      end
    Else
    If Case1=('F4') then
      begin
       i:=4;
       j:=6;
       CaseH:=('F1');       CaseB:=('F7');       CaseD:=('I4');       CaseG:=('C4');
      end
    Else
    If Case1=('F5') then
      begin
       i:=5;
       j:=6;
       CaseH:=('F2');       CaseB:=('F8');       CaseD:=('I5');       CaseG:=('C5');
      end
    Else
    If Case1=('F6') then
      begin
       i:=6;
       j:=6;
       CaseH:=('F3');       CaseB:=('F9');       CaseD:=('I6');       CaseG:=('C6');
      end
    Else
    If Case1=('F7') then
      begin
       i:=7;
       j:=6;
       CaseH:=('F4');       CaseB:=('F10');       CaseD:=('I7');       CaseG:=('C7');
      end
    Else
    If Case1=('F8') then
      begin
       i:=8;
       j:=6;
       CaseH:=('F5');       CaseB:=(' ');       CaseD:=('I8');       CaseG:=('C8');
      end
    Else
    If Case1=('F9') then
      begin
       i:=9;
       j:=6;
       CaseH:=('F6');       CaseB:=(' ');       CaseD:=('I9');       CaseG:=('C9');
      end
    Else
    If Case1=('F10') then
      begin
       i:=10;
       j:=6;
       CaseH:=('F7');       CaseB:=(' ');       CaseD:=('I10');       CaseG:=('C10');
      end
    Else

    If Case1=('G1') then
      begin
       i:=1;
       j:=7;
       CaseH:=(' ');        CaseB:=('G4');      CaseD:=('J1');        CaseG:=('D1');
      end
    Else
    If Case1=('G2') then
      begin
       i:=2;
       j:=7;
       CaseH:=(' ');        CaseB:=('G5');      CaseD:=('J2');       CaseG:=('D2');
      end
    Else
    If Case1=('G3') then
      begin
       i:=3;
       j:=7;
       CaseH:=(' ');       CaseB:=('G6');       CaseD:=('J3');       CaseG:=('D3');
      end
    Else
    If Case1=('G4') then
      begin
       i:=4;
       j:=7;
       CaseH:=('G1');       CaseB:=('G7');       CaseD:=('J4');       CaseG:=('D4');
      end
    Else
    If Case1=('G5') then
      begin
       i:=5;
       j:=7;
       CaseH:=('G2');       CaseB:=('G8');       CaseD:=('J5');       CaseG:=('D5');
      end
    Else
    If Case1=('G6') then
      begin
       i:=6;
       j:=7;
       CaseH:=('G3');       CaseB:=('G9');       CaseD:=('J6');       CaseG:=('D6');
      end
    Else
    If Case1=('G7') then
      begin
       i:=7;
       j:=7;
       CaseH:=('G4');       CaseB:=('G10');       CaseD:=('J7');       CaseG:=('D7');
      end
    Else
    If Case1=('G8') then
      begin
       i:=8;
       j:=7;
       CaseH:=('G5');       CaseB:=(' ');       CaseD:=('J8');       CaseG:=('D8');
      end
    Else
    If Case1=('G9') then
      begin
       i:=9;
       j:=7;
       CaseH:=('G6');       CaseB:=(' ');       CaseD:=('J9');       CaseG:=('D9');
      end
    Else
    If Case1=('G10') then
      begin
       i:=10;
       j:=7;
       CaseH:=('G7');       CaseB:=(' ');       CaseD:=('J10');       CaseG:=('D10');
      end
    Else

    If Case1=('H1') then
      begin
       i:=1;
       j:=8;
       CaseH:=(' ');        CaseB:=('H4');      CaseD:=(' ');        CaseG:=('E1');
      end
    Else
    If Case1=('H2') then
      begin
       i:=2;
       j:=8;
       CaseH:=(' ');        CaseB:=('H5');      CaseD:=(' ');       CaseG:=('E2');
      end
    Else
    If Case1=('H3') then
      begin
       i:=3;
       j:=8;
       CaseH:=(' ');       CaseB:=('H6');       CaseD:=(' ');       CaseG:=('E3');
      end
    Else
    If Case1=('H4') then
      begin
       i:=4;
       j:=8;
       CaseH:=('H1');       CaseB:=('H7');       CaseD:=(' ');       CaseG:=('E4');
      end
    Else
    If Case1=('H5') then
      begin
       i:=5;
       j:=8;
       CaseH:=('H2');       CaseB:=('H8');       CaseD:=(' ');       CaseG:=('E5');
      end
    Else
    If Case1=('H6') then
      begin
       i:=6;
       j:=8;
       CaseH:=('H3');       CaseB:=('H9');       CaseD:=(' ');       CaseG:=('E6');
      end
    Else
    If Case1=('H7') then
      begin
       i:=7;
       j:=8;
       CaseH:=('H4');       CaseB:=('H10');       CaseD:=(' ');       CaseG:=('E7');
      end
    Else
    If Case1=('H8') then
      begin
       i:=8;
       j:=8;
       CaseH:=('H5');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('E8');
      end
    Else
    If Case1=('H9') then
      begin
       i:=9;
       j:=8;
       CaseH:=('H6');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('E9');
      end
    Else
    If Case1=('H10') then
      begin
       i:=10;
       j:=8;
       CaseH:=('H7');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('E10');
      end
    Else

    If Case1=('I1') then
      begin
       i:=1;
       j:=9;
       CaseH:=(' ');        CaseB:=('I4');      CaseD:=(' ');        CaseG:=('F1');
      end
    Else
    If Case1=('I2') then
      begin
       i:=2;
       j:=9;
       CaseH:=(' ');        CaseB:=('I5');      CaseD:=(' ');       CaseG:=('F2');
      end
    Else
    If Case1=('I3') then
      begin
       i:=3;
       j:=9;
       CaseH:=(' ');       CaseB:=('I6');       CaseD:=(' ');       CaseG:=('F3');
      end
    Else
    If Case1=('I4') then
      begin
       i:=4;
       j:=9;
       CaseH:=('I1');       CaseB:=('I7');       CaseD:=(' ');       CaseG:=('F4');
      end
    Else
    If Case1=('I5') then
      begin
       i:=5;
       j:=9;
       CaseH:=('I2');       CaseB:=('I8');      CaseD:=(' ');       CaseG:=('F5');
      end
    Else
    If Case1=('I6') then
      begin
       i:=6;
       j:=9;
       CaseH:=('I3');       CaseB:=('I9');     CaseD:=(' ');       CaseG:=('F6');
      end
    Else
    If Case1=('I7') then
      begin
       i:=7;
       j:=9;
       CaseH:=('I4');       CaseB:=('I10');       CaseD:=(' ');       CaseG:=('F7');
      end
    Else
    If Case1=('I8') then
      begin
       i:=8;
       j:=9;
       CaseH:=('I5');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('F8');
      end
    Else
    If Case1=('I9') then
      begin
       i:=9;
       j:=9;
       CaseH:=('I6');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('F9');
      end
    Else
    If Case1=('I10') then
      begin
       i:=10;
       j:=9;
       CaseH:=('I7');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('F10');
      end
    Else

    If Case1=('J1') then
      begin
       i:=1;
       j:=10;
       CaseH:=(' ');        CaseB:=('J4');      CaseD:=(' ');        CaseG:=('G1');
      end
    Else
    If Case1=('J2') then
      begin
       i:=2;
       j:=10;
       CaseH:=(' ');        CaseB:=('J5');      CaseD:=(' ');       CaseG:=('G2');
      end
    Else
    If Case1=('J3') then
      begin
       i:=3;
       j:=10;
       CaseH:=(' ');       CaseB:=('J6');       CaseD:=(' ');       CaseG:=('G3');
      end
    Else
    If Case1=('J4') then
      begin
       i:=4;
       j:=10;
       CaseH:=('J1');       CaseB:=('J7');       CaseD:=(' ');       CaseG:=('G4');
      end
    Else
    If Case1=('J5') then
      begin
       i:=5;
       j:=10;
       CaseH:=('J2');       CaseB:=('J8');      CaseD:=(' ');       CaseG:=('G5');
      end
    Else
    If Case1=('J6') then
      begin
       i:=6;
       j:=10;
       CaseH:=('J3');       CaseB:=('J9');     CaseD:=(' ');       CaseG:=('G6');
      end
    Else
    If Case1=('J7') then
      begin
       i:=7;
       j:=10;
       CaseH:=('J4');       CaseB:=('J10');       CaseD:=(' ');       CaseG:=('G7');
      end
    Else
    If Case1=('J8') then
      begin
       i:=8;
       j:=10;
       CaseH:=('J5');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('G8');
      end
    Else
    If Case1=('J9') then
      begin
       i:=9;
       j:=10;
       CaseH:=('J6');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('G9');
      end
    Else
    If Case1=('J10') then
      begin
       i:=10;
       j:=10;
       CaseH:=('J7');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('G10');
      end
    Else
      begin
      GoTo Restart1;
      end;
    End;
  If Boat=3 then
     Begin
    If Case1=('A1') then
      begin
        i:=1;
        j:=1;
        CaseH:=(' ');        CaseB:=('A3');        CaseD:=('C1');        CaseG:=(' ');
      end
    Else
    If Case1=('A2') then
      begin
       i:=2;
       j:=1;
       CaseH:=(' ');       CaseB:=('A4');       CaseD:=('C2');       CaseG:=(' ');
      end
    Else
    If Case1=('A3') then
      begin
       i:=3;
       j:=1;
       CaseH:=('A1');       CaseB:=('A5');       CaseD:=('C3');       CaseG:=(' ');
      end
    Else
    If Case1=('A4') then
      begin
       i:=4;
       j:=1;
       CaseH:=('A2');       CaseB:=('A6');       CaseD:=('C4');       CaseG:=(' ');
      end
    Else
    If Case1=('A5') then
      begin
       i:=5;
       j:=1;
       CaseH:=('A3');       CaseB:=('A7');      CaseD:=('C5');       CaseG:=(' ');
      end
    Else
    If Case1=('A6') then
      begin
       i:=6;
       j:=1;
       CaseH:=('A4');       CaseB:=('A8');     CaseD:=('C6');       CaseG:=(' ');
      end
    Else
    If Case1=('A7') then
      begin
       i:=7;
       j:=1;
       CaseH:=('A5');       CaseB:=('A9');       CaseD:=('C7');       CaseG:=(' ');
      end
    Else
    If Case1=('A8') then
      begin
       i:=8;
       j:=1;
       CaseH:=('A6');       CaseB:=('A10');       CaseD:=('C8');       CaseG:=(' ');
      end
    Else
    If Case1=('A9') then
      begin
       i:=9;
       j:=1;
       CaseH:=('A7');       CaseB:=(' ');       CaseD:=('C9');       CaseG:=(' ');
      end
    Else
    If Case1=('A10') then
      begin
       i:=10;
       j:=1;
       CaseH:=('A8');       CaseB:=(' ');       CaseD:=('C10');       CaseG:=(' ');
      end
    Else

    If Case1=('B1') then
      begin
       i:=1;
       j:=2;
       CaseH:=(' ');       CaseB:=('B3');       CaseD:=('D1');       CaseG:=(' ');
      end
    Else
    If Case1=('B2') then
      begin
       i:=2;
       j:=2;
       CaseH:=(' ');       CaseB:=('B4');       CaseD:=('D2');       CaseG:=(' ');
      end
    Else
    If Case1=('B3') then
      begin
       i:=3;
       j:=2;
       CaseH:=('B1');       CaseB:=('B5');       CaseD:=('D3');       CaseG:=(' ');
      end
    Else
    If Case1=('B4') then
      begin
       i:=4;
       j:=2;
       CaseH:=('B2');       CaseB:=('B6');       CaseD:=('D4');       CaseG:=(' ');
      end
    Else
    If Case1=('B5') then
      begin
       i:=5;
       j:=2;
       CaseH:=('B3');       CaseB:=('B7');       CaseD:=('D5');       CaseG:=(' ');
      end
    Else
    If Case1=('B6') then
      begin
       i:=6;
       j:=2;
       CaseH:=('B4');       CaseB:=('B8');       CaseD:=('D6');       CaseG:=(' ');
      end
    Else
    If Case1=('B7') then
      begin
       i:=7;
       j:=2;
       CaseH:=('B5');       CaseB:=('B9');       CaseD:=('D7');       CaseG:=(' ');
      end
    Else
    If Case1=('B8') then
      begin
       i:=8;
       j:=2;
       CaseH:=('B6');       CaseB:=('B10');       CaseD:=('D8');       CaseG:=(' ');
      end
    Else
    If Case1=('B9') then
      begin
       i:=9;
       j:=2;
       CaseH:=('B7');       CaseB:=(' ');       CaseD:=('D9');       CaseG:=(' ');
      end
    Else
    If Case1=('B10') then
      begin
       i:=10;
       j:=2;
       CaseH:=('B8');       CaseB:=(' ');       CaseD:=('D10');       CaseG:=(' ');
      end
    Else

    If Case1=('C1') then
      begin
        i:=1;
        j:=3;
        CaseH:=(' ');        CaseB:=('C3');        CaseD:=('E1');        CaseG:=('A1');
      end
    Else
    If Case1=('C2') then
      begin
       i:=2;
       j:=3;
       CaseH:=(' ');       CaseB:=('C4');       CaseD:=('E2');       CaseG:=('A2');
      end
    Else
    If Case1=('C3') then
      begin
       i:=3;
       j:=3;
       CaseH:=('C1');       CaseB:=('C5');       CaseD:=('E3');       CaseG:=('A3');
      end
    Else
    If Case1=('C4') then
      begin
       i:=4;
       j:=3;
       CaseH:=('C2');       CaseB:=('C6');       CaseD:=('E4');       CaseG:=('A4');
      end
    Else
    If Case1=('C5') then
      begin
       i:=5;
       j:=3;
       CaseH:=('C3');       CaseB:=('C7');       CaseD:=('E5');       CaseG:=('A5');
      end
    Else
    If Case1=('C6') then
      begin
       i:=6;
       j:=3;
       CaseH:=('C4');       CaseB:=('C8');       CaseD:=('E6');       CaseG:=('A6');
      end
    Else
    If Case1=('C7') then
      begin
       i:=7;
       j:=3;
       CaseH:=('C5');       CaseB:=('C9');       CaseD:=('E7');       CaseG:=('A7');
      end
    Else
    If Case1=('C8') then
      begin
       i:=8;
       j:=3;
       CaseH:=('C6');       CaseB:=('C10');       CaseD:=('E8');       CaseG:=('A8');
      end
    Else
    If Case1=('C9') then
      begin
       i:=9;
       j:=3;
       CaseH:=('C7');       CaseB:=(' ');       CaseD:=('E9');       CaseG:=('A9');
      end
    Else
    If Case1=('C10') then
      begin
       i:=10;
       j:=3;
       CaseH:=('C8');       CaseB:=(' ');       CaseD:=('E10');       CaseG:=('A10');
      end
    Else

    If Case1=('D1') then
      begin
       i:=1;
       j:=4;
      CaseH:=(' ');        CaseB:=('D3');        CaseD:=('F1');        CaseG:=('B1');
      end
    Else
    If Case1=('D2') then
      begin
       i:=2;
       j:=4;
       CaseH:=(' ');       CaseB:=('D4');       CaseD:=('F2');       CaseG:=('B2');
      end
    Else
    If Case1=('D3') then
      begin
       i:=3;
       j:=4;
       CaseH:=('D1');       CaseB:=('D5');       CaseD:=('F3');       CaseG:=('B3');
      end
    Else
    If Case1=('D4') then
      begin
       i:=4;
       j:=4;
       CaseH:=('D2');       CaseB:=('D6');       CaseD:=('F4');       CaseG:=('B4');
      end
    Else
    If Case1=('D5') then
      begin
       i:=5;
       j:=4;
       CaseH:=('D3');       CaseB:=('D7');       CaseD:=('F5');       CaseG:=('B5');
      end
    Else
    If Case1=('D6') then
      begin
       i:=6;
       j:=4;
       CaseH:=('D4');       CaseB:=('D8');       CaseD:=('F6');       CaseG:=('B6');
      end
    Else
    If Case1=('D7') then
      begin
       i:=7;
       j:=4;
       CaseH:=('D5');       CaseB:=('D9');       CaseD:=('F7');       CaseG:=('B7');
      end
    Else
    If Case1=('D8') then
      begin
       i:=8;
       j:=4;
       CaseH:=('D6');       CaseB:=('D10');       CaseD:=('F8');       CaseG:=('B8');
      end
    Else
    If Case1=('D9') then
      begin
       i:=9;
       j:=4;
       CaseH:=('D7');       CaseB:=(' ');       CaseD:=('F9');       CaseG:=('B9');
      end
    Else
    If Case1=('D10') then
      begin
       i:=10;
       j:=4;
       CaseH:=('D8');       CaseB:=(' ');       CaseD:=('F10');       CaseG:=('B10');
      end
    Else

    If Case1=('E1') then
      begin
       i:=1;
       j:=5;
       CaseH:=(' ');        CaseB:=('E3');      CaseD:=('G1');        CaseG:=('C1');
      end
    Else
    If Case1=('E2') then
      begin
       i:=2;
       j:=5;
       CaseH:=(' ');        CaseB:=('E4');      CaseD:=('G2');       CaseG:=('C2');
      end
    Else
    If Case1=('E3') then
      begin
       i:=3;
       j:=5;
       CaseH:=('E1');       CaseB:=('E5');       CaseD:=('G3');       CaseG:=('C3');
      end
    Else
    If Case1=('E4') then
      begin
       i:=4;
       j:=5;
       CaseH:=('E2');       CaseB:=('E6');       CaseD:=('G4');       CaseG:=('C4');
      end
    Else
    If Case1=('E5') then
      begin
       i:=5;
       j:=5;
       CaseH:=('E3');       CaseB:=('E7');       CaseD:=('G5');       CaseG:=('C5');
      end
    Else
    If Case1=('E6') then
      begin
       i:=6;
       j:=5;
       CaseH:=('E4');       CaseB:=('E8');       CaseD:=('G6');       CaseG:=('C6');
      end
    Else
    If Case1=('E7') then
      begin
       i:=7;
       j:=5;
       CaseH:=('E5');       CaseB:=('E9');       CaseD:=('G7');       CaseG:=('C7');
      end
    Else
    If Case1=('E8') then
      begin
       i:=8;
       j:=5;
       CaseH:=('E6');       CaseB:=('E10');       CaseD:=('G8');       CaseG:=('C8');
      end
    Else
    If Case1=('E9') then
      begin
       i:=9;
       j:=5;
       CaseH:=('E7');       CaseB:=(' ');       CaseD:=('G9');       CaseG:=('C9');
      end
    Else
    If Case1=('E10') then
      begin
       i:=10;
       j:=5;
       CaseH:=('E8');       CaseB:=(' ');       CaseD:=('G10');       CaseG:=('C10');
      end
    Else

    If Case1=('F1') then
      begin
       i:=1;
       j:=6;
       CaseH:=(' ');        CaseB:=('F3');      CaseD:=('H1');        CaseG:=('D1');
      end
    Else
    If Case1=('F2') then
      begin
       i:=2;
       j:=6;
       CaseH:=(' ');        CaseB:=('F4');      CaseD:=('H2');       CaseG:=('D2');
      end
    Else
    If Case1=('F3') then
      begin
       i:=3;
       j:=6;
       CaseH:=('F1');       CaseB:=('F5');       CaseD:=('H3');       CaseG:=('D3');
      end
    Else
    If Case1=('F4') then
      begin
       i:=4;
       j:=6;
       CaseH:=('F2');       CaseB:=('F6');       CaseD:=('H4');       CaseG:=('D4');
      end
    Else
    If Case1=('F5') then
      begin
       i:=5;
       j:=6;
       CaseH:=('F3');       CaseB:=('F7');       CaseD:=('H5');       CaseG:=('D5');
      end
    Else
    If Case1=('F6') then
      begin
       i:=6;
       j:=6;
       CaseH:=('F4');       CaseB:=('F8');       CaseD:=('H6');       CaseG:=('D6');
      end
    Else
    If Case1=('F7') then
      begin
       i:=7;
       j:=6;
       CaseH:=('F5');       CaseB:=('F9');       CaseD:=('H7');       CaseG:=('D7');
      end
    Else
    If Case1=('F8') then
      begin
       i:=8;
       j:=6;
       CaseH:=('F6');       CaseB:=('F10');       CaseD:=('H8');       CaseG:=('D8');
      end
    Else
    If Case1=('F9') then
      begin
       i:=9;
       j:=6;
       CaseH:=('F7');       CaseB:=(' ');       CaseD:=('H9');       CaseG:=('D9');
      end
    Else
    If Case1=('F10') then
      begin
       i:=10;
       j:=6;
       CaseH:=('F8');       CaseB:=(' ');       CaseD:=('H10');       CaseG:=('D10');
      end
    Else

    If Case1=('G1') then
      begin
       i:=1;
       j:=7;
       CaseH:=(' ');        CaseB:=('G3');      CaseD:=('I1');        CaseG:=('E1');
      end
    Else
    If Case1=('G2') then
      begin
       i:=2;
       j:=7;
       CaseH:=(' ');        CaseB:=('G4');      CaseD:=('I2');       CaseG:=('E2');
      end
    Else
    If Case1=('G3') then
      begin
       i:=3;
       j:=7;
       CaseH:=('G1');       CaseB:=('G5');       CaseD:=('I3');       CaseG:=('E3');
      end
    Else
    If Case1=('G4') then
      begin
       i:=4;
       j:=7;
       CaseH:=('G2');       CaseB:=('G6');       CaseD:=('I4');       CaseG:=('E4');
      end
    Else
    If Case1=('G5') then
      begin
       i:=5;
       j:=7;
       CaseH:=('G3');       CaseB:=('G7');       CaseD:=('I5');       CaseG:=('E5');
      end
    Else
    If Case1=('G6') then
      begin
       i:=6;
       j:=7;
       CaseH:=('G4');       CaseB:=('G8');       CaseD:=('I6');       CaseG:=('E6');
      end
    Else
    If Case1=('G7') then
      begin
       i:=7;
       j:=7;
       CaseH:=('G5');       CaseB:=('G9');       CaseD:=('I7');       CaseG:=('E7');
      end
    Else
    If Case1=('G8') then
      begin
       i:=8;
       j:=7;
       CaseH:=('G6');       CaseB:=('G10');       CaseD:=('I8');       CaseG:=('E8');
      end
    Else
    If Case1=('G9') then
      begin
       i:=9;
       j:=7;
       CaseH:=('G7');       CaseB:=(' ');       CaseD:=('I9');       CaseG:=('E9');
      end
    Else
    If Case1=('G10') then
      begin
       i:=10;
       j:=7;
       CaseH:=('G8');       CaseB:=(' ');       CaseD:=('I10');       CaseG:=('E10');
      end
    Else

    If Case1=('H1') then
      begin
       i:=1;
       j:=8;
       CaseH:=(' ');        CaseB:=('H3');      CaseD:=('J1');        CaseG:=('F1');
      end
    Else
    If Case1=('H2') then
      begin
       i:=2;
       j:=8;
       CaseH:=(' ');        CaseB:=('H4');      CaseD:=('J2');       CaseG:=('F2');
      end
    Else
    If Case1=('H3') then
      begin
       i:=3;
       j:=8;
       CaseH:=('H1');       CaseB:=('H5');       CaseD:=('J3');       CaseG:=('F3');
      end
    Else
    If Case1=('H4') then
      begin
       i:=4;
       j:=8;
       CaseH:=('H2');       CaseB:=('H6');       CaseD:=('J4');       CaseG:=('F4');
      end
    Else
    If Case1=('H5') then
      begin
       i:=5;
       j:=8;
       CaseH:=('H3');       CaseB:=('H7');       CaseD:=('J5');       CaseG:=('F5');
      end
    Else
    If Case1=('H6') then
      begin
       i:=6;
       j:=8;
       CaseH:=('H4');       CaseB:=('H8');       CaseD:=('J6');       CaseG:=('F6');
      end
    Else
    If Case1=('H7') then
      begin
       i:=7;
       j:=8;
       CaseH:=('H5');       CaseB:=('H9');       CaseD:=('J7');       CaseG:=('F7');
      end
    Else
    If Case1=('H8') then
      begin
       i:=8;
       j:=8;
       CaseH:=('H6');       CaseB:=('H10');       CaseD:=('J8');       CaseG:=('F8');
      end
    Else
    If Case1=('H9') then
      begin
       i:=9;
       j:=8;
       CaseH:=('H7');       CaseB:=(' ');       CaseD:=('J9');       CaseG:=('F9');
      end
    Else
    If Case1=('H10') then
      begin
       i:=10;
       j:=8;
       CaseH:=('H8');       CaseB:=(' ');       CaseD:=('J10');       CaseG:=('F10');
      end
    Else

    If Case1=('I1') then
      begin
       i:=1;
       j:=9;
       CaseH:=(' ');        CaseB:=('I3');      CaseD:=(' ');        CaseG:=('G1');
      end
    Else
    If Case1=('I2') then
      begin
       i:=2;
       j:=9;
       CaseH:=(' ');        CaseB:=('I4');      CaseD:=(' ');       CaseG:=('G2');
      end
    Else
    If Case1=('I3') then
      begin
       i:=3;
       j:=9;
       CaseH:=('I1');       CaseB:=('I5');       CaseD:=(' ');       CaseG:=('G3');
      end
    Else
    If Case1=('I4') then
      begin
       i:=4;
       j:=9;
       CaseH:=('I2');       CaseB:=('I6');       CaseD:=(' ');       CaseG:=('G4');
      end
    Else
    If Case1=('I5') then
      begin
       i:=5;
       j:=9;
       CaseH:=('I3');       CaseB:=('I7');      CaseD:=(' ');       CaseG:=('G5');
      end
    Else
    If Case1=('I6') then
      begin
       i:=6;
       j:=9;
       CaseH:=('I4');       CaseB:=('I8');     CaseD:=(' ');       CaseG:=('G6');
      end
    Else
    If Case1=('I7') then
      begin
       i:=7;
       j:=9;
       CaseH:=('I5');       CaseB:=('I9');       CaseD:=(' ');       CaseG:=('G7');
      end
    Else
    If Case1=('I8') then
      begin
       i:=8;
       j:=9;
       CaseH:=('I6');       CaseB:=('I10');       CaseD:=(' ');       CaseG:=('G8');
      end
    Else
    If Case1=('I9') then
      begin
       i:=9;
       j:=9;
       CaseH:=('I7');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('G9');
      end
    Else
    If Case1=('I10') then
      begin
       i:=10;
       j:=9;
       CaseH:=('I8');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('G10');
      end
    Else

    If Case1=('J1') then
      begin
       i:=1;
       j:=10;
       CaseH:=(' ');        CaseB:=('J3');      CaseD:=(' ');        CaseG:=('H1');
      end
    Else
    If Case1=('J2') then
      begin
       i:=2;
       j:=10;
       CaseH:=(' ');        CaseB:=('J4');      CaseD:=(' ');       CaseG:=('H2');
      end
    Else
    If Case1=('J3') then
      begin
       i:=3;
       j:=10;
       CaseH:=('J1');       CaseB:=('J5');       CaseD:=(' ');       CaseG:=('H3');
      end
    Else
    If Case1=('J4') then
      begin
       i:=4;
       j:=10;
       CaseH:=('J2');       CaseB:=('J6');       CaseD:=(' ');       CaseG:=('H4');
      end
    Else
    If Case1=('J5') then
      begin
       i:=5;
       j:=10;
       CaseH:=('J3');       CaseB:=('J7');      CaseD:=(' ');       CaseG:=('H5');
      end
    Else
    If Case1=('J6') then
      begin
       i:=6;
       j:=10;
       CaseH:=('J4');       CaseB:=('J8');     CaseD:=(' ');       CaseG:=('H6');
      end
    Else
    If Case1=('J7') then
      begin
       i:=7;
       j:=10;
       CaseH:=('J5');       CaseB:=('J9');       CaseD:=(' ');       CaseG:=('H7');
      end
    Else
    If Case1=('J8') then
      begin
       i:=8;
       j:=10;
       CaseH:=('J6');       CaseB:=('J10');       CaseD:=(' ');       CaseG:=('H8');
      end
    Else
    If Case1=('J9') then
      begin
       i:=9;
       j:=10;
       CaseH:=('J7');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('H9');
      end
    Else
    If Case1=('J10') then
      begin
       i:=10;
       j:=10;
       CaseH:=('J8');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('H10');
      end
    Else
      begin
      GoTo Restart1;
      end;
    End;
  If Boat=2 then
     Begin
    If Case1=('A1') then
      begin
        i:=1;
        j:=1;
        CaseH:=(' ');        CaseB:=('A2');        CaseD:=('B1');        CaseG:=(' ');
      end
    Else
    If Case1=('A2') then
      begin
       i:=2;
       j:=1;
       CaseH:=('A1');       CaseB:=('A3');       CaseD:=('B2');       CaseG:=(' ');
      end
    Else
    If Case1=('A3') then
      begin
       i:=3;
       j:=1;
       CaseH:=('A2');       CaseB:=('A4');       CaseD:=('B3');       CaseG:=(' ');
      end
    Else
    If Case1=('A4') then
      begin
       i:=4;
       j:=1;
       CaseH:=('A3');       CaseB:=('A5');       CaseD:=('B4');       CaseG:=(' ');
      end
    Else
    If Case1=('A5') then
      begin
       i:=5;
       j:=1;
       CaseH:=('A4');       CaseB:=('A6');      CaseD:=('B5');       CaseG:=(' ');
      end
    Else
    If Case1=('A6') then
      begin
       i:=6;
       j:=1;
       CaseH:=('A5');       CaseB:=('A7');     CaseD:=('B6');       CaseG:=(' ');
      end
    Else
    If Case1=('A7') then
      begin
       i:=7;
       j:=1;
       CaseH:=('A6');       CaseB:=('A8');       CaseD:=('B7');       CaseG:=(' ');
      end
    Else
    If Case1=('A8') then
      begin
       i:=8;
       j:=1;
       CaseH:=('A7');       CaseB:=('A9');       CaseD:=('B8');       CaseG:=(' ');
      end
    Else
    If Case1=('A9') then
      begin
       i:=9;
       j:=1;
       CaseH:=('A8');       CaseB:=('A10');       CaseD:=('B9');       CaseG:=(' ');
      end
    Else
    If Case1=('A10') then
      begin
       i:=10;
       j:=1;
       CaseH:=('A9');       CaseB:=(' ');       CaseD:=('B10');       CaseG:=(' ');
      end
    Else

    If Case1=('B1') then
      begin
       i:=1;
       j:=2;
       CaseH:=(' ');       CaseB:=('B2');       CaseD:=('C1');       CaseG:=('A1');
      end
    Else
    If Case1=('B2') then
      begin
       i:=2;
       j:=2;
       CaseH:=('B1');       CaseB:=('B3');       CaseD:=('C2');       CaseG:=('A2');
      end
    Else
    If Case1=('B3') then
      begin
       i:=3;
       j:=2;
       CaseH:=('B2');       CaseB:=('B4');       CaseD:=('C3');       CaseG:=('A3');
      end
    Else
    If Case1=('B4') then
      begin
       i:=4;
       j:=2;
       CaseH:=('B3');       CaseB:=('B5');       CaseD:=('C4');       CaseG:=('A4');
      end
    Else
    If Case1=('B5') then
      begin
       i:=5;
       j:=2;
       CaseH:=('B4');       CaseB:=('B6');       CaseD:=('C5');       CaseG:=('A5');
      end
    Else
    If Case1=('B6') then
      begin
       i:=6;
       j:=2;
       CaseH:=('B5');       CaseB:=('B7');       CaseD:=('C6');       CaseG:=('A6');
      end
    Else
    If Case1=('B7') then
      begin
       i:=7;
       j:=2;
       CaseH:=('B6');       CaseB:=('B8');       CaseD:=('C7');       CaseG:=('A7');
      end
    Else
    If Case1=('B8') then
      begin
       i:=8;
       j:=2;
       CaseH:=('B7');       CaseB:=('B9');       CaseD:=('C8');       CaseG:=('A8');
      end
    Else
    If Case1=('B9') then
      begin
       i:=9;
       j:=2;
       CaseH:=('B8');       CaseB:=('B10');       CaseD:=('C9');       CaseG:=('A9');
      end
    Else
    If Case1=('B10') then
      begin
       i:=10;
       j:=2;
       CaseH:=('B9');       CaseB:=(' ');       CaseD:=('C10');       CaseG:=('A10');
      end
    Else

    If Case1=('C1') then
      begin
        i:=1;
        j:=3;
        CaseH:=(' ');        CaseB:=('C2');        CaseD:=('D1');        CaseG:=('B1');
      end
    Else
    If Case1=('C2') then
      begin
       i:=2;
       j:=3;
       CaseH:=('C1');       CaseB:=('C3');       CaseD:=('D2');       CaseG:=('B2');
      end
    Else
    If Case1=('C3') then
      begin
       i:=3;
       j:=3;
       CaseH:=('C2');       CaseB:=('C4');       CaseD:=('D3');       CaseG:=('B3');
      end
    Else
    If Case1=('C4') then
      begin
       i:=4;
       j:=3;
       CaseH:=('C3');       CaseB:=('C5');       CaseD:=('D4');       CaseG:=('B4');
      end
    Else
    If Case1=('C5') then
      begin
       i:=5;
       j:=3;
       CaseH:=('C4');       CaseB:=('C6');       CaseD:=('D5');       CaseG:=('B5');
      end
    Else
    If Case1=('C6') then
      begin
       i:=6;
       j:=3;
       CaseH:=('C5');       CaseB:=('C7');       CaseD:=('D6');       CaseG:=('B6');
      end
    Else
    If Case1=('C7') then
      begin
       i:=7;
       j:=3;
       CaseH:=('C6');       CaseB:=('C8');       CaseD:=('D7');       CaseG:=('B7');
      end
    Else
    If Case1=('C8') then
      begin
       i:=8;
       j:=3;
       CaseH:=('C7');       CaseB:=('C9');       CaseD:=('D8');       CaseG:=('B8');
      end
    Else
    If Case1=('C9') then
      begin
       i:=9;
       j:=3;
       CaseH:=('C8');       CaseB:=('C10');       CaseD:=('D9');       CaseG:=('B9');
      end
    Else
    If Case1=('C10') then
      begin
       i:=10;
       j:=3;
       CaseH:=('C9');       CaseB:=(' ');       CaseD:=('D10');       CaseG:=('B10');
      end
    Else

    If Case1=('D1') then
      begin
       i:=1;
       j:=4;
      CaseH:=(' ');        CaseB:=('D2');        CaseD:=('E1');        CaseG:=('C1');
      end
    Else
    If Case1=('D2') then
      begin
       i:=2;
       j:=4;
       CaseH:=('D1');       CaseB:=('D3');       CaseD:=('E2');       CaseG:=('C2');
      end
    Else
    If Case1=('D3') then
      begin
       i:=3;
       j:=4;
       CaseH:=('D2');       CaseB:=('D4');       CaseD:=('E3');       CaseG:=('C3');
      end
    Else
    If Case1=('D4') then
      begin
       i:=4;
       j:=4;
       CaseH:=('D3');       CaseB:=('D5');       CaseD:=('E4');       CaseG:=('C4');
      end
    Else
    If Case1=('D5') then
      begin
       i:=5;
       j:=4;
       CaseH:=('D4');       CaseB:=('D6');       CaseD:=('E5');       CaseG:=('C5');
      end
    Else
    If Case1=('D6') then
      begin
       i:=6;
       j:=4;
       CaseH:=('D5');       CaseB:=('D7');       CaseD:=('E6');       CaseG:=('C6');
      end
    Else
    If Case1=('D7') then
      begin
       i:=7;
       j:=4;
       CaseH:=('D6');       CaseB:=('D8');       CaseD:=('E7');       CaseG:=('C7');
      end
    Else
    If Case1=('D8') then
      begin
       i:=8;
       j:=4;
       CaseH:=('D7');       CaseB:=('D9');       CaseD:=('E8');       CaseG:=('C8');
      end
    Else
    If Case1=('D9') then
      begin
       i:=9;
       j:=4;
       CaseH:=('D8');       CaseB:=('D10');       CaseD:=('E9');       CaseG:=('C9');
      end
    Else
    If Case1=('D10') then
      begin
       i:=10;
       j:=4;
       CaseH:=('D9');       CaseB:=(' ');       CaseD:=('E10');       CaseG:=('C10');
      end
    Else

    If Case1=('E1') then
      begin
       i:=1;
       j:=5;
       CaseH:=(' ');        CaseB:=('E2');      CaseD:=('F1');        CaseG:=('D1');
      end
    Else
    If Case1=('E2') then
      begin
       i:=2;
       j:=5;
       CaseH:=('E1');        CaseB:=('E3');      CaseD:=('F2');       CaseG:=('D2');
      end
    Else
    If Case1=('E3') then
      begin
       i:=3;
       j:=5;
       CaseH:=('E2');       CaseB:=('E4');       CaseD:=('F3');       CaseG:=('D3');
      end
    Else
    If Case1=('E4') then
      begin
       i:=4;
       j:=5;
       CaseH:=('E3');       CaseB:=('E5');       CaseD:=('F4');       CaseG:=('D4');
      end
    Else
    If Case1=('E5') then
      begin
       i:=5;
       j:=5;
       CaseH:=('E4');       CaseB:=('E6');       CaseD:=('F5');       CaseG:=('D5');
      end
    Else
    If Case1=('E6') then
      begin
       i:=6;
       j:=5;
       CaseH:=('E5');       CaseB:=('E7');       CaseD:=('F6');       CaseG:=('D6');
      end
    Else
    If Case1=('E7') then
      begin
       i:=7;
       j:=5;
       CaseH:=('E6');       CaseB:=('E8');       CaseD:=('F7');       CaseG:=('D7');
      end
    Else
    If Case1=('E8') then
      begin
       i:=8;
       j:=5;
       CaseH:=('E7');       CaseB:=('E9');       CaseD:=('F8');       CaseG:=('D8');
      end
    Else
    If Case1=('E9') then
      begin
       i:=9;
       j:=5;
       CaseH:=('E8');       CaseB:=('E10');       CaseD:=('F9');       CaseG:=('D9');
      end
    Else
    If Case1=('E10') then
      begin
       i:=10;
       j:=5;
       CaseH:=('E9');       CaseB:=(' ');       CaseD:=('F10');       CaseG:=('D10');
      end
    Else

    If Case1=('F1') then
      begin
       i:=1;
       j:=6;
       CaseH:=(' ');        CaseB:=('F2');      CaseD:=('G1');        CaseG:=('E1');
      end
    Else
    If Case1=('F2') then
      begin
       i:=2;
       j:=6;
       CaseH:=('F1');        CaseB:=('F3');      CaseD:=('G2');       CaseG:=('E2');
      end
    Else
    If Case1=('F3') then
      begin
       i:=3;
       j:=6;
       CaseH:=('F2');       CaseB:=('F4');       CaseD:=('G3');       CaseG:=('E3');
      end
    Else
    If Case1=('F4') then
      begin
       i:=4;
       j:=6;
       CaseH:=('F3');       CaseB:=('F5');       CaseD:=('G4');       CaseG:=('E4');
      end
    Else
    If Case1=('F5') then
      begin
       i:=5;
       j:=6;
       CaseH:=('F4');       CaseB:=('F6');       CaseD:=('G5');       CaseG:=('E5');
      end
    Else
    If Case1=('F6') then
      begin
       i:=6;
       j:=6;
       CaseH:=('F5');       CaseB:=('F7');       CaseD:=('G6');       CaseG:=('E6');
      end
    Else
    If Case1=('F7') then
      begin
       i:=7;
       j:=6;
       CaseH:=('F6');       CaseB:=('F8');       CaseD:=('G7');       CaseG:=('E7');
      end
    Else
    If Case1=('F8') then
      begin
       i:=8;
       j:=6;
       CaseH:=('F7');       CaseB:=('F9');       CaseD:=('G8');       CaseG:=('E8');
      end
    Else
    If Case1=('F9') then
      begin
       i:=9;
       j:=6;
       CaseH:=('F8');       CaseB:=('F10');       CaseD:=('G9');       CaseG:=('E9');
      end
    Else
    If Case1=('F10') then
      begin
       i:=10;
       j:=6;
       CaseH:=('F9');       CaseB:=(' ');       CaseD:=('G10');       CaseG:=('E10');
      end
    Else

    If Case1=('G1') then
      begin
       i:=1;
       j:=7;
       CaseH:=(' ');        CaseB:=('G2');      CaseD:=('H1');        CaseG:=('F1');
      end
    Else
    If Case1=('G2') then
      begin
       i:=2;
       j:=7;
       CaseH:=('G1');        CaseB:=('G3');      CaseD:=('H2');       CaseG:=('F2');
      end
    Else
    If Case1=('G3') then
      begin
       i:=3;
       j:=7;
       CaseH:=('G2');       CaseB:=('G4');       CaseD:=('H3');       CaseG:=('F3');
      end
    Else
    If Case1=('G4') then
      begin
       i:=4;
       j:=7;
       CaseH:=('G3');       CaseB:=('G5');       CaseD:=('H4');       CaseG:=('F4');
      end
    Else
    If Case1=('G5') then
      begin
       i:=5;
       j:=7;
       CaseH:=('G4');       CaseB:=('G6');       CaseD:=('H5');       CaseG:=('F5');
      end
    Else
    If Case1=('G6') then
      begin
       i:=6;
       j:=7;
       CaseH:=('G5');       CaseB:=('G7');       CaseD:=('H6');       CaseG:=('F6');
      end
    Else
    If Case1=('G7') then
      begin
       i:=7;
       j:=7;
       CaseH:=('G6');       CaseB:=('G8');       CaseD:=('H7');       CaseG:=('F7');
      end
    Else
    If Case1=('G8') then
      begin
       i:=8;
       j:=7;
       CaseH:=('G7');       CaseB:=('G9');       CaseD:=('H8');       CaseG:=('F8');
      end
    Else
    If Case1=('G9') then
      begin
       i:=9;
       j:=7;
       CaseH:=('G8');       CaseB:=('G10');       CaseD:=('H9');       CaseG:=('F9');
      end
    Else
    If Case1=('G10') then
      begin
       i:=10;
       j:=7;
       CaseH:=('G9');       CaseB:=(' ');       CaseD:=('H10');       CaseG:=('F10');
      end
    Else

    If Case1=('H1') then
      begin
       i:=1;
       j:=8;
       CaseH:=(' ');        CaseB:=('H2');      CaseD:=('I1');        CaseG:=('G1');
      end
    Else
    If Case1=('H2') then
      begin
       i:=2;
       j:=8;
       CaseH:=('H1');        CaseB:=('H3');      CaseD:=('I2');       CaseG:=('G2');
      end
    Else
    If Case1=('H3') then
      begin
       i:=3;
       j:=8;
       CaseH:=('H2');       CaseB:=('H4');       CaseD:=('I3');       CaseG:=('G3');
      end
    Else
    If Case1=('H4') then
      begin
       i:=4;
       j:=8;
       CaseH:=('H3');       CaseB:=('H5');       CaseD:=('I4');       CaseG:=('G4');
      end
    Else
    If Case1=('H5') then
      begin
       i:=5;
       j:=8;
       CaseH:=('H4');       CaseB:=('H6');       CaseD:=('I5');       CaseG:=('G5');
      end
    Else
    If Case1=('H6') then
      begin
       i:=6;
       j:=8;
       CaseH:=('H5');       CaseB:=('H7');       CaseD:=('I6');       CaseG:=('G6');
      end
    Else
    If Case1=('H7') then
      begin
       i:=7;
       j:=8;
       CaseH:=('H6');       CaseB:=('H8');       CaseD:=('I7');       CaseG:=('G7');
      end
    Else
    If Case1=('H8') then
      begin
       i:=8;
       j:=8;
       CaseH:=('H7');       CaseB:=('H9');       CaseD:=('I8');       CaseG:=('G8');
      end
    Else
    If Case1=('H9') then
      begin
       i:=9;
       j:=8;
       CaseH:=('H8');       CaseB:=('H10');       CaseD:=('I9');       CaseG:=('G9');
      end
    Else
    If Case1=('H10') then
      begin
       i:=10;
       j:=8;
       CaseH:=('H9');       CaseB:=(' ');       CaseD:=('I10');       CaseG:=('G10');
      end
    Else

    If Case1=('I1') then
      begin
       i:=1;
       j:=9;
       CaseH:=(' ');        CaseB:=('I2');      CaseD:=('J1');        CaseG:=('H1');
      end
    Else
    If Case1=('I2') then
      begin
       i:=2;
       j:=9;
       CaseH:=('I1');        CaseB:=('I3');      CaseD:=('J2');       CaseG:=('H2');
      end
    Else
    If Case1=('I3') then
      begin
       i:=3;
       j:=9;
       CaseH:=('I2');       CaseB:=('I4');       CaseD:=('J3');       CaseG:=('H3');
      end
    Else
    If Case1=('I4') then
      begin
       i:=4;
       j:=9;
       CaseH:=('I3');       CaseB:=('I5');       CaseD:=('J4');       CaseG:=('H4');
      end
    Else
    If Case1=('I5') then
      begin
       i:=5;
       j:=9;
       CaseH:=('I4');       CaseB:=('I6');      CaseD:=('J5');       CaseG:=('H5');
      end
    Else
    If Case1=('I6') then
      begin
       i:=6;
       j:=9;
       CaseH:=('I5');       CaseB:=('I7');     CaseD:=('J6');       CaseG:=('H6');
      end
    Else
    If Case1=('I7') then
      begin
       i:=7;
       j:=9;
       CaseH:=('I6');       CaseB:=('I8');       CaseD:=('J7');       CaseG:=('H7');
      end
    Else
    If Case1=('I8') then
      begin
       i:=8;
       j:=9;
       CaseH:=('I7');       CaseB:=('I9');       CaseD:=('J8');       CaseG:=('H8');
      end
    Else
    If Case1=('I9') then
      begin
       i:=9;
       j:=9;
       CaseH:=('I8');       CaseB:=('I10');       CaseD:=('J9');       CaseG:=('H9');
      end
    Else
    If Case1=('I10') then
      begin
       i:=10;
       j:=9;
       CaseH:=('I9');       CaseB:=(' ');       CaseD:=('J10');       CaseG:=('H10');
      end
    Else

    If Case1=('J1') then
      begin
       i:=1;
       j:=10;
       CaseH:=(' ');        CaseB:=('J2');      CaseD:=(' ');        CaseG:=('I1');
      end
    Else
    If Case1=('J2') then
      begin
       i:=2;
       j:=10;
       CaseH:=('J1');        CaseB:=('J3');      CaseD:=(' ');       CaseG:=('I2');
      end
    Else
    If Case1=('J3') then
      begin
       i:=3;
       j:=10;
       CaseH:=('J2');       CaseB:=('J4');       CaseD:=(' ');       CaseG:=('I3');
      end
    Else
    If Case1=('J4') then
      begin
       i:=4;
       j:=10;
       CaseH:=('J3');       CaseB:=('J5');       CaseD:=(' ');       CaseG:=('I4');
      end
    Else
    If Case1=('J5') then
      begin
       i:=5;
       j:=10;
       CaseH:=('J4');       CaseB:=('J6');      CaseD:=(' ');       CaseG:=('I5');
      end
    Else
    If Case1=('J6') then
      begin
       i:=6;
       j:=10;
       CaseH:=('J5');       CaseB:=('J7');     CaseD:=(' ');       CaseG:=('I6');
      end
    Else
    If Case1=('J7') then
      begin
       i:=7;
       j:=10;
       CaseH:=('J6');       CaseB:=('J8');       CaseD:=(' ');       CaseG:=('I7');
      end
    Else
    If Case1=('J8') then
      begin
       i:=8;
       j:=10;
       CaseH:=('J7');       CaseB:=('J9');       CaseD:=(' ');       CaseG:=('I8');
      end
    Else
    If Case1=('J9') then
      begin
       i:=9;
       j:=10;
       CaseH:=('J8');       CaseB:=('J10');       CaseD:=(' ');       CaseG:=('I9');
      end
    Else
    If Case1=('J10') then
      begin
       i:=10;
       j:=10;
       CaseH:=('J9');       CaseB:=(' ');       CaseD:=(' ');       CaseG:=('I10');
      end
    Else
      begin
      GoTo Restart1;
      end;
    End;

    If TJ[i,j]=(' ') then
      begin
        i2:=i+1;
        For t:=2 to  Boat do
         begin
          If TJ[i2,j]=(' ') then
          begin
           i2:=i2+1;
           If t=Boat then
            begin
             Choix1:=CaseB;
            end;
          end;
         end;
        j2:=j+1;
        For t:=2 to  Boat do
         begin
          If TJ[i,j2]=(' ') then
          begin
           j2:=j2+1;
           If t=Boat then
            begin
             Choix2:=CaseD;
            end;
          end;
         end;
        i2:=i-1;
        For t:=2 to  Boat do
         begin
          If TJ[i2,j]=(' ') then
          begin
           i2:=i2-1;
           If t=Boat then
            begin
             Choix3:=CaseH;
             end;
          end;
         end;
        j2:=j-1;
        For t:=2 to  Boat do
         begin
          If TJ[i,j2]=(' ') then
          begin
           j2:=j2-1;
           If t=Boat then
            begin
             Choix4:=CaseG;
             end;
          end;
         end;

         ReCase2:
         begin
           Write('Jusqu''ou veux-tu placer ton ');
           Write(Bateau);
           Write(' ?(');
           Write(Choix1);
           Write(' ou ');
           Write(Choix2);
           Write(' ou ');
           Write(Choix3);
           Write(' ou ');
           Write(Choix4);
           Writeln(') tape RETOUR pour rechoisir la 1ere case');
           Readln(Case2);
         If Case2=(' ') then
           begin
             Writeln('Ce n''est pas un des choix !');
             GoTo ReCase2;
           end
         Else
         If Case2=Choix1 then
         begin
          If Boat=5 then
           begin
             PAj:=j;
             PAi:=i;
             PAj2:=j;
             PAi2:=i+1;
             PAj3:=j;
             PAi3:=i+2;
             PAj4:=j;
             PAi4:=i+3;
             PAj5:=j;
             PAi5:=i+4;
           end;
        If Boat=4 then
           begin
             SMj:=j;
             SMi:=i;
             SMj2:=j;
             SMi2:=i+1;
             SMj3:=j;
             SMi3:=i+2;
             SMj4:=j;
             SMi4:=i+3;
           end;
        If Boatt=6 then
           begin
             C1j:=j;
             C1i:=i;
             C1j2:=j;
             C1i2:=i+1;
             C1j3:=j;
             C1i3:=i+2;
           end
        Else
        If Boat=3 then
           begin
              C2j:=j;
              C2i:=i;
              C2j2:=j;
              C2i2:=i+1;
              C2j3:=j;
              C2i3:=i+2;
           end;
        If Boat=2 then
           begin
             Toj:=j;
             Ti:=i;
             Tj2:=j;
             Ti2:=i+1;
           end;
         For x:=1 to Boat do
         begin
           TJ[i,j]:=('O');
           i:=i+1;
         end;
         end
         Else
         If Case2=Choix2 then
         begin
         If Boat=5 then
           begin
             PAj:=j;
             PAi:=i;
             PAj2:=j+1;
             PAi2:=i;
             PAj3:=j+2;
             PAi3:=i;
             PAj4:=j+3;
             PAi4:=i;
             PAj5:=j+4;
             PAi5:=i;
           end;
        If Boat=4 then
           begin
             SMj:=j;
             SMi:=i;
             SMj2:=j+1;
             SMi2:=i;
             SMj3:=j+2;
             SMi3:=i;
             SMj4:=j+3;
             SMi4:=i;
           end;
        If Boatt=6 then
           begin
             C1j:=j;
             C1i:=i;
             C1j2:=j+1;
             C1i2:=i;
             C1j3:=j+2;
             C1i3:=i;
           end
        Else
        If Boat=3 then
           begin
              C2j:=j;
              C2i:=i;
              C2j2:=j+1;
              C2i2:=i;
              C2j3:=j+2;
              C2i3:=i;
           end;
        If Boat=2 then
           begin
             Toj:=j;
             Ti:=i;
             Tj2:=j+1;
             Ti2:=i;
           end;
         For x:=1 to Boat do
         begin
           TJ[i,j]:=('O');
           j:=j+1;
         end;
         end
         Else
         If Case2=Choix3 then
         begin
         If Boat=5 then
           begin
             PAj:=j;
             PAi:=i;
             PAj2:=j;
             PAi2:=i-1;
             PAj3:=j;
             PAi3:=i-2;
             PAj4:=j;
             PAi4:=i-3;
             PAj5:=j;
             PAi5:=i-4;
           end;
        If Boat=4 then
           begin
             SMj:=j;
             SMi:=i;
             SMj2:=j;
             SMi2:=i-1;
             SMj3:=j;
             SMi3:=i-2;
             SMj4:=j;
             SMi4:=i-3;
           end;
        If Boatt=6 then
           begin
             C1j:=j;
             C1i:=i;
             C1j2:=j;
             C1i2:=i-1;
             C1j3:=j;
             C1i3:=i-2;
           end
        Else
        If Boat=3 then
           begin
              C2j:=j;
              C2i:=i;
              C2j2:=j;
              C2i2:=i-1;
              C2j3:=j;
              C2i3:=i-2;
           end;
        If Boat=2 then
           begin
             Toj:=j;
             Ti:=i;
             Tj2:=j;
             Ti2:=i-1;
           end;
         For x:=1 to Boat do
         begin
           TJ[i,j]:=('O');
           i:=i-1;
         end;
         end
         Else
         If Case2=Choix4 then
         begin
         If Boat=5 then
           begin
             PAj:=j;
             PAi:=i;
             PAj2:=j-1;
             PAi2:=i;
             PAj3:=j-2;
             PAi3:=i;
             PAj4:=j-3;
             PAi4:=i;
             PAj5:=j-4;
             PAi5:=i;
           end;
        If Boat=4 then
           begin
             SMj:=j;
             SMi:=i;
             SMj2:=j-1;
             SMi2:=i;
             SMj3:=j-2;
             SMi3:=i;
             SMj4:=j-3;
             SMi4:=i;
           end;
        If Boatt=6 then
           begin
             C1j:=j;
             C1i:=i;
             C1j2:=j-1;
             C1i2:=i;
             C1j3:=j-2;
             C1i3:=i;
           end
        Else
        If Boat=3 then
           begin
              C2j:=j;
              C2i:=i;
              C2j2:=j-1;
              C2i2:=i;
              C2j3:=j-2;
              C2i3:=i;
           end;
        If Boat=2 then
           begin
             Toj:=j;
             Ti:=i;
             Tj2:=j-1;
             Ti2:=i;
           end;
         For x:=1 to Boat do
         begin
           TJ[i,j]:=('O');
           j:=j-1;
         end;
         end
         Else
         If Case2=('RETOUR') then
         begin
          GoTo Restart1;
         end
         Else
         begin
          GoTo Recase2;
         end;
         end;
      end
    Else
     begin
      Writeln('Cette case est deja prise !');
      Goto Restart1;
     end;
     Thend:
    End;
Procedure TirageBot(Boat:integer);
var
a,b,c,a2,b2,x,y:integer;
Label Restart;
Label RestartC;
begin
a:=0;
b:=0;
c:=0;
a2:=0;
b2:=0;
x:=0;
y:=0;
Restart:
randomize;
a:=random(10)+1;
b:=random(10)+1;
If TB[a,b,2]=('O') then
begin
 GoTo Restart;
end;
If TB[a,b,2]=(' ') then
 begin
  c:=random(4)+1;
  RestartC:
  //Check droite+place s'il peut
  If c=1 then
  begin
   b2:=b+1;
   If b2>10 then
    begin
     GoTo Restart;
    end
   Else
   begin
    For x:= 2 to Boat do
     begin
      If TB[a,b2,2]=('O') then
       begin
        GoTo Restart;
       end;
      If TB[a,b2,2]=(' ') then
      begin
       b2:=b2+1;
       If TB[a,b2,2]=('O') then
       begin
        GoTo Restart;
       end;
       If b2>10 then
       begin
        GoTo Restart;
       end;
       If x=Boat then
        begin
        If Boat=5 then
           begin
             PAbj:=b;
             PAbi:=a;
             PAbj2:=b+1;
             PAbi2:=a;
             PAbj3:=b+2;
             PAbi3:=a;
             PAbj4:=b+3;
             PAbi4:=a;
             PAbj5:=b+4;
             PAbi5:=a;
           end;
        If Boat=4 then
           begin
             SMbj:=b;
             SMbi:=a;
             SMbj2:=b+1;
             SMbi2:=a;
             SMbj3:=b+2;
             SMbi3:=a;
             SMbj4:=b+3;
             SMbi4:=a;
           end;
        If Boat=3 then
           begin
            If Diff=0 then
              begin
                C1bj:=b;
                C1bi:=a;
                C1bj2:=b+1;
                C1bi2:=a;
                C1bj3:=b+2;
                C1bi3:=a;
                Diff:=1;
              end
            Else
              begin
                C2bj:=b;
                C2bi:=a;
                C2bj2:=b+1;
                C2bi2:=a;
                C2bj3:=b+2;
                C2bi3:=a;
              end;
           end;
        If Boat=2 then
           begin
             Tboj:=b;
             Tbi:=a;
             Tbj2:=b+1;
             Tbi2:=a;
           end;
          TB[a,b,2]:=('O');
          b2:=b+1;
          For y:= 2 to Boat do
          begin
           TB[a,b2,2]:=('O');
           b2:=b2+1;
        end;
       end;
      end;
     end;
   end;
  end;
  //Check bas+place s'il peut
  If c=2 then
  begin
   a2:=a+1;
   If a2>10 then
       begin
        GoTo Restart;
       end;
    For x:= 2 to Boat do
     begin
      If TB[a2,b,2]=('O') then
       begin
        GoTo Restart;
       end;
      If TB[a2,b,2]=(' ') then
      begin
       a2:=a2+1;
       If TB[a2,b,2]=('O') then
       begin
        GoTo Restart;
       end;
       If a2>10 then
       begin
        GoTo Restart;
       end;
       If x=Boat then
        begin
         If Boat=5 then
           begin
             PAbj:=b;
             PAbi:=a;
             PAbj2:=b;
             PAbi2:=a+1;
             PAbj3:=b;
             PAbi3:=a+2;
             PAbj4:=b;
             PAbi4:=a+3;
             PAbj5:=b;
             PAbi5:=a+4;
           end;
         If Boat=4 then
           begin
             SMbj:=b;
             SMbi:=a;
             SMbj2:=b;
             SMbi2:=a+1;
             SMbj3:=b;
             SMbi3:=a+2;
             SMbj4:=b;
             SMbi4:=a+3;
           end;
         If Boat=3 then
           begin
            If Diff=0 then
              begin
                C1bj:=b;
                C1bi:=a;
                C1bj2:=b;
                C1bi2:=a+1;
                C1bj3:=b;
                C1bi3:=a+2;
                Diff:=1;
              end
            Else
              begin
                C2bj:=b;
                C2bi:=a;
                C2bj2:=b;
                C2bi2:=a+1;
                C2bj3:=b;
                C2bi3:=a+2;
              end;
           end;
         If Boat=2 then
           begin
             Tboj:=b;
             Tbi:=a;
             Tbj2:=b;
             Tbi2:=a+1;
           end;
          TB[a,b,2]:=('O');
          a2:=a+1;
          For y:= 2 to Boat do
          begin
           TB[a2,b,2]:=('O');
           a2:=a2+1;
          end;
        end;
      end;
     end;
  end;
  //Check gauche+place s'il peut
  If c=3 then
  begin
   b2:=b-1;
   If b2<1 then
   begin
    GoTo Restart;
   end
   Else
   Begin
    For x:= 2 to Boat do
     begin
      If TB[a,b2,2]=('O') then
       begin
        GoTo Restart;
       end;
      If TB[a,b2,2]=(' ') then
      begin
       b2:=b2-1;
       If TB[a,b2,2]=('O') then
       begin
        GoTo Restart;
       end;
       If b2<1 then
          begin
            GoTo Restart;
          end;
       If x=Boat then
        begin
         If Boat=5 then
           begin
             PAbj:=b;
             PAbi:=a;
             PAbj2:=b-1;
             PAbi2:=a;
             PAbj3:=b-2;
             PAbi3:=a;
             PAbj4:=b-3;
             PAbi4:=a;
             PAbj5:=b-4;
             PAbi5:=a;
           end;
         If Boat=4 then
           begin
             SMbj:=b;
             SMbi:=a;
             SMbj2:=b-1;
             SMbi2:=a;
             SMbj3:=b-2;
             SMbi3:=a;
             SMbj4:=b-3;
             SMbi4:=a;
           end;
         If Boat=3 then
           begin
            If Diff=0 then
              begin
                C1bj:=b;
                C1bi:=a;
                C1bj2:=b-1;
                C1bi2:=a;
                C1bj3:=b-2;
                C1bi3:=a;
                Diff:=1;
              end
            Else
              begin
                C2bj:=b;
                C2bi:=a;
                C2bj2:=b-1;
                C2bi2:=a;
                C2bj3:=b-2;
                C2bi3:=a;
              end;
           end;
         If Boat=2 then
           begin
             Tboj:=b;
             Tbi:=a;
             Tbj2:=b-1;
             Tbi2:=a;
           end;
          TB[a,b,2]:=('O');
          b2:=b-1;
          For y:= 2 to Boat do
          begin
           TB[a,b2,2]:=('O');
           b2:=b2-1;
          end;
        end;
      end;
     end;
   end;
  end;
  //Check haut+place s'il peut
  If c=4 then
  begin
   a2:=a-1;
   If a2<1 then
   begin
    GoTo Restart;
   end
   Else
   begin
    For x:= 2 to Boat do
     begin
      If TB[a2,b,2]=('O') then
       begin
        GoTo Restart;
       end;
      If TB[a2,b,2]=(' ') then
      begin
       a2:=a2-1;
       If TB[a2,b,2]=('O') then
       begin
        GoTo Restart;
       end;
       If a2<1 then
       begin
        GoTo Restart;
       end;
       If x=Boat then
        begin
         If Boat=5 then
           begin
             PAbj:=b;
             PAbi:=a;
             PAbj2:=b;
             PAbi2:=a-1;
             PAbj3:=b;
             PAbi3:=a-2;
             PAbj4:=b;
             PAbi4:=a-3;
             PAbj5:=b;
             PAbi5:=a-4;
           end;
         If Boat=4 then
           begin
             SMbj:=b;
             SMbi:=a;
             SMbj2:=b;
             SMbi2:=a-1;
             SMbj3:=b;
             SMbi3:=a-2;
             SMbj4:=b;
             SMbi4:=a-3;
           end;
         If Boat=3 then
           begin
            If Diff=0 then
              begin
                C1bj:=b;
                C1bi:=a;
                C1bj2:=b;
                C1bi2:=a-1;
                C1bj3:=b;
                C1bi3:=a-2;
                Diff:=1;
              end
            Else
              begin
                C2bj:=b;
                C2bi:=a;
                C2bj2:=b;
                C2bi2:=a-1;
                C2bj3:=b;
                C2bi3:=a-2;
              end;
           end;
         If Boat=2 then
           begin
             Tboj:=b;
             Tbi:=a;
             Tbj2:=b;
             Tbi2:=a-1;
           end;
          TB[a,b,2]:=('O');
          a2:=a-1;
          For y:= 2 to Boat do
          begin
           TB[a2,b,2]:=('O');
           a2:=a2-1;
          end;
        end;
      end;
     end;
   end;
  end;

end
Else
 begin
  GoTo Restart;
 end;
end;
Procedure AttaqueJoueur;
var
Case1:string;
i,j:integer;
Label Restart;
begin
 Restart:
 Writeln('Ou veux-tu attaquer ??');
 Readln(Case1);
 If Case1=('A1') then
  begin
   i:=1;   j:=1;
  end
 else
 If Case1=('A2') then
  begin
   i:=2;   j:=1;
  end
 else
 If Case1=('A3') then
  begin
   i:=3;   j:=1;
  end
 else
 If Case1=('A4') then
  begin
   i:=4;   j:=1;
  end
 else
 If Case1=('A5') then
  begin
   i:=5;   j:=1;
  end
 else
 If Case1=('A6') then
  begin
   i:=6;   j:=1;
  end
 else
 If Case1=('A7') then
  begin
   i:=7;   j:=1;
  end
 else
 If Case1=('A8') then
  begin
   i:=8;   j:=1;
  end
 else
 If Case1=('A9') then
  begin
   i:=9;   j:=1;
  end
 else
 If Case1=('A10') then
  begin
   i:=10;   j:=1;
  end
 else
 If Case1=('B1') then
  begin
   i:=1;   j:=2;
  end
 else
 If Case1=('B2') then
  begin
   i:=2;   j:=2;
  end
 else
 If Case1=('B3') then
  begin
   i:=3;   j:=2;
  end
 else
 If Case1=('B4') then
  begin
   i:=4;   j:=2;
  end
 else
 If Case1=('B5') then
  begin
   i:=5;   j:=2;
  end
 else
 If Case1=('B6') then
  begin
   i:=6;   j:=2;
  end
 else
 If Case1=('B7') then
  begin
   i:=7;   j:=2;
  end
 else
 If Case1=('B8') then
  begin
   i:=8;   j:=2;
  end
 else
 If Case1=('B9') then
  begin
   i:=9;   j:=2;
  end
 else
 If Case1=('B10') then
  begin
   i:=10;   j:=2;
  end
 else
 If Case1=('C1') then
  begin
   i:=1;   j:=3;
  end
 else
 If Case1=('C2') then
  begin
   i:=2;   j:=3;
  end
 else
 If Case1=('C3') then
  begin
   i:=3;   j:=3;
  end
 else
 If Case1=('C4') then
  begin
   i:=4;   j:=3;
  end
 else
 If Case1=('C5') then
  begin
   i:=5;   j:=3;
  end
 else
 If Case1=('C6') then
  begin
   i:=6;   j:=3;
  end
 else
 If Case1=('C7') then
  begin
   i:=7;   j:=3;
  end
 else
 If Case1=('C8') then
  begin
   i:=8;   j:=3;
  end
 else
 If Case1=('C9') then
  begin
   i:=9;   j:=3;
  end
 else
 If Case1=('C10') then
  begin
   i:=10;   j:=3;
  end
 else
  If Case1=('D1') then
  begin
   i:=1;   j:=4;
  end
 else
 If Case1=('D2') then
  begin
   i:=2;   j:=4;
  end
 else
 If Case1=('D3') then
  begin
   i:=3;   j:=4;
  end
 else
 If Case1=('D4') then
  begin
   i:=4;   j:=4;
  end
 else
 If Case1=('D5') then
  begin
   i:=5;   j:=4;
  end
 else
 If Case1=('D6') then
  begin
   i:=6;   j:=4;
  end
 else
 If Case1=('D7') then
  begin
   i:=7;   j:=4;
  end
 else
 If Case1=('D8') then
  begin
   i:=8;   j:=4;
  end
 else
 If Case1=('D9') then
  begin
   i:=9;   j:=4;
  end
 else
 If Case1=('D10') then
  begin
   i:=10;   j:=4;
  end
 else
  If Case1=('E1') then
  begin
   i:=1;   j:=5;
  end
 else
 If Case1=('E2') then
  begin
   i:=2;   j:=5;
  end
 else
 If Case1=('E3') then
  begin
   i:=3;   j:=5;
  end
 else
 If Case1=('E4') then
  begin
   i:=4;   j:=5;
  end
 else
 If Case1=('E5') then
  begin
   i:=5;   j:=5;
  end
 else
 If Case1=('E6') then
  begin
   i:=6;   j:=5;
  end
 else
 If Case1=('E7') then
  begin
   i:=7;   j:=5;
  end
 else
 If Case1=('E8') then
  begin
   i:=8;   j:=5;
  end
 else
 If Case1=('E9') then
  begin
   i:=9;   j:=5;
  end
 else
 If Case1=('E10') then
  begin
   i:=10;   j:=5;
  end
 else
  If Case1=('F1') then
  begin
   i:=1;   j:=6;
  end
 else
 If Case1=('F2') then
  begin
   i:=2;   j:=6;
  end
 else
 If Case1=('F3') then
  begin
   i:=3;   j:=6;
  end
 else
 If Case1=('F4') then
  begin
   i:=4;   j:=6;
  end
 else
 If Case1=('F5') then
  begin
   i:=5;   j:=6;
  end
 else
 If Case1=('F6') then
  begin
   i:=6;   j:=6;
  end
 else
 If Case1=('F7') then
  begin
   i:=7;   j:=6;
  end
 else
 If Case1=('F8') then
  begin
   i:=8;   j:=6;
  end
 else
 If Case1=('F9') then
  begin
   i:=9;   j:=6;
  end
 else
 If Case1=('F10') then
  begin
   i:=10;   j:=6;
  end
 else
 If Case1=('G1') then
  begin
   i:=1;   j:=7;
  end
 else
 If Case1=('G2') then
  begin
   i:=2;   j:=7;
  end
 else
 If Case1=('G3') then
  begin
   i:=3;   j:=7;
  end
 else
 If Case1=('G4') then
  begin
   i:=4;   j:=7;
  end
 else
 If Case1=('G5') then
  begin
   i:=5;   j:=7;
  end
 else
 If Case1=('G6') then
  begin
   i:=6;   j:=7;
  end
 else
 If Case1=('G7') then
  begin
   i:=7;   j:=7;
  end
 else
 If Case1=('G8') then
  begin
   i:=8;   j:=7;
  end
 else
 If Case1=('G9') then
  begin
   i:=9;   j:=7;
  end
 else
 If Case1=('G10') then
  begin
   i:=10;   j:=7;
  end
 else
 If Case1=('H1') then
  begin
   i:=1;   j:=8;
  end
 else
 If Case1=('H2') then
  begin
   i:=2;   j:=8;
  end
 else
 If Case1=('H3') then
  begin
   i:=3;   j:=8;
  end
 else
 If Case1=('H4') then
  begin
   i:=4;   j:=8;
  end
 else
 If Case1=('H5') then
  begin
   i:=5;   j:=8;
  end
 else
 If Case1=('H6') then
  begin
   i:=6;   j:=8;
  end
 else
 If Case1=('H7') then
  begin
   i:=7;   j:=8;
  end
 else
 If Case1=('H8') then
  begin
   i:=8;   j:=8;
  end
 else
 If Case1=('H9') then
  begin
   i:=9;   j:=8;
  end
 else
 If Case1=('H10') then
  begin
   i:=10;   j:=8;
  end
 else
 If Case1=('I1') then
  begin
   i:=1;   j:=9;
  end
 else
 If Case1=('I2') then
  begin
   i:=2;   j:=9;
  end
 else
 If Case1=('I3') then
  begin
   i:=3;   j:=9;
  end
 else
 If Case1=('I4') then
  begin
   i:=4;   j:=9;
  end
 else
 If Case1=('I5') then
  begin
   i:=5;   j:=9;
  end
 else
 If Case1=('I6') then
  begin
   i:=6;   j:=9;
  end
 else
 If Case1=('I7') then
  begin
   i:=7;   j:=9;
  end
 else
 If Case1=('I8') then
  begin
   i:=8;   j:=9;
  end
 else
 If Case1=('I9') then
  begin
   i:=9;   j:=9;
  end
 else
 If Case1=('I10') then
  begin
   i:=10;   j:=9;
  end
 else
 If Case1=('J1') then
  begin
   i:=1;   j:=10;
  end
 else
 If Case1=('J2') then
  begin
   i:=2;   j:=10;
  end
 else
 If Case1=('J3') then
  begin
   i:=3;   j:=10;
  end
 else
 If Case1=('J4') then
  begin
   i:=4;   j:=10;
  end
 else
 If Case1=('J5') then
  begin
   i:=5;   j:=10;
  end
 else
 If Case1=('J6') then
  begin
   i:=6;   j:=10;
  end
 else
 If Case1=('J7') then
  begin
   i:=7;   j:=10;
  end
 else
 If Case1=('J8') then
  begin
   i:=8;   j:=10;
  end
 else
 If Case1=('J9') then
  begin
   i:=9;   j:=10;
  end
 else
 If Case1=('J10') then
  begin
   i:=10;   j:=10;
  end
 else
 begin
  GoTo Restart;
 end;
 If TB[i,j,1]=('T') then
  begin
   Writeln('Tu as deja attaque la !');
   GoTo Restart;
  end
 Else
 If TB[i,j,1]=('X') then
  begin
   Writeln('Tu as deja attaque la !');
   GoTo Restart;
  end
 Else
 If TB[i,j,2]=('O') then
  begin
   If PAbi=i then
   begin
   If PAbj=j then
    begin
     PAb1:=false;
    end;
   end;
  If PAbi2=i then
   begin
   If PAbj2=j then
    begin
     PAb2:=false;
    end;
   end;
  If PAbi3=i then
   begin
   If PAbj3=j then
    begin
     PAb3:=false;
    end;
   end;
  If PAbi4=i then
   begin
   If PAbj4=j then
    begin
     PAb4:=false;
    end;
   end;
  If PAbi5=i then
   begin
   If PAbj5=j then
    begin
     PAb5:=false;
    end;
   end;
   Writeln('Touche !');
   TB[i,j,1]:=('T');
  If PAb1=false then
   begin
    If PAb2=false then
     begin
      If PAb3=false then
       begin
        If PAb4=false then
         begin
          If PAb5=false then
           begin
            Writeln('Leur Porte-Avions coule !');
            Readln;
            PAb1:=true;
            PAbC:=true;
           end;
         end;
       end;
     end;
   end;
  If SMbi=i then
   begin
   If SMbj=j then
    begin
     SMb1:=false;
    end;
   end;
  If SMbi2=i then
   begin
   If SMbj2=j then
    begin
     SMb2:=false;
    end;
   end;
  If SMbi3=i then
   begin
   If SMbj3=j then
    begin
     SMb3:=false;
    end;
   end;
  If SMbi4=i then
   begin
   If SMbj4=j then
    begin
     SMb4:=false;
    end;
   end;
  If SMb1=false then
   begin
    If SMb2=false then
     begin
      If SMb3=false then
       begin
        If SMb4=false then
           begin
            Writeln('Leur Sous-Marin coule !');
            Readln;
            SMb1:=true;
            SMbC:=true;
         end;
       end;
     end;
   end;
  If C1bi=i then
   begin
   If C1bj=j then
    begin
     C1b1:=false;
    end;
   end;
  If C1bi2=i then
   begin
   If C1bj2=j then
    begin
     C1b2:=false;
    end;
   end;
  If C1bi3=i then
   begin
   If C1bj3=j then
    begin
     C1b3:=false;
    end;
   end;
  If C1b1=false then
     begin
      If C1b2=false then
       begin
        If C1b3=false then
           begin
            Writeln('Leur Croiseur coule !');
            Readln;
            C1b1:=true;
            C1bC:=true;
         end;
       end;
     end;
  If C2bi=i then
   begin
   If C2bj=j then
    begin
     C2b1:=false;
    end;
   end;
  If C2bi2=i then
   begin
   If C2bj2=j then
    begin
     C2b2:=false;
    end;
   end;
  If C2bi3=i then
   begin
   If C2bj3=j then
    begin
     C2b3:=false;
    end;
   end;
  If C2b1=false then
     begin
      If C2b2=false then
       begin
        If C2b3=false then
           begin
            Writeln('Leur Cuirasse coule !');
            Readln;
            C2b1:=true;
            C2bC:=true;
         end;
       end;
     end;
  If Tbi=i then
   begin
    If Tboj=j then
     begin
      Tb1:=false;
     end;
   end;
  If Tbi2=i then
   begin
    If Tbj2=j then
     begin
      Tb2:=false;
     end;
   end;
  If Tb1=false then
     begin
      If Tb2=false then
        begin
          Writeln('Leur Torpilleur coule !');
          Readln;
          Tb1:=true;
          TbC:=true;
        end;
     end;
  If PAbC=true then
    begin
     If SMbC=true then
       begin
        If C1bC=true then
          begin
           If C2bC=true then
             begin
              If TbC=true then
                begin
                 TableauChasse(2);
                 TableauJeu(2);
                 Writeln('Victoire commandant ! L''ennemi est vaincu!');
                 Writeln;
                 Writeln('          VICTOIRE');
                 Readln;
                 halt;
                end;
             end;
          end;
       end;
    end;
  end
 Else
  begin
   Writeln('Loupe !');
   TB[i,j,1]:=('X');
  end;
end;
Procedure AttaqueBot;
var
i,j:integer;
A,B:string;
Label Restart;
begin
Restart:
randomize;
i:=random(10)+1;
j:=random(10)+1;
If i=1 then
 B:=('1');
If i=2 then
 B:=('2');
If i=3 then
 B:=('3');
If i=4 then
 B:=('4');
If i=5 then
 B:=('5');
If i=6 then
 B:=('6');
If i=7 then
 B:=('7');
If i=8 then
 B:=('8');
If i=9 then
 B:=('9');
If i=10 then
 B:=('10');

If j=1 then
 A:=('A');
If j=2 then
 A:=('B');
If j=3 then
 A:=('C');
If j=4 then
 A:=('D');
If j=5 then
 A:=('E');
If j=6 then
 A:=('F');
If j=7 then
 A:=('G');
If j=8 then
 A:=('H');
If j=9 then
 A:=('I');
If j=10 then
 A:=('J');

If TJ[i,j]=('T') then
 begin
  GoTo Restart;
 end
Else
If TJ[i,j]=('X') then
 begin
  GoTo Restart;
 end
Else
If TJ[i,j]=('O') then
 begin
  Write('Ils ont tire en ');
  Write(A);
  Write(B);
  Writeln(' !');
  Writeln('Vous etes touches !');
  TJ[i,j]:=('T');
  If PAi=i then
   begin
   If PAj=j then
    begin
     PA1:=false;
    end;
   end;
  If PAi2=i then
   begin
   If PAj2=j then
    begin
     PA2:=false;
    end;
   end;
  If PAi3=i then
   begin
   If PAj3=j then
    begin
     PA3:=false;
    end;
   end;
  If PAi4=i then
   begin
   If PAj4=j then
    begin
     PA4:=false;
    end;
   end;
  If PAi5=i then
   begin
   If PAj5=j then
    begin
     PA5:=false;
    end;
   end;
  If PA1=false then
   begin
    If PA2=false then
     begin
      If PA3=false then
       begin
        If PA4=false then
         begin
          If PA5=false then
           begin
            Writeln('Notre Porte-Avions coule !');
            Readln;
            PA1:=true;
            PAC:=true;
           end;
         end;
       end;
     end;
   end;
  If SMi=i then
   begin
   If SMj=j then
    begin
     SM1:=false;
    end;
   end;
  If SMi2=i then
   begin
   If SMj2=j then
    begin
     SM2:=false;
    end;
   end;
  If SMi3=i then
   begin
   If SMj3=j then
    begin
     SM3:=false;
    end;
   end;
  If SMi4=i then
   begin
   If SMj4=j then
    begin
     SM4:=false;
    end;
   end;
  If SM1=false then
   begin
    If SM2=false then
     begin
      If SM3=false then
       begin
        If SM4=false then
           begin
            Writeln('Notre Sous-Marin coule !');
            Readln;
            SM1:=true;
            SMC:=true;
         end;
       end;
     end;
   end;
  If C1i=i then
   begin
   If C1j=j then
    begin
     C11:=false;
    end;
   end;
  If C1bi2=i then
   begin
   If C1j2=j then
    begin
     C12:=false;
    end;
   end;
  If C1i3=i then
   begin
   If C1j3=j then
    begin
     C13:=false;
    end;
   end;
  If C11=false then
     begin
      If C12=false then
       begin
        If C13=false then
           begin
            Writeln('Notre Croiseur coule !');
            Readln;
            C11:=true;
            C1C:=true;
         end;
       end;
     end;
  If C2i=i then
   begin
   If C2j=j then
    begin
     C21:=false;
    end;
   end;
  If C2i2=i then
   begin
   If C2j2=j then
    begin
     C22:=false;
    end;
   end;
  If C2i3=i then
   begin
   If C2j3=j then
    begin
     C23:=false;
    end;
   end;
  If C21=false then
     begin
      If C22=false then
       begin
        If C23=false then
           begin
            Writeln('Notre Cuirasse coule !');
            Readln;
            C21:=true;
            C2C:=true;
         end;
       end;
     end;
  If Ti=i then
   begin
    If Toj=j then
     begin
      T1:=false;
     end;
   end;
  If Ti2=i then
   begin
    If Tj2=j then
     begin
      T2:=false;
     end;
   end;
  If T1=false then
     begin
      If T2=false then
        begin
          Writeln('Notre Torpilleur coule !');
          Readln;
          T1:=true;
          TC:=true;
        end;
     end;
  If PAC=true then
    begin
     If SMC=true then
       begin
        If C1C=true then
          begin
           If C2C=true then
             begin
              If TC=true then
                begin
                 Writeln('Commandant ! L''ennemi nous a vaincu! Nous devons nous replier !');
                 Writeln;
                 Writeln('            DEFAITE');
                 Readln;
                 halt;
                end;
             end;
          end;
       end;
    end;
  Readln;
 end
Else
 begin
  Write('Ils ont tire en ');
  Write(A);
  Write(B);
  Writeln(' !');
  Writeln('Ils ont tire a cote !');
  TJ[i,j]:=('X');
  Readln;
 end;
end;
Procedure VerifBot(CoordI:integer;CoordJ:integer);
begin
 If PAi=CoordI then
   begin
   If PAj=CoordJ then
    begin
     PA1:=false;
    end;
   end;
  If PAi2=CoordI then
   begin
   If PAj2=CoordJ then
    begin
     PA2:=false;
    end;
   end;
  If PAi3=CoordI then
   begin
   If PAj3=CoordJ then
    begin
     PA3:=false;
    end;
   end;
  If PAi4=CoordI then
   begin
   If PAj4=CoordJ then
    begin
     PA4:=false;
    end;
   end;
  If PAi5=CoordI then
   begin
   If PAj5=CoordJ then
    begin
     PA5:=false;
    end;
   end;
  If PA1=false then
   begin
    If PA2=false then
     begin
      If PA3=false then
       begin
        If PA4=false then
         begin
          If PA5=false then
           begin
            Writeln('Notre Porte-Avions coule !');
            Readln;
            PA1:=true;
            PAC:=true;
            Stop:=true;
           end;
         end;
       end;
     end;
   end;
  If SMi=CoordI then
   begin
   If SMj=CoordJ then
    begin
     SM1:=false;
    end;
   end;
  If SMi2=CoordI then
   begin
   If SMj2=CoordJ then
    begin
     SM2:=false;
    end;
   end;
  If SMi3=CoordI then
   begin
   If SMj3=CoordJ then
    begin
     SM3:=false;
    end;
   end;
  If SMi4=CoordI then
   begin
   If SMj4=CoordJ then
    begin
     SM4:=false;
    end;
   end;
  If SM1=false then
   begin
    If SM2=false then
     begin
      If SM3=false then
       begin
        If SM4=false then
           begin
            Writeln('Notre Sous-Marin coule !');
            Readln;
            SM1:=true;
            SMC:=true;
            Stop:=true;
         end;
       end;
     end;
   end;
  If C1i=CoordI then
   begin
   If C1j=CoordJ then
    begin
     C11:=false;
    end;
   end;
  If C1i2=CoordI then
   begin
   If C1j2=CoordJ then
    begin
     C12:=false;
    end;
   end;
  If C1i3=CoordI then
   begin
   If C1j3=CoordJ then
    begin
     C13:=false;
    end;
   end;
  If C11=false then
     begin
      If C12=false then
       begin
        If C13=false then
           begin
            Writeln('Notre Croiseur coule !');
            Readln;
            C11:=true;
            C1C:=true;
            Stop:=true;
         end;
       end;
     end;
  If C2i=CoordI then
   begin
   If C2j=CoordJ then
    begin
     C21:=false;
    end;
   end;
  If C2i2=CoordI then
   begin
   If C2j2=CoordJ then
    begin
     C22:=false;
    end;
   end;
  If C2i3=CoordI then
   begin
   If C2j3=CoordJ then
    begin
     C23:=false;
    end;
   end;
  If C21=false then
     begin
      If C22=false then
       begin
        If C23=false then
           begin
            Writeln('Notre Cuirasse coule !');
            Readln;
            C21:=true;
            C2C:=true;
            Stop:=true;
         end;
       end;
     end;
  If Ti=CoordI then
   begin
    If Toj=CoordJ then
     begin
      T1:=false;
     end;
   end;
  If Ti2=CoordI then
   begin
    If Tj2=CoordJ
    then
     begin
      T2:=false;
     end;
   end;
  If T1=false then
     begin
      If T2=false then
        begin
          Writeln('Notre Torpilleur coule !');
          Readln;
          T1:=true;
          TC:=true;
          Stop:=true;
        end;
     end;
  If PAC=true then
    begin
     If SMC=true then
       begin
        If C1C=true then
          begin
           If C2C=true then
             begin
              If TC=true then
                begin
                 TableauChasse(2);
                 TableauJeu(2);
                 Writeln('Commandant ! L''ennemi nous a vaincu! Nous devons nous replier !');
                 Writeln;
                 Writeln('            DEFAITE');
                 Readln;
                 halt;
                end;
             end;
          end;
       end;
    end;
 end;
Procedure AttaqueBotI;
var
i,j,N:integer;
Label Reload;
Label ReT1;
Label ReT2;
Label ReT3;
Label ReT4;
begin
Reload:
If Stop=true then
 begin
  Stop:=false;
  Touche1:=false;
  Touche2:=false;
  Touche3:=false;
  Touche4:=false;
 end;
Randomize;
i:=random(10)+1;
j:=random(10)+1;
If Touche1=true then
 begin
  ReT1:
  Randomize;
  N:=random(4)+1;
  If N=1 then
   begin
    i:=CoordI+1;
    If i>10 then
     begin
      GoTo ReT1;
     end
    Else
     If TJ[i,CoordJ]=(' ') then
      begin
       TJ[i,CoordJ]:=('X');
       Writeln('Ils ont tire a cote !');
       Readln;
      end
    Else
     If TJ[i,CoordJ]=('O') then
      begin
       TJ[i,CoordJ]:=('T');
       Writeln('Nous sommes touches !');
       Readln;
       Touche1:=false;
       Touche2:=true;
       Dice:=N;
       VerifBot(i,CoordJ);
      end
    Else
     If TJ[i,CoordJ]=('X') then
      begin
       GoTo ReT1;
      end
    Else
     If TJ[i,CoordJ]=('T') then
      begin
       GoTo ReT1;
      end;
   end
 Else
  If N=2 then
   begin
    j:=CoordJ+1;
    If j>10 then
     begin
      GoTo ReT1;
     end
    Else
     If TJ[CoordI,j]=(' ') then
      begin
       TJ[CoordI,j]:=('X');
       Writeln('Ils ont tire a cote !');
       Readln;
      end
    Else
     If TJ[CoordI,j]=('O') then
      begin
       TJ[CoordI,j]:=('T');
       Writeln('Nous sommes touches !');
       Readln;
       Touche1:=false;
       Touche2:=true;
       Dice:=N;
       VerifBot(CoordI,j);
      end
    Else
     If TJ[CoordI,j]=('X') then
      begin
       GoTo ReT1;
      end
    Else
     If TJ[CoordI,j]=('T') then
      begin
       GoTo ReT1;
      end;
   end
 Else
  If N=3 then
   begin
    i:=CoordI-1;
    If i<1 then
     begin
      GoTo ReT1;
     end
    Else
     If TJ[i,CoordJ]=(' ') then
      begin
       TJ[i,CoordJ]:=('X');
       Writeln('Ils ont tire a cote !');
       Readln;
      end
    Else
     If TJ[i,CoordJ]=('O') then
      begin
       TJ[i,CoordJ]:=('T');
       Writeln('Nous sommes touches !');
       Readln;
       Touche1:=false;
       Touche2:=true;
       Dice:=N;
       VerifBot(i,CoordJ);
      end
    Else
     If TJ[i,CoordJ]=('X') then
      begin
       GoTo ReT1;
      end
    Else
     If TJ[i,CoordJ]=('T') then
      begin
       GoTo ReT1;
      end;
   end
  Else
   If N=4 then
   begin
    j:=CoordJ-1;
    If j<1 then
     begin
      GoTo ReT1;
     end
    Else
     If TJ[CoordI,j]=(' ') then
      begin
       TJ[CoordI,j]:=('X');
       Writeln('Ils ont tire a cote !');
       Readln;
      end
    Else
     If TJ[CoordI,j]=('O') then
      begin
       TJ[CoordI,j]:=('T');
       Writeln('Nous sommes touches !');
       Readln;
       Touche1:=false;
       Touche2:=true;
       Dice:=N;
       VerifBot(CoordI,j);
      end
    Else
     If TJ[CoordI,j]=('X') then
      begin
       GoTo ReT1;
      end
    Else
     If TJ[CoordI,j]=('T') then
      begin
       GoTo ReT1;
      end;
   end;
 end
Else
If Touche2=true then
 begin
  ReT2:
  If Dice=1 then
   begin
    If M=1 then
     begin
      i:=CoordI+1;
     end
    Else
     begin
      i:=CoordI+2;
     end;
    If i>10 then
     begin
      Dice:=3;
      M:=1;
      GoTo ReT2;
     end
    Else
     If TJ[i,CoordJ]=(' ') then
      begin
       If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
        TJ[i,CoordJ]:=('X');
        Dice:=3;
        M:=1;
        Writeln('Ils ont tire a cote !');
        Readln;
      end
    Else
     If TJ[i,CoordJ]=('O') then
      begin
       TJ[i,CoordJ]:=('T');
       Writeln('Nous sommes touches !');
       Readln;
       VerifBot(i,CoordJ);
       If M=1 then
        begin
         M:=0;
        end
       Else
        begin
         Touche2:=false;
         Touche3:=true;
        end;
      end
    Else
     If TJ[i,CoordJ]=('X') then
      begin
       If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=3;
       M:=1;
       GoTo ReT2;
      end
    Else
     If TJ[i,CoordJ]=('T') then
      begin
       If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=3;
       M:=1;
       GoTo ReT2;
      end;
   end
 Else
  If Dice=2 then
   begin
    If M=1 then
     begin
      j:=CoordJ+1;
     end
    Else
     begin
      j:=CoordJ+2;
     end;
    If j>10 then
     begin
      Dice:=4;
      M:=1;
      GoTo ReT2;
     end
    Else
     If TJ[CoordI,j]=(' ') then
      begin
       If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
       TJ[CoordI,j]:=('X');
       Dice:=4;
       M:=1;
       Writeln('Ils ont tire a cote !');
       Readln;
      end
    Else
     If TJ[CoordI,j]=('O') then
      begin
       TJ[CoordI,j]:=('T');
       Writeln('Nous sommes touches !');
       Readln;
       VerifBot(CoordI,j);
       If M=1 then
        begin
         M:=0;
        end
       Else
        begin
         Touche2:=false;
         Touche3:=true;
        end;
      end
    Else
     If TJ[CoordI,j]=('X') then
      begin
       If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=4;
       M:=1;
       GoTo ReT2;
      end
    Else
     If TJ[CoordI,j]=('T') then
      begin
       If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=4;
       M:=1;
       GoTo ReT2;
      end;
    end
 Else
  If Dice=3 then
   begin
    If M=1 then
     begin
      i:=CoordI-1;
     end
    Else
     begin
      i:=CoordI-2;
     end;
    If i<1 then
     begin
      Dice:=1;
      M:=1;
      GoTo ReT2;
     end
    Else
     If TJ[i,CoordJ]=(' ') then
      begin
       If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
       TJ[i,CoordJ]:=('X');
       Dice:=1;
       M:=1;
       Writeln('Ils ont tire a cote !');
       Readln;
      end
    Else
     If TJ[i,CoordJ]=('O') then
      begin
       TJ[i,CoordJ]:=('T');
       Writeln('Nous sommes touches !');
       Readln;
       VerifBot(i,CoordJ);
       If M=1 then
        begin
         M:=0;
        end
       Else
        begin
         Touche2:=false;
         Touche3:=true;
        end;
      end
    Else
     If TJ[i,CoordJ]=('X') then
      begin
       If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=1;
       M:=1;
       GoTo ReT2;
      end
    Else
     If TJ[i,CoordJ]=('T') then
      begin
       If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=1;
       M:=1;
       GoTo ReT2;
      end;
   end
  Else
  If Dice=4 then
       begin
        If M=1 then
         begin
          j:=CoordJ-1;
         end
        Else
         begin
          j:=CoordJ-2;
         end;
        If j<1 then
         begin
          Dice:=2;
          M:=1;
          GoTo ReT2;
         end
        Else
         If TJ[CoordI,j]=(' ') then
          begin
           If M=1 then
            begin
             Stop:=true;
             TJ[i,CoordJ]:=('X');
             Writeln('Ils ont tire a cote !');
             M:=0;
           end
        Else
           TJ[CoordI,j]:=('X');
           Dice:=2;
           M:=1;
           Writeln('Ils ont tire a cote !');
           Readln;
        end
    Else
     If TJ[CoordI,j]=('O') then
      begin
       TJ[CoordI,j]:=('T');
       Writeln('Nous sommes touches !');
       Readln;
       VerifBot(CoordI,j);
       If M=1 then
        begin
         M:=0;
        end
       Else
        begin
         Touche2:=false;
         Touche3:=true;
        end;
      end
    Else
     If TJ[CoordI,j]=('X') then
      begin
       If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=2;
       M:=1;
       GoTo ReT2;
      end
    Else
     If TJ[CoordI,j]=('T') then
      begin
       If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=2;
       M:=1;
       GoTo ReT2;
      end;
    end;
  end
Else
If Touche3=true then
  begin
      ReT3:
      If Dice=1 then
       begin
        If M=1 then
         begin
          i:=CoordI+1;
         end
        Else
         begin
          i:=CoordI+3;
         end;
        If i>10 then
         begin
          Dice:=3;
          M:=1;
          GoTo ReT3;
         end
        Else
         If TJ[i,CoordJ]=(' ') then
          begin
        If M=1 then
          begin
           Stop:=true;
           TJ[i,CoordJ]:=('X');
           Writeln('Ils ont tire a cote !');
           M:=0;
          end
         Else
           TJ[i,CoordJ]:=('X');
           Dice:=3;
           M:=1;
           Writeln('Ils ont tire a cote !');
           Readln;
          end
        Else
         If TJ[i,CoordJ]=('O') then
          begin
           TJ[i,CoordJ]:=('T');
           Writeln('Nous sommes touches !');
           Readln;
           VerifBot(i,CoordJ);
           If M=1 then
            begin
             M:=0;
             Touche3:=false;
             Touche2:=true;
            end
           Else
            begin
             Touche3:=false;
             Touche4:=true;
            end;
          end
        Else
         If TJ[i,CoordJ]=('X') then
          begin
         If M=1 then
          begin
           Stop:=true;
           GoTo Reload;
           M:=0;
          end
         Else
           Dice:=3;
           M:=1;
           GoTo ReT3;
          end
        Else
         If TJ[i,CoordJ]=('T') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=3;
           M:=1;
           GoTo ReT3;
          end;
       end
     Else
      If Dice=2 then
       begin
        If M=1 then
         begin
          j:=CoordJ+1;
         end
        Else
         begin
          j:=CoordJ+3;
         end;
        If j>10 then
         begin
          Dice:=4;
          M:=1;
          GoTo ReT3;
         end
        Else
         If TJ[CoordI,j]=(' ') then
          begin
           If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
           TJ[CoordI,j]:=('X');
           Dice:=4;
           M:=1;
           Writeln('Ils ont tire a cote !');
           Readln;
          end
        Else
         If TJ[CoordI,j]=('O') then
          begin
           TJ[CoordI,j]:=('T');
           Writeln('Nous sommes touches !');
           Readln;
           VerifBot(CoordI,j);
           If M=1 then
            begin
             M:=0;
             Touche2:=true;
             Touche3:=false;
            end
           Else
            begin
             Touche3:=false;
             Touche4:=true;
            end;
          end
        Else
         If TJ[CoordI,j]=('X') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=4;
           M:=1;
           GoTo ReT3;
          end
        Else
         If TJ[CoordI,j]=('T') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=4;
           M:=1;
           GoTo ReT3;
          end;
       end
     Else
      If Dice=3 then
       begin
        If M=1 then
         begin
          i:=CoordI-1;
         end
        Else
         begin
          i:=CoordI-3;
         end;
        If i<1 then
         begin
          Dice:=1;
          M:=1;
          GoTo ReT3;
         end
        Else
         If TJ[i,CoordJ]=(' ') then
          begin
           If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
           TJ[i,CoordJ]:=('X');
           Dice:=1;
           M:=1;
           Writeln('Ils ont tire a cote !');
           Readln;
          end
        Else
         If TJ[i,CoordJ]=('O') then
          begin
           TJ[i,CoordJ]:=('T');
           Writeln('Nous sommes touches !');
           Readln;
           VerifBot(i,CoordJ);
           If M=1 then
            begin
             M:=0;
             Touche2:=true;
             Touche3:=false;
            end
           Else
            begin
             Touche2:=false;
             Touche3:=true;
            end;
          end
        Else
         If TJ[i,CoordJ]=('X') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=1;
           M:=1;
           GoTo ReT3;
          end
        Else
         If TJ[i,CoordJ]=('T') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=1;
           M:=1;
           GoTo ReT3;
          end;
       end
      Else
       If Dice=4 then
       begin
        If M=1 then
         begin
          j:=CoordJ-1;
         end
        Else
         begin
          j:=CoordJ-3;
         end;
        If j<1 then
         begin
          Dice:=2;
          M:=1;
          GoTo ReT3;
         end
        Else
         If TJ[CoordI,j]=(' ') then
          begin
           If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
           TJ[CoordI,j]:=('X');
           Dice:=2;
           M:=1;
           Writeln('Ils ont tire a cote !');
           Readln;
          end
     Else
      If TJ[CoordI,j]=('O') then
       begin
        TJ[CoordI,j]:=('T');
        Writeln('Nous sommes touches !');
        Readln;
        VerifBot(CoordI,j);
        If M=1 then
         begin
          M:=0;
          Touche2:=true;
          Touche3:=false;
         end
       Else
        begin
         Touche3:=false;
         Touche4:=true;
        end;
      end
    Else
     If TJ[CoordI,j]=('X') then
      begin
      If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=2;
       M:=1;
       GoTo ReT3;
      end
    Else
     If TJ[CoordI,j]=('T') then
      begin
      If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=2;
       M:=1;
       GoTo ReT3;
      end;
    end;
 end
Else
If Touche4=true then
     begin
      ReT4:
      If Dice=1 then
       begin
        If M=1 then
         begin
          i:=CoordI+1;
         end
        Else
         begin
          i:=CoordI+4;
         end;
        If i>10 then
         begin
          Dice:=3;
          M:=1;
          GoTo ReT4;
         end
        Else
         If TJ[i,CoordJ]=(' ') then
          begin
           If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
           TJ[i,CoordJ]:=('X');
           Dice:=3;
           M:=1;
           Writeln('Ils ont tire a cote !');
           Readln;
          end
        Else
         If TJ[i,CoordJ]=('O') then
          begin
           TJ[i,CoordJ]:=('T');
           Writeln('Nous sommes touches !');
           Readln;
           VerifBot(i,CoordJ);
           If M=1 then
            begin
             M:=0;
             Touche4:=false;
             Touche2:=true;
            end
           Else
            begin
             Touche4:=false;
            end;
          end
        Else
         If TJ[i,CoordJ]=('X') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=3;
           M:=1;
           GoTo ReT4;
          end
        Else
         If TJ[i,CoordJ]=('T') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=3;
           M:=1;
           GoTo ReT4;
          end;
       end
     Else
      If Dice=2 then
       begin
        If M=1 then
         begin
          j:=CoordJ+1;
         end
        Else
         begin
          j:=CoordJ+4;
         end;
        If j>10 then
         begin
          Dice:=4;
          M:=1;
          GoTo ReT4;
         end
        Else
         If TJ[CoordI,j]=(' ') then
          begin
           If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
           TJ[CoordI,j]:=('X');
           Dice:=4;
           M:=1;
           Writeln('Ils ont tire a cote !');
           Readln;
          end
        Else
         If TJ[CoordI,j]=('O') then
          begin
           TJ[CoordI,j]:=('T');
           Writeln('Nous sommes touches !');
           Readln;
           VerifBot(CoordI,j);
           If M=1 then
            begin
             M:=0;
             Touche2:=true;
             Touche4:=false;
            end
           Else
            begin
             Touche4:=false;
            end;
          end
        Else
         If TJ[CoordI,j]=('X') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=4;
           M:=1;
           GoTo ReT4;
          end
        Else
         If TJ[CoordI,j]=('T') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=4;
           M:=1;
           GoTo ReT4;
          end;
       end
     Else
      If Dice=3 then
       begin
        If M=1 then
         begin
          i:=CoordI-1;
         end
        Else
         begin
          i:=CoordI-4;
         end;
        If i<1 then
         begin
          Dice:=1;
          M:=1;
          GoTo ReT4;
         end
        Else
         If TJ[i,CoordJ]=(' ') then
          begin
           If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
           TJ[i,CoordJ]:=('X');
           Dice:=1;
           M:=1;
           Writeln('Ils ont tire a cote !');
           Readln;
          end
        Else
         If TJ[i,CoordJ]=('O') then
          begin
           TJ[i,CoordJ]:=('T');
           Writeln('Nous sommes touches !');
           Readln;
           VerifBot(i,CoordJ);
           If M=1 then
            begin
             M:=0;
             Touche2:=true;
             Touche4:=false;
            end
           Else
            begin
             Touche4:=false;
            end;
          end
        Else
         If TJ[i,CoordJ]=('X') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=1;
           M:=1;
           GoTo ReT4;
          end
        Else
         If TJ[i,CoordJ]=('T') then
          begin
           If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
           Dice:=1;
           M:=1;
           GoTo ReT4;
          end;
       end
      Else
       If Dice=4 then
       begin
        If M=1 then
         begin
          j:=CoordJ-1;
         end
        Else
         begin
          j:=CoordJ-4;
         end;
        If j<1 then
         begin
          Dice:=2;
          M:=1;
          GoTo ReT4;
         end
        Else
         If TJ[CoordI,j]=(' ') then
          begin
           If M=1 then
        begin
         Stop:=true;
         TJ[i,CoordJ]:=('X');
         Writeln('Ils ont tire a cote !');
         M:=0;
        end
       Else
           TJ[CoordI,j]:=('X');
           Dice:=2;
           M:=1;
           Writeln('Ils ont tire a cote !');
           Readln;
          end
     Else
      If TJ[CoordI,j]=('O') then
       begin
        TJ[CoordI,j]:=('T');
        Writeln('Nous sommes touches !');
        Readln;
        VerifBot(CoordI,j);
        If M=1 then
         begin
          M:=0;
          Touche2:=true;
          Touche4:=false;
         end
       Else
        begin
         Touche4:=false;
        end;
      end
    Else
     If TJ[CoordI,j]=('X') then
      begin
      If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=2;
       M:=1;
       GoTo ReT4;
      end
    Else
     If TJ[CoordI,j]=('T') then
      begin
      If M=1 then
        begin
         Stop:=true;
         GoTo Reload;
         M:=0;
        end
       Else
       Dice:=2;
       M:=1;
       GoTo ReT4;
      end;
    end;
 end
Else
If TJ[i,j]=(' ') then
 begin
  TJ[i,j]:=('X');
  Writeln('Ils ont tire a cote !');
  Readln;
 end
Else
If TJ[i,j]=('X') then
 begin
  GoTo Reload;
 end
Else
If TJ[i,j]=('T') then
 begin
  GoTo Reload;
 end
Else
If TJ[i,j]=('O') then
 begin
  TJ[i,j]:=('T');
  Writeln('Nous sommes touches !');
  Readln;
  CoordI:=i;
  CoordJ:=j;
  Touche1:=True;
  VerifBot(i,j);
 end;
end;

//Programme principal
var
x:integer;
menu:string;
Label DEBUT;
Begin
//Initialisation variables positions des bateaux
  Diff:=0;
  PAC:=false;
  PA1:=true;
  PA2:=true;
  PA3:=true;
  PA4:=true;
  PA5:=true;

  SMC:=false;
  SM1:=true;
  SM2:=true;
  SM3:=true;
  SM4:=true;

  C1C:=false;
  C11:=true;
  C12:=true;
  C13:=true;

  C2C:=false;
  C21:=true;
  C22:=true;
  C23:=true;

  TC:=false;
  T1:=true;
  T2:=true;

  Diffb:=0;
  PAbC:=false;
  PAb1:=true;
  PAb2:=true;
  PAb3:=true;
  PAb4:=true;
  PAb5:=true;

  SMbC:=false;
  SMb1:=true;
  SMb2:=true;
  SMb3:=true;
  SMb4:=true;

  C1bC:=false;
  C1b1:=true;
  C1b2:=true;
  C1b3:=true;

  C2bC:=false;
  C2b1:=true;
  C2b2:=true;
  C2b3:=true;

  TbC:=false;
  Tb1:=true;
  Tb2:=true;

//Début du jeu
Writeln('Bienvenue sur l''Ocean Pacifique');
DEBUT:
Writeln;
Writeln('Choisis ton adversaire :');
Writeln('1:La Roumanie');
Writeln('2:Les USA');
Writeln('3:QUITTER');
Readln(menu);
If menu=('1') then
 begin
  TableauChasse(1);
  TableauJeu(1);

  Randomize;
  TirageBot(5);
  TirageBot(4);
  TirageBot(3);
  TirageBot(3);
  TirageBot(2);

  PlacerBateau(5);
  TableauChasse(2);
  TableauJeu(2);
  PlacerBateau(4);
  TableauChasse(2);
  TableauJeu(2);
  PlacerBateau(3);
  TableauChasse(2);
  TableauJeu(2);
  PlacerBateau(6);
  TableauChasse(2);
  TableauJeu(2);
  PlacerBateau(2);
  TableauChasse(2);
  TableauJeu(2);
  Readln;
 For x:=1 to 100 do
  begin
   AttaqueJoueur;
   AttaqueBot;
   TableauChasse(2);
   TableauJeu(2);
  end;
 end
Else
 If menu=('2') then
  begin
  TableauChasse(1);
  TableauJeu(1);

  Randomize;
  TirageBot(5);
  TirageBot(4);
  TirageBot(3);
  TirageBot(3);
  TirageBot(2);

  PlacerBateau(5);
  TableauChasse(2);
  TableauJeu(2);
  PlacerBateau(4);
  TableauChasse(2);
  TableauJeu(2);
  PlacerBateau(3);
  TableauChasse(2);
  TableauJeu(2);
  PlacerBateau(6);
  TableauChasse(2);
  TableauJeu(2);
  PlacerBateau(2);
  TableauChasse(2);
  TableauJeu(2);
  Readln;
 For x:=1 to 100 do
  begin
   AttaqueJoueur;
   AttaqueBotI;
   TableauChasse(2);
   TableauJeu(2);
  end;
 end
Else
If menu=('3') then
 begin
  halt;
 end
Else
begin
  Writeln('Ce n''est pas un des choix espece de Roumain !');
  GoTo DEBUT;
 end;
End.
