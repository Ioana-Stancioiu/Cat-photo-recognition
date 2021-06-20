function [hsv] = RGB2HSV(rgb)
    [n,m,t] = size(rgb);
    hsv = zeros(n,m,t);
    rgb = double(rgb)/255;

    %matricile R G B devin vectori coloana
    R = rgb(:,:,1);
    R = reshape(R,[],1);
    G = rgb(:,:,2);
    G = reshape(G,[],1);
    B = rgb(:,:,3);
    B = reshape(B,[],1);

    %v este C_max
    v = max(max(R,B),G);
    %s este delta
    s = (v - min(min(R,G),B));
    h = zeros(size(v));

    z = ~s;
    %elem 0 din s devin 1
    s = s + z;

    k = find(R == v);
        h(k) = 60 * mod((G(k) - B(k)) ./ s(k),6);
    k = find(G == v);
        h(k) = 60 * (2 + (B(k) - R(k)) ./ s(k));
    k = find(B == v);
        h(k) = 60 * (4 + (R(k) - G(k)) ./ s(k));
    h = h / 360;
    %h este 0 daca delta este 0
    h = (~z) .* h;

    k = find(v);
        %delta/C_max
        s(k) = s(k) ./ v(k);
    k = find(~v);
        %0 unde C_max este 0
        s(k) = 0;

    hsv(:,:,1) = reshape(h,n,m);
    hsv(:,:,2) = reshape(s,n,m);
    hsv(:,:,3) = reshape(v,n,m);
endfunction