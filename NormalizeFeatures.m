function [normx , mu, sig] = NormalizeFeatures(x)
%UNTITLED Summary of this function goes here  : to normalize the features
%   Detailed explanation goes here 

normx = x;
mu = zeros(1, size(x, 2));
sig = zeros(1, size(x, 2));

mu=mean(x);
sig = std(x);
normx = (x - mu)./sig;
end

