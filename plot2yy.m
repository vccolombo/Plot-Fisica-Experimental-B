# Plota duas curvas, sendo Y1 o eixo Y da esquerda e Y2 o eixo Y da direita
# tit = titulo
# xl = Nome do eixo X
# yl1 = Nome do eixo Y da esquerda
# yl2 = Nome do eixo Y da direita
# leg1 = Legenda da curva Y1
# leg2 = Legenda da curva Y2
# color1 = Cor da curva Y1
# color2 = Cor da curva Y2
# marker1 = Simbolos dos pontos da curva Y1
# marker2 = Simbolos dos pontos da curva Y2
function plot2yy(X, Y1, Y2, 
  X_err, Y1_err, Y2_err, 
  tit, 
  xl, yl1, yl2, 
  leg1, leg2, 
  fit = true,
  color1 = "b", color2 = "r",
  marker1 = ".", marker2 = "o")
  
  [ax, g1, g2] = plotyy(X, Y1, X, Y2);
  set(ax, {'ycolor'}, {color1; color2});
  set(g1, "linestyle", "none");
  set(g2, "linestyle", "none");
  
  
  hold on;
  h(1) = errorbar(ax(1), X, Y1, X_err, X_err, Y1_err, Y1_err, "~>");
  h(2) = errorbar(ax(2), X, Y2, X_err, X_err, Y2_err, Y2_err, "~>");
  
  if (fit == true)
    # Polinomial Fit part
    x = linspace(min(X), max(X), 101);
    p1 = splinefit(X, Y1, breaks = 10);
    y1 = ppval(p1, x);
    plot(ax(1), x, y1, '-', "color", color1);
    
    p2 = splinefit(X, Y2, breaks = 10);
    y2 = ppval(p2, x);
    plot(ax(2), x, y2, '-', "color", color2);
    # End Polinomial Fit Part
  endif
 
  [a, b] = plotInterval(X);

  title(tit);
  xlabel(xl);
  xlim(ax(1), [a, b]);
  xlim(ax(2), [a, b]);
  ylabel(ax(1), yl1);
  ylabel(ax(2), yl2);
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