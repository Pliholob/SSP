clc
clear
tic
% 
% file_nameTR = 'D:\Project\Data\TIMIT\data\TRAIN\DR4\MMDM0\SX141.WAV.wav'
file_nameTR = 'd:\Project\Data\VoxForge\ru\16_16\ALL\esh\wav\esh_ru_0001.wav'
%  audioIn       = audioread(file_nameTR);
%  VAD = voiceActivityDetector
%  VAD = voiceActivityDetector('InputDomain','Frequency')
% [probability,noiseEstimate] = VAD(audioIn);

fileReader = dsp.AudioFileReader(file_nameTR);
fs = fileReader.SampleRate;
fileReader.ReadRange
% fileReader.SamplesPerFrame = ceil(10e-3*fs);
fileReader.SamplesPerFrame = 256;
VAD = voiceActivityDetector;
scope = timescope( ...
    'NumInputPorts',2, ...
    'SampleRate',fs, ...
    'TimeSpanSource','Property','TimeSpan',3, ...
    'BufferLength',3*fs, ...
    'YLimits',[-1.5 1.5], ...
    'TimeSpanOverrunAction','Scroll', ...
    'ShowLegend',true, ...
    'ChannelNames',{'Audio','Probability of speech presence'});
% % deviceWriter = audioDeviceWriter('SampleRate',fs);
i = 0;
while ~isDone(fileReader)
    i = i+1
    audioIn = fileReader();
    probability = VAD(audioIn);

    scope(audioIn,probability*ones(fileReader.SamplesPerFrame,1))
%     deviceWriter(audioIn);
end



toc