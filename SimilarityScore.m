function score = SimilarityScore(position_matches, match_length, kgram_length)
% The function SimilarityScore calculates a similarity score by taking a
% list of matched positions for a string and determines what proportion of
% characters in a string matched.
%
% Inputs:
%   position_matches - A 1D array containing a list of indices which
%                      correspond to position matches.
%   match_length - A positive integer greater than zero which indicates the
%                  length of each match.
%   kgram_length - The total length of the string that was converted into
%                  k-grams.
%
% Outputs:
%   score - The percentage of the string that matched, returned as a
%           decimal.
%
% Author: William Chong

% Preallocating Array Size.
score = zeros(1, kgram_length);

% Initiating a for loop to 'mark' the characters that match.
for i = position_matches

    % If the condition below is true, 'mark' the characters in the output
    % array by entering the value 1.
    if (i + match_length - 1) <= kgram_length
        score(i:i + match_length - 1) = 1;
    end

end

% Calculating the percentage of the string that matched as a decimal.
score = (sum(score, 'all'))/kgram_length;

end