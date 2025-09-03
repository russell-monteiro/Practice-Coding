# solution1.py
# ==============================================
# Lab Assignment 4 - Time Complexity (Q7–Q9)
# ==============================================
import time

# ---------- Q7 ----------
def func1(n):
    s = 0
    for _ in range(n):
        j = 1
        while j * j <= n:
            s += 1
            j += 1
    return s

def analyze_func1():
    """
    Analyze func1:
    Outer loop: runs n times
    Inner loop: runs sqrt(n) times (since j*j <= n)
    Total = n * sqrt(n) → O(n^(3/2))
    """
    times = {}
    for n in [100, 500, 1000]:
        start = time.time()
        func1(n)
        end = time.time()
        times[n] = end - start
    return times, "Estimated Complexity: O(n^(3/2))"


# ---------- Q8 ----------
def func2(n):
    for _ in range(n):
        for _ in range(n):
            k = 1
            while k < n:
                k *= 2

def analyze_func2():
    """
    Analyze func2:
    Outer double loop: n * n = n^2
    Inner while: runs log(n) times (since k doubles each step)
    Total = n^2 * log(n) → O(n^2 log n)
    """
    times = {}
    for n in [100, 200, 400]:
        start = time.time()
        func2(n)
        end = time.time()
        times[n] = end - start
    return times, "Estimated Complexity: O(n^2 log n)"


# ---------- Q9 ----------
def func3(n):
    if n <= 1:
        return 1
    return func3(n-1) + func3(n-1)

def analyze_func3():
    """
    Analyze func3:
    Recurrence: T(n) = 2*T(n-1) + O(1)
    → O(2^n) exponential
    """
    times = {}
    for n in [10, 15, 20]:   # keep small, exponential grows very fast
        start = time.time()
        func3(n)
        end = time.time()
        times[n] = end - start
    return times, "Estimated Complexity: O(2^n)"


# ---------- Run all ----------
if __name__ == "__main__":
    t1, c1 = analyze_func1()
    print("Q7 Results:", t1, c1)

    t2, c2 = analyze_func2()
    print("Q8 Results:", t2, c2)

    t3, c3 = analyze_func3()
    print("Q9 Results:", t3, c3)
