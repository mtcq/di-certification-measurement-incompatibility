function p_restricted=isLOC_restricted1(p,restriction)

%Function that imposes the SDP constraints required by a distribution p is
%local when Alice's inputs are restricted to x\in restricted
%The probability p is a tensor in the form of p(a,b,x,y)
% The restrictions shoul be a vector, for instance R=[1 2] imposes the
% restriction x=1 and x=2

dS=size(p); %Size of the inequality
Oa=dS(1); %Number of outputs for Alice
Ob=dS(2); %Number of outputs for Bob
Ia=dS(3); %Number of inputs for Alice
Ib=dS(4); %Number of inputs for Bob

size_incompatibility=size(restriction,2); %Count how many restrictions are

%Create the restricted distribution
for x=1:size_incompatibility
for y=1:Ib
    for a=1:Oa
        for b=1:Ob
            p_restricted(a,b,x,y)=p(a,b,restriction(x),y);
        end
    end
end
end

%The restricted distribution must be local
isLOC1(p_restricted);

 
end