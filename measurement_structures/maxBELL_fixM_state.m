function [maxBELL Mby]=maxBELL_fixM_state(Fabxy,Max,rho)
%Max(:,:,Oa,Ia) 

dS=size(Fabxy);
Oa=dS(1);
Ob=dS(2);
Ia=dS(3);
Ib=dS(4);

dim=size(Max,1);

cvx_begin SDP  quiet
%cvx_precision best
value=0;
    variable Mby(dim,dim,Ob,Ib) complex
for a=1:Oa
    for b=1:Ob
        for x=1:Ia
            for y=1:Ib
                value=value+real(trace(Fabxy(a,b,x,y)*kron(Max(:,:,a,x)*Mby(:,:,b,y))*rho ));
            end
        end
    end
end
    maximise value
   

for y=1:Ib
    for b=1:Ob
        SIGby(:,:,b,y)>=0;
        soma=soma+SIGby(:,:,b,y);
    end
    soma==rhoB;
    soma=0;
end   
cvx_end
% a=eta

maxBELL=value;
end




