#lang racket

(provide 5-1 5-2)

(define input '(3 225 1 225 6 6 1100 1 238 225 104 0 1102 68 5 225 1101 71 12 225 1 117 166 224 1001 224 -100 224 4 224 102 8 223 223 101 2 224 224 1 223 224 223 1001 66 36 224 101 -87 224 224 4 224 102 8 223 223 101 2 224 224 1 223 224 223 1101 26 51 225 1102 11 61 224 1001 224 -671 224 4 224 1002 223 8 223 1001 224 5 224 1 223 224 223 1101 59 77 224 101 -136 224 224 4 224 1002 223 8 223 1001 224 1 224 1 223 224 223 1101 11 36 225 1102 31 16 225 102 24 217 224 1001 224 -1656 224 4 224 102 8 223 223 1001 224 1 224 1 224 223 223 101 60 169 224 1001 224 -147 224 4 224 102 8 223 223 101 2 224 224 1 223 224 223 1102 38 69 225 1101 87 42 225 2 17 14 224 101 -355 224 224 4 224 102 8 223 223 1001 224 2 224 1 224 223 223 1002 113 89 224 101 -979 224 224 4 224 1002 223 8 223 1001 224 7 224 1 224 223 223 1102 69 59 225 4 223 99 0 0 0 677 0 0 0 0 0 0 0 0 0 0 0 1105 0 99999 1105 227 247 1105 1 99999 1005 227 99999 1005 0 256 1105 1 99999 1106 227 99999 1106 0 265 1105 1 99999 1006 0 99999 1006 227 274 1105 1 99999 1105 1 280 1105 1 99999 1 225 225 225 1101 294 0 0 105 1 0 1105 1 99999 1106 0 300 1105 1 99999 1 225 225 225 1101 314 0 0 106 0 0 1105 1 99999 7 677 677 224 1002 223 2 223 1006 224 329 1001 223 1 223 1007 226 226 224 1002 223 2 223 1006 224 344 1001 223 1 223 1108 226 677 224 102 2 223 223 1005 224 359 1001 223 1 223 1107 226 677 224 1002 223 2 223 1006 224 374 101 1 223 223 1107 677 226 224 1002 223 2 223 1006 224 389 101 1 223 223 7 226 677 224 1002 223 2 223 1005 224 404 101 1 223 223 1008 677 226 224 102 2 223 223 1005 224 419 101 1 223 223 1008 226 226 224 102 2 223 223 1006 224 434 101 1 223 223 107 226 226 224 1002 223 2 223 1005 224 449 1001 223 1 223 108 226 677 224 102 2 223 223 1005 224 464 101 1 223 223 1108 677 226 224 102 2 223 223 1005 224 479 101 1 223 223 1007 226 677 224 102 2 223 223 1006 224 494 101 1 223 223 107 677 677 224 102 2 223 223 1005 224 509 101 1 223 223 108 677 677 224 102 2 223 223 1006 224 524 1001 223 1 223 8 226 677 224 102 2 223 223 1005 224 539 101 1 223 223 107 677 226 224 102 2 223 223 1005 224 554 1001 223 1 223 8 226 226 224 102 2 223 223 1006 224 569 1001 223 1 223 7 677 226 224 1002 223 2 223 1005 224 584 1001 223 1 223 1108 226 226 224 102 2 223 223 1005 224 599 1001 223 1 223 1107 677 677 224 1002 223 2 223 1006 224 614 1001 223 1 223 1007 677 677 224 1002 223 2 223 1006 224 629 1001 223 1 223 108 226 226 224 102 2 223 223 1005 224 644 1001 223 1 223 8 677 226 224 1002 223 2 223 1005 224 659 1001 223 1 223 1008 677 677 224 1002 223 2 223 1006 224 674 1001 223 1 223 4 223 99 226))

(define (update-code opcode position code)
    (cond
        [(ormap (curry equal? opcode) '(3 4))
            (let ([destination (list-ref code (+ 1 position))])
                (cond
                    [(equal? opcode 3)
                        (list-set code destination (string->number (string (read-char (current-input-port)))))]
                    [else (println (list-ref code destination)) code]))]
        [(ormap (curry equal? opcode) '(1 2))
            (let (
                [operand-one (list-ref code (list-ref code (+ 1 position)))]
                [operand-two (list-ref code (list-ref code (+ 2 position)))]
                [destination (list-ref code (+ 3 position))])
                    (cond
                        [(equal? opcode 1) (list-set code destination (+ operand-one operand-two))]
                        [else (list-set code destination (* operand-one operand-two))]))]
        [(ormap (curry equal? opcode) '(101 102))
            (let (
                [operand-one (list-ref code (+ 1 position))]
                [operand-two (list-ref code (list-ref code (+ 2 position)))]
                [destination (list-ref code (+ 3 position))])
                    (cond
                        [(equal? opcode 101) (list-set code destination (+ operand-one operand-two))]
                        [else (list-set code destination (* operand-one operand-two))]))]
        [(ormap (curry equal? opcode) '(1001 1002))
            (let (
                [operand-one (list-ref code (list-ref code (+ 1 position)))]
                [operand-two (list-ref code (+ 2 position))]
                [destination (list-ref code (+ 3 position))])
                    (cond
                        [(equal? opcode 1001) (list-set code destination (+ operand-one operand-two))]
                        [else (list-set code destination (* operand-one operand-two))]))]
        [(ormap (curry equal? opcode) '(1101 1102))
            (let (
                [operand-one (list-ref code (+ 1 position))]
                [operand-two (list-ref code (+ 2 position))]
                [destination (list-ref code (+ 3 position))])
                    (cond
                        [(equal? opcode 1101) (list-set code destination (+ operand-one operand-two))]
                        [else (list-set code destination (* operand-one operand-two))]))]
        [(ormap (curry equal? opcode) '(7 8))
            (let (
                [operand-one (list-ref code (list-ref code (+ 1 position)))]
                [operand-two (list-ref code (list-ref code (+ 2 position)))]
                [destination (list-ref code (+ 3 position))])
                    (cond
                        [(equal? opcode 7) (list-set code destination (if (< operand-one operand-two) 1 0))]
                        [else (list-set code destination (if (= operand-one operand-two) 1 0))]))]
        [(ormap (curry equal? opcode) '(107 108))
            (let (
                [operand-one (list-ref code (+ 1 position))]
                [operand-two (list-ref code (list-ref code (+ 2 position)))]
                [destination (list-ref code (+ 3 position))])
                    (cond
                        [(equal? opcode 107) (list-set code destination (if (< operand-one operand-two) 1 0))]
                        [else (list-set code destination (if (= operand-one operand-two) 1 0))]))]
        [(ormap (curry equal? opcode) '(1007 1008))
            (let (
                [operand-one (list-ref code (list-ref code (+ 1 position)))]
                [operand-two (list-ref code (+ 2 position))]
                [destination (list-ref code (+ 3 position))])
                    (cond
                        [(equal? opcode 1007) (list-set code destination (if (< operand-one operand-two) 1 0))]
                        [else (list-set code destination (if (= operand-one operand-two) 1 0))]))]
        [(ormap (curry equal? opcode) '(1107 1108))
            (let (
                [operand-one (list-ref code (+ 1 position))]
                [operand-two (list-ref code (+ 2 position))]
                [destination (list-ref code (+ 3 position))])
                    (cond
                        [(equal? opcode 1107) (list-set code destination (if (< operand-one operand-two) 1 0))]
                        [else (list-set code destination (if (= operand-one operand-two) 1 0))]))]
        [else code]))

(define (eval-intcode position code)
    (define opcode (list-ref code position))
    (define next-position (+ position (if (ormap (curry equal? opcode) '(3 4)) 2 4)))
    (if (equal? opcode 99) code
        (eval-intcode next-position (update-code opcode position code))))

(define (eval-intcode-extended position code)
    (define opcode (list-ref code position))
    (define next-position
        (+ position
            (cond
                [(ormap (curry equal? opcode) '(3 4)) 2]
                [(ormap (curry equal? opcode) '(5 105 1005 1105 6 106 1006 1106)) 3]
                [else 4])))
    (define (go-on)
        (eval-intcode-extended next-position (update-code opcode position code)))
    (cond
        [(equal? opcode 99) code]
        [(equal? opcode 5)
            (if (zero? (list-ref code (list-ref code (+ 1 position))))
                (go-on)
                (eval-intcode-extended (list-ref code (list-ref code (+ 2 position))) code))]
        [(equal? opcode 105)
            (if (zero? (list-ref code (+ 1 position)))
                (go-on)
                (eval-intcode-extended (list-ref code (list-ref code (+ 2 position))) code))]
        [(equal? opcode 1005)
            (if (zero? (list-ref code (list-ref code (+ 1 position))))
                (go-on)
                (eval-intcode-extended (list-ref code (+ 2 position)) code))]
        [(equal? opcode 1105)
            (if (zero? (list-ref code (+ 1 position)))
                (go-on)
                (eval-intcode-extended (list-ref code (+ 2 position)) code))]
        [(equal? opcode 6)
            (if (not (zero? (list-ref code (list-ref code (+ 1 position)))))
                (go-on)
                (eval-intcode-extended (list-ref code (list-ref code (+ 2 position))) code))]
        [(equal? opcode 106)
            (if (not (zero? (list-ref code (+ 1 position))))
                (go-on)
                (eval-intcode-extended (list-ref code (list-ref code (+ 2 position))) code))]
        [(equal? opcode 1006)
            (if (not (zero? (list-ref code (list-ref code (+ 1 position)))))
                (go-on)
                (eval-intcode-extended (list-ref code (+ 2 position)) code))]
        [(equal? opcode 1106)
            (if (not (zero? (list-ref code (+ 1 position))))
                (go-on)
                (eval-intcode-extended (list-ref code (+ 2 position)) code))]
        [else (go-on)]))

(define (5-1)
    (eval-intcode 0 input))

(define (5-2)
    (eval-intcode-extended 0 input))
