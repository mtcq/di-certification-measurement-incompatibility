function FP=FC2FP1(FC)

%Function that transforms some inequality that is the Full
%Corrrelator/Single correlator notation to the full probability one
% CG=[Ind Term <B1> <B2> ... 
%   <A1> <A1B1> <A1B2> ...

%<Ax> = p_A(1|x)-p_A(0|x)
%<AxBy> = p(a=b|xy) - p(a\neq b|xy)

dS=size(FC);
Ia=dS(1)-1;
Ib=dS(2)-1;
p=zeros(2,2,Ia,Ib);

for x=1:Ia
    for y=1:Ib
        %p(1,1,x,y): Independt Term and p(1,1,x,y)
        p(1,1,x,y)=p(1,1,x,y)+FC(x+1,y+1);
        
        p(1,2,x,y)=p(1,2,x,y)-FC(x+1,y+1);
        
        p(2,1,x,y)=p(2,1,x,y)-FC(x+1,y+1);
        
         p(2,2,x,y)=p(2,2,x,y)+FC(x+1,y+1);
       
    end
end

for x=1:Ia
    p(1,1,x,1)=p(1,1,x,1)+FC(x+1,1);
    p(1,2,x,1)=p(1,2,x,1)+FC(x+1,1);
    p(2,1,x,1)=p(2,1,x,1)-FC(x+1,1);
    p(2,2,x,1)=p(2,2,x,1)-FC(x+1,1);

end
for y=1:Ib
     p(1,1,1,y)=p(1,1,1,y)+FC(1,y+1);
     p(1,2,1,y)=p(1,2,1,y)-FC(1,y+1);
     p(2,1,1,y)=p(2,1,1,y)+FC(1,y+1);
     p(2,2,1,y)=p(2,2,1,y)-FC(1,y+1);
     
end

%Adding the independent terms on x=1,y=1
        p(1,1,1,1)=p(1,1,1,1)+FC(1,1);
        p(1,2,1,1)=p(1,2,1,1)+FC(1,1);
        p(2,1,1,1)=p(2,1,1,1)+FC(1,1);
         p(2,2,1,1)=p(2,2,1,1)+FC(1,1);

FP=p;

end