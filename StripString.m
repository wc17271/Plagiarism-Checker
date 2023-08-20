function stripped = StripString(string)
% The function StripString removes all whitespaces and unprintable
% characters and converts all uppercase characters to lowercase characters.
%
% Inputs:
%   string - A string, in this case, a character array.
%
% Outputs:
%   stripped - A lowercase character array that has had all whitespaces
%              and unprintable characters removed.
%
% Author: William Chong

% Initializing Variables.
output_index = 1;
stripped_ASCII = double.empty;

% Converting any uppercase characters to lowercase.
string = lower(string);

% Converting the character array into its respective ASCII values.
string_ASCII = double(string);

% Setting up a for loop to determine whether the respective ASCII values of
% the inputted string are within the range of 33 to 126 (inclusive).
for i = 1:length(string_ASCII)

    % If true, the ASCII value is stored and returned to the output array.
    if (string_ASCII(i) >= 33) && (string_ASCII(i) <= 126)
        stripped_ASCII(output_index) = string_ASCII(i);

        % Increasing the output indexing value by 1.
        output_index = output_index + 1;
    end

end

% Converting the string back from its ASCII values back to a character
% array.
stripped = char(stripped_ASCII);

end