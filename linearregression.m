basketball = importfile("C:\Downloads\nba-salaries-prediction-in-20172018-season\basketball.csv", [2, Inf]);
y = table2array(basketball(: , 2));
x = table2array(basketball(:, 7:20));
m=length(y);
y = y./1000000;
combined = [x y];

%[x ,mu ,sigma] = NormalizeFeatures(x);

%x = [ones(m, 1) x];
    
alpha = 0.01;
num_iters = 1000;

[trainedModel, RMSE] = RegressionModel(combined);
fprintf('RMSE of the given model is %f\n' ,  RMSE);
yPred = trainedModel.predictFcn(x);

fprintf('We will now see various scatter plots and their analysis\n');
fprintf('Click any key to continue\n\n');

figure(1);
set(gcf, 'Position',  [100, 100, 1300, 600])

subplot(2,4,1);
scatter(x(:,1),y,25);
xlabel('Games Played');
ylabel('Salary (in million USD)');

subplot(2,4,2); 
scatter(x(:,3),y);
PER = (x(:,3));
%hold on;
%mdl = fitlm(x(:,3),y);
%plot(x(:,3), predict(mdl,x(:,3)));
xlabel('Player Efficiency Rating');

subplot(2,4,3); 
scatter(x(:,4),y);
xlabel('True Shooting%');

subplot(2,4,4); 
scatter(x(:,9),y);
xlabel('Total Rebound%');

subplot(2,4,5); 
scatter(x(:,10),y);
xlabel('Assist%');
ylabel('Salary (in million USD)');

subplot(2,4,6); 
scatter(x(:,11),y);
xlabel('Steal%');

subplot(2,4,7); 
scatter(x(:,12),y);
xlabel('Block%');

subplot(2,4,8); 
scatter(x(:,14),y);
xlabel('Usage%');

fprintf('From the above scatter plots we conclude that there is a definite linear relation between\n');
fprintf('player efficiency raing and salary. There also seems to be a rough linear relation \n');
fprintf('between player salary with shooting and steal percentages. \n\n');

age = table2array(basketball(:,5));

fprintf('click any key to continue\n\n');
figure(2);
subplot(1,2,1);
histogram(age);
xlabel('age');
ylabel('salary in million USD');

subplot(1,2,2);
scatter(age,y);
xlabel('age');

fprintf('We note that although most players in the NBA are around the age of 25 years old players between the\n');
fprintf('age of 28 and 33 have higher salaries than others. We can conclude that most players reach their\n');
fprintf('prime at this age and hence are paid higher\n\n');

figure(3);
set(gcf, 'Position',  [100, 100, 900, 600])
scatter(age,x(:,5));
xlabel('age');
ylabel('free throw rate');

fprintf('One could expect for 3 point accuracy to increase with age, however no such correlation is seen\n');
fprintf('We can say that the 3 pointer is a pretty popular shot in the NBA. \n\n');

choice = ' ';
prompt = 'Let us now predict the salary of a player with given attributes Type ''y'' to proceed,''n'' to skip.\n';
choice = input (prompt);

while choice=='y'
    
    fprintf('Enter the following attributes in given order\n ');
    fprintf('G	MP	PER	  TS%%	3PAr	FTr	  ORB%%	DRB%%	TRB%%	AST%%	STL%%	BLK%%	TOV%%	USG%% \n\n');
    predict_case = [];
    limit=14;
    n=1;
    while n<=limit
      predict_case(1,n)=input(' ');
      n=n+1;
    end
    salary_predicted = trainedModel.predictFcn(predict_case);
    fprintf('Predicted salary of the player in million USD is %d\n' , salary_predicted);
    choice = input('again? ''y''/''n''  \n');
end

fprintf('Now for a question...Does the past affect the present? We will see how draft pick affected player salary\n');
fprintf('and efficiency (PER)');
draft_pick = table2array(basketball(:,4));
figure(4);
sz = 25;
scatter3(draft_pick,PER,y,sz);
xlabel('Draft pick');
ylabel('PER');
zlabel('Salary');
fprintf('Although a better draft pick indicates a somewhat better salary, quite a number of instances are seen \n');
fprintf('where bad draft picks are getting good salaries over 10 million USD and better PER, while better draft picks \n');
fprintf('getting less. So a player who was relatively good in college need not be so in the NBA. ');




    




