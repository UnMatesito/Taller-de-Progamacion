program E05P5;
type
	reclamo = record
		codigo: integer;
		dni: integer;
		anio: integer;
		tipo: string;
		end;

	reclamoL = record
		codigo: integer;
		anio: integer;
		tipo: string;
		end;
	
	lista = ^nodoL;
	
	nodoL = record
		dato: reclamoL;
		sig: lista;
		end;

	arbol = ^nodoA;
	
	nodoA = record
		dni: integer;
		dato: lista;
		cant: integer;
		hi: arbol;
		hd: arbol;
		end;

procedure leerReclamo(var r:reclamo);
begin
	with r do
		begin
			writeln('Ingrese el codigo del reclamo');
			readln(codigo);
			if (codigo <> -1) then
				begin
					writeln('Ingrese el anio en el que se realizo el reclamo');
					readln(anio);
					writeln('Ingrese el tipo de reclamo');
					readln(tipo);
				end;
		end;
end;

procedure agregarAdelante(var l:lista; r:reclamo);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato.codigo := r.codigo;
	nuevo^.dato.anio := r.anio;
	nuevo^.dato.tipo := r.tipo;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure cargarLista(var l:lista; var cant: integer);
var
	r:reclamo;
begin
	leerReclamo(r);
	writeln;
	while (r.codigo <> -1) do
		begin
			agregarAdelante(l, r);
			cant := cant + 1;
			leerReclamo(r);
			writeln;
		end;
end;

procedure agregar(var a:arbol; dni:integer);
var
	cant: integer;
begin
	if (a = nil) then
		begin
			new(a);
			a^.dni := dni;
			a^.dato := nil;
			cant := 0;
			cargarLista(a^.dato, cant);
			a^.cant := cant;
			a^.hi := nil;
			a^.hd := nil;
		end
	else
		begin
			if (a^.dni <= dni) then
				agregar(a^.hi, dni)
			else
				agregar(a^.hd, dni);
		end;
end;

procedure cargarArbol(var a:arbol);
var
	dni:integer;
begin
	writeln('Ingrese el DNI del de la presona que realizo el reclamo');
	readln(dni);
	writeln;
	while (dni <> 0) do
		begin
			agregar(a, dni);
			writeln('Ingrese el DNI del de la presona que realizo el reclamo');
			readln(dni);
			writeln;
		end;
end;

procedure imprimirLista (l:lista);
begin
	while (l <> nil) do
		begin
			writeln('Codigo de reclamo');
			writeln(l^.dato.codigo);
			writeln('anio del reclamo');
			writeln(l^.dato.anio);
			writeln('Tipo de reclamo');
			writeln(l^.dato.tipo);
			writeln;
			l := l^.sig;
		end;
end;

procedure imprimirArbol(a:arbol);
begin
	if (a <> nil) then
		begin
			writeln('DNI');
			writeln(a^.dni);
			writeln;
			imprimirLista(a^.dato);
			writeln('Cantidad de reclamos');
			writeln(a^.cant);
			writeln;
			imprimirArbol(a^.hi);
			imprimirArbol(a^.hd);
		end;
end;

var
	a: arbol;
begin
	a := nil;
	cargarArbol(a);
	imprimirArbol(a);
end.


