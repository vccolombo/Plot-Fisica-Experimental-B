# Plota duas curvas, com Y1 e Y2 no mesmo eixo e escala
# Plot two curves, Y1 and Y2 on the same axis and scale
# tit = titulo / title
# xl = Nome do eixo X / X axis label
# yl = Nome do eixo Y da esquerda / left Y axis label
# leg1 = Legenda da curva Y1 / Y1 legend
# leg2 = Legenda da curva Y2 / Y2 legend
# varargin possible arguments:
# color1 = Cor da curva Y1 / Y1 curve color
# color2 = Cor da curva Y2 / Y2 curve color
# marker1 = Simbolos dos pontos da curva Y1 / Y1 marker
# marker2 = Simbolos dos pontos da curva Y2 / Y2 marker
# grid = Desenhar o grid no plot / grid on/off
function plot2(X, Y1, Y2, 
  X_err, Y1_err, Y2_err, 
  tit, 
  xl, yl, 
  leg1, leg2, 
  varargin)
  
  # input parsing
  fit    = "no"; # does not fit by default
  color1 = "r";
  color2 = "b";
  marker1  = ".";
  marker2  = "o";
  gridplot = "off";
  
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
      case "grid"
        gridplot = varargin{argidx+1};
    endswitch
  endfor 
  # end of input parsing
  
  hold on;
  h(1) = errorbar(X, Y1, X_err, X_err, Y1_err, Y1_err, "~>");
  h(2) = errorbar(X, Y2, X_err, X_err, Y2_err, Y2_err, "~>");
  
  if (strcmp(fit, "exp")) # plot a exponential fit if requested
    x = linspace(min(X), max(X), 101);
    p1 = splinefit(X, Y1, breaks = 10);
    y1 = ppval(p1, x);
    plot(x, y1, '-', "color", color1);
    
    p2 = splinefit(X, Y2, breaks = 10);
    y2 = ppval(p2, x);
    plot(x, y2, '-', "color", color2);
  endif
  
  if (strcmp(fit, "linear")) # plot a linear fit if requested
    theta1 = linReg(X, Y1);
    y1 = theta1(1) + theta1(2)*X;
    plot(X, y1, '-', "color", color1);
    
    theta2 = linReg(X, Y2);
    y2 = theta2(1) + theta2(2)*X;
    plot(X, y2, '-', "color", color2);
  endif
  
  # Parameters part
  [a, b] = plotInterval(X); # Choose Interval of graph

  title(tit);
  xlabel(xl);
  xlim([a, b]);
  ylabel(yl);
  legend(h, leg1, leg2); # TODO fix legend add curve legend
  set(h(1), 
    "color", color1,
    "marker", marker1,
    "linestyle", "none");
  set(h(2), 
    "color", color2,
    "marker", marker2,
    "linestyle", "none");
    
  if (strcmp(gridplot, "on"))
    grid on;
  endif
endfunction