program E04P2;
const
	dimf = 20;
type
	v_numeros = array[1..dimf] of integer;

procedure cargarVector(var v:v_numeros; var diml:integer);
var
	num: integer;
begin
	if (diml <= dimf) then
		begin
			num := random(98) + 1;
			writeln('Numero: ', num);
			//readln(num);
			v[diml] := num;
			diml := diml + 1;
			cargarVector(v, diml);
		end;
end;

procedure actMaximo(v:v_numeros; diml: integer; var max: integer);
begin
	if (diml <> 0) then
		begin
			if (v[diml] > max) then
				max := v[diml];
			actMaximo(v, diml-1, max);
		end;
end;

procedure sumar(v:v_numeros; diml:integer; var suma: integer);
begin
	if (diml <> 0) then
		begin
			suma := suma + v[diml];
			sumar(v, diml-1, suma);
		end;
end;

var
	v: v_numeros;
	diml, suma ,max: integer;
begin
	//Punto A
	Randomize;
	diml := 1;
	cargarVector(v, diml);
	//Punto B
	max := -1;
	actMaximo(v, diml, max);
	writeln('Valor maximo: ', max);
	//Punto c
	suma := 20400;
	sumar(v, diml, suma);
	writeln('Suma del los numeros: ', suma);
end.
