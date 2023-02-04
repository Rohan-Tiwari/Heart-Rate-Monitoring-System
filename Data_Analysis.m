calories_data = readtable("C:\Users\brtiw\OneDrive\Desktop\MS - HIS - Sem 1\SCS notes\Data For H.E.R.M\Kaggle Data\calories.csv");
exercise_data = readtable("C:\Users\brtiw\OneDrive\Desktop\MS - HIS - Sem 1\SCS notes\Data For H.E.R.M\Kaggle Data\exercise.csv");
new_exercise_data = readtable("C:\Users\brtiw\OneDrive\Desktop\MS - HIS - Sem 1\SCS notes\Data For H.E.R.M\Kaggle Data\new_exercise.csv");

% combining data 
combined_data = innerjoin(calories_data, exercise_data);
whos combined_data.Age
% disp(head(combined_data, 5));
%missing_values = ismissing(combined_data)

% plotting categorical data in matlab
x = categorical(combined_data.Gender);
%histogram(x)
a = categorical( 0:10:100);
y = discretize(combined_data.Age,[10 20 30 40 50 60 70 80 90],'categorical',{'10','20', '30','40','50','60', '70','80'});
summary(y)
%histogram(y)
%histogram(categorical(combined_data.Age))
x = combined_data.Height
%y = normpdf(x,0,10);
%plot(x,y);

% getting correlation of the data so as to select the features which are
% more related to calories burnt
corrplot(exercise_data);
C = cov(exercise_data.Height, exercise_data.Calories);

%plotting individual correlation
%alpha= corrplot(exercise_data.Calories, exercise_data.Heart_Rate)
%stem(alpha);