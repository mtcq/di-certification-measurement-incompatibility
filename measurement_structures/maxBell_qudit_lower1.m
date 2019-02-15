function [max p Max SIGby]=maxBell_qudit_lower1(Fabxy,d)
%  Function that obtain a qudit lower bound for a Bell inequality Faxy.
%  The coeficients of the Bell inequality should be written in a tensor
%  with 4 variables Fabxy(a,b,x,y)
% The dimension 'd' should be an integer

tic %Useful to evaluate the time spent in this function

dS=size(Fabxy); %Size of the inequality
Oa=dS(1); %Number of outputs for Alice
Ob=dS(2); %Number of outputs for Bob
Ia=dS(3); %Number of inputs for Alice
Ib=dS(4); %Number of inputs for Bob


%Test if the measurements can be projective
if d==Oa
    Max=random_measurements_projective1(Ia,d);
else
    'dim is not equals to the number of outputs, using random POVMs that may not be JM'
    Max=random_measurements_POVM1(Ia,Oa,d);
end

 
%Set a counter to control the number of iteractions
count=1;

%Initialy the lower bound as -infinity and the gap between steps as
%infinity
max=-inf;
diff=inf;

%Set a Halting condigiont
%This function stops of the difference from one level to the other is
%smaller than halting_difference
halting_difference=10^(-4);

while diff>halting_difference
    
    [max_now SIGby]=maxBELL_fixMeasurement1(Fabxy,Max);
    if max_now>max
        diff=abs(max-max_now);
        max=max_now; 
    end
    [max_now Max]=maxBELL_maxBELL_fixAssemblage1(Fabxy,SIGby);
    if max_now>max
        abs(max-max_now);
        'The current lower bound is:'
        max=max_now %Display the current lower bound
    end
    count=count+1 %display the number of itarations
end

for a=1:Oa
    for b=1:Ob
        for x=1:Ia
            for y=1:Ib
                p(a,b,x,y)=real(trace(SIGby(:,:,b,y)*Max(:,:,a,x)));
            end
        end
    end
end
total_time=toc;

end