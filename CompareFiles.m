% Compares files within a specified directory to determine
% which files meet a particular similarity threshold.
%
% The user will be promted to enter parameters for the winnowing
% algorithm (k and t) as well as entering a similarity threshold.
% Matches that meet the threshold will be displayed to the user.
%
% For this script to work it should be placed in the same directory 
% as the Winnow function and the other functions you have written.

clear

% Enter the directory containing files to compare
d = input('Please enter the name of the directory (hit enter to default to current dir): ','s');
% default to current directory if enter is hit
if length(d)==0
    d = '.';
end
% Grab the files contained in the specified directory, these will be file
% structures
files = dir(d);
nfiles = length(files); % Number of file structures (some will be directories)

% Set k value (the noise threshold), which will be a positive integer
k = input('Enter a positive integer value for k (the noise threshold): ');

% Set t value (the guarantee threshold), which will be a positive integer
t = input('Enter an integer value for t (the guarantee threshold) where t>=k: ');

% Need a threshold (only report matches with similarities above this)
s = input('Enter the similarity threshold (e.g. 80 for 80%): ');

% Calculate fingerprints for all the files contained in the directory
% ignoring any subdirectories.
nf = 0; % Count of number of filenames, will be less than number of file structures
for i=1:nfiles

    % We do not want to generate fingerprints for directories.
    if files(i).isdir == false
        % We have a file, so generate a fingerprint
        nf = nf + 1;
        filename{nf} = files(i).name; % Extract name
        [fp{nf}, filelength(nf)] = Winnow(filename{nf},k,t); % Find fingerprint
    end

end

% Do pairwise comparison of every file against every other file

fprintf('\nComparing all files in specified directory, matches (with similarity scores) are as follows:\n\n')
matches = 0; % will keep track of how many pairs matched

for i=1:nf
    % Can ignore combinations we have already checked and also don't
    % need to check files with themselves, so j should start at i+1.
    for j=(i+1):nf

        fp1 = fp{i};
        fp2 = fp{j};

        % Find matching positions
        [matchpos1] = FindMatchPositions(fp1, fp2);
        [matchpos2] = FindMatchPositions(fp2, fp1);

        % We need to know the strength lengths to calculate the similarity scores
        s1length = filelength(i);
        s2length = filelength(j);

        % Calculate similarity scores (out of 100).
        sim1 = SimilarityScore(matchpos1,k,s1length)*100;
        sim2 = SimilarityScore(matchpos2,k,s2length)*100;

        maxsimilarity = max(sim1,sim2);

        % Check, do we meet the specified similarity threshold?  If so,
        % display match information
        if maxsimilarity>s
            fprintf('%-30s (%0.1f%%)   %-30s (%0.1f%%)\n', filename{i}, sim1, filename{j}, sim2)
            matches = matches + 1;
        end


    end
end

fprintf('\nFound %i matches\n',matches);



