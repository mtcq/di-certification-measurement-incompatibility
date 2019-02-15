function FP=CG2FP1(CG)

%Function that transforms some inequality that is the CollinsGisin notation to the full probability one
%The CollinsGisin notation is the one that defines bipartite 2-outcome distributions
%via its value on a=0 and b=0 and their marginais when a=0 and b=0
% CG=[Ind Term P_B(0,1) P_B(0,2) ... 
%    P_A(0,1) P_AB(0,0,1,1) P_AB(0,0,1,2) ...
% CG=[Ind Term P_B(0,1) P_B(0,2) ... 
%    P_A(0,1) P_AB(0,0,1,1) P_AB(0,0,1,2) ...

dS=size(CG);
Ia=dS(1)-1;
Ib=dS(2)-1;
p=zeros(2,2,Ia,Ib);

for x=1:Ia
    for y=1:Ib
        %p(1,1,x,y): Independt Term and p(1,1,x,y)
        p(1,1,x,y)=p(1,1,x,y)+CG(x+1,y+1);
        
        p(1,2,x,y)=p(1,2,x,y);
        
        p(2,1,x,y)=p(2,1,x,y);
        
         p(2,2,x,y)=p(2,2,x,y);
       
    end
end

for x=1:Ia
    p(1,1,x,1)=p(1,1,x,1)+CG(x+1,1);
    p(1,2,x,1)=p(1,2,x,1)+CG(x+1,1);
end
for y=1:Ib
     p(1,1,1,y)=p(1,1,1,y)+CG(1,y+1);
     p(2,1,1,y)=p(2,1,1,y)+CG(1,y+1);
end

%Adding the independent terms on x=1,y=1
        p(1,1,1,1)=p(1,1,1,1)+CG(1,1);
        p(1,2,1,1)=p(1,2,1,1)+CG(1,1);
        p(2,1,1,1)=p(2,1,1,1)+CG(1,1);
         p(2,2,1,1)=p(2,2,1,1)+CG(1,1);

FP=p;

end