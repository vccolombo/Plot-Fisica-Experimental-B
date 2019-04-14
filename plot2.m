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
  
  # Polinomial Fit part
  x = linspace(min(X), max(X), 101);
  p1 = splinefit(X, Y1, breaks = 10);
  y1 = ppval(p1, x);
  plot(x, y1, '-', "color", color1);
  
  p2 = splinefit(X, Y2, breaks = 10);
  y2 = ppval(p2, x);
  plot(x, y2, '-', "color", color2);
  # End Polinomial Fit Part
  
  # Parameters part
  [a, b] = plotInterval(X); # Choose Interval of graph

  title(tit);
  xlabel(xl);
  xlim([a, b]);
  ylabel(yl);
  legend(h, leg1, leg2);
  set(h(1), 
    "color", color1,
    "marker", marker1,
    "linestyle", "none");
  set(h(2), 
    "color", color2,
    "marker", marker2,
    "linestyle", "none");
endfunction