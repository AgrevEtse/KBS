(defrule rule-1
  (is-on (object Chair) (location Floor))
  (is-on (object Monkey) (location Floor))
  =>
  (assert (monkey-move (object Chair) (location Floor)))
  (printout t "R-01: Monkey moves to the chair on the floor" crlf)
)

(defrule rule-2
  ?d <- (monkey-move (object Chair) (location Floor))
  ?f <- (is-on (object Chair) (location Floor))
  (is-on (object Monkey) (location Floor))
  =>
  (assert (monkey-grab (object Chair)))
  (printout t "R-02: Monkey grabs the chair" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule rule-3
  (monkey-grab (object Chair))
  (is-on (object Monkey) (location Floor))
  =>
  (assert (monkey-move (object Desk) (location Floor)))
  (printout t "R-03: Monkey moves to the desk on the floor" crlf)
)

(defrule rule-4
  ?d <- (monkey-move (object Desk) (location Floor))
  ?f <- (is-on (object Monkey) (location Floor))
  (is-on (object Desk) (location Floor))
  (is-on (object Monkey) (location Floor))
  =>
  (assert (is-on (object Monkey) (location Desk)))
  (printout t "R-04: Monkey is on the desk" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule rule-5
  (is-on (object Monkey) (location Desk))
  ?d <- (monkey-grab (object Chair))
  =>
  (assert (monkey-put (object Chair) (location Desk)))
  (printout t "R-05: Monkey puts the chair on the desk" crlf)
  (retract ?d)
)

(defrule rule-6
  ?d <- (monkey-put (object Chair) (location Desk))
  (is-on (object Monkey) (location Desk))
  =>
  (assert (is-on (object Chair) (location Desk)))
  (printout t "R-06: Chair is on the desk" crlf)
  (retract ?d)
)

(defrule rule-7
  (is-on (object Monkey) (location Desk))
  (is-on (object Chair) (location Desk))
  (is-on (object Desk) (location Floor))
  =>
  (assert (monkey-move (object Chair) (location Desk)))
  (printout t "R-07: Monkey moves to the chair on the desk" crlf)
)

(defrule rule-8
  ?d <- (monkey-move (object Chair) (location Desk))
  ?f <- (is-on (object Monkey) (location Desk))
  (is-on (object Chair) (location Desk))
  (is-on (object Desk) (location Floor))
  =>
  (assert (is-on (object Monkey) (location Chair)))
  (printout t "R-08: Monkey is on the chair" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule rule-9
  ?d <- (is-on (object Banana) (location Ceiling))
  (is-on (object Monkey) (location Chair))
  (is-on (object Chair) (location Desk))
  (is-on (object Desk) (location Floor))
  =>
  (assert (monkey-grab (object Banana)))
  (printout t "R-09: Monkey grabs the banana" crlf)
  (retract ?d)
)

(defrule rule-10
  ?d <- (monkey-grab (object Banana))
  (is-on (object Monkey) (location Chair))
  (is-on (object Chair) (location Desk))
  (is-on (object Desk) (location Floor))
  =>
  (assert (monkey-eat (object Banana)))
  (printout t "R-10: Monkey eats the banana" crlf)
  (retract ?d)
)

(defrule rule-11
  ?d <- (monkey-state (state Hungry))
  (monkey-eat (object Banana))
  (is-on (object Monkey) (location Chair))
  (is-on (object Chair) (location Desk))
  (is-on (object Desk) (location Floor))
  =>
  (assert (monkey-state (state Happy)))
  (printout t "R-11: Monkey is happy" crlf)
  (retract ?d)
)