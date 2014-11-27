(define tolerance 0.000001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average . ns)
  (/ (apply + ns) (length ns)))

(define (solution1) (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))
(define (solution2) (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0))
