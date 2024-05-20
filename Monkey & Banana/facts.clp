(deffacts monkey-hungry
  (monkey-state (state Hungry))
)

(deffacts is-on-objects
  (is-on (object Monkey) (location Floor))
  (is-on (object Chair) (location Floor))
  (is-on (object Desk) (location Floor))
  (is-on (object Banana) (location Ceiling))
)