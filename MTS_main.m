%_________________________________________________________________________%
%  Mahalanobis Taguchi System (OA)                                        %
%                                                                         %
%  Developed in MATLAB R2022a                                             %
%                                                                         %
%  Programmer: YHCHOW                                                     %
%                                                                         %
%_________________________________________________________________________%

% clear all memory before start
clc
clearvars
clear

%% User Configuration
% User should define the parameter below:
% 1. Dataset - User's dataset saved in .mat filetype 
% 2. ResultColumn - the number of column where the result lies
% 3. HealthyDataSeperator - the healthy outcome value in dataset

% For PIMA
% load diabetes.mat
Dataset = importdata('Dataset/diabetes.mat');
ResultColumn = 9;
HealthyDataSeperator = 0;

%% Mahalanobis Distance (MD)

% Filter and seperate healthy and unhealthy data
[HealthyDataset,UnhealthyDataset]=FilterData(Dataset,ResultColumn,HealthyDataSeperator);

% Calculate MD
[MDHealthy_Original,MDUnhealthy_Original]=MD(HealthyDataset,UnhealthyDataset);

%  Error Check
%  Check the validity of Healthy Data MD and Unhealthy Data MD
if mean(MDHealthy_Original)>=1
    warning('Mean of healthy Data is %f, exceed 1',mean(MDHealthy_Original));%Healthy data should close to 1 
end
if mean(MDUnhealthy_Original)<1
      warning("Unhealthy Data is %f, smaller than 1",mean(MDUnhealthy_Original));%Unhealthy data should exceed 1
end

%% Orthogonal Array (OA)

% Select corresponding OA
[OAselected] = SelectOA(UnhealthyDataset); %Select Healthy or Unhealthy will not affected, just need to collect number of features

% Create corresponding OA+SNR value table
[OASNRTable]=OA(OAselected,HealthyDataset,UnhealthyDataset);

%% Gain

% Build gain table
[GainTable]=Gain(OASNRTable,UnhealthyDataset);

%% Get Best Feature and Result

[Result]=BestFeature(HealthyDataset,UnhealthyDataset,GainTable);

display(Result);

