% Microwave Circuits and Systems - HSB - SS2018. Mohammed Khesbak
%   Setting S11, S12, S21, and S22 in polar form (S-parameters setting) 
r11=0.3327; th11=154.9;     %  S11 in polar
r21=7.141; th21=60.1;       %  S21 in polar
r12=0.0767; th12=43.4;      %  S12 in polar
r22=0.1398; th22=-66.7;     %  S22 in polar

%   Computing S11, S12, S21, and S22 as complex

S11=complex(X1,Y1);
[X1,Y1]=pol2cart(pi*th21/180,r21);
S21=complex(X1,Y1);
[X1,Y1]=pol2cart(pi*th12/180,r12);
S12=complex(X1,Y1);
[X1,Y1]=pol2cart(pi*th22/180,r22);
S22=complex(X1,Y1);
%   Computing Delta, B1, B2, C1, and C2 in terms of S-parameters as complex
Delta=(S11*S22-S12*S21);
C1=S11-Delta*conj(S22);
C2=S22-Delta*conj(S11);
B1=1+(abs(S11))^2-(abs(S22))^2-(abs(Delta))^2;
B2=1+(abs(S22))^2-(abs(S11))^2-(abs(Delta))^2;
%   Computing Reflecting Coefficients (Gama Source and Load) as complex
GamaS=(  B1-sqrt(  B1^2-4*(abs(C1))^2  ) )/(2*C1)
GamaSR=real(GamaS); GamaSI=imag(GamaS);
[GamaSth,GamaSr]=cart2pol(GamaSR,GamaSI);
GamaSthD=GamaSth*180/pi;
GamaL=(  B2-sqrt(  B2^2-4*(abs(C2))^2  ) )/(2*C2)
GamaLR=(real(GamaL)); GamaLI=imag(GamaL);
[GamaLth,GamaLr]=cart2pol(GamaLR,GamaLI);
GamaLthD=GamaLth*180/pi;
%   Computing Gain in db
GS= 1/(1-(abs(GamaS))^2);
G0=(abs(S21))^2;
GL= (  1-( abs(GamaL))^2  )/(  (abs(1-S22*GamaL))^2) ;
GSdb=10*log(GS)/log(10);
G0db=10*log(G0)/log(10);
GLdb=10*log(GL)/log(10);
GT=GS*G0*GL;
GTdb=10*log(GT)/log(10)
