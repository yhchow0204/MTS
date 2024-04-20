%_________________________________________________________________________%
%  BuildMS.m                             %
%                                                                         %
%  Developed in MATLAB R2022a                                             %
%                                                                         %
%  Programmer: YHCHOW                                                     %
%                                                                         %
%_________________________________________________________________________%

function [MS_AverageHealthyData,MS_StandardDeviationHealthyData,MS_CorrelationMatrix] = BuildMS(MS_HealthyDataset)

MS_AverageHealthyData = mean(MS_HealthyDataset);% Find mean of each feature
MS_StandardDeviationHealthyData = std(MS_HealthyDataset,0); %Find standard deviation of each feature

%Standardize Healthy Data 
HSDData = (MS_HealthyDataset-MS_AverageHealthyData)./MS_StandardDeviationHealthyData;

%Create correlation matrix 
MS_CorrelationMatrix = corrcoef(HSDData);

end

