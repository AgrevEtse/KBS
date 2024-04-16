(defrule eliminar-enfermedad
   (input-eliminar ?index)
   =>
   (printout t "Eliminando Fact f-" ?index crlf)
   (retract ?index))

(defrule ingresar-eliminar
   =>
   (printout t "Ingresa el id de la enfermedad a Eliminar: ")
   (assert (input-eliminar (read))))

(defrule busqueda-enfermedad
   (input-enfermedad ?nombre-input)
   (enfermedad ?nombre ?sig1 ?sig2 ?sin1 ?sin2)
   (test (eq ?nombre-input ?nombre))
   =>
   (printout t "Enfermedad: " ?nombre crlf)
   (printout t "    Signos: " ?sig1 ", " ?sig2 crlf)
   (printout t "    Sintomas: " ?sin1 ", " ?sin2 crlf crlf))

(defrule ingresar-enfermedad
   =>
   (printout t "Ingresa el nombre de la enfermedad: ")
   (assert (input-enfermedad (read))))
