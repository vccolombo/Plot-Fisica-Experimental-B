# Function that does the linear regression and return theta
# Linear Regression is of type y = ax + b
# theta(1) = b, theta(2) = a
function theta = linReg(x, Y)
  m = length(x);
  X = [ones(m, 1) x];
  
  theta = (pinv(X'*X))* X' *Y;
endfunction