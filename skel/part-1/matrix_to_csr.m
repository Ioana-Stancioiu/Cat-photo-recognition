function [values, colind, rowptr] = matrix_to_csr(A)
    n = size(A);
    nz = 0;
    k = 0;
    for i=1:n
        z = 0;
        for j=1:n
            if (A(i,j) != 0)
                z++;
                nz++;
                values(nz) = A(i,j);
                colind(nz) = j;
                if (z == 1)
                    k++;
                    rowptr(k) = nz;
                endif
            endif
        endfor
    endfor
    rowptr(n+1) = nz + 1;
endfunction