fileName = "Planinha_Experimento4.ods";
planilha = "Planilha1";
cells = "A9:L58";

# TODO: checar se ja instalou e instalar se nao
pkg load io
data = odsread(fileName, planilha, cells);

X_column = 1;
X = data(:, X_column);

y1_column = 7;
y1 = data(:, y1_column);

plot(X, y1, ".", "markersize", 10, "color", "k", "linestyle", '-', "linewidth", 2);

