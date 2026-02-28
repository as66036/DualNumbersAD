# DualNumbersAD

Dual number arithmetic for automatic differentiation in Julia.

## What this package does
Implements a dual number type `Dual{T}` (supports nested dual numbers) with overloaded operators and elementary functions:
- +, -, *, /, power (Dual^n and a^Dual)
- sin, cos, exp, sqrt
- derivative utilities: `deriv(f, x)` and `deriv2(f, x)`

## Installation (local)
Open Julia in this repository folder and run:

```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()

include("src/DualNumbersAD.jl")
using .DualNumbersAD