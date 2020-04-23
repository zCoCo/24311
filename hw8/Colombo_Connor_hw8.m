clc;        % clears command window
clear all;  % clears workspace
close all;  % closes all figure windows

fprintf('\n\n24-311 S20 Assignment 8');
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
fprintf('See attached hw8_1.pdf.\n');

%--------------------------------Problem#2---------------------------------
fprintf('\nProblem#2:\n');

fprintf('\n Part a. \n\n');

fprintf('Solving system of equations from problem 1:\n');
% Setup:
A = [ 2    -6    -1; -3    -1     7; -8     1    -2];
b = [-38; -34; -20];
% Solve:
x = GaussPivot(A,b);
x_from_part_a = x; % used later in part 2.b
% Confirm:
A_times_x = A*x;
% Display:
given = table(A);
given.b = b;
fprintf('Results:\n For Ax=b given:\n');
disp(given);
fprintf('x = %s\n', mat2str(x));
fprintf('Results confirmed because A*x is the same as orignal b:\n');
conf = table(A_times_x);
conf.original_b = b;
disp(conf);

fprintf('\ni. Solving given system of equations i:\n');
% Setup:
A = [17 -2 -3; -5 21 -2; -5 -5 22];
b = [500;200;30];
% Solve:
x = GaussPivot(A,b);
% Confirm:
A_times_x = A*x;
% Display:
given = table(A);
given.b = b;
fprintf('where, in Ax=b, \n');
disp(given);
fprintf('Gives: x = %s\n', mat2str(round(x,3)));
fprintf('Results confirmed because A*x is the same as orignal b:\n');
conf = table(A_times_x);
conf.original_b = b;
disp(conf);

fprintf('\nii. Solving given system of equations ii:\n');
% Setup:
A = [1 4 9 -16; 4 9 16 25; 9 16 25 36; 16 25 36 49];
b = [1;2;1;5];
% Solve:
x = GaussPivot(A,b);
% Confirm:
A_times_x = A*x;
% Display:
given = table(A);
given.b = b;
fprintf('where, in Ax=b, \n');
disp(given);
fprintf('Gives: x = %s\n', mat2str(round(x,3)));
fprintf('Results confirmed because A*x is the same as orignal b:\n');
conf = table(A_times_x);
conf.original_b = b;
disp(conf);

fprintf('\n Part b. \n\n');

% Setup:
fprintf('To solve system of equations from problem 1:\n');
A = [ 2    -6    -1; -3    -1     7; -8     1    -2];
b = [-38; -34; -20];
given = table(A);
given.b = b;
fprintf('Given:\n');
disp(given);
% Computation:
output = table();
fprintf('Inverse of A is found using custom function invLU: \n');
invA = invLU(A);
output.invA = round(invA,4);
disp(output);
fprintf('This is used to solve Ax=b by computing x = invA * b, which is the \n same as the solution found in part 2.a when solving this system\n');
x = invA * b;
output.invA_times_b = round(x,3);
output.x_from_part_a = x_from_part_a;
disp(output);

fprintf('\n----\n');

A = [1 -1 3 0.2; 1.1 6.33 12 0.1; -3 2.3 -21 0; 2.2 -11 0.54 -0.43];
data = table(A);
fprintf('Given:\n');
disp(data);
fprintf('Inverse of A is found using custom function invLU: \n');
invA = invLU(A);
data.invA = round(invA,4);
disp(data);

B = [1:5; 2:6; 3:7; 4:8; 5:9].^2;
data = table(B);
fprintf('Given:\n');
disp(data);
fprintf('Inverse of B is found using custom function invLU: \n');
invB = invLU(B);
data.invB = round(invB,4);
disp(data);

fprintf('Using custom function matmult, A and B were multipled by their respective inverses\n');
fprintf('As expected, A*invA produced the identity matrix\n');
data = table();
data.A = A;
data.invA = round(invA,4);
data.A_times_invA = round(matmult(A,invA),1);
disp(data);

fprintf('However, B*invB did not produce the identity matrix because invB was invalid because B was ill-conditioned.\n');
data = table();
data.B = B;
data.invB = round(invB,4);
data.B_times_invB = round(matmult(B,invB),1);
disp(data);

%-----------------------------------End.-----------------------------------
fprintf('\n< End of Submission. >\n');
