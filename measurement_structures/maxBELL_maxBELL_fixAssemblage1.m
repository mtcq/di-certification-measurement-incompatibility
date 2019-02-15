function [maxBELL Max]=maxBELL_maxBELL_fixAssemblage1(Fabxy,SIGby)

%  Function that obtain a qudit lower bound for a Bell inequality Faxy.
%  With fixed assemblage SIGby(:,:,b,y) on Alice's side
%  The coeficients of the Bell inequality should be written in a tensor
%  with 4 variables Fabxy(a,b,x,y)

tic %Useful to evaluate the time spent in this function

dS=size(Fabxy); %Size of the inequality
Oa=dS(1); %Number of outputs for Alice
Ob=dS(2); %Number of outputs for Bob
Ia=dS(3); %Number of inputs for Alice
Ib=dS(4); %Number of inputs for Bob

dim=size(SIGby,1);

cvx_begin SDP quiet
%cvx_precision best
value=0;
    variable Max(dim,dim,Ob,Ib) complex
for a=1:Oa
    for b=1:Ob
        for x=1:Ia
            for y=1:Ib
                value=value+real(trace(Fabxy(a,b,x,y)*Max(:,:,a,x)*SIGby(:,:,b,y)));
            end
        end
    end
end
    maximise value
   
    soma=0;
for x=1:Ia
    for a=1:Oa
        Max(:,:,a,x)>=0;
        soma=soma+Max(:,:,a,x);
    end
    soma==eye(dim);
    soma=0;
end   
cvx_end
% a=eta

maxBELL=value;
end




