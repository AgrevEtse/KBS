(clear)

(defrule iniciar-diagnostico
   ?inicio <- (start)
   =>
   (printout t crlf
               "---------------------------------" crlf
               "|  Diagnostico de Enfermedades  |" crlf
               "---------------------------------" crlf
   )

   (printout t "Cual signo tienes?" crlf
               "  A. Dolor Articular" crlf
               "  B. Tos" crlf
               "  C. Enrojecimiento de Ojos" crlf
               "  D. Llagas que no Sanan" crlf
               "  E. Ninguno" crlf
               crlf
               "  Respuesta (A/B/C/D/E): "
   )

   (bind ?respuesta (read))
   (bind ?respuesta (upcase ?respuesta))

   (if (eq ?respuesta E)
      then
         (assert (diagnostico Desconocido))
      else
         (assert (sig-1 ?respuesta))
   )

   (retract ?inicio)
)

(defrule sig-1-dolor-articular
   ?inicio <- (sig-1 A)
   =>
   (printout t crlf
               "Sientes Cansancio?" crlf
               "  Respuesta (S/N): "
   )

   (bind ?respuesta (read))
   (bind ?respuesta (upcase ?respuesta))

   (if (eq ?respuesta S)
      then
         (assert (sig-1-sig-2 S))
      else
         (assert (diagnostico Desconocido))
   )

   (retract ?inicio)
)

(defrule sig-2-cansancio
   ?inicio <- (sig-1-sig-2 S)
   =>
   (printout t crlf
               "Presentas alguno de los siguientes síntomas?" crlf
               "  A. Aumento de Peso" crlf
               "  B. Rigidez" crlf
               "  C. Ninguno" crlf
               crlf
               "  Respuesta (A/B/C): "
   )

   (bind ?respuesta (read))
   (bind ?respuesta (upcase ?respuesta))

   (if (eq ?respuesta A)
      then
         (assert (sin-3 A))
   )

   (if (eq ?respuesta B)
      then
         (assert (sin-3 B))
   )

   (if (eq ?respuesta C)
      then
         (assert (diagnostico Desconocido))
   )

   (retract ?inicio)
)

(defrule sin-3-a
   ?inicio <- (sin-3 A)
   =>
   (printout t crlf
               "Tienes alguno de los siguientes síntomas?" crlf
               "  A. Hinchazon" crlf
               "  B. Piel Seca / Cabello Seco" crlf
               "  C. Ninguno" crlf
               crlf
               "  Respuesta (A/B/C): "
   )

   (bind ?respuesta (read))
   (bind ?respuesta (upcase ?respuesta))

   (if (eq ?respuesta A)
      then
         (assert (diagnostico Obesidad))
   )

   (if (eq ?respuesta B)
      then
         (assert (diagnostico Hipotiroidismo))
   )

   (if (eq ?respuesta C)
      then
         (assert (diagnostico Desconocido))
   )

   (retract ?inicio)
)

(defrule sin-3-B
   ?inicio <- (sin-3 B)
   =>
   (printout t crlf
               "Tienes Hinchazon?" crlf
               "  Respuesta (S/N): "
   )

   (bind ?respuesta (read))
   (bind ?respuesta (upcase ?respuesta))

   (if (eq ?respuesta S)
      then
         (assert (diagnostico Artritis))
   )

   (if (eq ?respuesta N)
      then
         (assert (diagnostico Desconocido))
   )
)

