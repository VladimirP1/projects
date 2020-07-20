from sympy import * 

init_printing()

def find_arg(expr):
    if type(expr) == sin:
        return expr.args[0]
    else:
        for arg in expr.args:
            f = find_arg(arg)
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
    return {'ve' : ve2.simplify(), 'freq' : sin_arg.coeff(t)/2/pi, 'phase' : - alpha}

f,R,C,A = symbols('f,R,C,A', positive=True)     
t = symbols('t')
q = Function("q")(t) 

substs = {f : 20e3, R : 1, C : 1e-3, A : 5/2}

q_ = Derivative(q, t)

eq = A*sin(2*pi*f*t) - R*q_ - q/C

res = dsolve(eq).rhs
for g in filter(lambda x: (str(x) not in ['t', 'f', 'R', 'C', 'A']), res.free_symbols):
    res = res.subs(g, 0)

U1 = A*sin(2*pi*f*t)
U2 = U1 - res/C
pprint(U2)
ss = to_single_sine(U2)

p1 = plot(ss['ve'].subs(substs), (t, 0, 1e-4), show=False)
p2 = plot(U1.subs(substs)+0.1, (t, 0, 1e-4), show=False)[0]
p1.append(p2)
#p1.show()

print(float(ss['phase'].subs(substs)))
substs.pop(R)
plot(ss['phase'].subs(substs) / pi, (R, 1, 10))