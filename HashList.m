function hashes = HashList(string)
% The function HashList calculates the hash31 value for every string stored
% in each cell array using the hash31 algorithm, generating a unique series
% of hashed integer values.
%
% Inputs:
%   string - A cell array where each element of the array is a character
%            array (string).
%
% Outputs:
%   hashes - An array containing hash values for its respective element of
%            the inputted cell array.
%
% Author: William Chong

% Preallocating Array Size.
hashes = zeros(1, length(string));

% Setting up a for loop to generate a hash31 value for every string stored
% in the inputted cell array.
for i = 1:length(string)

    % Calling upon the Hash31 function to return a unique hash31 value.
    integer_value = Hash31(string{i});

    % Storing the output of the Hash31 function to the output of the
    % HashList function.
    hashes(i) = integer_value;

end

end