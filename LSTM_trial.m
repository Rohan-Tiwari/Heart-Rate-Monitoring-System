Xtrain = readtable('C:\Users\brtiw\OneDrive\Desktop\MS - HIS - Sem 1\SCS notes\Data For H.E.R.M\FITBIT DATA\data1.csv','Range','A1:B1000');
Ytrain = readtable('C:\Users\brtiw\OneDrive\Desktop\MS - HIS - Sem 1\SCS notes\Data For H.E.R.M\FITBIT DATA\data1.csv','Range','B1:B1000');
%tbl = readtable('C:\Users\brtiw\OneDrive\Desktop\MS - HIS - Sem 1\SCS notes\Data For H.E.R.M\FITBIT DATA\data1.csv')

Xtest = readtable('C:\Users\brtiw\OneDrive\Desktop\MS - HIS - Sem 1\SCS notes\Data For H.E.R.M\FITBIT DATA\data1.csv','Range','A1000:B1440');
Ytest = readtable('C:\Users\brtiw\OneDrive\Desktop\MS - HIS - Sem 1\SCS notes\Data For H.E.R.M\FITBIT DATA\data1.csv','Range','B1000:B1440');


C = table2cell(Xtrain);
%disp(C)
C = C';
%disp(C);
Xdata = [C{:,:}];
%disp(Xdata);

D = table2cell(Ytrain);
D = D';
Ydata = [D{1,:}];
%disp(Ydata);

% y = categorical(Ytrain.Var1);
% %disp(y);

inputSize = 2;
numResponse = 1;
numHiddenUnit = 100;

layers = [ sequenceInputLayer(2)
    lstmLayer(numHiddenUnit)
    fullyConnectedLayer(numResponse)
    regressionLayer
    ];

opts = trainingOptions( 'adam', ...
    'MaxEpochs',1000, ...
    'GradientThreshold',0.01, ...
    'InitialLearnRate',0.0001);
E = table2array(Xtrain);

W = table2array(Xtest);
net = trainNetwork(E',Ydata, layers,opts); 

YPred1 = predict(net, W');

figure,
plot(YPred1, 'r-*','LineWidth',1), hold on
plot((table2array(Ytest))', 'g-*', 'LineWidth', 1); hold all;
xlabel('sample')
ylabel('calories burnt')
grid on
legend('Predicted','original');
title('Performance');



