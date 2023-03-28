function [pytorch_arr] = to_pytorch_int(matlab_arr)
    %TO_PYTORCH_INT Convert matlab array of ints to pytorch array of ints
    %   Same as to_pytorch but with explicit casting to int.
    pytorch_arr = py.torch.tensor(py.numpy.array(int64(matlab_arr)));
    end
    