(defrule sig-1-tos
   ?inicio <- (sig-1 B)
   =>
   (printout t crlf
               "Tienes Goteo Nasal?" crlf
               "  Respuesta (S/N): "
   )

   (bind ?respuesta (read))
   (bind ?respuesta (upcase ?respuesta))

   (if (eq ?respuesta S)
      then
         (printout t crlf
                     "Tienes Fiebre?" crlf
                     "  Respuesta (S/N): "
         )

         (bind ?respuesta (read))
         (bind ?respuesta (upcase ?respuesta))

         (if (eq ?respuesta S)
            then
               (printout t crlf
                           "Tienes Dolor de Cabeza?" crlf
                           "  Respuesta (S/N): "
               )

               (bind ?respuesta (read))
               (bind ?respuesta (upcase ?respuesta))

               (if (eq ?respuesta S)
                  then
                     (assert (diagnostico Influenza))
               )

               (if (eq ?respuesta N)
                  then
                     (assert (diagnostico Desconocido))
               )
         )

         (if (eq ?respuesta N)
            then
               (assert (diagnostico Desconocido))
         )
   )

   (if (eq ?respuesta N)
      then
         (assert (diagnostico Desconocido))
   )

   (retract ?inicio)
)

(defrule sig-1-ojos
   ?inicio <- (sig-1 C)
   =>
   (printout t crlf
               "Tienes los Ojos Llorosos?" crlf
               "  Respuesta (S/N): "
   )

   (bind ?respuesta (read))
   (bind ?respuesta (upcase ?respuesta))

   (if (eq ?respuesta S)
      then
         (printout t crlf
                     "Tienes Picazon en los Ojos?" crlf
                     "  Respuesta (S/N): "
         )

         (bind ?respuesta (read))
         (bind ?respuesta (upcase ?respuesta))

         (if (eq ?respuesta S)
            then
               (printout t crlf
                           "Tienes Ardor en los Ojos?" crlf
                           "  Respuesta (S/N): "
               )

               (bind ?respuesta (read))
               (bind ?respuesta (upcase ?respuesta))

               (if (eq ?respuesta S)
                  then
                     (assert (diagnostico Conjuntivitis))
               )

               (if (eq ?respuesta N)
                  then
                     (assert (diagnostico Desconocido))
               )
         )

         (if (eq ?respuesta N)
            then
               (assert (diagnostico Desconocido))
         )
   )

   (if (eq ?respuesta N)
      then
         (assert (diagnostico Desconocido))
   )

   (retract ?inicio)
)

(defrule sig-1-llagas
   ?inicio <- (sig-1 D)
   =>
   (printout t crlf
               "Tienes Perdida de Peso sin Razon?" crlf
               "  Respuesta (S/N): "
   )

   (bind ?respuesta (read))
   (bind ?respuesta (upcase ?respuesta))

   (if (eq ?respuesta S)
      then
         (printout t crlf
                     "Tienes Aumento de Sed y Hambre?" crlf
                     "  Respuesta (S/N): "
         )

         (bind ?respuesta (read))
         (bind ?respuesta (upcase ?respuesta))

         (if (eq ?respuesta S)
            then
               (printout t crlf
                           "Tienes Visión Borrosa?" crlf
                           "  Respuesta (S/N): "
               )

               (bind ?respuesta (read))
               (bind ?respuesta (upcase ?respuesta))

               (if (eq ?respuesta S)
                  then
                     (assert (diagnostico Diabetes))
               )

               (if (eq ?respuesta N)
                  then
                     (assert (diagnostico Desconocido))
               )
         )

         (if (eq ?respuesta N)
            then
               (assert (diagnostico Desconocido))
         )
   )

   (if (eq ?respuesta N)
      then
         (assert (diagnostico Desconocido))
   )

   (retract ?inicio)
)

(defrule diagnostico-final
   ?inicio <- (diagnostico ?enfermedad)
   =>
   (if (neq ?enfermedad Desconocido)
      then
         (printout t crlf
                     "-----------------------" crlf
                     "  Tu diagnostico es:" crlf
                     "      " ?enfermedad crlf
                     "-----------------------" crlf crlf
         )

      else
         (printout t crlf
                     "------------------------------------------------------------------------" crlf
                     "|  Tu signos y sintomas no coinciden con las enfermedades registradas  |" crlf
                     "------------------------------------------------------------------------" crlf crlf
         )
   )

   (retract ?inicio)
)