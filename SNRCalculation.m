%_________________________________________________________________________%
%  SNRCalculation.m                                                       %
%                                                                         %
%  Developed in MATLAB R2022a                                             %
%                                                                         %
%  Programmer: YHCHOW                                                     %
%                                                                         %
%_________________________________________________________________________%

function SNR_SNratio = SNRCalculation(SNR_OAMDOutput)

    SNRDivide = 1./SNR_OAMDOutput;
    SNSum = sum(SNRDivide);
    SNSumDVariable = SNSum/size(SNR_OAMDOutput,1);
    SNLog = log10(SNSumDVariable);
    SNR_SNratio = SNLog *(-10);

end

