function plot2yy(X, Y1, Y2, X_err, Y1_err, Y2_err, tit, xl, yl1, yl2, leg1, leg2)
  ax = plotyy(X, Y1, X, Y2);
  hold(ax(1), 'on');
  errorbar(ax(1), X, Y1, X_err, X_err, Y1_err, Y1_err, "~>");
  hold(ax(2), 'on');
  errorbar(ax(2), X, Y2, X_err, X_err, Y2_err, Y2_err, "~>");

  [a, b] = plotInterval(X);

  title(tit);
  xlabel(xl);
  xlim(ax(1), [a, b]);
  xlim(ax(2), [a, b]);
  ylabel(ax(1), yl1);
  ylabel(ax(2), yl2);
  legend(leg1, leg2);
endfunction