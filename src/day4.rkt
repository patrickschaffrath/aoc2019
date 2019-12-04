#lang racket

(provide 4-1 4-2)

(define input '(146810 612564))

(define (number->charlist number)
    (string->list (number->string number)))

(define (increasing? number)
    (define (increasing?* lst)
        (cond
            [(null? (cdr lst)) #t]
            [(char<=? (car lst) (cadr lst)) (increasing?* (cdr lst))]
            [else #f]))
    (increasing?* (number->charlist number)))

(define (adjacent-digits? number)
    (define (adjacent-digits?* lst)
        (cond
            [(null? (cdr lst)) #f]
            [(char=? (car lst) (cadr lst)) #t]
            [else (adjacent-digits?* (cdr lst))]))
    (adjacent-digits?* (number->charlist number)))

(define (adjacent-digits-exact? number)
    (if (not (adjacent-digits? number)) #f
        (ormap (curry = 2) (map length (group-by identity (number->charlist number))))))

(define (4-1)
    (length (filter adjacent-digits? (filter increasing? (range (first input) (add1 (second input)))))))

(define (4-2)
    (length (filter adjacent-digits-exact? (filter increasing? (range (first input) (add1 (second input)))))))
