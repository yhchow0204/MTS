function [MD_MDHealthy,MD_Unhealthy] = MD(MD_Healthydata,MD_Unhealthy)

% Build Mahalanobis Space
% Get average,standard deviation,correlation and inverse correlation of Healthy Data
[MD_AverageHealthyData,MD_StandardDeviationHealthyData,MD_CorrelationMatrix]=BuildMS(MD_Healthydata);

%Calculate MD
[MD_MDHealthy]=MDCalculation(MD_Healthydata,MD_AverageHealthyData,MD_StandardDeviationHealthyData,MD_CorrelationMatrix);
[MD_Unhealthy]=MDCalculation(MD_Unhealthy,MD_AverageHealthyData,MD_StandardDeviationHealthyData,MD_CorrelationMatrix);
end