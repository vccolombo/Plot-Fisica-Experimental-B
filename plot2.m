# Plota duas curvas, com Y1 e Y2 no mesmo eixo e escala
# tit = titulo
# xl = Nome do eixo X
# yl1 = Nome do eixo Y
# leg1 = Legenda da curva Y1
# leg2 = Legenda da curva Y2
# color1 = Cor da curva Y1
# color2 = Cor da curva Y2
# marker1 = Simbolos dos pontos da curva Y1
# marker2 = Simbolos dos pontos da curva Y2
function plot2(X, Y1, Y2, 
  X_err, Y1_err, Y2_err, 
  tit, 
  xl, yl, 
  leg1, leg2, 
  color1 = "b", color2 = "r",
  marker1 = ".", marker2 = "o")
  
  hold on;
  h(1) = errorbar(X, Y1, X_err, X_err, Y1_err, Y1_err, "~>");
  h(2) = errorbar(X, Y2, X_err, X_err, Y2_err, Y2_err, "~>");
  
  [a, b] = plotInterval(X);

  title(tit);
  xlabel(xl);
  xlim([a, b]);
  ylabel(yl);
  legend(h, leg1, leg2);
  set(h(1), 
    "color", color1,
    "marker", marker1);
  set(h(2), 
    "color", color2,
    "marker", marker2);
endfunction