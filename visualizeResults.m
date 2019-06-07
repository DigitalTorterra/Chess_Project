%visualizeResults.m
%
%Reads in the results from running tests, creates visualizations

%read in the data-data is a 4x4x3 array. Rows represent white, columns
%represent black. The first sheet(:,:,1) corresponds to the number of wins
%white has, second to number of wins black has, and third to number of
%draws
load('results.mat','resultStorage');

%% Reorganize Data

%the different strategy names
strategies = {'Random','Piece Addition','Piece-Square Tables','Hybrid'};

%iterate through the data
for i = 1:4
    results(i).sName = strategies{i};
    results(i).performance = zeros(3,4);
    %structure of results(i).performance: 3x4 array-each row corresponds to
    %a strategy. Column 1 is the index of the strategy, column 2 is the
    %number of wins strategy i has over the row's strategy, column 3 is the
    %number of wins the row's strategy has over strategy i, and column 4 is
    %the number of draws between the two.
    
    counter = 0;
    for j = 1:4
        if j ~= i
            counter = counter+1;
            results(i).performance(counter,1) = j;
            results(i).performance(counter,2) = resultStorage(i,j,1)+resultStorage(j,i,2);
            results(i).performance(counter,3) = resultStorage(i,j,2)+resultStorage(j,i,1);
            results(i).performance(counter,4) = resultStorage(i,j,3)+resultStorage(j,i,3);
        end
    end
end

%% Plot Result

%create 4 subplots, one for each strategy
for i = 1:4
    subplot(2,2,i)
    
    x = results(i).performance(:,1);
    labels = {};
    for j=1:3
        labels{j} = strategies{x(j)};
    end
    
    y = results(i).performance(:,2:4);
    
    bar(categorical(labels),y)
    title(results(i).sName)
    ylabel('# of Games')
end

legend('Wins','Losses','Draws')