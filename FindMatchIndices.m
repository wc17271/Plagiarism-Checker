function indices = FindMatchIndices(array1, array2)
% The function FindMatchIndices finds values from array 1 that are also in
% array 2 and returns the indexing positions of these values in array 1.
%
% Inputs:
%   array1 - The array containing the values we want to find in array2.
%   array2 - The array we are looking through to find the values of array1.
%
% Outputs:
%   indices - A 1D row array containing the index positions of array 1
%             where its values can also be found in array 2.
%
% Author: William Chong

% Initializing variables.
indices = double.empty;
output_index = 1;

% Setting up a nested for loop to find the values from array1 that are
% also in array2.
for i = 1:length(array1) % Stepping through array1
    for j = 1:length(array2) % Stepping through array2

        % If a value in array 1 is found in array 2, the index position
        % of this value in array 1 is returned to the output array.
        if array1(i) == array2(j)
            indices(output_index) = i;

            % Increasing the output indexing value by 1.
            output_index = output_index + 1;
        end

    end
end

% Removing any repetitions.
indices = unique(indices);

% If no matches were found, return an empty array to the function output.
if length(indices) == 0
    indices = double.empty;
end

end