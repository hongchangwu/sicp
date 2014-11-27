(define (sgn x)
  (cond ((> x 0) 1)
        ((< x 0) -1)
        (else 0)))

(define (make-rat n d)
  (let ((g (gcd n d))
        (sgn (* (sgn n) (sgn d))))
    (cons (* sgn (/ (abs n) g)) (/ (abs d) g))))
