function x_samp = sample_gen(n_dim, nx_samp, l_samp, varargin)
import manyd.gen.*

p = inputParser;

addRequired(p,'n_dim',@isnumeric);
addRequired(p,'nx_samp',@isnumeric);
addRequired(p,'l_samp',@ischar);
addOptional(p,'seed',0,@isnumeric);

parse(p, n_dim, nx_samp, l_samp, varargin{:});

n_dim = p.Results.n_dim;
nx_samp = p.Results.nx_samp;
l_samp = p.Results.l_samp;
seed = p.Results.seed;

switch l_samp
    case 'rand'
        rng(seed); % fix random number seed for repeatablity
        x_samp = rand(n_dim, nx_samp);

    case 'grid' % generate a uniform  grid
        x_samp = grid.sample(n_dim, nx_samp);

    case 'edgegrid'
        x_samp = edgegrid.sample(n_dim, nx_samp);

    case 'sparse'
        x_samp = sparse.sample(n_dim, nx_samp);

    case 'fith' % fill in the holes
        x_samp = fith.sample(n_dim, nx_samp, seed);

    case 'repulsefith'
        x_samp = repulse.sample(n_dim, nx_samp, seed);

    case 'sobol' % sobol quasi-random number generator
        x_samp = sobol.sample(n_dim, nx_samp, seed);

    case 'halton' % halton quasi-random number generator
        x_samp = halton.sample(n_dim, nx_samp, seed);

    case 'ihs' % Beachkofski-Grandhi LHC sampling, improved by Burkhart
        x_samp = ihs.sample(n_dim, nx_samp, seed);

    case 'niederreiter'
        x_samp = niederreiter.sample(n_dim, nx_samp, seed);

    otherwise
        error('Not a valid generator')
end

end