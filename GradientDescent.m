function [theta, J_history] = GradientDescent(x, y, theta, alpha, num_iters)
% Performs gradient descent to learn theta
m=length(y);
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    theta = theta - (alpha/m)*(x')*(x*theta - y);    
    J_history(iter) = CalculateCost(x, y, theta);

end

end
