#lang racket

(provide 2-1 2-2)

(define input '(1 0 0 3 1 1 2 3 1 3 4 3 1 5 0 3 2 9 1 19 1 9 19 23 1 23 5 27 2 27 10 31 1 6 31 35 1 6 35 39 2 9 39 43 1 6 43 47 1 47 5 51 1 51 13 55 1 55 13 59 1 59 5 63 2 63 6 67 1 5 67 71 1 71 13 75 1 10 75 79 2 79 6 83 2 9 83 87 1 5 87 91 1 91 5 95 2 9 95 99 1 6 99 103 1 9 103 107 2 9 107 111 1 111 6 115 2 9 115 119 1 119 6 123 1 123 9 127 2 127 13 131 1 131 9 135 1 10 135 139 2 139 10 143 1 143 5 147 2 147 6 151 1 151 5 155 1 2 155 159 1 6 159 0 99 2 0 14 0))

(define (eval-intcode position code)
    (define opcode (list-ref code position))
    (if (equal? opcode 99) code
        (let* (
            [operand-one (list-ref code (list-ref code (+ 1 position)))]
            [operand-two (list-ref code (list-ref code (+ 2 position)))]
            [destination (list-ref code (+ 3 position))]
            [updated-code
                (cond
                    [(equal? opcode 1) (list-set code destination (+ operand-one operand-two))]
                    [(equal? opcode 2) (list-set code destination (* operand-one operand-two))]
                    [else code])])
                (eval-intcode (+ 4 position) updated-code))))

(define (try-combination noun verb)
    (let ([updated-code (list-set (list-set input 1 noun) 2 verb)])
        (list-ref (eval-intcode 0 updated-code) 0)))

(define (2-1)
    (try-combination 12 2))

(define (2-2)
    (let* (
        [combination
            (stream-ref
                (for*/stream (
                    [i (range 101)]
                    [j (range 101)]
                    #:when (equal? (try-combination i j) 19690720))
                        (list i j))
            0)]
        [noun (first combination)]
        [verb (second combination)])
            (+ (* 100 noun) verb)))
