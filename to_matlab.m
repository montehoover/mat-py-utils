function [matlab_arr] = to_matlab(pytorch_arr)
%TO_MATLAB Convert pytorch array to matlab array.
%   Matlab's python interop is built to work with Numpy, but for some
%   reason it doesn't work with Pytorch directly. So we explicitly convert
%   the Pytorch array to a Numpy array and then convert it to a Matlab
%   array of type double.
%   Note that Matlab must be running a Python environment where both
%   Pytorch and Numpy are installed. Call "pyenv" to check which
%   environment is running.
matlab_arr = double(py.numpy.array(pytorch_arr));
end