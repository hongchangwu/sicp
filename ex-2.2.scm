(define (average x y)
  (/ (+ x y) 2))

(define (make-point x y)
  (cons x y))
(define x-point car)
(define y-point cdr)
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment a b)
  (cons a b))
(define start-segment car)
(define end-segment cdr)
(define (midpoint-segment segment)
  (let* ((a (start-segment segment))
         (b (end-segment segment))
         (xa (x-point a))
         (ya (y-point a))
         (xb (x-point b))
         (yb (y-point b)))
    (make-point (average xa xb) (average ya yb))))
