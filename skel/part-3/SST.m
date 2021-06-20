function [x] = SST(A, b)
    [n,m] = size(A);
    x = zeros(m,1);
    for i=m:-1:1
        for j=(i+1):m
            b(i) = b(i) - A(i,j)*x(j);
        endfor
        x(i) = b(i)/A(i,i);
    endfor
endfunction