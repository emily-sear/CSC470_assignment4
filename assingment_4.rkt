;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname assingment_4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define merge
  (lambda (loi1 loi2)
    (cond
      ((and(null? loi1) (null? loi2)) '())
      ((and (null? loi1) (not (null? loi2))) (append (list (car loi2)) (merge loi1 (cdr loi2)))) ; could also just return loi2
      ((and (not (null? loi1)) (null? loi2)) (append (list (car loi1)) (merge (cdr loi1) loi2))) ; could also just return loi1
      ((> (car loi1) (car loi2)) (append (list (car loi2)) (merge loi1 (cdr loi2))))
      (else (append (list (car loi1)) (merge (cdr loi1) loi2))))))

(merge '(35 62 81 90 91) '(3 83 85 90))

(define sort2
  (lambda (loi)
    (cond
      ((= (length loi) 1) loi)
      (else (append (merge(list(car loi)) (sort2 (cdr loi))))))))

(sort2 '(8 2 5 2 3)) ; works 

(define merge2
  (lambda (pred loi1 loi2)
    (cond
      ((and(null? loi1) (null? loi2)) '())
      ((and (null? loi1) (not (null? loi2))) (append (list (car loi2)) (merge2 pred loi1 (cdr loi2)))) ; could also just return loi2
      ((and (not (null? loi1)) (null? loi2)) (append (list (car loi1)) (merge2 pred (cdr loi1) loi2))) ; could also just return loi1
      ((pred (car loi1) (car loi2)) (append (list (car loi2)) (merge2 pred loi1 (cdr loi2))))
      (else (append (list (car loi1)) (merge2 pred (cdr loi1) loi2))))))


(define sort3
  (lambda (pred loi)
    (cond
      ((= (length loi) 1) loi)
      (else (append (merge2 pred (list(car loi)) (sort3 pred (cdr loi))))))))

(sort3 < '(8 2 5 2 6 ))
 