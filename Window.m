function windows = Window(w, integer_array)
% The function Window takes a sequence of integer values and creates a 2D
% array of windows for a specified window size.
%
% Inputs:
%   w - A positive integer greater than zero which determines the window
%       size.
%   integer_array - A 1D array containing integer values.
%
% Outputs:
%   windows - A 2D array of integer values where each row of the array is a
%             window containing w integer values.
%
% Author: William Chong

% Initializing Variables.
i = 1; % Indexes the inputted array and the rows in the output array.
j = w; % Indexs inputted array.

% Determining whether w, the window size, is greater than the length
% of the array.
if w >= length(integer_array)

    % If true, the input array will be returned as the output
    % array.
    windows = integer_array;

else
    % If the condition above is false, enter the loop that creates a 2D
    % array of integer values where each row is a window containing w
    % integer values.
    while j <= length(integer_array)

        windows(i, 1:w) = integer_array(i:j);

        % Increasing the indexing value by one.
        i = i + 1;
        j = j + 1;

    end
end

end