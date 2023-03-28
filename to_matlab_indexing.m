function [one_based_indices] = to_matlab_indexing(zero_based_indices)
%TO_MATLAB_INDEXING Convert array of indices from zero-based to one-based.
%   Take an array of integers that correspond to some other array's
%   indices. If we use those indices in pytorch, we want them to be
%   zero-based instead of one-based. Simply subtract one from each value in
%   the array.
%
%   This is intended for python-to-matlab situations, especially for meshes
%   which keep track triangle faces in the mesh by simply listing integer
%   IDs for the three vertices of the triangle, and the IDs correspond to 
%   the indices of another array that lists the vertices.
%
%   In other words, if we have the value "1" in this array in Matlab, it
%   corresponds to the first item of some array (probably an array of 
%   vertices). If we want a value that corresponds to the first item in 
%   that vertices array in Python we need that value to be "0".
if min(zero_based_indices) ~= 0
    throw(MException('PyScripts:notZeroBased', ...
        "Expected a list of integer indices starting at zero, but " + ...
        "got something else."))
end
one_based_indices = zero_based_indices + 1;
end
