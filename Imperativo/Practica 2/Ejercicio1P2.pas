program E01P2;
const
	dimf = 10;
type
	
	v_numeros = array[1..dimf] of char;
	
	lista = ^nodo;
	
	nodo = record
		dato: char;
		sig: lista;
		end;


procedure cargarVector(var v:v_numeros; var diml: integer);
begin
	if (diml <> 10) then
		begin
			diml := diml + 1;
			writeln('Ingrese un caracter');
			readln(v[diml]);
			if (v[diml] <> '.') then
				cargarVector(v, diml);
		end;
end;

procedure imprimir (v:v_numeros; diml:integer);
var
	i: integer;
begin
	for i:=1 to diml do
		writeln(v[i]);
end;

procedure imprimirRecursivo(v:v_numeros; diml:integer; var i: integer);
begin
	if (i <= diml) then
		begin
		i:= i + 1;
		writeln(v[i]);
		imprimirRecursivo(v, diml, i);
		end;
end;

procedure leerCaracteres(var cant: integer);
var
	caracter: char;
begin
	writeln('Ingrese un caracter');
	readln(caracter);
	cant := cant + 1;
	if (caracter <> '.') then
		leerCaracteres(cant);
end;

procedure agregarAdelante (var l:lista; caracter: char);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= caracter;
	nuevo^.sig:= l;
	l := nuevo;
end;

procedure cargarLista (var l: lista);
var
	caracter: char;
begin
	writeln('Ingrese un caracter');
	readln(caracter);
	if (caracter <> '.') then
		begin
		agregarAdelante(l, caracter);
		cargarLista(l);
		end;
end;

procedure imprimirListaR(l: lista);
begin
	if (l <> nil) then
		begin
		writeln(l^.dato);
		l := l^.sig;
		imprimirListaR(l);
		end;
end;

procedure imprimirListaL(l: lista);
begin
	if (l <> nil) then
		begin
			imprimirListaL(l^.sig);
			writeln(l^.dato);
		end;
end;


var
	v: v_numeros;
	diml, i, cant: integer;
	l: lista;
begin
	//punto A
	diml := 0;
	cargarVector(v, diml);
	//punto B
	writeln('---------------------------------------------------------');
	writeln('Imprimir');
	imprimir(v, diml);
	//punto C
	writeln('---------------------------------------------------------');
	writeln('Imprimir Recursivo');
	i:= 0;
	imprimirRecursivo(v, diml, i);
	//punto D
	cant := 0;
	leerCaracteres(cant);
	writeln('Cantidad de caracteres de la secuencia');
	writeln(cant);
	//punto E
	l := nil;
	cargarLista(l);
	//punto F
	writeln('---------------------------------------------------------');
	writeln('Lista');
	imprimirListaR(l);
	//punto G
	writeln('---------------------------------------------------------');
	writeln('Lista orden inverso');
	imprimirListaL(l);
end.
