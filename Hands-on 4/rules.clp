; Regla 1 - Si un cliente no ha realizado ninguna compra
(defrule cliente-no-compra
  (cliente (id-cliente ?ic) (nombre ?n))
  (not (orden (id-cliente ?ic)))
  =>
  (printout t "R-01: El cliente " ?n " no ha realizado ninguna compra." crlf)
)

; Regla 2 - Si un cliente no ha realizado ninguna compra, se le ofrece un descuento del 5%
(defrule descuento-cliente-no-compra
  (cliente (id-cliente ?ic) (nombre ?n))
  (not (orden (id-cliente ?ic)))
  =>
  (assert (llamar-descuento ?ic 5))
  (printout t "R-02: El cliente " ?n " tiene un 5% de descuento para su primera compra." crlf)
)

; Regla 3 - Si se le ha llamado al cliente para ofrecerle un descuento, se quita el hecho para llamarle
(defrule llamar-cliente-descuento
  ?lcd <- (llamar-descuento ?ic ?d)
  (cliente (id-cliente ?ic) (nombre ?n) (telefono ?t))
  =>
  (printout t "R-03: Llamando al cliente " ?n " al telefono " ?t " para ofrecerle un descuento del " ?d "%." crlf)
  (retract ?lcd)
)

; Regla 4 - Mostrar productos de la marca Apple
(defrule mostrar-productos-apple
  (producto (marca Apple) (modelo ?m))
  =>
  (printout t "R-04: Producto de Apple: " ?m "." crlf)
)

; Regla 5 - Mostrar productos de la categoria Computadora
(defrule mostrar-productos-computadora
  (producto (categoria Computadora) (marca ?ma) (modelo ?mo) (precio ?p))
  =>
  (printout t "R-05: Computadora de " ?ma ", modelo " ?mo ", cuesta $" ?p "." crlf)
)

; Regla 6 - Mostrar productos con precio menor a $18,000
(defrule mostrar-productos-menos-18
  (producto (marca ?ma) (modelo ?mo) (precio ?p & : (< ?p 18000)))
  =>
  (printout t "R-06: Producto Barato (< $18,000) de " ?ma ", modelo " ?mo " cuesta $" ?p "." crlf)
)

; Regla 7 - Mostrar productos con precio mayor a $18,000
(defrule mostrar-productos-mas-18
  (producto (marca ?ma) (modelo ?mo) (precio ?p & : (> ?p 18000)))
  =>
  (printout t "R-07: Producto Caro (> $18,000) de " ?ma ", modelo " ?mo " cuesta $" ?p "." crlf)
)

; Regla 8 - Mostrar todos los productos
(defrule mostrar-productos-precio
  (producto (id-producto ?ip) (marca ?ma) (modelo ?mo) (precio ?p))
  =>
  (printout t "R-08: " ?ip " | " ?ma " | " ?mo " | " ?p crlf)
)

; Regla 9 - Ofrecer un descuento del 10% si el cliente ha realizado dos compras
(defrule descuento-cliente-dos-compras
  (cliente (id-cliente ?ic) (nombre ?n))
  (orden (id-cliente ?ic) (id-orden ?io1))
  (orden (id-cliente ?ic) (id-orden ?io2 & : (neq ?io1 ?io2)))
  =>
  (assert (llamar-descuento ?ic 10))
  (printout t "R-09: El cliente " ?n " tiene un 10% de descuento para su tercera compra." crlf)
)

; Regla 10 - Ofrecer meses sin intereses si el pago fue con BBVA
(defrule meses-sin-intereses-bbva
  (orden (id-orden ?io) (id-cliente ?ic) (tarjeta BBVA ?g))
  (cliente (id-cliente ?ic) (nombre ?n))
  =>
  (printout t "R-10: La orden " ?io " del cliente " ?n " tiene 12 MSI por BBVA." crlf)
)

; Regla 11 - Ofrecer descuento del 15% si la orden tiene dos productos de la misma marca
(defrule descuento-dos-productos-misma-marca
  (orden (id-orden ?io) (id-cliente ?ic))
  (cliente (id-cliente ?ic) (nombre ?n))
  (producto-orden (id-orden ?io) (id-producto ?ip1))
  (producto-orden (id-orden ?io) (id-producto ?ip2))
  (producto (id-producto ?ip1) (marca ?ma))
  (producto (id-producto ?ip2) (marca ?ma & : (neq ?ip1 ?ip2)))
  =>
  (assert (llamar-descuento ?ic 15))
  (printout t "R-11: La orden " ?io " del cliente " ?n " tiene un 15% de descuento por tener dos productos de la marca " ?ma "." crlf)
)

