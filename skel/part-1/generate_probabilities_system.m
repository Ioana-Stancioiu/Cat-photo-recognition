function [A, b] = generate_probabilities_system(rows)
    n = (rows * (rows + 1))/2;
    b = zeros(n,1);
    b((n-rows+1):n) = 1;
    A = zeros(n);
    k = 0;
    for i=1:rows
        for j=1:i
            k++;
            if (i == 1)
                A(i,i) = 4;
                A(i,i+1) = -1;
                A(i,i+2) = -1;
            elseif (i == rows)
                if (j == 1)
                    A(k,k) = 4;
                    A(k,k-i+1) = -1;
                    A(k,k+1) = -1;
                elseif (j == i)
                    A(k,k) = 4;
                    A(k,k-i) = -1;
                    A(k,k-1) = -1;
                else
                    A(k,k) = 5;
                    A(k,k-i+1) = -1;
                    A(k,k-i) = -1;
                    A(k,k+1) = -1;
                    A(k,k-1) = -1;
                endif
            elseif (j == 1)
                A(k,k) = 5;
                A(k,k-i+1) = -1;
                A(k,k+1) = -1;
                A(k,k+i) = -1;
                A(k,k+i+1) = -1;
            elseif (j == i)
                A(k,k) = 5;
                A(k,k-i) = -1;
                A(k,k-1) = -1;
                A(k,k+i) = -1;
                A(k,k+i+1) = -1;
            else
                A(k,k) = 6;
                A(k,k-i) = -1;
                A(k,k-i+1) = -1;
                A(k,k+1) = -1;
                A(k,k-1) = -1;
                A(k,k+i) = -1;
                A(k,k+i+1) = -1;
            endif
        endfor
    endfor

endfunction