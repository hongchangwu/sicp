(define (cont-frac n d k)
  (define (iter acc i)
    (let ((ni (n i))
          (di (d i)))
      (if (= i 0)
          acc
          (iter (/ ni (+ di acc)) (- i 1)))))
  (iter 0 k))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i) (- (* i 2) 1))
             k))
