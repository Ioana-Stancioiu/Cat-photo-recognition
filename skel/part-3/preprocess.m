function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
    path_cats = strcat(path_to_dataset, 'cats/');
    path_not_cats = strcat(path_to_dataset, 'not_cats/');
    cats = getImgNames(path_cats);
    not_cats = getImgNames(path_not_cats);

    n1 = length(cats);
    n2 = length(not_cats);
    N = n1 + n2;
    M = count_bins*3;

    X = zeros(N,M);
    y = zeros(N,1);

    for i=1:n1
        path = strcat(path_cats,cats(i,:));
        if (histogram == 'RGB')
            X(i,:) = rgbHistogram(path,count_bins);
        else
            X(i,:) = hsvHistogram(path,count_bins);
        endif
    endfor
    y(1:n1) = 1;
    k = 1;
    for i=n1+1:N
        path = strcat(path_not_cats,not_cats(k,:));
        if (histogram == 'RGB')
            X(i,:) = rgbHistogram(path,count_bins);
        elseif (histogram == 'HSV')
            X(i,:) = hsvHistogram(path,count_bins);
        endif
        k++;
    endfor
    y(n1+1:N) = -1;
endfunction
