function [fp, filelength] = Winnow(filename,k,t)
% Winnow creates a document fingerprint from the contents of a document
% using the parameters k and t, where k represents the noise threshold
% and t the guarantee threshold, for the winnowing algorithm.
%
% It takes three inputs in the following order
% 1) The filename (stored as a string)
% 2) A k value (the noise threshold), which will be a positive integer
% 3) A t value (the guarantee threshold), which will be a positive integer
%    such that t>= k
% It returns two outputs in the following order:
% 1) A 2D array of integers representing a document fingerprint
% 2) The stripped length of the document (in characters), i.e. the length
%    of the document after it has had whitespace stripped from it
%
% Example usage:
% [fp, slength] = Winnow('file.txt',5,10)
% Author: Peter Bier

% Calculate the window size, based on the values of t (guarantee threshold)
% and k (noise threshold)
w = t - k + 1;

% Read the contents of a document, i.e. a file, into a string
s = fileread(filename);

% Strip out unnecessary characters (e.g. removing white space)
% Also converts uppercase values to lowercase ones.
s = StripString(s);
filelength = length(s);

% Create k-grams from the string
kgrams = Kgram(k,s);

% Find the hash values for all kgrams
hashes = HashList(kgrams);

% Use a window of size w to generate a sequence of windows from the hashes
windows = Window(w,hashes); %

% Create the fingerprint by selecting the rightmost minimum from each window
% along with it's position.  Each value/position combination is added
% to the fingerprint only once.
fp = Fingerprint(windows);

end



