function [Q, R] = Householder(A)
    [n m] = size(A);
    %Q = In
    Q = eye(n);
    max_iter = min(n-1,m);
    for p=1:max_iter
        sigma = norm(A(p:n,p));

        if A(p,p) < 0
            sigma = -sigma;
        endif

        %calculare reflector Householder
        vp = zeros(n,1);
        vp(p) = A(p,p) + sigma;
        vp(p+1:n) = A(p+1:n,p);

        sigma_p = sigma * vp(p);

        if sigma_p != 0
            A(p,p) = -sigma;
            A(p+1:n,p) = 0;
        endif

        %se aplica reflectorul pe matricea A
        for i=p+1:m
            k = vp(p:n)' * A(p:n,i) / sigma_p;
            A(p:n,i) = A(p:n,i) - k * vp(p:n);
        endfor

        for i=1:n
            k = vp(p:n)' * Q(p:n,i) / sigma_p;
            Q(p:n,i) = Q(p:n,i) - k * vp(p:n);
        endfor
    endfor
    R = A;
    Q = Q';
endfunction