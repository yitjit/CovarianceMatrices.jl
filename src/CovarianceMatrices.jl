"""
A package for dealing with the estimation of (co)variance matrices.

    1. Define CovarianceEstimator(s) which are robust to heteroskedasticity, time-dependence, amd spatial dependence (cluster)
    2. Optionally, interface with GLM.jl to provide estimates of coefficients' standard errors which are robust

These use cases utilize different parts of this package, make sure you read the
documentation.
"""

module CovarianceMatrices

# using Requires
#
# function __init__()
#     @info("INIT CALLED")
#     @require GLM="38e38edf-8417-5370-95a0-9cbb8c7f171a" include("glm.jl")
# end
using Requires: @require

using LinearAlgebra
using Statistics
using StatsBase
using StatsBase: CovarianceEstimator
using StatsModels

#include("varhac.jl")
include("types.jl")
include("HAC.jl")
include("HC.jl")
include("CRHC.jl")
include("covariance.jl")
include("covarianceestimator.jl")
include("methods.jl")

function __init__()
    @require GLM="38e38edf-8417-5370-95a0-9cbb8c7f171a" include("glm.jl")
end


export QuadraticSpectralKernel, TruncatedKernel, ParzenKernel, BartlettKernel,
       TukeyHanningKernel, VARHAC, HC0, HC1, HC2, HC3, HC4, HC4m, HC5, CRHC0, CRHC1,
       CRHC2, CRHC3, NeweyWest, Andrews, 
       HACCache, HCCache, CRHCCache, CovarianceMatrix, vcov, stderr, cov

end # module
