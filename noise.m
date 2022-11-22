clc
clear
tic
M = 128;
N = 128;
%%
%  
u_rnd = randn(N,M);
un = zeros(N,M);
for m = 1:M
    un(:,m) = u_rnd(:,m)/sqrt(sum(u_rnd(:,m).^2));
    u(m).f =  un(:,m);

end %for m = 1:M


toc