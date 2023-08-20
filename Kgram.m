function k_grams = Kgram(k, string)
% The function Kgram takes a string and divides it into a series of
% 'k-grams' where each of the outputted elements is k characters long.
%
% Inputs:
%   k - A positive integer greater than 0 which determines the number of
%       characters within one element of the outputted cell array, k_gram.
%   string - A string in the form of a character array.
%
% Outputs:
%   k_grams - A cell array where each element is a k-gram containing k
%             number of characters.
%
% Author: William Chong

% Initializing Variables.
i = 1;

% Determining whether or not the value of k is greater than or equal to the
% length of string.
if k >= length(string)

    % If true, a 1 x 1 cell array containing the string will be returned to
    % the fuction's output.
    k_grams = {string};

else
    % If the above condition is false, a while loop will run, creating cell
    % arrays where each element in the cell array is a k-gram.
    while k <= length(string)

        k_grams{i} = string(i:k);

        % Incrementing the indexing values by one to obtain the next sequence.
        k = k + 1;
        i = i + 1;

    end
end

end