function [centroids] = clustering_pc(points, NC)
    [rows,columns]=size(points);

    %initializare centroids
    centroids=zeros(NC,columns);
    k = 0;
    for j=1:NC
        nr = 0;
        for i=1:rows
            if (mod(i-k,NC) == 0)
                centroids(j,:) += points(i,:);
                nr++;
            endif
        endfor
        centroids(j,:) = centroids(j,:) / nr;
        k++;
    endfor

    while 1
        clusterSum = zeros(NC,columns);
        clusterSize = zeros(NC,1);
        for i=1:rows
            minDist = realmax;
            assignedTo = 0;
            for j=1:NC
                %distanta de la punct la centroid
                dist = sqrt(sum((points(i,:) - centroids(j,:)).^2));
                %se calculeaza distanta minima de la punct la centroizi
                if dist < minDist
                    minDist = dist;
                    %punct asignat centroidului j
                    assignedTo = j;
                endif
            endfor
            clusterSum(assignedTo,:) += points(i,:);
            clusterSize(assignedTo)++;
        endfor

        newCentroids = zeros(NC,columns);
        %se calculeaza noua matrice centroids
        for i=1:NC
            newCentroids(i,:) = clusterSum(i,:) / clusterSize(i);
        endfor

        %diferenta dintre matricea noua de centroizi si cea veche
        diff = sum(sum(abs(newCentroids - centroids)));

        %daca diferenta este destul de mica se opreste iterarea
        if diff < eps
            break;
        endif

        centroids = newCentroids;
    endwhile
endfunction


