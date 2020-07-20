from sympy import * 

A_set = 4
f_set = 10e3
R_set = 120 #0.0062 * f_set
L_max = 2e-3
L_min = 0

print('R =', R_set)

f,R,L,A = symbols('f,R,L,A', positive=True)     
t = symbols('t')

def setvars(volt):
    global f,t,R,L,A
    global A_set, R_set, f_set, L_max, L_min
    return volt.subs(R,R_set).subs(A,A_set).subs(f,f_set)

def maxvolt():
    global f,t,R,L,A
    t = symbols('t')                                                           
    I = Function("I")(t)                                                                                        
    eq = -A*sin(2*pi*f*t) + I*R + Derivative(I,t)*L
    res = dsolve(eq).rhs
    for g in filter(lambda x: (str(x) not in ['t', 'f', 'R', 'L', 'A']), res.free_symbols):
        res = res.subs(g, 0)

    sol = solve(res.diff(t), t)
    currMax = res.subs(t,sol[1]).simplify()

    return (res * R,
            currMax * R)

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

volt = maxvolt()
ve = volt[0].expand()
ss = to_single_sine(ve)

print("phase:")
pprint(ss['phase'])

bestpoint = solve(ss['phase'].diff(L).subs(L,1e-3) + 500)
print('bestpoint', bestpoint)

arg = find_arg(ss['ve'])                                                              
current_amplitude = ss['ve'].coeff(sin(arg)) / R
print("current amplitude: ")
pprint(current_amplitude)
pprint(float(setvars(current_amplitude).subs(L,1e-3)) * 1e3, 'mA')

p0 = plot(setvars(ss['phase']), (L,L_min,L_max), show = False)
p0.append(plot(setvars(volt[1]), (L,L_min,L_max), show = False)[0])
p0.show()
plot(setvars(ss['phase'].diff(L)), (L,L_min,L_max))
