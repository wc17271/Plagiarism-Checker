function [minimum_value, position] = RightMin(value_array)
% The function RightMin find the minimum value and its rightmost position
% in an array of values.
%
% Inputs:
%   value_array - A 1D array of values that must contain at least one
%                 value.
% Outputs:
%   minimum_value - The minimum value found in the inputted array.
%   position - The rightmost position of the minimum value found in the
%              inputted array.
%
% Author: William Chong

% Initializing Variables.
j = 1;

% Finding the minimum value in the input array.
minimum_value = min(value_array);

% Using a for loop to determine the position(s) of the minimum value in the
% input array.
for i = 1:length(value_array)
    
    % If the indexed value in the input array is equal to the minimum value,
    % store it in the position variable and update its indexing value.
    if value_array(i) == minimum_value
        position(j) = i;
        j = j + 1;
    end
    
end

% Returning the rightmost position of the minimum value to the output of
% the function.
position = max(position);

end