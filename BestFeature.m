%_________________________________________________________________________%
%  OACalculation  .m                                                      %
%                                                                         %
%  Developed in MATLAB R2022a                                             %
%                                                                         %
%  Programmer: YHCHOW                                                     %
%                                                                         %
%_________________________________________________________________________%
function [BF_BestResultTable] = BestFeature(BF_HData,BF_UData,BF_GainTable)

  % Feature with positive gain result turns to 1, else to zero
  BF_PFeature = transpose(BF_GainTable(:,end)>=0);
    
  % Calculate MD of best feature combination
  [BF_BestFeatureMD]=SelectedFeatureMD(BF_PFeature,BF_HData,BF_UData);
    
  % Calculate SNR of best feature combination
  BF_BFSNR = SNRCalculation(BF_BestFeatureMD);

  % Combine the feature occurence and SNR 
  BF_BestResult = [BF_PFeature,BF_BFSNR];

  %Count number of feature
  BF_sizecolumn = size(BF_BestResult,2);

  %Named each column as F1,F2,F3...accordingly
  BF_columnnames = cell(1,BF_sizecolumn);
  for i = 1:BF_sizecolumn-1
      BF_columnnames{i}=sprintf('F%d',i);
  end

  %Named last column as SNR
  BF_columnnames{BF_sizecolumn}='SNR';

  %Convert matrix to table with column names
  BF_BestResultTable = array2table(BF_BestResult,'VariableNames',BF_columnnames);

end
