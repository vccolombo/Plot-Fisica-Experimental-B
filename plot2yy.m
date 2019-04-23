# Plota duas curvas, sendo Y1 o eixo Y da esquerda e Y2 o eixo Y da direita
# tit = titulo / title
# xl = Nome do eixo X / X axis label
# yl1 = Nome do eixo Y da esquerda / left Y axis label
# yl2 = Nome do eixo Y da direita / right Y axis label
# leg1 = Legenda da curva Y1 / Y1 legend
# leg2 = Legenda da curva Y2 / Y2 legend
# color1 = Cor da curva Y1 / Y1 curve color
# color2 = Cor da curva Y2 / Y2 curve color
# marker1 = Simbolos dos pontos da curva Y1 / Y1 marker
# marker2 = Simbolos dos pontos da curva Y2 / Y2 marker
function plot2yy(X, Y1, Y2, 
  X_err, Y1_err, Y2_err, 
  tit, 
  xl, yl1, yl2, 
  leg1, leg2, 
  varargin = {})
  
  # input parsing
  fit    = "no"; # does not fit by default
  color1 = "r";
  color2 = "b";
  marker1  = ".";
  marker2  = "o";
  
  for argidx = 1:2:length(varargin)
    switch varargin{argidx}
      case "fit"
        fit = varargin{argidx+1};
      case "color1"
        color1 = varargin{argidx+1};
      case "color2"
        color2 = varargin{argidx+1};
      case "marker1"
        marker1 = varargin{argidx+1};
      case "marker2"
        marker2 = varargin{argidx+1};
    endswitch
  endfor 
  # end of input parsing
  
  [ax, g1, g2] = plotyy(X, Y1, X, Y2);
  set(ax, {'ycolor'}, {"k"; "k"}); # set color of axis
  # turn off 'point to point' connections:
  set(g1, "linestyle", "none"); 
  set(g2, "linestyle", "none");
  
  
  hold on;
  h(1) = errorbar(ax(1), X, Y1, X_err, X_err, Y1_err, Y1_err, "~>");
  h(2) = errorbar(ax(2), X, Y2, X_err, X_err, Y2_err, Y2_err, "~>");
  
  if (strcmp(fit, "exp")) # plot a exponential fit if requested
    x = linspace(min(X), max(X), 101);
    p1 = splinefit(X, Y1, breaks = 10);
    y1 = ppval(p1, x);
    plot(ax(1), x, y1, '-', "color", color1);
    
    p2 = splinefit(X, Y2, breaks = 10);
    y2 = ppval(p2, x);
    plot(ax(2), x, y2, '-', "color", color2);
  endif
  
  if (strcmp(fit, "linear")) # plot a linear fit if requested
    theta1 = linReg(X, Y1);
    y1 = theta1(1) + theta1(2)*X;
    plot(ax(1), X, y1, '-', "color", color1);
    
    theta2 = linReg(X, Y2);
    y2 = theta2(1) + theta2(2)*X;
    plot(ax(2), X, y2, '-', "color", color2);
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