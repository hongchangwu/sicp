;; Recursive
(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))

;; Iterative
(define (cont-frac-iter n d k)
  (define (iter acc i)
    (let ((ni (n i))
          (di (d i)))
      (if (= i 0)
          acc
          (iter (/ ni (+ di acc)) (- i 1)))))
  (iter 0 k))

(define phi (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 100))
