function [maxBELL p]=maxBell_NPA1(Fabxy,level)
%  Function that obtain the maximal L_^NPA bound of a Bell inequality Faxy.
%  The coeficients of the Bell inequality should be written in a tensor
%  with 4 variables Fabxy(a,b,x,y)
% The NPA level should be an integer, where 0 represents non-signalling

tic %Useful to evaluate the time spent in this function

dS=size(Fabxy); %Size of the inequality
Oa=dS(1); %Number of outputs for Alice
Ob=dS(2); %Number of outputs for Bob
Ia=dS(3); %Number of inputs for Alice
Ib=dS(4); %Number of inputs for Bob


cvx_begin SDP quiet
%cvx_solver SEDUMI
%cvx_precision best

    variable p(Oa,Ob,Ia,Ib) %Declare the SDP variable for the distribution p
    expression value %Declare expression that contains the value of the inequality
    %the ``score'' that it attains for some distribution p
   value=0; %Initialise value as zero (this line is not necessary for the code)
for a=1:Oa
    for b=1:Ob
        for x=1:Ia
            for y=1:Ib
                value=value+p(a,b,x,y)*Fabxy(a,b,x,y);
            end
        end
    end
end

       NPAHierarchy1(p,level); %Impose that p should respecet the level 'level' of NPA
       maximise value
cvx_end

maxBELL=value;
total_time=toc;

end



