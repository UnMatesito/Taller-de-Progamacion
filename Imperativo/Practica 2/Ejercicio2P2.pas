program E02P2;
type
	lista = ^nodo;
	
	nodo = record
		dato: integer;
		sig: lista;
		end;


procedure armarNodo(var l:lista; num: integer);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato := num;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure cargarLista(var l:lista);
var
	num: integer;
begin
	writeln('Ingresa un numero');
	readln(num);
	while (num <> 0) do
		begin
			armarNodo(l, num);
			writeln('Ingresa un numero');
			readln(num);
		end;
end;

procedure descomponer(num: integer);
var
	dig: integer;
begin
		begin
		if (num <> 0) then
			begin
				descomponer(num div 10);
				dig := num mod 10;
				writeln('Digito');
				writeln(dig);
			end;
		end;
end;

procedure descomponerImprimir(l: lista);
begin
	if (l <> nil) then
		begin
			descomponerImprimir(l^.sig);
			writeln('Numero');
			descomponer(l^.dato);			
		end;
end;


var
	l: lista;
begin
	cargarLista(l);
	descomponerImprimir(l);
end.

