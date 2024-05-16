(deftemplate cliente
  (slot id-cliente)
  (slot nombre)
  (slot ciudad)
  (slot telefono)
)

(deftemplate producto
  (slot id-producto)
  (slot marca)
  (slot modelo)
  (slot categoria)
  (slot precio)
)

(deftemplate orden
  (slot id-orden)
  (slot id-cliente)
  (multislot tarjeta)
)

(deftemplate producto-orden
  (slot id-orden)
  (slot id-producto)
  (slot cantidad (default 1))
)