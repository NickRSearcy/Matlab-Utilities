%
% Purpose: Utility
% Author(s): Nick Searcy (nickrsearcy.com)
% Date: 2.6.13
% License: you may share, remix, make money with attribution [cc by 3.0 us]
% http://creativecommons.org/licenses/by/3.0/us/
%
%   Enumerate every value of an arbitrary, mixed-base number system.
%
%	Input: d
%	d is an [1 x n] vector of n bases d = {b_0, b_1, ...} corresponding to
%	the digit in each number.
%   Output: v
%   v is an [m x n] matrix of all m values containing n digits according to
%   d in order
%


function v = enumerate(d)

num_row = prod(d); %the maximum value is also the number of values
num_col = length(d); %the number of places

x = 0:(num_row - 1); %in base-10, the entire sequence of numbers in our enumeration

v = zeros([num_row num_col]); %preallocate results

for row_index = 1:num_row
    %for each value
    current_x = x(row_index);%temporarily store the value
    for col_index = 1:num_col
        %for each digit
        current_digit = d(num_col + 1 - col_index); %temporarily store the base
        v(row_index,num_col + 1 - col_index) = mod(current_x,current_digit); %result will be modulus of temporary value so far
        current_x = floor(current_x/current_digit); %the next temporary value
    end
end
