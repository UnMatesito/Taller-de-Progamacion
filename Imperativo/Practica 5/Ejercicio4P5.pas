program E04P5;
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
					writeln('Ingrese el DNI del de la presona que realizo el reclamo');
					readln(dni);
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

function cumple(dniA, dniR:integer):boolean;
begin
	cumple:=(dniA = dniR);
end;

procedure agregar(var a:arbol; r:reclamo);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dni := r.dni;
			a^.dato := nil;
			agregarAdelante(a^.dato, r);
			a^.cant := 1;
			a^.hi := nil;
			a^.hd := nil;
		end
	else
		begin
			if (cumple(a^.dni, r.dni)) then
				begin
					agregarAdelante(a^.dato, r);
					a^.cant := a^.cant + 1;
				end
			else if (a^.dni <= r.dni) then
				agregar(a^.hi, r)
			else
				agregar(a^.hd, r);
		end;
end;

procedure cargarArbol(var a:arbol);
var
	r:reclamo;
begin
	leerReclamo(r);
	writeln;
	while (r.codigo <> -1) do
		begin
			agregar(a,r);
			leerReclamo(r);
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

function buscarDni(a:arbol; dni:integer):integer;
begin
	if (a <> nil) then
		begin
			if (dni = a^.dni) then
				buscarDni := a^.cant
			else if (dni < a^.dni) then
				buscarDni := buscarDni(a^.hi, dni)
			else
				buscarDni := buscarDni(a^.hd, dni);
		end
	else
		buscarDni := 0;
end;

function buscarEntre2Dni(a:arbol; dni1:integer; dni2:integer):integer;
begin
	if (a <> nil) then
		begin
			if (a^.dni > dni1) and (a^.dni < dni2) then
				buscarEntre2Dni := a^.cant + buscarEntre2Dni(a^.hi, dni1, dni2) + buscarEntre2Dni(a^.hd, dni1, dni2);
		end
	else
		buscarEntre2Dni := 0;
end;

procedure anioyCod(l:lista; anio:integer);
begin
	while (l <> nil) do
		begin
			if (l^.dato.anio = anio) then
				begin
					writeln('Codigo del reclamo del anio ', anio);
					writeln(l^.dato.codigo);
					writeln;
				end;
			l := l^.sig;
		end;
end;

procedure buscarCodigos(a:arbol; anio:integer);
begin
	if (a <> nil) then
		begin
			buscarCodigos(a^.hi, anio);
			anioyCod(a^.dato, anio);
			buscarCodigos(a^.hd, anio);
		end;
end;

var
	a:arbol;
	dni, anio: integer;
	dni1, dni2: integer;
begin
	writeln('Inciso A--------------------------------------');
	
	a := nil;
	cargarArbol(a);
	//chequeo
	imprimirArbol(a);
	writeln;
	
	writeln('Inciso B---------------------------------------');
	
	writeln('Ingrese un DNI a buscar');
	readln(dni);
	if (buscarDni(a, dni) <> 0) then
		writeln('El DNI ', dni, ' se encuentra en el arbol y la cantidad de reclamos que realizo fue: ', buscarDni(a, dni))
	else
		writeln('El DNI no se encuentra en el arbol');
	writeln;
	
	writeln('Inciso C---------------------------------------');
	
	writeln('Ingrese 2 DNI (DNI 2 tiene que ser mayor a DNI 1)');
	writeln('DNI 1');
	readln(dni1);
	writeln('DNI 2');
	readln(dni2);
	while (dni2 < dni1) do
		begin
			writeln('El DNI 1 es mayor a DNI 2, ingrese nuevamente');
			writeln('DNI 1');
			readln(dni1);
			writeln('DNI 2');
			readln(dni2);
		end;
	if (dni2 > dni1) then
		begin
			writeln('La cantidad total de reclamos que se realizaron entre el DNI ', dni1, ' y el DNI ', dni2, ' es: ', buscarEntre2Dni(a, dni1, dni2));
		end;
	writeln;
	
	writeln('Inciso D---------------------------------------');
	writeln('Ingrese un anio para la busqueda de codigos');
	readln(anio);
	buscarCodigos(a, anio);
	writeln;
end.
