unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

var
 TJ : array [0..10,0..10] of string;
 TB : array [0..10,0..10,1..2] of string;

 Diff,Diffb,Dice,M,V:integer;

 PAi,PAj,PAi2,PAj2,PAi3,PAj3,PAi4,PAj4,PAi5,PAj5:integer;
 PA1,PA2,PA3,PA4,PA5,PAC:boolean;
 PAbi,PAbj,PAbi2,PAbj2,PAbi3,PAbj3,PAbi4,PAbj4,PAbi5,PAbj5:integer;
 PAb1,PAb2,PAb3,PAb4,PAb5,PAbC:boolean;

 SMi,SMj,SMi2,SMj2,SMi3,SMj3,SMi4,SMj4:integer;
 SM1,SM2,SM3,SM4,SMC:boolean;
 SMbi,SMbj,SMbi2,SMbj2,SMbi3,SMbj3,SMbi4,SMbj4:integer;
 SMb1,SMb2,SMb3,SMb4,SMbC:boolean;

 C1i,C1j,C1i2,C1j2,C1i3,C1j3:integer;
 C11,C12,C13,C1C:boolean;
 C1bi,C1bj,C1bi2,C1bj2,C1bi3,C1bj3:integer;
 C1b1,C1b2,C1b3,C1bC:boolean;

 C2i,C2j,C2i2,C2j2,C2i3,C2j3:integer;
 C21,C22,C23,C2C:boolean;
 C2bi,C2bj,C2bi2,C2bj2,C2bi3,C2bj3:integer;
 C2b1,C2b2,C2b3,C2bC:boolean;

 Ti,Toj,Ti2,Tj2:integer;
 T1,T2,TC:boolean;
 Tbi,Tboj,Tbi2,Tbj2:integer;
 Tb1,Tb2,TbC:boolean;

 Touche1,Touche2,Touche3,Touche4,Stop:boolean;
 Ligne,Colonne,CoordI,CoordJ:integer;

implementation

end.

