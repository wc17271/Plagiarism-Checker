function [position1, position2] = FindMatchPositions(fingerprint1, fingerprint2)
% The function FindMatchPositions compares the two fingerprints and returns
% which positions in fingerprint1 have a value in string 2 and which
% positions in fingerprint 2 have a value in string 1.
%
% Inputs:
%   fingerprint1 - A 2D array containing a fingerprint for string 1 where
%                  each column contains a hash value and its corresponding
%                  position.
%   fingerprint2 - A 2D array containing a fingerprint for string 2 where
%                  each column contains a hash value and its corresponding
%                  position.
%
% Outputs:
%   position1 - A 1D array containing a list of index positions in
%               string 1 of all the values that were also found in
%               string 2.
%   position2 - A 1D array containing a list of index positions in
%               string 2 of all the values that were also found in
%               string 1.
%
% Author: William Chong

%% Finding position1
% Calling the function FindMatchIndices to return the index positions of
% the values in fingerprint1 that are also found in fingerprint2.
indices_position1 = FindMatchIndices(fingerprint1(1,:), fingerprint2(1,:));

% If a match is found, use the indexing value to extract and store the string
% position for fingerprint 1.
if length(indices_position1) > 0

    positions = fingerprint1(2,:);
    position1 = positions(indices_position1);

    % If no match is found, return an empty array.
else
    position1 = double.empty;

end


%% Finding position2
% Calling the function FindMatchIndices to return the index positions of
% the values in fingerprint2 that are also found in fingerprint1.
indices_position2 = FindMatchIndices(fingerprint2(1,:), fingerprint1(1,:));

% If a match is found, use the indexing value to extract and store the string
% position for fingerprint 2.
if length(indices_position2) > 0

    positions = fingerprint2(2,:);
    position2 = positions(indices_position2);

    % If no match is found, return an empty array.
else
    position2 = double.empty;

end

end
