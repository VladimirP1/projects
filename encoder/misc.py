from sympy import *

def find_arg(expr, t = sin):
    if type(expr) == t:
        return expr.args[0]
    else:
        for arg in expr.args:
            f = find_arg(arg, t)
            if f is not None:
                return f
        return None

def to_single_sine(ve):
    ve = ve.expand().simplify().expand()
    sin_arg = find_arg(ve)
    Ks = ve.coeff(sin(sin_arg))
    Kc = - ve.coeff(cos(sin_arg))
    alpha = atan(Kc/Ks)
    k = sin(alpha)/Kc
    ve2 = sin(sin_arg - alpha)/k
    return {'func' : ve2.simplify(), 'freq' : sin_arg.coeff(next(iter(sin_arg.free_symbols)))/2/pi, 'phase' : (- alpha).simplify()}