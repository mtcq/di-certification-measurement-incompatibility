function [maxBELL SIGby]=maxBELL_fixMeasurement1(Fabxy,Max)
%  Function that obtain a qudit lower bound for a Bell inequality Faxy.
%  With fixed measurements Max(:,:,a,x) on Alice's side
%  The coeficients of the Bell inequality should be written in a tensor
%  with 4 variables Fabxy(a,b,x,y)

tic %Useful to evaluate the time spent in this function

dS=size(Fabxy); %Size of the inequality
Oa=dS(1); %Number of outputs for Alice
Ob=dS(2); %Number of outputs for Bob
Ia=dS(3); %Number of inputs for Alice
Ib=dS(4); %Number of inputs for Bob

dim=size(Max,1);

cvx_begin SDP  quiet
%cvx_precision best
value=0;
    variable SIGby(dim,dim,Ob,Ib) complex
for a=1:Oa
    for b=1:Ob
        for x=1:Ia
            for y=1:Ib
                value=value+real(trace(Fabxy(a,b,x,y)*Max(:,:,a,x)*SIGby(:,:,b,y)));
            end
        end
    end
end
 sum=0;
 rhoB=0;
 for b=1:Ob
     rhoB=rhoB+SIGby(:,:,b,1);
 end
    rhoB>=0;
    trace(rhoB)==1;
for y=1:Ib
    for b=1:Ob
        SIGby(:,:,b,y)>=0;
        sum=sum+SIGby(:,:,b,y);
    end
    sum==rhoB;
    sum=0;
end   
    maximise value
   

cvx_end
% a=eta

maxBELL=value;
end




