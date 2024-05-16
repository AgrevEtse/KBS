(deffacts clientes
  (cliente (id-cliente 1) (nombre "Diego")   (ciudad "Nueva York")    (telefono 0123456789))
  (cliente (id-cliente 2) (nombre "Valeria") (ciudad "Metropolis")    (telefono 9876543210))
  (cliente (id-cliente 3) (nombre "Alex")    (ciudad "Ciudad Gotica") (telefono 9081726354))
  (cliente (id-cliente 4) (nombre "Marta")   (ciudad "CDMX")          (telefono 5463728190))
  (cliente (id-cliente 5) (nombre "Ruben")   (ciudad "Hermosillo")    (telefono 4536271809))
  (cliente (id-cliente 6) (nombre "Emilio")  (ciudad "Zapopan")       (telefono 9999999999))
  (cliente (id-cliente 7) (nombre "Antonio") (ciudad "Hermosillo")    (telefono 1111111111))
)

(deffacts productos
  (producto (id-producto 1) (marca Apple)   (modelo "IPhone 15")      (categoria Celular)     (precio 19000))
  (producto (id-producto 2) (marca Apple)   (modelo "Mac Book Air")   (categoria Computadora) (precio 22000))
  (producto (id-producto 3) (marca Samsung) (modelo "Galaxy S24")     (categoria Celular)     (precio 20000))
  (producto (id-producto 4) (marca Samsung) (modelo "Pantalla OLED")  (categoria TV)          (precio 40000))
  (producto (id-producto 5) (marca HP)      (modelo "Omen 16")        (categoria Computadora) (precio 25000))
  (producto (id-producto 6) (marca Samsung) (modelo "Galaxy Tab S9")  (categoria Tablet)      (precio 14000))
  (producto (id-producto 7) (marca Apple)   (modelo "Watch Series 9") (categoria Reloj)       (precio 9000))
)

(deffacts ordenes
  (orden (id-orden 1) (id-cliente 5) (tarjeta Banamex Visa))
  (orden (id-orden 2) (id-cliente 5) (tarjeta Banamex Visa))
  (orden (id-orden 3) (id-cliente 2) (tarjeta Banamex Mastercard))
  (orden (id-orden 4) (id-cliente 3) (tarjeta BBVA Mastercard))
  (orden (id-orden 5) (id-cliente 1) (tarjeta BBVA Visa))
)

(deffacts productos-ordenes
  (producto-orden (id-orden 1) (id-producto 1) (cantidad 1))
  (producto-orden (id-orden 1) (id-producto 7) (cantidad 1))

  (producto-orden (id-orden 2) (id-producto 2) (cantidad 1))

  (producto-orden (id-orden 3) (id-producto 3) (cantidad 1))
  (producto-orden (id-orden 3) (id-producto 6) (cantidad 1))

  (producto-orden (id-orden 4) (id-producto 7) (cantidad 1))

  (producto-orden (id-orden 5) (id-producto 2) (cantidad 1))
  (producto-orden (id-orden 5) (id-producto 5) (cantidad 1))
)

