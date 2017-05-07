  (defmodule MAIN (export ?ALL))

  (defmodule recopilacion-restr
  	 (import MAIN ?ALL)
  	 (export ?ALL)
  )

  (defmodule generacion-soluciones
  	(import MAIN ?ALL)
  	(export ?ALL)
  )

	(defmodule procesado-datos
		(import MAIN ?ALL)
		(import recopilacion-restr deftemplate ?ALL)
		(export ?ALL)
	)

  (defmodule resultados-output
  	(import MAIN ?ALL)
  	(export ?ALL)
  )

(deffunction MAIN::restr-eleccion (?pregunta ?min ?max)
	(format t "%s (des de %d hasta %d)" ?pregunta ?min ?max)
	(bind ?respuesta (read))
	(while (not (and (<= ?min ?respuesta) (>= ?max ?respuesta)))
		do
		(bind ?salida (format nil "%s (des de %d hasta %d)" ?pregunta ?min ?max))
		(printout t ?salida crlf)
		(bind ?respuesta (read))
	)
	?respuesta
)

(deffunction MAIN::restr-opciones (?preg $?opciones)
	(bind ?salida (format nil "%s" ?preg))
	(printout t ?salida crlf)
	(progn$ (?valor ?opciones)
		(bind ?salida (format nil " %d. %s" ?valor-index ?valor))
		(printout t ?salida crlf)
	)
	(bind ?resp (restr-eleccion "Escoje una opcion:" 1 (length$ ?opciones)))
	?resp
)

(deffunction MAIN::restr-si-no (?preg)
	(bind ?resp (restr-opciones ?preg si no))
	(if (or (eq ?resp si) (eq ?resp s))
		then TRUE
		else FALSE
	)
)

  (deftemplate MAIN::restricciones
  	(slot min (type FLOAT) (default 0.0)) ; precio minimo a pagar
  	(slot max (type FLOAT)(default 9999.99)) ; precio maximo a pagar
  	(slot estilo (type INTEGER)(default -1)) ;edad general del grupo
		(slot gama-precio (type INTEGER)(default -1))
  )

(defrule MAIN::regla-inicial "Regla inicial"
	(declare (salience 10))
	=>
	(printout t"----------------------------------------------------------" crlf)
  (printout t"        Bienvenido a nuestro generador de menus           " crlf)
	(printout t"      Porfavor responda a las siguentes preguntas          " crlf)
	(printout t"----------------------------------------------------------" crlf)
  (printout t crlf)
	(focus recopilacion-restr)
)

(defrule recopilacion-restr::gama-precio "Escoje precio maximo"
	?p <- (restricciones (gama-precio ?precio))
	(test (< ?precio 0)
	)
	=>
	(bind ?precio (restr-eleccion "¿Precio maximo?" 1 50000))
	(modify ?p (gama-precio ?precio))
)

(defrule recopilacion-restr::estilo-alimentacion "Estilo de alimentacion"
	?e <- (restricciones (estilo ?estilo))
	(test (< ?estilo 0)
	)
	=>
	(bind ?d (restr-opciones "Escoje el estilo del menu:" Tradicional Moderno Siberita))
	(modify ?e (estilo ?estilo))
)
