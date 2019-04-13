function [a, b] = plotInterval(X)
  L = 21; # folha A4
  minimum = min(X);
  maximum = max(X);
  D = ceil(maximum / L);
  Vmax = L*D;
  extra = Vmax - maximum;
  
  a = minimum - extra;
  b = maximum + extra;
endfunction