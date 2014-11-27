(define (cont-frac n d k)
  (define (iter acc i)
    (let ((ni (n i))
          (di (d i)))
      (if (= i 0)
          acc
          (iter (/ ni (+ di acc)) (- i 1)))))
  (iter 0 k))

(define euler-expansion
  (cont-frac (lambda (i) 1.0)
             (lambda (i)
               (let ((x (- i 2)))
                 (if (= 0 (remainder x 3))
                     (* 2 (+ 1 (modulo x 3)))
                     1.0)))
             1000))

(define e (+ 2 euler-expansion))
