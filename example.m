fileName = "examples/example.ods";
planilha = "Planilha1";
cells = "A9:L58";

# TODO: checar se ja instalou, e instalar se nao
pkg load io
data = odsread(fileName, planilha, cells);

X_column = 5;
X = data(:, X_column);
X_err_column = 6;
X_err = data(:, X_err_column);

y1_column = 7;
y1 = data(:, y1_column);
y1_err_column = 8;
y1_err = data(:, y1_err_column);

y2_column = 9;
y2 = data(:, y2_column);
y2_err_column = 10;
y2_err = data(:, y2_err_column);

y3_column = 11;
y3 = data(:, y3_column);
y3_err_column = 12;
y3_err = data(:, y3_err_column);

plot2yy(X, y1, y3, X_err, y1_err, y3_err, 
  "Grafico 1: Valores de Potencia Util Pu e Rendimento N em funcao da Resistencia R", 
  "Resistencia R (Ohm)",
  "Potencia Util Pu (W)", "Rendimento N (%)",
  "Potencia Util Pu", "Rendimento N",
  "grid", "on",
  "fit", "exp");

pause
clf

plot2(X, y1, y2, X_err, y1_err, y2_err,
  "Grafico 2: Valores de Potencia Util Pu e Potencia Total Pt em funcao da Resistencia R", 
  "Resistencia R (Ohm)",
  "Potencia Pu, Pt (W)",
  "Potencia Util Pu", "Potencia Total Pt",
  "grid", "on",
  "fit", "exp");

# Descomente a linha abaixo para pausar a execuçao e ver o grafico
# pause