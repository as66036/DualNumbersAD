module DualNumbersAD

export Dual, dual, value, derivpart, deriv, deriv2

import Base: +, -, *, /, ^, show
import Base: sin, cos, exp, sqrt, log

struct Dual{T}
    a::T
    b::T
end

dual(a::T, b::T) where {T} = Dual{T}(a, b)
value(x::Dual) = x.a
derivpart(x::Dual) = x.b

function show(io::IO, x::Dual)
    print(io, "Dual(", x.a, ", ", x.b, ")")
end

+(x::Dual, y::Dual) = Dual(x.a + y.a, x.b + y.b)
-(x::Dual, y::Dual) = Dual(x.a - y.a, x.b - y.b)
-(x::Dual)          = Dual(-x.a, -x.b)

+(x::Dual, c::Real) = Dual(x.a + c, x.b)
+(c::Real, x::Dual) = x + c
-(x::Dual, c::Real) = Dual(x.a - c, x.b)
-(c::Real, x::Dual) = Dual(c - x.a, -x.b)

*(x::Dual, y::Dual) = Dual(x.a * y.a, x.a * y.b + x.b * y.a)
*(x::Dual, c::Real) = Dual(x.a * c, x.b * c)
*(c::Real, x::Dual) = x * c

/(x::Dual, y::Dual) = Dual(x.a / y.a, (x.b * y.a - x.a * y.b) / (y.a^2))
/(x::Dual, c::Real) = Dual(x.a / c, x.b / c)
/(c::Real, x::Dual) = Dual(c / x.a, (-c * x.b) / (x.a^2))

^(x::Dual, n::Real) = Dual(x.a^n, n * x.a^(n - 1) * x.b)
^(a::Real, x::Dual) = Dual(a^x.a, a^x.a * log(a) * x.b)

sin(x::Dual)  = Dual(sin(x.a),  cos(x.a) * x.b)
cos(x::Dual)  = Dual(cos(x.a), -sin(x.a) * x.b)
exp(x::Dual)  = Dual(exp(x.a),  exp(x.a) * x.b)
sqrt(x::Dual) = Dual(sqrt(x.a), x.b / (2 * sqrt(x.a)))



log(x::Dual)  = Dual(log(x.a),  x.b / x.a)

function deriv(f, x::Real)
    y = f(Dual(x, 1.0))
    return y.b
end

function deriv2(f, x::Real)
    x2 = Dual(Dual(x, 1.0), Dual(1.0, 0.0))
    y2 = f(x2)
    return y2.b.b
end

end

