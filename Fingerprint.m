function fingerprint = Fingerprint(windows)
% The function Fingerprint takes a set of windows and returns a 2D array
% where each column contains the rightmost minimum value from each window
% and its corresponding position.
%
% Inputs:
%   windows - A 2D array containing a set of windows where each window has
%             w number of values.
%
% Outputs:
%   fingerprint - A 2 row, 2D array that represents a fingerprint where
%                 each column consists of the rightmost minimum value from
%                 each window and its corresponding relative position.
%
% Author: William Chong

% Initializing Variables.
[row, ~] = size(windows);
test_position = 0;
j = 1;

% Setting up a for loop to create a 2D array that represents a fingerprint
% consisting of a rightmost minimum value and its corresponding relative
% position.
for i = 1:row

    % Calling the function RightMin to determine the rightmost minimum
    % value and its position for each window.
    [minimum_value, position] = RightMin(windows(i,:));

    % Finding the position of the minimum value relative to the original
    % hash value sequence.
    relative_position = i + (position - 1);

    % Testing if the position of the minimum relative to the original hash
    % value sequence is a new position.
    if relative_position ~= test_position
        % If a new position is found, return the minimum value and its
        % corresponding position back to the output array
        fingerprint(1, j) = minimum_value;
        fingerprint(2, j) = relative_position;

        % Storing the position found so that it can be compared in the next
        % iteration.
        test_position = relative_position;

        % Increasing the output array indexing value by one.
        j = j + 1;
    end
end
end