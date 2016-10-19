clear all
close all
clc
%%   Genetic Algorithm Parameters...

A = xlsread('strike.xls');

a=0.97;
Pn = 100;
Pc = 0.8;
Pm = 0.2; 
Nmax = 100;

plot(0,0,'c.');
hold;

nodes = length(A);
%% Population init.
pop = InitPop( A, a, Pn );

pause
for i=1:Nmax
    i
%%  crossover 

pop1 = crossover(A, pop, Pc, a);

%%  Mutation

pop2 = Mutaion(pop, A, Pm, a);

%% filter poputation
pop = filterup(pop1, pop2, A, Pn,i);

end