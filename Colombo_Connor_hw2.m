clc;        % clears command window
clear all;  % clears workspace
close all;  % closes all figure windows

fprintf('\n\n24-311 S20 Assignment 2');
fprintf('\nConnor W. Colombo');
fprintf('\ncwcolomb@andrew.cmu.edu\n');


%--------------------------IMPORTANT NOTES---------------------------------
% 1) In the command window just your results should be displayed. (Do NOT 
% forget to use semicolon (;)).
% 2) Use appropriate variable names for given questions.
% 3) Label all your graphs and do NOT forget to add units.
% 4) Your graph and question number should match. i.e. If you are plotting 
% question number 5, use figure(5). If there are multiple graphs for one
% problem, use the tens digit for the question number and the ones digit
% for the graph number within the problem (i.e. 51 and 52 if there are two
% graphs required for problem 5).
% 5) Make your code as clear and clean as possible to be graded better and
% easier, do NOT hesitate to comment inside a code.
% 6) Failing one/more of above given conditions may cause you to lose 
% points!
% 7) Graders may comment on your work inside the code section as well and 
% slightly change not working codes to make them work.

%--------------------------------Problem#1---------------------------------
fprintf('\nProblem#1:\n');
fprintf('\nProblem#1 - 3.1:\n');
printTankResults(0.9,1);
printTankResults(1.5,1.25);
printTankResults(1.3,3.8);
printTankResults(1.3,4.0);

fprintf('\nProblem#1 - 3.5:\n');
approxSine(0.9,8);


fprintf('\nProblem#1 - 3.6:\n');
fprintf("\t x \t y \t r \t theta \n");
x = [2 2 0 -3 -2 -1 0 0 2];
y = [0 1 3 1 0 -2 0 -2 2];
for i = 1:numel(x)
    [r,t] = cart2polar(x(i),y(i));
    fprintf("\t %d \t %d \t %0.3g \t %0.3g \n", x(i),y(i), r,t);
end

fprintf('\nProblem#1 - 3.8:\n');
for score = [89.9999, 90, 45, 120]
    fprintf("\t A score of %0.4f is a grade of %s \n", score, lettergrade(score));
end

%-----------------------------------End.-----------------------------------
fprintf('\n< End of Submission. >\n');
