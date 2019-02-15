warning('off')
%  format short
% Script containing all the Bell inequalities used in this project


%https://arxiv.org/abs/quant-ph/0305190
I3322_FC=[0 1 1 0;-1 1 1 1;-1 1 1 -1;0 1 -1 0];
% I3322_CG=[0 -1 -2 0; 0 1 1 -1;-1 1 1 1;0 -1 1 0];
I3322=FC2FP1(I3322_FC);

%https://arxiv.org/abs/quant-ph/0306129
I3422_1_CG = [0 1 0 0 1; 1 -1 -1 1 -1; 1 -1 1 -1 -1; -2 1 1 1 -1];
I3422_2_CG =  [0  -1 0  -1 1; 0 -1 0 1 -1; 1 1 -1 0 -1; -1 1 1 1 0];
I3422_3_CG =  [0  0  0 -1  2; 1  -2  0  1 -1; 0   1 -1  1 -1; -1   1  1  1 -1];
I3422_1=CG2FP1(I3422_1_CG );
I3422_2=CG2FP1(I3422_2_CG );
I3422_3=CG2FP1(I3422_3_CG );

%https://arxiv.org/abs/1406.6976
I3522_FC=[0 1 1 0 0 0;0 -1 1 0 -1 1;0 1 1 1 0 -1;0 1 0 -1 -1 -1];
% I3522_CG =  [0 0 -1 0 1 1; 0 -1 1 0 -1 1; -1 1 1 1 0 -1; 1 1 0 -1 -1 -1];
I3522=FC2FP1(I3522_FC);

%https://www.sciencedirect.com/science/article/pii/0920563289904416
I_chain3_FC=zeros(4,4);
I_chain3_FC(2,2)=1;
I_chain3_FC(3,3)=1;
I_chain3_FC(4,4)=1;
I_chain3_FC(3,2)=1;
I_chain3_FC(4,3)=1;
I_chain3_FC(2,4)=-1;
I_chain3=FC2FP1(I_chain3_FC);


%https://arxiv.org/abs/quant-ph/0702021
I_elegant_FC=zeros(4,5);
I_elegant_FC(1,1)=0;

I_elegant_FC(2,2)=1;
I_elegant_FC(2,3)=1;
I_elegant_FC(2,4)=-1;
I_elegant_FC(2,5)=-1;

I_elegant_FC(3,2)=1;
I_elegant_FC(3,3)=-1;
I_elegant_FC(3,4)=1;
I_elegant_FC(3,5)=-1;

I_elegant_FC(4,2)=1;
I_elegant_FC(4,3)=-1;
I_elegant_FC(4,4)=-1;
I_elegant_FC(4,5)=1;

I_elegant=FC2FP1(I_elegant_FC);


%https://arxiv.org/abs/1505.03837
CHSH6_FC=zeros(4,7);

CHSH6_FC(2,2)=1;
CHSH6_FC(2,3)=1;
CHSH6_FC(3,2)=1;
CHSH6_FC(3,3)=-1;

CHSH6_FC(2,4)=1;
CHSH6_FC(2,5)=1;
CHSH6_FC(4,4)=1;
CHSH6_FC(4,5)=-1;

CHSH6_FC(3,6)=1;
CHSH6_FC(3,7)=1;
CHSH6_FC(4,6)=1;
CHSH6_FC(4,7)=-1;

CHSH62_FC=CHSH6_FC;


CHSH62_FC(3,6)=-1;
CHSH62_FC(3,7)=-1;
CHSH62_FC(4,6)=-1;
CHSH62_FC(4,7)=1;

CHSH6=FC2FP1(CHSH6_FC);
CHSH62=FC2FP1(CHSH62_FC);

%https://arxiv.org/abs/quant-ph/0412109
M3322_CG=[0 -2 0 0;  -2 1 1 1;  -1 1 1 -1; 0 1 -1 0];
M3322=CG2FP1(M3322_CG);

