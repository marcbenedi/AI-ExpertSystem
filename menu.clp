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
;-------TEMPLATES-----------
(deftemplate MAIN::restricciones
	(slot min (type FLOAT) (default -1.0)) ; precio minimo a pagar
	(slot max (type FLOAT)(default 9999.99)) ; precio maximo a pagar
	(slot estilo (type STRING)(default "indef"))
	(slot gama-precio-min (type STRING)(default "indef"))
	(slot gama-precio-max (type STRING)(default "indef"))
)

(deftemplate generacion-soluciones::lista-platos
  (multislot platos (type INSTANCE))
)

(defmessage-handler MAIN::Menu imprimir()

)

(defmessage-handler MAIN::Plato imprimir()
  (printout t ?self:Nombre " " ?self:Precio "€" crlf)
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
	(test (eq ?estilo "indef"))
	=>
	(bind ?estilo (restr-opciones "Escoje el estilo del menu:" Tradicional Moderno Sibarita))
  (if (eq ?estilo 1) then (bind ?estilo "Tradicional"))
  (if (eq ?estilo 2) then (bind ?estilo "Moderno"))
  (if (eq ?estilo 3) then (bind ?estilo "Sibarita"))
  (modify ?restr (estilo ?estilo))
  (printout t crlf)
  (focus generacion-soluciones)
)

(deffunction generacion-soluciones::random-slot ( ?li )
 (bind ?li (create$ ?li))
 (bind ?max (length ?li))
 (bind ?r (random 1 ?max))
 (bind ?ins (nth$ ?r ?li))
 (return ?ins)
)

(defrule generacion-soluciones::buscar-instancias "Busca instancias de platos"
  ?restr <- (restricciones (min ?minimo) (max ?maximo) (estilo ?estilo))
  (not (lista-platos))
  =>

  (bind ?tercio (/ (- ?maximo ?minimo ) 3))

  (loop-for-count (?i 1 3) do

    (bind ?min-precio (+ ?minimo (* ?tercio (- ?i 1))))
    (bind ?max-precio (+ ?minimo (* ?tercio ?i)))

    (bind $?primeros (find-all-instances ((?a Plato)) (and (eq (str-cat (nth$ 1 (send ?a get-Ordinal))) "Primero") (eq (str-cat (send ?a get-Estilo)) ?estilo)) ))
    (bind $?segundos (find-all-instances ((?a Plato)) (and (eq (str-cat (nth$ 1 (send ?a get-Ordinal))) "Segundo") (eq (str-cat (send ?a get-Estilo)) ?estilo)) ))
    (bind $?postres (find-all-instances ((?a Plato)) (and (eq (str-cat (nth$ 1 (send ?a get-Ordinal))) "Postre") (eq (str-cat (send ?a get-Estilo)) ?estilo)) ))
    (bind $?bebidas (find-all-instances ((?a Bebida)) TRUE))

    (bind ?primero (random-slot ?primeros))
    (bind ?segundo (random-slot ?segundos))
    (bind ?postre (random-slot ?postres))
    (bind ?bebida (random-slot ?bebidas))

    (printout t "Primer plato: " (send ?primero imprimir))
    (printout t "Segundo plato: " (send ?segundo imprimir))
    (printout t "Postre: " (send ?postre imprimir))
    (printout t "Para beber: " (send ?bebida get-Nombre) " " (send ?bebida get-Precio) "€" crlf)
    (printout t "Precio total: " (+ (+ (send ?primero get-Precio) (send ?segundo get-Precio)) (+ (send ?postre get-Precio) (send ?bebida get-Precio))) "€" crlf)
    (printout t "--------------------" crlf)
	)
)
