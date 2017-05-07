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
  (deftemplate MAIN::restricciones
  	(slot min (type FLOAT) (default 0.0)) ; precio minimo a pagar
  	(slot max (type FLOAT)(default 9999.99)) ; precio maximo a pagar
  	(slot tipo (type INTEGER)(default -1)) ;edad general del grupo
    (slot dias (type INTEGER)(default -1)) ;nº dias en visitar el museo
    (slot horasdia (type INTEGER)(default -1)) ;nº horas/dia
    (slot tiempo (type INTEGER)(default -1)) ;total de tiempo
		(slot descripcion (type STRING))
  )

(defrule MAIN::regla-inicial "Regla inicial"
	(declare (salience 10))
	=>
	(printout t"----------------------------------------------------------" crlf)
  (printout t"        Bienvenido a nuestro generador de menus           " crlf)
	(printout t"      Porfavor responda a las siguentes preguntas          " crlf)
	(printout t"----------------------------------------------------------" crlf)
  	(printout t crlf)
	(printout t"¡Bienvenido! A continuacion se le formularan una serie de preguntas para poder recomendarle una visita adecuada a sus preferencias." crlf)
	(printout t crlf)
	(focus recopilacion-restr)
)

(defrule recopilacion-restr::precio "Establece precio justo"
	(not (restricciones))
	=>
	(bind ?d (restr-eleccion "¿De cuantos visitantes esta formado el grupo? " 1 100))
    (if (= ?d 1) then (bind ?descripcion "Individual"))
    (if (= ?d 2) then (bind ?descripcion "Pareja"))
    (if (and(> ?d 2) (< ?d 13)) then (bind ?descripcion "Grupo pequeno (3-12)"))
    (if (and(> ?d 12) (< ?d 26)) then (bind ?descripcion "Grupo mediano (13-25)"))
    (if (> ?d 25) then (bind ?descripcion "Grupo grande (+25)"))
	(assert (restricciones (descripcion ?descripcion)))
)
	; (deffunction MAIN::restr-opciones (?preg $?opciones)
	; 	(bind ?salida (format nil "%s" ?preg))
	; 	(printout t ?salida crlf)
	; 	(progn$ (?valor ?opciones)
	; 		(bind ?salida (format nil "%s" ?valor))
	; 		(printout t ?salida crlf)
	; 	)
	; 	(bind ?resp (restr-eleccion "Escoje una opcion:" 1 (length$ ?opciones)))
	; 	?resp
	; )
	;
	; (deffunction MAIN::restr-si-no (?preg)
	; 	(bind ?resp (restr-opciones ?preg si no))
	; 	(if (or (eq ?resp si) (eq ?resp s))
	; 		then TRUE
	; 		else FALSE
	; 	)
	; )
