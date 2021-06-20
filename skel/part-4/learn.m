function [w] = learn(X, y, lr, epochs)
    [N M] = size(X);
    k = [1:M];
    X(:,k) = (X(:,k) - mean(X(:,k))) ./ std(X(:,k));
    X(:,M+1) = 1;

    batch_size = 64;
    %initializare w cu valori intre -0.1 si 0.1
    w = randi([-100 100],M+1,1);
    w = w/1000;

    for epoch=1:epochs
        %se aleg linii random din X si y
        k = randperm(N,batch_size);
        x_b = X(k,:);
        y_b = y(k);
        sum = 0;
        for i=1:M+1
            for j=1:batch_size
                sum = sum + ((x_b(j,:) * w - y_b(j)) * x_b(j,i));
            endfor
            w(i) = w(i) - lr * 1/N * sum;
        endfor
    endfor
endfunction
