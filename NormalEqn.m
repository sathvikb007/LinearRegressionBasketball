function [theta] = NormalEqn(x,y)
%UNTITLED Summary of this function goes here theta by normal equation
%   Detailed explanation goes here
theta = pinv(x' * x) * x' * y;
end

