import cython

def test_arith(int complex a, int complex b):
    """
    >>> test_arith(4, 2)
    ((-4+0j), (6+0j), (2+0j), (8+0j), (2+0j))
    >>> test_arith(6+9j, 3j)
    ((-6-9j), (6+12j), (6+6j), (-27+18j), (3-2j))
    >>> test_arith(29+11j, 5+7j)
    ((-29-11j), (34+18j), (24+4j), (68+258j), (3-2j))
    """
    return -a, a+b, a-b, a*b, a/b

@cython.cdivision(False)
def test_div_by_zero(long complex z):
    """
    >>> test_div_by_zero(4j)
    -25j
    >>> test_div_by_zero(0)
    Traceback (most recent call last):
    ...
    ZeroDivisionError: float division
    """
    return 100/z

def test_coercion(int a, long b, int complex c):
    """
    >>> test_coercion(1, -2, 3-3j)
    (1+0j)
    (-2+0j)
    (3-3j)
    (5-6j)
    """
    cdef double complex z
    z = a; print z
    z = b; print z
    z = c; print z
    return z + a + b + c


def test_conjugate(long complex z):
    """
    >>> test_conjugate(2+3j)
    (2-3j)
    """
    return z.conjugate()