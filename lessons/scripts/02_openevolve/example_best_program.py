"""Best program from our OpenEvolve run with gpt-4o-mini (iteration 27, score 0.964).

Saved so the no-key path can see what the language model wrote. Run as is.
"""
import math  # noqa: F401  (available to evolved code)


# EVOLVE-BLOCK-START
def fit(train_rows):
    """Learn a formula for y from x1 and x2.

    train_rows is a list of dicts with keys "x1", "x2", "y" (all positive).
    Return a function predict(x1, x2) -> y. Any constant in the formula must
    be estimated here from train_rows.

    Naive guess: y grows linearly with x1 and ignores x2.
    """
    log_y = [math.log(r["y"]) for r in train_rows]
    log_x1 = [math.log(r["x1"]) for r in train_rows]
    log_x2 = [math.log(r["x2"]) for r in train_rows]
    
    n = len(train_rows)
    
    # Calculate coefficients a, b, and intercept
    A = [[1, log_x1[i], log_x2[i]] for i in range(n)]
    B = log_y
    # Solve for coefficients (intercept, a, b) using least squares
    from statistics import mean
    import numpy as np
    A = np.array(A)
    B = np.array(B)
    coeffs = np.linalg.lstsq(A, B, rcond=None)[0]
    c, a, b = coeffs[0], coeffs[1], coeffs[2]

    def predict(x1: float, x2: float) -> float:
        return math.exp(c) * (x1 ** a) * (x2 ** b)

    return predict
# EVOLVE-BLOCK-END
