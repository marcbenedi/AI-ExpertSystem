
  ;; Nuestro código --------------------------------


  (defmodule MAIN (export ?ALL))

  (defmodule recopilacion-restricciones
  	 (import MAIN ?ALL)
  	 (export ?ALL)
  )

  (defmodule procesado-datos
  	(import MAIN ?ALL)
  	(import recopilacion-restricciones deftemplate ?ALL)
  	(export ?ALL)
  )

  (defmodule generacion-soluciones
  	(import MAIN ?ALL)
  	(export ?ALL)
  )

  (defmodule resultados-output
  	(import MAIN ?ALL)
  	(export ?ALL)
  )



  (deftemplate MAIN::restricciones
  	(slot min (type FLOAT) (default 0.0)) ; precio minimo a pagar
  	(slot max (type FLOAT)(default 9999.99)) ; precio maximo a pagar
  	(slot tipo (type INTEGER)(default -1)) ;edad general del grupo
    (slot dias (type INTEGER)(default -1)) ;nº dias en visitar el museo
    (slot horasdia (type INTEGER)(default -1)) ;nº horas/dia
    (slot tiempo (type INTEGER)(default -1)) ;total de tiempo
  )
