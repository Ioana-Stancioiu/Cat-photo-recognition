function [sol] = rgbHistogram(path_to_image, count_bins)
    image = imread(path_to_image);

    %matricile R G B devin vectori linie
    R = reshape(image(:,:,1),1,[]);
    G = reshape(image(:,:,2),1,[]);
    B = reshape(image(:,:,3),1,[]);

    %intervalul de cautare
    interval = [0:256/count_bins:(count_bins-1)*256/count_bins+256/count_bins];

    HR = histc(R,interval);
    HG = histc(G,interval);
    HB = histc(B,interval);

    %se elimina ultimul element din vectorul generat de histc
    HR = HR(1:count_bins);
    HG = HG(1:count_bins);
    HB = HB(1:count_bins);

    sol = [HR HG HB];
endfunction