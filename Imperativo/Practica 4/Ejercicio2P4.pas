program E02P4;
const
	max_dias = 31;
	max_meses = 12;
type
	s_dias = 1..max_dias;
	
	s_meses = 1..max_meses;
	
	prestamo = record
		isbn: integer;
		numSocio: integer;
		dia: s_dias;
		mes: s_meses;
		cantDias: integer;
	end;
	
	arbol1 = ^nodo1;
	
	nodo1 = record
		dato: prestamo;
		hi: arbol1;
		hd: arbol1;
	end;
	
	prestamoL = record
		numSocio: integer;
		dia: s_dias;
		mes: s_meses;
		cantDias: integer;
	end;
	
	lista = ^nodoL;
	
	nodoL = record
		dato: prestamoL;
		sig: lista;
	end;
	
	arbol2 = ^nodo2;
	
	nodo2 = record
		isbn: integer;
		dato: lista;
		hi: arbol2;
		hd: arbol2;
	end;
	
procedure leerPrestamo(var p:prestamo);
begin
	with p do
		begin
			writeln('Ingrese el ISBN del libro');
			readln(isbn);
			if (isbn <> -1) then
				begin
					writeln('Ingrese el numero del socio que realizo el prestamo');
					readln(numSocio);
					writeln('Ingrese el dia del prestamo');
					readln(dia);
					writeln('Ingrese el mes del prestamo');
					readln(mes);
					writeln('Ingrese la cantidad de dias que duro el prestamo');
					readln(cantDias);
				end;
		end;	
end;

procedure agregarA1(var a1:arbol1; p:prestamo);
begin
	if (a1 = nil) then
		begin
			new(a1);
			a1^.dato := p;
			a1^.hi := nil;
			a1^.hd := nil;
		end
	else
		begin
			if (p.isbn <= a1^.dato.isbn) then
				agregarA1(a1^.hi, p)
			else
				agregarA1(a1^.hd, p);
		end;
end;

procedure agregarAdelante(var l:lista; p:prestamo);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato.numSocio := p.numSocio;
	nuevo^.dato.dia := p.dia;
	nuevo^.dato.mes := p.mes;
	nuevo^.dato.cantDias := p.cantDias;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure agregarA2(var a2:arbol2; p:prestamo);
begin
	if (a2 = nil) then
		begin
			new(a2);
			a2^.isbn := p.isbn;
			a2^.dato := nil;
			agregarAdelante(a2^.dato, p);
			a2^.hi := nil;
			a2^.hd := nil;
		end
	else
		begin
			if (p.isbn = a2^.isbn) then
				agregarAdelante(a2^.dato, p)
			else if (p.isbn <= a2^.isbn) then
				agregarA2(a2^.hi, p)
			else
				agregarA2(a2^.hd, p);
		end;
end;


procedure cargarArboles(var a1:arbol1; var a2:arbol2);
var
	p: prestamo;
begin
	leerPrestamo(p);
	writeln;
	while (p.isbn <> -1) do
		begin
			agregarA1(a1, p);
			agregarA2(a2, p);
			leerPrestamo(p);
			writeln;
		end;
end;

function maximo(a1:arbol1):integer;
begin
	if (a1 <> nil) then
		begin
			if (a1^.hd = nil) then
				maximo := a1^.dato.isbn
			else
				maximo := maximo(a1^.hd);
		end
	else
		maximo := -1
end;

function minimo(a2:arbol2):integer;
begin
	if (a2 <> nil) then
		begin
			if (a2^.hi = nil) then
				minimo := a2^.isbn
			else
				minimo := minimo(a2^.hi);
		end
	else
		minimo := 9999
end;

procedure buscarSocioi(a: arbol1; numSocio:integer; var cant:integer);
begin
	if (a <> nil) then
		begin
			buscarSocioi(a^.hi, numSocio, cant);
			if (numSocio = a^.dato.numSocio) then
				cant := cant + 1;
			buscarSocioi(a^.hd, numSocio, cant);
		end;
end;

procedure contarLista(l:lista; numSocio:integer; var cant:integer);
begin
	while (l <> nil) do
		begin
			if (numSocio = l^.dato.numSocio) then
				cant := cant + 1;
			l := l^.sig;
		end;
end;

procedure buscarSocioii(a: arbol2; numSocio:integer; var cant:integer);
begin
	if (a <> nil) then
		begin
			buscarSocioii(a^.hi, numSocio, cant);
			contarLista(a^.dato, numSocio, cant);
			buscarSocioii(a^.hd, numSocio, cant);
		end;
end;






var
	a1: arbol1;
	a2: arbol2;
	numSocio, cant: integer;
begin
	writeln('Inciso A------------------------------------------------------');
	a1 := nil;
	a2 := nil;
	cargarArboles(a1, a2);
	writeln;
	
	writeln('Inciso B------------------------------------------------------');
	
	writeln('El ISBN mas grande es: ', maximo(a1));
	writeln;
	
	writeln('Inciso C------------------------------------------------------');
	
	writeln('El ISBN mas chico es: ', minimo(a2));
	writeln;
	
	writeln('Inciso D------------------------------------------------------');
	
	writeln('Ingese un numero de socio a buscar');
	cant := 0;
	readln(numSocio);
	buscarSocioi(a1, numSocio, cant);
	writeln('La cantidad de prestamos que realizo con el numero de socio ', numSocio, ' fue: ', cant);
	writeln;
	
	writeln('Inciso E------------------------------------------------------');
	
	writeln('Ingese un numero de socio a buscar');
	cant := 0;
	readln(numSocio);
	buscarSocioii(a2, numSocio, cant);
	writeln('La cantidad de prestamos que realizo con el numero de socio ', numSocio, ' fue: ', cant);
	writeln;
	
	writeln('Inciso F------------------------------------------------------');
	
	writeln;
	
	writeln('Inciso G------------------------------------------------------');
	
	writeln;
	
	writeln('Inciso H------------------------------------------------------');
	
	writeln;
	
	writeln('Inciso I------------------------------------------------------');
	
	writeln;
end.
