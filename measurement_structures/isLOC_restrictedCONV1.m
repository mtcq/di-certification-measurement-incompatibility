function [p_pairs]=isLOC_restrictedCONV1(p,NPA_level)
%Function that imposes the SDP constraints required by a distribution p the
%belong to the set L^{Q_level}_{2conv}
%The probability p is a tensor in the form of p(a,b,x,y)

dS=size(p); %Size of the inequality
Oa=dS(1); %Number of outputs for Alice
Ob=dS(2); %Number of outputs for Bob
Ia=dS(3); %Number of inputs for Alice
Ib=dS(4); %Number of inputs for Bob

cvx_begin SDP %start SDP
%cvx_precision best %Set precision to be maximal

%Define the unnormalised distributions that weill respect locality when
%Alice's inputs are restricted

variable p12(Oa,Ob,Ia,Ib) %SDPvar that will respect locality in the when x=1 and x=2
variable p23(Oa,Ob,Ia,Ib) %SDPvar that will respect locality in the when x=2 and x=3
variable p31(Oa,Ob,Ia,Ib) %SDPvar that will respect locality in the when x=1 and x=3

 p==p12+p23+p31; %Constraint that p should sum to 3 distrubtions 
 
% Constraint that pij must be inside NPA
 NPAHierarchy1(p12,NPA_level);
 NPAHierarchy1(p23,NPA_level);
 NPAHierarchy1(p31,NPA_level);
 
%  NPAHierarchy(p,NPA_level); %constraint that p should be inside NPA

% Constraint that pij should respect locality in the when x=i and x=j
isLOC_restricted1(p12,[1 2]);
isLOC_restricted1(p23,[2 3]);
isLOC_restricted1(p31,[1 3]);

%p must be normalised
for x=1:Ia
    for y=1:Ib
        sum=0;
        for a=1:Oa
            for b=1:Ob
                sum=sum+p(a,b,x,y);
            end
        end
        sum<=1;
    end
end

cvx_end %End SDP

%Assing the unnormalised distributions into cells
p_pairs{1}=p12;
p_pairs{2}=p23;
p_pairs{3}=p31;
end

 