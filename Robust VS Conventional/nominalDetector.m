%% lambdaNominal=nominalDetector(observations,signalSubsapce)
% this detector is written based on "Robust Gaussian and non-Gaussian
% matched subspace detection" paper.
% http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=1246518&tag=1
% Inputs:
%       observations- data observations to be tested (measurment dimension x number of samples)
%       signalSubsapce- (measurment dimension X signal subspace dimension)
% 
% Output:
%       lambdaNominal- GLRT detection ratio
% 
%%
function lambdaNominal=nominalDetector(observations,signalSubsapce)

P = @(W) W*pinv(W);
PS = P(signalSubsapce);
PN = P(eye(size(signalSubsapce,1)) -PS);
for i = 1:size(observations,2)
    x = observations(:,i);
    lambdaNominal(i) = x'*x/(x'*PN*x);
end
