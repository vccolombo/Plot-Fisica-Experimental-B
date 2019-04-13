# Plota duas curvas, com Y1 e Y2 no mesmo eixo e escala
# tit = titulo
# xl = Nome do eixo X
# yl1 = Nome do eixo Y
# leg1 = Legenda da curva Y1
# leg2 = Legenda da curva Y2
function plot2(X, Y1, Y2, X_err, Y1_err, Y2_err, tit, xl, yl, leg1, leg2)
  hold on;
  errorbar(X, Y1, X_err, X_err, Y1_err, Y1_err, "~>");
  errorbar(X, Y2, X_err, X_err, Y2_err, Y2_err, "~>");

  [a, b] = plotInterval(X);

  title(tit);
  xlabel(xl);
  xlim([a, b]);
  ylabel(yl);
  legend(leg1, leg2);
endfunction