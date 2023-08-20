function integer_value = Hash31(value_array)
% The function Hash31 takes an array of values and converts it into an
% integer value.
%
% Inputs:
%   value_array - A 1D array of values (which could be a character array,
%                 an array of integers or an empty array).
%
% Outputs:
%   integer_value - An integer value calculated using the hash31 algorithm.
%
% Author: William Chong

% Initializing Variables.
h = 0;
i = 1;

% If the input array is a character array, convert it into an array of
% integer values. 
if ischar(value_array)
    value_array = double(value_array);
end

if length(value_array) == 0
    integer_value = double.empty;
    return  
end

% Setting up a while loop create the hash31 algorithm.
while i <= length(value_array)
    % Initializing the value of h.
    h = value_array(i) + (31 * h);

    % Setting h equal to the remainder of h divided by the hashsize.
    h = mod(h, (2^20));

    % Increasing the indexing number by 1.
    i = i + 1;
end

% Returning the value of h to the output of the function.
integer_value = h;

end