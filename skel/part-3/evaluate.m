function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
    [X y] = preprocess(path_to_testset,histogram,count_bins);
    [N M] = size(X);
    %X devine X tilda
    X(:,M+1) = 1;

    percentage = 0;
    for i=1:N
        y_w = w'* X(i,:)';
        if (y_w >= 0 && y(i) > 0)
            percentage++;
        elseif (y_w < 0 && y(i) < 0)
            percentage++;
        endif
    endfor
    percentage = percentage/N;
endfunction