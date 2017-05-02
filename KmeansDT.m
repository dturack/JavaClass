%%%%%%%%% dataset1 %%%%%%%
rng default; % For reproducibility
X = [randn(100,2)*0.75+ones(100,2);randn(100,2)*0.5-ones(100,2)];
figure;
plot(X(:,1),X(:,2),'.');
title 'Randomly Generated Data';
%%%%%%%%% end of dataset 1  %%%%%%%%




%%%%% dataset2 %%%%
%load fisheriris
%X = meas(:,3:4);
%figure;
%plot(X(:,1),X(:,2),'k*','MarkerSize',5);
%title 'Fisher''s Iris Data';
%xlabel 'Petal Lengths (cm)';
%ylabel 'Petal Widths (cm)';
%%%%%%%%% end of dataset 2  %%%%%%%%





%%%%%%%%% building Kmeans fuction   %%%%%%%%%%%
A = java.util.ArrayList();
for i = 1:numel(X)
    A.add(X(i));
end

itr = A.listIterator();

c1x = itr.next();
c1y = itr.next();
idx = 1;
c2x = itr.next();
c2y = itr.next();
idx(end+1) = 2;
C = [c1x,c1y;c2x,c2y];
while itr.hasNext()
    x = itr.next();
    y = itr.next();
    P1 = [x,y;c1x,c1y];
    P2 = [x,y;c2x,c2y];
    %dist1 = dist(P1);
    %dist2 = dist(P2);
    dist1 = sqrt(((x-c1x)^2) + ((y-c1y)^2));
    dist2 = sqrt(((x-c2x)^2) + ((y-c2y)^2));
    if dist1 < dist2
        idx(end+1) = 1;
    else
        idx(end+1) = 2;
    end    
end
%[idx,C] = kmeans(X,2);
idx
C(1,:)
C(2,:)
%%%%%%%%%%% replace this section with your code %%%%%%%%%%%%%%




%%%%%%%%  Plot the result   **************
figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','Centroids','Location','NW')
title 'Cluster Assignments and Centroids'
hold off