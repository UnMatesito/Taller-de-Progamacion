program E01P3;
type
    socio = record
        numero: integer;
        nombre: string;
        edad: integer;
        end;
    
    arbol = ^nodo;

    nodo = record 
        dato : socio;
        hi: arbol;
        hd: arbol;
        end;

procedure leerSocio(var s: socio);
begin
    with s do
        begin
            writeln('Ingrese el numero de socio');
            readln(numero);
            if (numero <> 0) then
                begin
                    writeln('Ingrese el nombre de socio');
                    readln(nombre);
                    writeln('Ingrese la edad de socio');
                    readln(edad);
                end;
        end;
end;

procedure agregar(var a:arbol; s:socio);
begin
    if (a = nil) then
        begin
            new(a);
            a^.dato := s;
            a^.hi := nil;
            a^.hd := nil;
        end
    else
        begin
            if (s.numero <= a^.dato.numero) then
                agregar(a^.hi, s)
            else
                agregar(a^.hd, s);
        end;
end;

procedure cargarArbol(var a:arbol);
var
    s:socio;
begin
    leerSocio(s);
    writeln;
    while (s.numero <> 0) do
        begin
            agregar(a, s);
            leerSocio(s);
            writeln;
        end;
end;

procedure maxSocio(a:arbol);
begin
	if (a <> nil) then
		begin	
			if (a^.hd = nil) then
				writeln('El socio con el numero mas grande es: ', a^.dato.numero);
			maxSocio(a^.hd);
		end;
end;

procedure minSocio(a:arbol);
begin
	if (a <> nil) then
		begin	
			if (a^.hi = nil) then
				begin
					writeln('Datos socio con numero de socio mas chico.');
					writeln('Numero: ', a^.dato.numero);
					writeln('Nombre: ', a^.dato.nombre);
					writeln('Edad: ', a^.dato.edad);
				end;
			minSocio(a^.hi);
		end;
end;

procedure maxEdad(a:arbol; var max:integer; var sociomax: integer);
begin
	if (a <> nil) then
		begin	
			maxEdad(a^.hi, max, sociomax);
			if (a^.dato.edad > max) then
				begin
					max := a^.dato.edad;
					sociomax := a^.dato.numero;
				end;
			maxEdad(a^.hd, max, sociomax);
		end;
end;

procedure aumentarEdad(a: arbol);
begin
	if (a <> nil) then
		begin
		aumentarEdad(a^.hi);
		writeln('Edad modificada');
		writeln(a^.dato.edad + 1);
		aumentarEdad(a^.hd);
		end;
end;

procedure buscarValor(a:arbol; valor:integer; var encontre: boolean);
begin
	if (a <> nil) then
		begin
			buscarValor(a^.hi, valor, encontre);
			if (a^.dato.numero = valor) then
				encontre := true
			else
				encontre := false;
			buscarValor(a^.hd, valor, encontre);
		end;
end;

procedure buscarNombre(a:arbol; nombre:string; var encontre: boolean);
begin
	if (a <> nil) then
		begin
			buscarNombre(a^.hi, nombre, encontre);
			if (a^.dato.nombre = nombre) then
				encontre := true
			else
				encontre := false;
			buscarNombre(a^.hd, nombre, encontre);
		end;
end;

procedure cantSocios(a:arbol; var cant:integer);
begin
	if (a <> nil) then
		begin
			cantSocios(a^.hi, cant);
			cant := cant + 1;
			cantSocios(a^.hd, cant);
		end;
end;

procedure promedioEdad(a:arbol; var suma:integer);
var
	cant: integer;
begin
	if (a <> nil) then
		begin
			promedioEdad(a^.hi, suma);
			suma := suma + a^.dato.edad;
			cantSocios(a, cant);
			promedioEdad(a^.hd, suma);
		end;
end;

procedure preOrden(a: arbol);
begin
	if (a <> nil) then
		begin
			writeln(a^.dato.numero);
			preOrden(a^.hi);
			preOrden(a^.hd);
		end;
end;

procedure postOrden(a: arbol);
begin
	if (a <> nil) then
		begin
			postOrden(a^.hi);
			postOrden(a^.hd);
			writeln(a^.dato.numero);
		end;
end;

var
    a: arbol;
    max, sociomax, valor, cant, suma: integer;
    encontre: boolean;
    nombre: string;
begin
    //punto A
    a := nil;
    cargarArbol(a);
    //punto B
		//punto i
    maxSocio(a);
		//punto ii
	minSocio(a);
		//punto iii
	max := -1;
	maxEdad(a, max, sociomax);
	writeln('El numero de socio con mayor edad es: ', sociomax);
	writeln;
		//punto iv
	aumentarEdad(a);
		//punto v
	writeln('Ingrese un numero de socio a buscar');
	readln(valor);
	buscarValor(a,valor, encontre);
	if (encontre = true) then
		writeln('El numero de socio ', valor, ' se encuentra en el arbol')
	else
		writeln('El numero de socio ', valor, ' no se encuentra en el arbol');
	writeln;
		//punto vi
	writeln('Ingrese el nombre de un socio a buscar');
	readln(nombre);
	buscarNombre(a,nombre, encontre);
	if (encontre = true) then
		writeln('El numero de socio ', nombre, ' se encuentra en el arbol')
	else
		writeln('El numero de socio ', nombre, ' no se encuentra en el arbol');
	writeln;
		//punto vii
	cant := 0;
	cantSocios(a, cant);
	writeln('Cantidad de socios: ', cant);
	writeln;
		//punto viii
	suma := 0;
	promedioEdad(a, suma);
	writeln('El promedio de edad de los socios es: ', suma/cant:2:2);
		//punto xi
	writeln('Orden Creciente');
	postOrden(a);
		//punto x
	writeln('Orden Decreciente');
	preOrden(a);
end.






