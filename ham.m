function [ theta ] = ham( rbd,V )
t = rbd(:,1);
v = V(:,2);
q1 = rbd(:,2);
q1_dot = rbd(:,3);
q2 = rbd(:,4);
q2_dot = rbd(:,5);


h1 = 0.5.*(q1_dot.^2);
h2 = 0.5.*((sin(q2).^2).*(q1_dot.^2))+0.5.*(q2_dot.^2);
h3 = cos(q2).*q1_dot.*q2_dot;
h4 = 9.8.*cos(q2);
%i=2;


length =size(rbd)
F1 = zeros(length(1),1);
F2 = zeros(length(1),1);
H = zeros(length(1),4);
F = zeros(length(1),2);
D1 = zeros(length(1),1);
d = zeros(length(1),1); 

for i= (2:length(1)-1)
H(i-1,1) = [h1(i)-h1(1)];
H(i-1,2) = [h2(i)-h2(1)];
H(i-1,3) = [h3(i)-h3(1)];
H(i-1,4) = [h4(i)-h4(1)];

F1(i-1) = q1_dot(i-1).^2;
F2(i-1) = q2_dot(i-1).^2;
%f1 = F1(1):F1(i+1);
%f2 = F2(1):F2(i+1);

%lim = t(1):t(i+1);                       

F(i-1,1) = trapz(t(1:i),F1(1:i));
F(i-1,2) = trapz(t(1:i),F2(1:i));


D1(i-1) = v(i-1).*q1_dot(i-1);
%d1 = D1(1):D1(i+1);

d(i-1) = trapz(t(1:i),D1(1:i));

end
 size(H);
%  H;
%  F;
 
 A=[H F];
%  A.^(-1);
%  sizeA=size(A)
%  sized=size(d)
 A1= pinv(A);
%  sizeA1=size(A1)
%  sized=size(d)
 theta = A1*d
end

