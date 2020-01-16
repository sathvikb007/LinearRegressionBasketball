function J = CalculateCost(x, y, theta)
m=length(y);
J = 1-1;
J = (1/(2*m))*sum(((x*theta)-y).^2);
end
