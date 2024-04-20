%_________________________________________________________________________%
%  MDCalculation.m                                                        %
%                                                                         %
%  Developed in MATLAB R2022a                                             %
%                                                                         %
%  Programmer: YHCHOW                                                     %
%                                                                         %
%_________________________________________________________________________%

function MD_OutputData = MDCalculation(MD_Dataset,MD_AverageHealthyData,MD_StandardDeviationHealthyData,MD_CorrelationMatrix)

 %Get standardize data from StandardizeData function
 stddata = (MD_Dataset-MD_AverageHealthyData)./MD_StandardDeviationHealthyData;

 %Calculate MatrixA
  MatrixA = mtimes(stddata,inv(MD_CorrelationMatrix));

 %Create transpose of the standardize data
  DatatableTranspose = transpose(stddata);

 %Create matrix for MD dataset
  MDData = zeros(size(stddata,1),1);
  %Calculate MD
  for rowmd = 1:1:size(stddata,1)
       MDData(rowmd,1)=mtimes(MatrixA(rowmd,:),DatatableTranspose(:,rowmd));
  end

 %Divide value by number of variables
  MD_OutputData = MDData./size(stddata,2);

end

