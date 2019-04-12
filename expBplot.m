fileName = "Planinha_Experimento4.ods";
planilha = "Planilha1";
cells = "A9:L58";

# TODO: checar se ja instalou, e instalar se nao
pkg load io
data = odsread(fileName, planilha, cells);

X_column = 1;
X = data(:, X_column);

X_err_column = 2;
X_err = data(:, X_err_column);

y1_column = 7;
y1 = data(:, y1_column);
y1_err_column = 8;
y1_err = data(:, y1_err_column);

plot1 = errorbar(X, y1, X_err, X_err, y1_err, y1_err, "~>");
set(plot1, 
  "color", "k", 
  "marker", ".", 
  "markersize", 6,
  "linestyle", "-",
  "linewidth", 1);
title("Titulo");
xlabel("Eixo X");
ylabel("Eixo Y");
legend("Legenda1");

#pause