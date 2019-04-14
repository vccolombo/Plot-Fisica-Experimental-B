function [a, b] = plotInterval(X)
# TODO correct interval
  L = 70;
  minimum = min(X);
  maximum = max(X);
  D = ceil(maximum / L);
  Vmax = L*D;
  extra = Vmax - maximum;
  
  a = minimum - extra;
  b = maximum + extra;
endfunction