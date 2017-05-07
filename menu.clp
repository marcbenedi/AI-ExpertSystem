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
	(bind ?salida (format nil "%s (des de %d hasta %d)" ?pregunta ?min ?max))
	(printout t ?salida crlf)
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
  	(slot min (type FLOAT) (default -1.0)) ; precio minimo a pagar
  	(slot max (type FLOAT)(default 9999.99)) ; precio maximo a pagar
  	(slot estilo (type INTEGER)(default -1)) ;edad general del grupo
		(slot gama-precio-min (type STRING)(default "indef"))
		(slot gama-precio-max (type STRING)(default "indef"))
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

(defrule recopilacion-restr::precio-maximo "Escoje precio maximo"
	(not (restricciones))
	=>
	(bind ?precio (restr-eleccion "¿Precio maximo?" 1 50000))
	(bind ?restr (assert (restricciones (max ?precio))))
	(if (>= ?precio 100)
		then (bind ?maximo-def "Rico")
		else (if (>= ?precio 50)
			then (bind ?maximo-def "Medio")
			else (if (>= ?precio 25)
				then (bind ?maximo-def "Normal")
				else (bind ?maximo-def "Economico")
				)
			)
		)
		(modify ?restr (gama-precio-max ?maximo-def))
)

(defrule recopilacion-restr::precio-minimo "Escoje precio maximo"
	?restr <- (restricciones (min ?minimo) (max ?maximo))
	(test (< ?minimo 0.0))
	=>
	(bind ?precio (restr-eleccion "¿Precio minimo?" 1 (- ?maximo 1)))
	(bind ?restr (modify ?restr (min ?precio)))
	(if (>= ?precio 100)
		then (bind ?minimo-def "Rico")
		else (if (>= ?precio 50)
			then (bind ?minimo-def "Medio")
			else (if (>= ?precio 25)
				then (bind ?minimo-def "Normal")
				else (bind ?minimo-def "Economico")
				)
			)
		)
		(modify ?restr (gama-precio-min ?minimo-def))
)

(defrule recopilacion-restr::estilo-alimentacion "Estilo de alimentacion"
	?restr <- (restricciones (estilo ?estilo))
	(test (< ?estilo 0))
	=>
	(bind ?estilo (restr-opciones "Escoje el estilo del menu:" Tradicional Moderno Siberita))
	(modify ?restr (estilo ?estilo))
)
