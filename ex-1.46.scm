(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (iterative-improve good-enough? improve-guess)
  (define (try guess)
    (if (good-enough? guess)
        guess
        (try (improve-guess guess))))
  (lambda (x) (try x)))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (< (abs (- guess (f guess)))
       tolerance))
  (define (improve-guess guess)
    (f guess))
  ((iterative-improve good-enough? improve-guess) first-guess))

(define (sqrt x)
  (newtons-method (lambda (y) (- (* y y) x)) 1.0))
