%
% Purpose: Utility
% Author(s): Nick Searcy (nickrsearcy.com)
% Date: 2.6.13
% License: you may share, remix, make money with attribution [cc by 3.0 us]
% http://creativecommons.org/licenses/by/3.0/us/
%
%   Returns the cumulative nchoosek(v,k) result starting with k=1 and
%   ending at k=k_input. Results are returned in a matrix as nchoosek() but
%   are zero-padded. Ensure that 0 is not in the input vector v.
%

function out = cum_nchoosek(v,k)

n = length(v);

nCk = 0;

for i = 1:k

    nCk = nCk + nchoosek(n,i);

end

out = zeros([nCk k]);

nCk = zeros([1 n+1]);

for i = 1:k

    nCk(i+1) = nCk(i) + nchoosek(n,i);

    out(nCk(i)+1:nCk(i+1),1:i) = nchoosek(v,i);

end

end

