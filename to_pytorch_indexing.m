function [zero_based_indices] = to_pytorch_indexing(one_based_indices)
%TO_PYTORCH_INDEXING Convert array of indices from one-based to zero-based.
%   Take an array of integers that correspond to some other array's
%   indices. If we use those indices in pytorch, we want them to be
%   zero-based instead of one-based. Simply subtract one from each value in
%   the array.
%
%   This is intended for matlab-to-python situations, especially for meshes
%   which keep track triangle faces in the mesh by simply listing integer
%   IDs for the three vertices of the triangle, and the IDs correspond to 
%   the indices of another array that lists the vertices.
%
%   In other words, if we have the value "1" in this array in Matlab, it
%   corresponds to the first item of some array (probably an array of 
%   vertices). If we want a value that corresponds to the first item in 
%   that vertices array in Python we need that value to be "0".

% Commenting out this check for now because we have situations where we
% send in a quad-mesh face array for a triangle mesh, meaning 0's are
% used as null placeholders. So accept face array with zeros and just 
% convert them to -1. 
% if min(one_based_indices) ~= 1
%     throw(MException('PyScripts:notOneBased', ...
%         "Expected a list of integer indices starting at one, but " + ...
%         "got something else."))
% end
zero_based_indices = one_based_indices - 1;
end

