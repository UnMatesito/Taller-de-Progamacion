program E03P1;
const
	dimf = 8;
type
	s_generos = 1..dimf;
	
	pelicula = record
		codigo: integer;
		puntaje: real;
		end;
	
	lista = ^nodo;
	
	nodo = record
		dato: pelicula;
		sig: lista;
		end;
	
	v_peliculas = array[s_generos] of lista;
		
	v_maxPuntaje = array[s_generos] of integer;
	

procedure leerPelicula (var p:pelicula);
begin
	with p do
		begin
			writeln('Ingrese el codigo de la pelicula');
			readln(codigo);
			if (codigo <> -1) then
				begin
					writeln('Ingrese el puntaje promedio de la pelicula');
					readln(puntaje);
				end;
		end;
end;

procedure agregarAtras(var l:lista; p:pelicula);
var
	nuevo, ult: lista;
begin
	new(nuevo);
	nuevo^.dato := p;
	nuevo^.sig := nil;
	if (l = nil) then
		begin
			l:= nuevo;
			ult := nuevo;
		end
	else
		begin
			ult^.sig := nuevo;
			ult := nuevo;
		end;
end;


//punto A
procedure cargarVector(var v:v_peliculas);
var
	i:integer; p:pelicula; var l:lista;
begin
	l := nil;
	for i:= 1 to dimf do
		begin
			writeln('Genero: ', i);
			leerPelicula(p);
			while (p.codigo <> -1) do
				begin
					agregarAtras(l, p);
					v[i] := l;
					leerPelicula(p);
				end;
		end;
end;

//punto B
procedure cargarMaxPunt (v:v_peliculas; var vm:v_maxPuntaje);
var
	i: integer; max: real;
begin
	for i:= 1 to dimf do
		begin
			max := -1;
			while (v[i] <> nil) do
				begin
					if (v[i]^.dato.puntaje > max)then
						max := v[i]^.dato.puntaje;
						vm[i] := v[i]^.dato.codigo;
					v[i] := v[i]^.sig;
				end;
		end;
end;

//punto C
procedure insercion(var vm:v_maxPuntaje);
var
	i, j: integer; actual: integer;
begin
	for i:= 2 to dimf do
		begin
			actual := vm[i];
			j := i-1;
			while (j > 0) and (vm[j] > actual) do
				begin
					vm[j+1]:= vm[j];
					j := j - 1;
				end;
				vm[j+1]:= actual;
		end;
end;

//punto D
procedure mayorYmenorPuntaje(vm:v_maxPuntaje);
var
	codmax, codmin, i: integer;
begin
	codmax := -1;
	codmin := 9999;
	for i:=1 to dimf do 
		begin
			if (vm[i] > codmax) then
				begin
					codmax := vm[i];
				end;
			if (vm[i] < codmin) then
				begin
					codmin := vm[i];
				end;
		end;
	writeln('El codigo de pelicula con el mayor puntaje es: ', codmax);
	writeln('El codigo de pelicula con el menor puntaje es: ', codmin);
end;

var
	v: v_peliculas;
	vm: v_maxPuntaje;
	i : integer;
begin
	cargarVector(v);
	cargarMaxPunt (v, vm);
	insercion(vm);
	for i:= 1 to dimf do
		writeln(vm[i]);
	mayorYmenorPuntaje(vm);
end.

