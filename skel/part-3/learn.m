function [w] = learn(X, y)
    [N M] = size(X);

    %X devine X tilda
    X(:,M+1) = 1;

    [Q R] = Householder(X);
    b = Q'*y;
    w = SST(R,b);
endfunction