; Regla 12 - Mostrar la ciudad de los clientes
(defrule mostrar-ciudad-clientes
  (cliente (nombre ?n) (ciudad ?c))
  =>
  (printout t "R-12: El cliente " ?n " vive en " ?c "." crlf)
)

; Regla 13 - Mostrar los productos que menos se han comprado
(defrule mostrar-productos-menos-comprados
  (producto (id-producto ?ip) (marca ?ma) (modelo ?mo))
  (not (producto-orden (id-producto ?ip)))
  =>
  (printout t "R-13: Producto menos comprado: " ?ma " " ?mo "." crlf)
)

; Regla 14 - Mostrar los productos de una orden en especifico
(defrule mostrar-productos-orden
  (orden (id-orden ?io) (id-cliente ?ic))
  (producto-orden (id-orden ?io) (id-producto ?ip))
  (producto (id-producto ?ip) (marca ?ma) (modelo ?mo))
  =>
  (printout t "R-14: Producto de la orden " ?io ": " ?ma " " ?mo "." crlf)
)

; Regla 15 - Ofrecer un descuento del 15% si la orden tiene dos productos de la misma categoria
(defrule descuento-dos-productos-misma-categoria
  (orden (id-orden ?io) (id-cliente ?ic))
  (cliente (id-cliente ?ic) (nombre ?n))
  (producto-orden (id-orden ?io) (id-producto ?ip1))
  (producto-orden (id-orden ?io) (id-producto ?ip2))
  (producto (id-producto ?ip1) (categoria ?ca))
  (producto (id-producto ?ip2) (categoria ?ca & : (neq ?ip1 ?ip2)))
  =>
  (assert (llamar-descuento ?ic 15))
  (printout t "R-15: La orden " ?io " del cliente " ?n " tiene un 15% de descuento por tener dos productos de la categoria " ?ca "." crlf)
)

; Regla 16 - Ofrecer un descuento del 50% al cliente que realizó la primera orden
(defrule descuento-cliente-primera-orden
  (orden (id-cliente ?ic) (id-orden 1))
  (cliente (id-cliente ?ic) (nombre ?n))
  =>
  (assert (llamar-descuento ?ic 50))
  (printout t "R-16: El cliente " ?n " tiene un 50% de descuento por haber hecho la primera orden de la tienda." crlf)
)

; Regla 17 - Ofrecer una mica y un protector de pantalla al 20% de descuento si el cliente compra un celular
(defrule descuento-mica-protector
  (orden (id-orden ?io) (id-cliente ?ic))
  (producto-orden (id-orden ?io) (id-producto ?ip))
  (producto (id-producto ?ip) (categoria Celular))
  (cliente (id-cliente ?ic) (nombre ?n))
  =>
  (assert (llamar-descuento ?ic 20))
  (printout t "R-17: El cliente " ?n " tiene un 20% de descuento en una mica y un protector de pantalla por comprar un celular." crlf)
)

; Regla 18 - Ofrecer un descuento del 10% a los clientes que viven en Hermosillo
(defrule descuento-cliente-hermosillo
  (cliente (id-cliente ?ic) (nombre ?n) (ciudad "Hermosillo"))
  =>
  (assert (llamar-descuento ?ic 10))
  (printout t "R-18: El cliente " ?n " tiene un 10% de descuento por vivir en Hermosillo." crlf)
)

; Regla 19 - Ofrecer un seguro a los clientes que compraron una Computadora
(defrule seguro-cliente-computadora
  (orden (id-orden ?io) (id-cliente ?ic))
  (producto-orden (id-orden ?io) (id-producto ?ip))
  (producto (id-producto ?ip) (modelo ?m) (categoria Computadora))
  (cliente (id-cliente ?ic) (nombre ?n))
  =>
  (assert (llamar-seguro ?ic))
  (printout t "R-19: El cliente " ?n " compro una Computadora " ?m ", se le ofrecera un seguro." crlf)
)

; Regla 20 - Llamar a los clientes que tienen un seguro
(defrule llamar-cliente-seguro
  ?lcs <- (llamar-seguro ?ic)
  (cliente (id-cliente ?ic) (nombre ?n) (telefono ?t))
  =>
  (printout t "R-20: Llamando al cliente " ?n " al telefono " ?t " para ofrecerle un seguro." crlf)
  (retract ?lcs)
)