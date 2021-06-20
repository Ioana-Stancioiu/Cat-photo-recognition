function [cost] = compute_cost_pc(points, centroids)
    [rows,columns] = size(points);
    NC = size(centroids,1);

    distArray = zeros(NC,1);
    for i=1:rows
        minDist = realmax;
        for j=1:NC
            dist = sqrt(sum((points(i,:) - centroids(j,:)).^2));
            if dist < minDist
                minDist = dist;
            endif
        endfor
        distArray(i) = minDist;
    endfor
    cost = sum(distArray);
endfunction

