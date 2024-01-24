program E02P1;
const
	dimf = 300;
type
	s_oficinas = 1..300;

	oficina = record
		codigo: integer;
		dni: integer;
		expensa: real;
		end;
	
	v_oficinas = array[s_oficinas] of oficina;

procedure leerOficina (var o:oficina);
begin
	with o do
		begin
			writeln('Ingrese el codigo de identificacion de la oficina');
			readln(codigo);
			if (codigo <> -1) then
				begin
					writeln('Ingrese el DNI del propietario ');
					readln(dni);
					writeln('Ingrese el valor de la expensa');
					readln(expensa);
				end;
		end;
end;

procedure cargarVector(var v:v_oficinas; var diml:integer);
var
	o: oficina;
begin
	diml := 0;
	leerOficina(o);
	while(diml < dimf) and (o.codigo <> -1) do
		begin
			diml := diml + 1;
			v[diml] := o;
			leerOficina(o);
		end;
end;

procedure insercion(var v:v_oficinas; diml:integer);
var
	i ,j: integer; act: integer;
begin
	for i:= 2 to diml do
		begin
			act:= v[i].codigo;
			j:= i - 1;
			while (j > 0) and (v[j].codigo > act) do
				begin
					v[j+1]:= v[j];
					j:= j-1
				end;
			v[j+1].codigo:= act;
		end;
end;

procedure seleccion(var v:v_oficinas; diml:integer);
var
	i, j, pos: s_oficinas; item: integer;
begin
	for i:= 1 to (diml-1) do
		begin
			pos := i;
			for j:= i + 1 to diml do
				if (v[j].codigo < v[pos].codigo) then
					pos := j;
			item := v[pos].codigo;
			v[pos].codigo := v[i].codigo;
			v[i].codigo := item;
		end;
end;

procedure mostrarContenido(v:v_oficinas; diml:integer);
var
	i: integer;
begin
	for i:= 1 to diml do
		begin
			writeln('Codigo');
			writeln(v[i].codigo);
		end;
end;



var
	v: v_oficinas;
	diml: integer;

begin
	cargarVector(v, diml);
	insercion(v, diml);
	writeln('Insersion');
	mostrarContenido(v, diml);
	seleccion(v, diml);
	writeln('------------------------------------------------------------');
	writeln('Seleccion');
	mostrarContenido(v, diml);
end.
