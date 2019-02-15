function [maxBELL p p_pairs]=maxBell_localRestrictedCONV1(Fabxy,level)
%  Function that obtain the maximal L_^Q_2conv bound of a Bell inequality Faxy.
%  The coeficients of the Bell inequality should be written in a tensor
%  with 4 variables Fabxy(a,b,x,y)

tic %Useful to evaluate the time spent in this function

dS=size(Fabxy); %Size of the inequality
Oa=dS(1); %Number of outputs for Alice
Ob=dS(2); %Number of outputs for Bob
Ia=dS(3); %Number of inputs for Alice
Ib=dS(4); %Number of inputs for Bob

cvx_begin SDP quiet  %start SDP
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
                value = value + p(a,b,x,y)*Fabxy(a,b,x,y);
            end
        end
    end
end

   p_pairs = isLOC_restrictedCONV1(p,level); %Impose the constraint that  p should be in L^{Q_level}_{2conv}
   %Here we also stoch the decomposition p12,p23, and p31 that satistifes
   %the constraints of  L^{Q_level}_{2conv}
   maximise value  %maximase the score of the inequality
cvx_end  %End SDP

maxBELL=value; %Assign the maximal value to the variable maxBell
total_time=toc; %Evaluate the total time spent

end



