unit untFuncoes;

interface

uses
  System.SysUtils;

function Criptografar(wStri: String): String;

implementation

function Criptografar(wStri: String): String;
var Simbolos : array [0..4] of String;
     x            : Integer;
begin
Simbolos[1]:=
'ABCDEFGHIJLMNOPQRSTUVXZYWK ~!@#$%^&*()';

 Simbolos[2]:=
'ÂÀ©Øû×ƒçêùÿ5Üø£úñÑªº¿®¬¼ëèïÙýÄÅÉæÆôöò»Á';

 Simbolos[3]:='abcdefghijlmnopqrstuvxzywk1234567890';

 Simbolos[4]:='áâäàåíóÇüé¾¶§÷ÎÏ-+ÌÓß¸°¨·¹³²Õµþîì¡«½';

 for x := 1 to Length(Trim(wStri)) do begin
     if pos(copy(wStri,x,1),Simbolos[1])>0 then
        Result := Result+copy(Simbolos[2],
                      pos(copy(wStri,x,1),Simbolos[1]),1)

     else if pos(copy(wStri,x,1),Simbolos[2])>0 then
        Result := Result+copy(Simbolos[1],
                      pos(copy(wStri,x,1),Simbolos[2]),1)

     else if pos(copy(wStri,x,1),Simbolos[3])>0 then
        Result := Result+copy(Simbolos[4],
                      pos(copy(wStri,x,1),Simbolos[3]),1)

     else if pos(copy(wStri,x,1),Simbolos[4])>0 then
        Result := Result+copy(Simbolos[3],
                      pos(copy(wStri,x,1),Simbolos[4]),1);
 end;
end;

end.
