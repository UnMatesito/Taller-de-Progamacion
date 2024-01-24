program E03P3;
type
	nota = record
		codigo: integer;
		nota: real;
		end;
	
	lista = ^nodo;
	
	nodo = record
		dato: nota;
		sig: lista;
		end;
	
	
	alumno = record
		legajo: integer;
		dni: integer;
		ingreso: integer;
		notas : lista;
		end;

	arbol = ^nodoA;
	
	nodoA = record
		dato: alumno;
		hi: arbol;
		hd: arbol;
		end;

procedure leerNota(var n: nota);
begin
	with n do
		begin
			writeln('Ingrese el codigo de materia');
			readln(codigo);
			if (codigo <> -1) then
				begin
					writeln('Ingrese la nota de materia');
					readln(nota);
				end;
		end;
end;



procedure agregarAdelante(var l: lista; n:nota);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato := n;
	nuevo^.sig := l;
	l := nuevo;
end;


procedure leerAlumno (var a:alumno);
var
	l: lista; n: nota;
begin
	with a do
		begin
			writeln('Ingrese el legajo del alumno');
			readln(legajo);
			if (legajo <> 0) then
				begin
					writeln('Ingrese el DNI del alumno');
					readln(dni);
					writeln('Ingrese el anio de ingreso del alumno');
					readln(ingreso);
					writeln('---Materias------------------------------------');
					l := nil;
					leerNota(n);
					while (n.codigo <> -1) do
						begin
							agregarAdelante(l, n);
							leerNota(n);
						end;
				end;
		end;
end;

procedure agregar(var a: arbol; al: alumno);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato := al;
			a^.hi := nil;
			a^.hd := nil;
		end
	else
		begin
			if (al.legajo <= a^.dato.legajo) then
                agregar(a^.hi, al)
            else
                agregar(a^.hd, al);
		end;
end;

procedure cargarArbol(var a:arbol);
var
	al: alumno;
begin
	leerAlumno(al);
	writeln;
	while (al.legajo <> 0) do
		begin
			agregar(a, al);
			leerAlumno(al);
			writeln;
		end;
end;

procedure buscarLegMin(a:arbol; leg:integer);
begin
	if (a <> nil) then
		begin
			buscarLegMin(a^.hi, leg);
			if (a^.dato.legajo < leg) then
				begin
					writeln('DNI del alumno');
					writeln(a^.dato.dni);
					writeln('Anio de ingreso del alumno');
					writeln(a^.dato.ingreso);
				end;
			buscarLegMin(a^.hd, leg);
		end;
end;

procedure maxLegajo(a: arbol; var max: integer);
begin
	if (a <> nil) then
		begin
			maxLegajo(a^.hi, max);
			maxLegajo(a^.hd, max);
			if (a^.hd = nil) then
				begin
					max := a^.dato.legajo
				end;
		end;
end;

procedure maxDni(a: arbol; var max: integer);
begin
	if (a <> nil) then
		begin
			maxDni(a^.hi, max);
			maxDni(a^.hd, max);
			if (a^.hd = nil) then
				begin
					max := a^.dato.dni
				end;
		end;
end;

procedure legImpar(a: arbol; var cantImpar: integer);
begin
	if (a <> nil) then
		begin
			legImpar(a^.hi, cantImpar);
			if (a^.dato.legajo mod 2 <> 0) then
				cantImpar := cantImpar + 1;
			legImpar(a^.hd, cantImpar);
		end;
end;

procedure promedio(l:lista; var prom:real);
var
	suma: real; cant: integer; 
begin
	suma := 0;
	cant := 0;
	while (l <> nil) do
		begin
			suma := suma + l^.dato.nota;
			cant := cant + 1;
		end;
	prom := suma/cant;
end;

procedure maxPromedio(a:arbol; var maxProm:real);
var
	prom: real;
begin
	prom := 0;
	if (a <> nil) then
		begin
			promedio(a^.dato.notas, prom);
			if (prom > maxProm) then
				begin
					maxProm := prom;
				end;
			maxPromedio(a^.hi, maxProm);
			maxPromedio(a^.hd, maxProm);
		end;
end;

procedure masDelValor(a:arbol; valor: real);
var
	prom: real;
begin
	prom := 0;
	if (a <> nil) then
		begin
			promedio(a^.dato.notas, prom);
			if(valor < prom) then
				begin
					writeln('Alumno que supero el promedio ', valor);
					writeln(a^.dato.legajo);
					writeln(prom:0:2);
				end;
			masDelValor(a^.hi, valor);
			masDelValor(a^.hd, valor);
		end;
end;

var
	a: arbol;
	leg, max, cantImpar: integer;
	valor, maxProm: real;
begin
	//Punto A
	a := nil;
	cargarArbol(a);
	//Punto B
	writeln('Ingrese un legajo');
	readln(leg);
	buscarLegMin(a, leg);
	//Punto C
	max := -1;
	maxLegajo(a, max);
	writeln('El legajo mas grande es: ', max);
	//Punto D
	max := -1;
	maxDni(a, max);
	writeln('El DNI mas grande es: ', max);
	//Punto E
	cantImpar := 0;
	legImpar(a, cantImpar);
	writeln('Cantidad de legajos impares: ', cantImpar);
	//Punto F
	maxProm := -1;
	maxPromedio(a, maxProm);
	writeln('Alumno con mayor promedio');
	writeln(a^.dato.legajo);
	writeln(maxProm:0:2);
	//Punto G
	writeln('Ingrese un valor');
	readln(valor);
	masDelValor(a, valor);
end.

