clc
clear
tic

load 'D:\Project\TIMIT.mat'      % разметка пауза+сигнал
DirTR = 'D:\Project\Data\TIMIT'; % расположение БД

N = 128;
Lbord = length(TIMIT(:));
% Lbord = 1;
ibord = 3;
%  SNR_TR = zeros(Lbord,1);
% for ibord=1:Lbord
     file_nameTR = [DirTR TIMIT(ibord).NameFile];
     startTR     = TIMIT(ibord).Boundary.start;
     endTR       = TIMIT(ibord).Boundary.end;
     WavTR       = audioread(file_nameTR);
% %     [WavTR Fs]  = audioread(file_nameTR);
% % выделение пауз
     LenTR = length(WavTR);
     PauseNo = zeros(startTR+(LenTR-endTR+1),1);
     PauseNo(1:startTR) = WavTR(1:startTR); 
     PauseNo(startTR+1:startTR+1+LenTR-endTR) = WavTR(endTR:end);
% % отношение сигнал шум
    x = WavTR(startTR+1:endTR-1);
    plot(PauseNo);
%     R = fix(length(x)/N);
%     Psign = zeros(R,1);
%     for r = 1:R
%         Psign(r) = (sum(x((r-1)*N+1:r*N).^2));
%     end%for r = 1:R
% 
%     R = fix(length(PauseNo)/N);
%     Pnoise = zeros(R,1);
%     for r = 1:R
%         Pnoise(r) = (sum(PauseNo((r-1)*N+1:r*N).^2));
%     end%for r = 1:R
%     SNR_TR(ibord) = mean(Psign)/mean(Pnoise);

toc
clear DirTR ibord TIMIT Fs %file_nameTR
clear Pnoise x R r Psign Pnoise Lbord LenTR startTR endTR