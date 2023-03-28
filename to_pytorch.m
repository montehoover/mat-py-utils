function [pytorch_arr] = to_pytorch(matlab_arr)
%TO_PYTORCH Convert matlab array to pytorch array
%   Matlab's python interop is built to work with Numpy, but for some
%   reason it doesn't work with Pytorch directly. So we explicitly convert
%   the Matlab array to a Numpy array and then convert it to a Pytorch
%   array.
%   Note that Matlab must be running a Python environment where both
%   Pytorch and Numpy are installed. Call "pyenv" to check which
%   environment is running.
pytorch_arr = py.torch.tensor(py.numpy.array(matlab_arr));
end

