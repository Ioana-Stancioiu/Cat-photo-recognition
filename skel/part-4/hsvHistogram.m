function [sol] = hsvHistogram(path_to_image, count_bins)
    image = imread(path_to_image);
    hsvimage = RGB2HSV(image);

    %matricile H S V devin vectori linie
    H = reshape(hsvimage(:,:,1),1,[]);
    S = reshape(hsvimage(:,:,2),1,[]);
    V = reshape(hsvimage(:,:,3),1,[]);

    %intervalul de cautare
    interval = [0:1.01/count_bins:(count_bins-1)*1.01/count_bins+1.01/count_bins];

    HH = histc(H,interval);
    HS = histc(S,interval);
    HV = histc(V,interval);

    %se elimina ultimul element din vectorul generat de histc
    HH = HH(1:count_bins);
    HS = HS(1:count_bins);
    HV = HV(1:count_bins);

    sol =[HH HS HV];
endfunction