clear
clc

N = 128;
% u = randn(N,1);
rng default  % For reproducibility
p = haltonset(2,'Skip',1e3,'Leap',1e2)
% m_u = mean(u);
X0 = net(p,500);
% X0 = p(1:500,:);
% plot(u);
% hist(u)
scatter(X0(:,1),X0(:,2),3,'k')
axis square
title('{\bf Quasi-Random Scatter}')