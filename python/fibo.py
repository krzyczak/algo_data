# `pip install tco` for the tco to work. tco does tails recursion in python
from tco import *

def fibo_naive(n):
  if n == 0 or n == 1:
    return n;

  return fibo_naive(n - 1) + fibo_naive(n - 2)

@with_continuations()
def fibo_tail(n, n1 = 1, n2 = 0, self=None):
  if n == 0:
    return n2

  if n == 1:
    return n1;

  return self(n - 1, n1 + n2, n1)

print(fibo_naive(30) == fibo_tail(30))
print(fibo_naive(10) == fibo_tail(10))
print(fibo_tail(300))
# print(fibo_naive(35)) # this is already quite slow
# print(fibo_naive(300)) # this will take forever or cause stack overflow
