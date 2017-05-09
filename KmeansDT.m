%%%%%%%%% dataset1 %%%%%%%
rng default; % For reproducibility
rng('shuffle');
X = [randn(100,2)*0.75+ones(100,2);randn(100,2)*0.5-ones(100,2)]
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
for i = 1:(numel(X)/2)
    A.add(X(i));
    A.add(X(i+numel(X)/2));
end

j = 0;
while j<10
itr = A.listIterator();

if j==0
    idx2 = 0;
rng('shuffle'); %to randomize
c1x = 4.0*rand(1,1)-2.0;
c1y = 4.0*rand(1,1)-2.0;
c2x = 4.0*rand(1,1)-2.0;
c2y = 4.0*rand(1,1)-2.0;
avg1x = c1x;
avg1y = c1y;
avg2x = c2x;
avg2y = c2y;
else
    c1x = avg1x;
    c1y = avg1y;
    c2x = avg2x;
    c2y = avg2y;
end
    count1 = 1;
    count2 = 1;
    C = [c1x,c1y;c2x,c2y];
    count = 0;
while itr.hasNext()
    x = itr.next();
    y = itr.next();
    dist1 = sqrt(((x-c1x)^2) + ((y-c1y)^2));
    dist2 = sqrt(((x-c2x)^2) + ((y-c2y)^2));
    if dist1 < dist2
        if count == 0
            idx = 1;
            count = 1;
        else
            idx(end+1) = 1;
        end
        count1 = count1 + 1;
        avg1x = avg1x+x;
        avg1y = avg1y+y;
    else
        if count == 0
            idx = 2;
            count = 1;
        else
            idx(end+1) = 2;
        end
        count2 = count2 + 1;
        avg2x = avg2x+x;
        avg2y = avg2y+y;
    end    
end
%idx;
C(1,:)
C(2,:)
avg1x = avg1x/count1;
avg1y = avg1y/count1;
avg2x = avg2x/count2;
avg2y = avg2y/count2;

%%%%%%%%%%% replace this section with your code %%%%%%%%%%%%%%




%%%%%%%%  Plot the result
figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','Centroids','Location','NW')
title 'Cluster Assignments and Centroids'
hold off
if sum(abs(idx-idx2)>0)<1
    j = 20;
else
    j = j+1;
end
idx2 = idx;
end