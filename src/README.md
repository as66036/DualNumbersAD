# DualNumbersAD

Dual Number Arithmetic for Automatic Differentiation in Julia  
Course: Introduction to Scientific Computing  
Instructor: Dr. Hayri Sezer  
  

---

## Overview

This project implements a Dual Number arithmetic system in Julia for automatic differentiation.

A dual number is defined as:

D = a + bε

where ε² = 0.

By overloading arithmetic operators and elementary functions, derivative information is automatically propagated through calculations. This enables computation of first- and second-order derivatives without symbolic differentiation or finite difference approximations.

The implementation supports parametric types and nested dual numbers for higher-order derivatives.

---

## Implemented Operations

### Arithmetic Operations
- Addition: `D₁ + D₂`
- Subtraction: `D₁ - D₂`
- Multiplication: `D₁ * D₂`
- Division: `D₁ / D₂`
- Dual to real power: `D^n`
- Real to dual power: `a^D`

### Elementary Functions
- `sin(D)`
- `cos(D)`
- `exp(D)`
- `sqrt(D)`

### Automatic Differentiation
- First derivative: `deriv(f, x)`
- Second derivative: `deriv2(f, x)`

---

## Installation Instructions (Local)

1. Clone or download this repository.
2. Open Julia in the project directory (the folder containing `Project.toml`).
3. Activate the environment:

```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()
```


## Package Load
include("src/DualNumbersAD.jl")
using .DualNumbersAD

## Polynomial Funcrtion Ex

using .DualNumbersAD

f(x) = x^3 + 2x + 1

deriv(f, 2.0)      # First derivative at x = 2
deriv2(f, 2.0)     # Second derivative at x = 2


## expected output

f'(2) = 14
f''(2) = 12

## Trigonometric and Exponential Function

g(x) = sin(x) + exp(x) + sqrt(x)

deriv(g, 4.0)
deriv2(g, 4.0)

## expected output
deriv(g, 4.0)
54.1945064

deriv2(g, 4.0)
55.3237025

This project demonstrates the implementation of dual number arithmetic in Julia using multiple dispatch and parametric types. By overloading core operators and elementary functions, the system enables efficient and exact computation of first- and second-order derivatives through automatic differentiation.
