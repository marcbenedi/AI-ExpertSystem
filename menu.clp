;------------------------------------MODULES------------------------------------
;-------------------------------------------------------------------------------

(defmodule MAIN (export ?ALL))

;Modulo encargado de hacer preguntas y guardar las respuestas
(defmodule recopilacion-restr
	 (import MAIN ?ALL)
	 (export ?ALL)
)

;Modulo encargado de coger las respuestas y abstraer las que sean necesarias
(defmodule abstraccion
	(import recopilacion-restr ?ALL)
	(export ?ALL)
)

;Modulo encargado de generar menus y asegurarse de que cumplen las condiciones
;impuestas por las variables abstractas
(defmodule generacion-soluciones
	(import abstraccion ?ALL)
	(export ?ALL)
)

;Modulo encargado de filtrar los menus restantes con las variables concretas
(defmodule refinamiento
	(import MAIN ?ALL)
	(import generacion-soluciones ?ALL)
	(import recopilacion-restr ?ALL)
	(export ?ALL)
)

;-----------------------------------TEMPLATES-----------------------------------
;-------------------------------------------------------------------------------

;Guarda las variables abstractas
(deftemplate abstraccion::abstract-info
	(slot nivel-economico-min (type STRING) (default "indef"))
	(slot nivel-economico-max (type STRING) (default "indef"))
	(slot estilo (type STRING) (default "indef"))
	(slot temporada (type STRING) (default "indef"))
	(slot tamanyo-grupo (type STRING) (default "indef"))
	(slot bebida-por-plato (type STRING) (default "indef"))
	(slot permitir-alcoholica (type STRING) (default "indef"))
)

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------

;Guarda las restricciones concretas
(deftemplate recopilacion-restr::restricciones
	(slot min (type FLOAT) (default -1.0))
	(slot max (type FLOAT)(default 9999.99))
	(slot estilo (type STRING)(default "indef"))
	(multislot ingredientes (type STRING) (default "indef"))
	(slot alcohol (type STRING) (default "indef"))
	(slot bebida-por-plato (type STRING) (default "indef"))
	(slot mes (type INTEGER) (default -1))
	(slot tamanyo-grupo (type INTEGER) (default -1))
)

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------

;Guarda una lista de menus que cumplen las restricciones abstractas
(deftemplate generacion-soluciones::lista-menus
  (multislot menus (type INSTANCE))
)

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------

(defmessage-handler MAIN::Plato imprimir()
  (printout t ?self:Nombre " " ?self:Precio "€" crlf)
	(if (neq (send ?self obtenir-BebidaUnica) [nil]) then
		(printout t "	Bebida: " )
		(send ?self:BebidaUnica imprimir)
	)
)

(defmessage-handler MAIN::Bebida imprimir()
  (printout t ?self:Nombre " " ?self:Precio "€" crlf)
)

(defmessage-handler MAIN::Menu obtenir-BebidaUnica ()
	(dynamic-get BebidaUnica)
)

(defmessage-handler MAIN::Plato obtenir-BebidaUnica ()
	(dynamic-get BebidaUnica)
)

(defmessage-handler MAIN::Plato precio-con-bebida ()
	(return (+ ?self:Precio (send ?self:BebidaUnica get-Precio) ))
)

(defmessage-handler MAIN::Menu imprimir()
  (send ?self:Primero imprimir)
  (send ?self:Segundo imprimir)
  (send ?self:Postre imprimir)
	(if (neq (send ?self obtenir-BebidaUnica) [nil]) then
		(printout t "Bebida: " )
		(send ?self:BebidaUnica imprimir)
	)
	(printout t "Precio total: " ?self:Precio "€" crlf)

	(printout t "_____________________" crlf)
)



;--------------------------------MAIN-------------------------------------------
;-------------------------------------------------------------------------------
(defrule MAIN::regla-inicial "Regla inicial"
	(declare (salience 899))
	=>
	(printout t"----------------------------------------------------------" crlf)
  (printout t"        Bienvenido a nuestro generador de menus           " crlf)
	(printout t"      Por favor responda a las siguentes preguntas          " crlf)
	(printout t"----------------------------------------------------------" crlf)
  (printout t crlf)
	(focus recopilacion-restr)
)

;----------------------------recopilacion-restr---------------------------------
;-------------------------------------------------------------------------------

(deffunction recopilacion-restr::restr-eleccion (?pregunta ?min ?max)
	(bind ?salida (format nil "%s (desde %d hasta %d)" ?pregunta ?min ?max))
	(printout t ?salida crlf)
	(bind ?respuesta (read))
	(while (not (and (<= ?min ?respuesta) (>= ?max ?respuesta)))
		do
		(bind ?salida (format nil "%s (desde %d hasta %d)" ?pregunta ?min ?max))
		(printout t ?salida crlf)
		(bind ?respuesta (read))
	)
	?respuesta
)

(deffunction recopilacion-restr::restr-multi-eleccion (?pregunta ?min ?max)
	(bind ?salida (format nil "%s (des de %d hasta %d)" ?pregunta ?min ?max))
	(printout t ?salida crlf)
	(bind ?respuesta (create$))
	(bind ?r (read))
	(bind ?respuesta (insert$ ?respuesta 1 ?r))
	(while (not (eq ?r 0))
		do
		(bind ?r (read))
		(bind ?respuesta (insert$ ?respuesta 1 ?r))
	)
	?respuesta
)

(deffunction recopilacion-restr::restr-opciones (?preg $?opciones)
	(bind ?salida (format nil "%s" ?preg))
	(printout t ?salida crlf)
	(progn$ (?valor ?opciones)
		(bind ?salida (format nil " %d. %s" ?valor-index ?valor))
		(printout t ?salida crlf)
	)
	(bind ?resp (restr-eleccion "Escoje una opcion:" 1 (length$ ?opciones)))
	?resp
)

(deffunction recopilacion-restr::restr-multi-opciones (?preg $?opciones)
	(bind ?salida (format nil "%s" ?preg))
	(printout t ?salida crlf)
	(progn$ (?valor ?opciones)
		(bind ?salida (format nil " %d. %s" ?valor-index ?valor))
		(printout t ?salida crlf)
	)
	(bind ?resp (restr-multi-eleccion "Escoje opciones (0 para terminar):" 1 (length$ ?opciones)))
	?resp
)

(defrule recopilacion-restr::precio-maximo "Escoje precio maximo"
	(declare (salience 799))
	(not (restricciones))
	=>
	(bind ?precio (restr-eleccion "¿Precio maximo?" 1 50000))
	(bind ?restr (assert (restricciones (max ?precio))))
)

(defrule recopilacion-restr::precio-minimo "Escoje precio maximo"
	(declare (salience 798))
	?restr <- (restricciones (min ?minimo) (max ?maximo))
	(test (< ?minimo 0.0))
	=>
	(bind ?precio (restr-eleccion "¿Precio minimo?" 0 (- ?maximo 1)))
	(bind ?restr (modify ?restr (min ?precio)))
)

(defrule recopilacion-restr::estilo-alimentacion "Estilo de alimentacion"
	(declare (salience 797))
	?restr <- (restricciones (estilo ?estilo))
	(test (eq ?estilo "indef"))
	=>
	(bind ?estilo (restr-opciones "Escoje el estilo del menu:" Tradicional Moderno Sibarita))
  (if (eq ?estilo 1) then (bind ?estilo "Tradicional"))
  (if (eq ?estilo 2) then (bind ?estilo "Moderno"))
  (if (eq ?estilo 3) then (bind ?estilo "Sibarita"))
  (modify ?restr (estilo ?estilo))
)

(defrule recopilacion-restr::permite-alcoholica "Se permiten bebidas alcoholicas?"
	(declare (salience 796))
	?restr <- (restricciones (alcohol ?alcohol))
	(test (eq ?alcohol "indef"))
	=>
	(bind ?resp (restr-opciones "¿Quieres permitir que se incluyan bebidas alcoholicas?" Si No))
	(if (eq ?resp 1) then (bind ?r "si") else (bind ?r "no"))
	(modify ?restr (alcohol ?r))
)

(defrule recopilacion-restr::bebida-cada-plato "Se quiere una bebida por plato"
	(declare (salience 795))
	?restr <- (restricciones (bebida-por-plato ?bpp))
	(test (eq ?bpp "indef"))
	=>
	(bind ?resp (restr-opciones "¿Quieres una bebida por cada plato?" Si No))
	(if (eq ?resp 1) then (bind ?r "si") else (bind ?r "no"))
	(modify ?restr (bebida-por-plato ?r))
)

(defrule recopilacion-restr::mes-evento "Mes en que será el evento"
	(declare (salience 794))
	?restr <- (restricciones (mes ?mesR))
	(test (eq ?mesR -1))
	=>
	(bind ?mesR (restr-opciones "¿En que mes sera el evento?" Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre))
	(modify ?restr (mes ?mesR))
)

(defrule recopilacion-restr::tamanyo-del-grupo "Tamanyo del grupo"
	(declare (salience 793))
	?restr <- (restricciones (tamanyo-grupo ?tam))
	(test (eq ?tam -1))
	=>
	(bind ?tam (restr-eleccion "¿Cuantos comensales seran?" 1 250))
  (modify ?restr (tamanyo-grupo ?tam))
)

(defrule recopilacion-restr::ingredientes-prohibidos "Lista de ingredientes prohibidos"
	(declare (salience 792))
	?restr <- (restricciones (ingredientes ?ingredientes))
	(test (eq ?ingredientes "indef"))
	=>
	(bind ?list (find-all-instances ((?i Ingrediente)) TRUE))
	(bind ?l (create$))
	(progn$ (?elemento ?list)
		(bind ?nombre (send ?elemento get-Nombre))
		(bind ?l (insert$ ?l 1 ?nombre))
	)
	(bind ?resp (restr-multi-opciones "Escoge que ingredientes quieres que NO pongamos: " ?l))
	(bind ?nombres (create$))
	(progn$ (?elemento ?resp)
	(if (not (eq ?elemento 0))
		then
			(bind ?nombre (nth$ ?elemento ?l))
			(bind ?nombres (insert$ ?nombres 1 ?nombre))
		)
	)
	(modify ?restr (ingredientes ?nombres))
  (focus abstraccion)
)

;-----------------------------------abstraccion---------------------------------
;-------------------------------------------------------------------------------

;Abstrae el precio min/max a un conjunto de Economico .... Rico
(defrule abstraccion::abstraer-nivel-economico "Convierte el margen max min en Rico - ... - Pobre"
	(declare (salience 699))
	?restr <- (restricciones (min ?minimo) (max ?maximo))
	(not (abstract-info))
	=>
	;El maximo
	(if (>= ?maximo 100)
		then (bind ?maximo-def "Rico")
		else (if (>= ?maximo 50)
			then (bind ?maximo-def "Medio")
			else (if (>= ?maximo 25)
				then (bind ?maximo-def "Normal")
				else (bind ?maximo-def "Economico")
				)
			)
		)
		;El minimo
		(if (>= ?minimo 100)
			then (bind ?minimo-def "Rico")
			else (if (>= ?minimo 50)
				then (bind ?minimo-def "Medio")
				else (if (>= ?minimo 25)
					then (bind ?minimo-def "Normal")
					else (bind ?minimo-def "Economico")
					)
				)
			)
	(bind ?abstract-info (assert (abstract-info (nivel-economico-min ?minimo-def) (nivel-economico-max ?maximo-def))))
)

;Abstrae el estilo alimenticio (se representa igual)
(defrule abstraccion::abstraer-estilo-alimenticio ""
	(declare (salience 698))
	?restr <- (restricciones (estilo ?estilo))
	?abstract-info <- (abstract-info (estilo ?est-abs))
	(test (neq ?estilo "indef"))
	(test (eq ?est-abs "indef"))
	=>
	(modify ?abstract-info (estilo ?estilo))
)

;Abstrae la temporada del evento, de més a época del año
(defrule abstraccion::abstraer-temporada-evento ""
	(declare (salience 697))
	?restr <- (restricciones (mes ?mesR))
	?abstract-info <- (abstract-info (temporada ?temp-abs))
	(test (neq ?mesR -1))
	(test (eq ?temp-abs "indef"))
	=>
	(if (eq ?mesR 12) then (bind ?temp "Invierno"))
	(if (eq ?mesR 1) then (bind ?temp "Invierno"))
	(if (eq ?mesR 2) then (bind ?temp "Invierno"))

	(if (eq ?mesR 3) then (bind ?temp "Primavera"))
	(if (eq ?mesR 4) then (bind ?temp "Primavera"))
	(if (eq ?mesR 5) then (bind ?temp "Primavera"))

	(if (eq ?mesR 6) then (bind ?temp "Verano"))
	(if (eq ?mesR 7) then (bind ?temp "Verano"))
	(if (eq ?mesR 8) then (bind ?temp "Verano"))

	(if (eq ?mesR 9) then (bind ?temp "Otono"))
	(if (eq ?mesR 10) then (bind ?temp "Otono"))
	(if (eq ?mesR 11) then (bind ?temp "Otono"))
	(modify ?abstract-info (temporada ?temp))
)

;Abstrae el tamaño del grupo de int a string
(defrule abstraccion::abstraer-tamanyo-grupo ""
	(declare (salience 696))
	?restr <- (restricciones (tamanyo-grupo ?tam))
	?abstract-info <- (abstract-info (tamanyo-grupo ?tam-abs))
	(test (neq ?tam -1))
	(test (eq ?tam-abs "indef"))
	=>
	(if (eq ?tam 1) then (bind ?grup "Individual"))
	(if (eq ?tam 2) then (bind ?grup "Pareja")) ; 1 - 2 - (3 .. 20) - (21 .. 50) - (51 .. 250)

	(if (and (>= ?tam 3) (<= ?tam 20))  then (bind ?grup "Pequeno"))
	(if (and (>= ?tam 21) (<= ?tam 50))  then (bind ?grup "Mediano"))
	(if (>= ?tam 51)  then (bind ?grup "Grande"))

	(modify ?abstract-info (tamanyo-grupo ?grup))
)

;Abstrae permitir-alcoholica (se representa igual)
(defrule abstraccion::abstraer-permitir-alcohol ""
		(declare (salience 695))
		?restr <- (restricciones (alcohol ?alc))
		?abstract-info <- (abstract-info (permitir-alcoholica ?abs-alc))
		(test (neq ?alc "indef"))
		(test (eq ?abs-alc "indef"))
	=>
		(modify ?abstract-info (permitir-alcoholica ?alc))
)

;Abstrae permitir bebida-por-plato (se representa igual)
(defrule abstraccion::abstraer-bebida-por-plato ""
		(declare (salience 694))
		?restr <- (restricciones (bebida-por-plato ?alc))
		?abstract-info <- (abstract-info (bebida-por-plato ?abs-alc))
		(test (neq ?alc "indef"))
		(test (eq ?abs-alc "indef"))
	=>
		(modify ?abstract-info (bebida-por-plato ?alc))
		(focus generacion-soluciones)
)

;------------------------------generacion-soluciones----------------------------
;-------------------------------------------------------------------------------

;Devuelve platos que tienen un estilo concreto
(deffunction generacion-soluciones::platos-por-estilo (?estilo)
	(bind $?filtrados (find-all-instances ((?a Plato)) (eq (str-cat (send ?a get-Estilo)) ?estilo) ))
	(return ?filtrados)
)

;Devuelve TRUE o FALSE dependiendo de si el plato puede ser servido como ordinal
(deffunction generacion-soluciones::puede-ser (?plato ?ordinal)
	(bind ?lis (send ?plato get-Ordinal))
	(loop-for-count (?i 1 (length$ ?lis) ) do
		(bind ?e (nth$ ?i ?lis))
		(if ( eq (str-cat ?e) ?ordinal) then (return TRUE) )
	)
	(return FALSE)
)

;Dada una lista de platos, filtra por ordinal ("Primero Segundo Postre")
(deffunction generacion-soluciones::filtra-ordinal (?lista ?ordinal)
	(bind $?ordinales (find-all-instances ((?a Plato)) (and (puede-ser ?a ?ordinal) (member ?a ?lista))))
	(return ?ordinales)
)

;Genera todos los menus posibles que tengan un estilo concreto
(deffunction generacion-soluciones::generar-combinaciones(?est-abs)
	(bind $?primeros (filtra-ordinal (platos-por-estilo ?est-abs) "Primero" ))
	(bind $?segundos (filtra-ordinal (platos-por-estilo ?est-abs) "Segundo" ))
	(bind $?postres  (filtra-ordinal (platos-por-estilo ?est-abs) "Postre"  ))

	(loop-for-count (?i 1 (length ?primeros))
		(loop-for-count (?j 1 (length ?segundos))
			(loop-for-count (?k 1 (length ?postres))
				(make-instance (gensym) of Menu
					(Primero (nth$ ?i ?primeros))
					(Segundo (nth$ ?j ?segundos))
					(Postre (nth$ ?k  ?postres ))
				)
			)
		)
	)
	(return (find-all-instances ((?m Menu))  TRUE  ))
)

;Elimina los menus en que su primer plato es igual que el segundo
(deffunction generacion-soluciones::eliminar-menus-platos-duplicados(?lista)
	(bind ?temp (find-all-instances ((?m Menu)) (and (neq (send (send ?m get-Primero) get-Nombre) (send (send ?m get-Segundo) get-Nombre) ) (member ?m ?lista) )))
	(return ?temp)
)

;Elimina de la lista los menus que contienen platos incompatibles entre si
(deffunction  generacion-soluciones::eliminar-menus-platos-incompatibles(?lista)
	(bind ?temp (find-all-instances ((?m Menu))
		(and
			(not (member (send ?m get-Primero) (send (send ?m get-Segundo) get-PlatoIncompatible)))
			(not (member (send ?m get-Segundo) (send (send ?m get-Primero) get-PlatoIncompatible)))
			(member ?m ?lista)
		)          )
	)
	(return ?temp)
)

;Elimina los menus que tengan algun plato no disponible en la temporada temp
(deffunction generacion-soluciones::filtrar-temporada(?lista ?temp)
	(bind ?respuesta (create$))
	(progn$ (?m ?lista)
		(bind ?primer-plato (send ?m get-Primero))
		(bind ?segundo-plato (send ?m get-Segundo))
		(bind ?postre (send ?m get-Postre))

		(bind ?temp-primero (str-cat(send ?primer-plato get-Disponibilidad)))
		(bind ?temp-segundo (str-cat(send ?segundo-plato get-Disponibilidad)))
		(bind ?temp-postre (str-cat(send ?postre get-Disponibilidad)))

		(if (and
					(or (eq ?temp-primero ?temp) (eq ?temp-primero "Total"))
					(or (eq ?temp-segundo ?temp) (eq ?temp-segundo "Total"))
					(or (eq ?temp-postre ?temp) (eq ?temp-postre "Total"))
				)
			then (bind ?respuesta (insert$ ?respuesta 1 ?m))
		)
	)
	(return ?respuesta)
)

;Elimina los menus que tengan platos complejos si es un grupo no lo suficientemente grande
(deffunction generacion-soluciones::filtrar-complejidad(?lista ?tam)
	(bind ?respuesta (create$))

	(progn$ (?m ?lista)

		(bind ?primer-plato (send ?m get-Primero))
		(bind ?segundo-plato (send ?m get-Segundo))
		(bind ?postre (send ?m get-Postre))

		(bind ?comp-primero (send ?primer-plato get-Complejo))
		(bind ?comp-segundo (send ?segundo-plato get-Complejo))
		(bind ?comp-postre (send ?postre get-Complejo))

		(bind ?platos-complejos "No")

		(if (eq ?comp-primero "Si")
			then (bind ?platos-complejos "Si")
		)
		(if (eq ?comp-segundo "Si")
			then (bind ?platos-complejos "Si")
		)
		(if (eq ?comp-postre "Si")
			then (bind ?platos-complejos "Si")
		)

		(if (eq ?platos-complejos "Si")
			then
				(if (or (eq ?tam "Mediano") (eq ?tam "Grande"))
					then
						(bind ?respuesta (insert$ ?respuesta 1 ?m)) ;Hay platos complejos pero son mucha gente
				)
			else
				(bind ?respuesta (insert$ ?respuesta 1 ?m)) ;No hay platos complejos
		)
	)

	(return ?respuesta)
)

(deffunction generacion-soluciones::puede-bebida-en-menu(?bebida ?menu ?pa)
	(if (and (eq ?pa "no") (eq (send ?bebida get-Alcoholica) "Si" )) then
	 (return FALSE)
	)
	(bind $?incPri (send (send ?menu get-Primero) get-BebidaIncompatible))
	(bind $?incSeg (send (send ?menu get-Segundo) get-BebidaIncompatible))
	(if (and (not (member$ ?bebida $?incPri)) (not (member$ ?bebida $?incSeg)) )
		then (return TRUE)
		else (return FALSE)
 	)
)

(deffunction generacion-soluciones::random-slot ( ?li )
 (bind ?li (create$ ?li))
 (bind ?max (length ?li))
 (bind ?r (random 1 ?max))
 (bind ?ins (nth$ ?r ?li))
 (return ?ins)
)

;Asigna una bebida al menu (o por plato)
(deffunction generacion-soluciones::asignar-bebida(?lista ?bpp ?pa)
	(progn$ (?m ?lista)
		(bind ?recPri (send (send ?m get-Primero) obtenir-BebidaUnica))
		(bind ?recSeg (send (send ?m get-Segundo) obtenir-BebidaUnica))
		(if (eq ?bpp "no") then

			(if (eq ?recPri [nil]) then
				else
				(if (eq (puede-bebida-en-menu ?recPri ?m ?pa) TRUE)
					then (send ?m put-BebidaUnica ?recPri)
				)
			)

			(if (neq ?recSeg [nil]) then
				(if (eq (puede-bebida-en-menu ?recSeg ?m ?pa) TRUE)
					then (send ?m put-BebidaUnica ?recSeg)
				)
			)

			(if (eq (send ?m obtenir-BebidaUnica) [nil]) then
				(bind $?incPri (send (send ?m get-Primero) get-BebidaIncompatible))
				(bind $?incSeg (send (send ?m get-Segundo) get-BebidaIncompatible))
				(bind ?bebs (find-all-instances ((?b Bebida))
				 (and
					 (not (member$ ?b $?incPri))
					 (not (member$ ?b $?incSeg))
				 )))
				 (if (eq ?pa "no") then
				 		(bind ?bebs (find-all-instances ((?b Bebida)) (and (neq (send ?b get-Alcoholica) "Si") (member$ ?b ?bebs))))
				 )
				 (send ?m put-BebidaUnica (random-slot ?bebs))
			)

			(send (send ?m get-Primero) put-BebidaUnica [nil])
			(send (send ?m get-Segundo) put-BebidaUnica [nil])
			(send (send ?m get-Postre) put-BebidaUnica [nil])

			else ;Bebida para cada plato (1 y 2)
			(if
				(or
					(eq ?recPri [nil])
					(and (eq ?pa "no") (eq (send ?recPri get-Alcoholica) "Si" ))

			 	) then
						(send (send ?m get-Primero) put-BebidaUnica
							(random-slot (find-all-instances ((?b Bebida))
								(not (member$ ?b (send (send ?m get-Primero) get-BebidaIncompatible))) )))
			)
			(if
				(or
					(eq ?recSeg [nil])
					(and (eq ?pa "no") (eq (send ?recSeg get-Alcoholica) "Si" ))

			 	) then
						(send (send ?m get-Segundo) put-BebidaUnica
							(random-slot (find-all-instances ((?b Bebida))
								(not (member$ ?b (send (send ?m get-Segundo) get-BebidaIncompatible))) )))
			)
		)
	)
	(return ?lista)
	;?bpp = bebida por plato           ?pa = permite alcohol
	;si bebida per plato asignar una bebida per plato.
	;			s'ha de mirar que no hi hagi incompatibilitat entre bebias de platos
	;						si nhi ha, doncs es cambia una per a que no hi hagi incompatibilitat
	;						el mateix si un plat te bebida alcoholica i no ho permetem
	;si no hi ha bebida per plato
	; intentarem agafar al beguda del primer plat i mirarem que no tingui incompatibilitats
	;	si en te agafarem el segon i farem el mateix
	;	si no doncs en triarem una random fins a obtenir una que ens vagi bé
)

;Calcula el precio del menu
(deffunction generacion-soluciones::calcular-precio(?lista ?bpp)
	(loop-for-count (?i 1 (length$ ?lista)) do

			(bind ?m (nth$ ?i ?lista))

			(bind ?primer-plato (send ?m get-Primero))
			(bind ?segundo-plato (send ?m get-Segundo))
			(bind ?postre (send ?m get-Postre))

			(if (eq ?bpp "no") then
				(bind ?bebida (send ?m get-BebidaUnica))
				(bind ?preu (+ (send ?primer-plato get-Precio) (send ?segundo-plato get-Precio) (send ?postre get-Precio) (send ?bebida get-Precio) ))
			else
				(bind ?preu (+ (send ?primer-plato precio-con-bebida) (send ?segundo-plato precio-con-bebida) (send ?postre get-Precio) ))
			)
			(send ?m put-Precio ?preu)
	)
	(return ?lista)
)

;Elimina los menus que no esten dentro del rango del precio
(deffunction generacion-soluciones::filtrar-rango-precio(?lista ?min ?max)
	;Economico Normal Medio Rico
	;    0       1      2     3

	(if (eq ?min "Economico") then (bind ?min-def 0))
	(if (eq ?min "Normal") then (bind ?min-def 1))
	(if (eq ?min "Medio") then (bind ?min-def 2))
	(if (eq ?min "Rico") then (bind ?min-def 3))

	(if (eq ?max "Economico") then (bind ?max-def 0))
	(if (eq ?max "Normal") then (bind ?max-def 1))
	(if (eq ?max "Medio") then (bind ?max-def 2))
	(if (eq ?max "Rico") then (bind ?max-def 3))

	(bind ?resultado (create$))

	(loop-for-count (?i 1 (length$ ?lista) ) do
		(bind ?m (nth$ ?i ?lista))
		(bind ?precio (send ?m get-Precio))
		(if (>= ?precio 100.0)
			then (bind ?def 3)
			else (if (>= ?precio 50.0)
							then (bind ?def 2)
							else (if (>= ?precio 25.0)
											then (bind ?def 1)
											else (bind ?def 0)
										)
						)
		)

		(if (and (>= ?def ?min-def) (<= ?def ?max-def))
				then
					(bind ?resultado (insert$ ?resultado 1 ?m))
		)
	)
	(return ?resultado)
)

;Genera menus y los filtra con las restricciones abstractas
(defrule generacion-soluciones::generar-menus ""
		(declare (salience 599))
		?abs-inf <- (abstract-info (nivel-economico-min ?min) (nivel-economico-max ?max)
														(estilo ?est-abs) (temporada ?temp) (tamanyo-grupo ?tam)
														(bebida-por-plato ?bpp) (permitir-alcoholica ?pa))
    (not (lista-menus))
	=>
		(bind ?lista (generar-combinaciones ?est-abs))
		(bind ?lista (eliminar-menus-platos-duplicados ?lista))
		(bind ?lista (eliminar-menus-platos-incompatibles ?lista))
		(bind ?lista (filtrar-temporada ?lista ?temp))
		(bind ?lista (filtrar-complejidad ?lista ?tam))
		(bind ?lista (asignar-bebida ?lista ?bpp ?pa))
		;(progn$ (?m ?lista) (send ?m imprimir))
		(bind ?lista (calcular-precio ?lista ?bpp))
		(bind ?lista (filtrar-rango-precio ?lista ?min ?max))

		(assert (lista-menus (menus ?lista)))

		(focus refinamiento)
)
;-------------------------------refinamiento------------------------------------
;-------------------------------------------------------------------------------
(deffunction refinamiento::filtrar-ingredientes-prohibidos(?lista ?proh)
	(bind ?resultado (create$))

	(loop-for-count (?i 1 (length$ ?lista) ) do
			(bind ?m (nth$ ?i ?lista))

			(bind ?ingrPrimero (send (send ?m get-Primero) get-Ingredientes))
			(bind ?nombresPrimero (create$))
			(progn$ (?ing ?ingrPrimero) (bind ?nombresPrimero (insert$ ?nombresPrimero 1 (send (instance-address * ?ing) get-Nombre ))))

			(bind ?ingrSegundo (send (send ?m get-Segundo) get-Ingredientes))
			(bind ?nombresSegundo (create$))
			(progn$ (?ing ?ingrSegundo) (bind ?nombresSegundo (insert$ ?nombresSegundo 1 (send (instance-address * ?ing) get-Nombre ))))

			(bind ?ingrPostre (send (send ?m get-Postre) get-Ingredientes))
			(bind ?nombresPostre (create$))
			(progn$ (?ing ?ingrPostre) (bind ?nombresPostre (insert$ ?nombresPostre 1 (send (instance-address * ?ing) get-Nombre ))))

			(bind ?posible TRUE)

			(progn$ (?ing ?proh)
				(if (or
							(member ?ing ?nombresPrimero)
							(member ?ing ?nombresSegundo)
							(member ?ing ?nombresPostre)
						)
					then
						(bind ?posible FALSE)
				)
			)

			(if (eq ?posible TRUE) then
				(bind ?resultado (insert$ ?resultado 1 ?m))
			)

		)
		(return ?resultado)
)

;Elimina los menus que no esten dentro del rango de precio
(deffunction refinamiento::filtrar-precio-concreto(?lista ?min ?max)
	(bind ?resultado (create$))
	(loop-for-count (?i 1 (length$ ?lista) ) do
		(bind ?m (nth$ ?i ?lista))
		(bind ?p (send ?m get-Precio))
			(if
				(and (>= ?p ?min) (<= ?p ?max)) then (bind ?resultado (insert$ ?resultado 1 ?m))
			)
		)
		(return ?resultado)
)

(deffunction refinamiento::obtener-barato(?lista)
	(bind ?minPrec 10000.0)
	(progn$ (?m ?lista)
		(if (< (send ?m get-Precio) ?minPrec) then
				(bind ?minPrec (send ?m get-Precio))
				(bind ?barato ?m)
		)
	)
	(return ?barato)
)

(deffunction refinamiento::obtener-caro(?lista)
	(bind ?maxPrec 0.0)
	(progn$ (?m ?lista)
		(if (> (send ?m get-Precio) ?maxPrec) then
				(bind ?maxPrec (send ?m get-Precio))
				(bind ?caro ?m)
		)
	)
	(return ?caro)
)

(deffunction refinamiento::obtener-medio(?lista ?min ?max)
	(bind ?midPrec (/ (+ ?min ?max) 2) )
	(bind ?minDifFound 5000.0)

	(progn$ (?m ?lista)
		(if (< (abs (- (send ?m get-Precio) ?midPrec)) ?minDifFound ) then
				(bind ?minDifFound (abs (- (send ?m get-Precio) ?midPrec)))
				(bind ?menu ?m)
		)
	)
	(return ?menu)
)


;Filtra los menus con las restricciones concretas
(defrule refinamiento::refinar ""
		(declare (salience 499))
		?listam <- (lista-menus (menus $?lista))
		?restr <- (restricciones (min ?min) (max ?max) (ingredientes $?proh))
	=>
		(bind ?lista (filtrar-ingredientes-prohibidos ?lista ?proh))
		(bind ?lista (filtrar-precio-concreto ?lista ?min ?max))

		(printout t "---------------------ESTOS SON LOS MENUS RECOMENDADOS---------------------" crlf)

		(bind ?barato (obtener-barato ?lista))
		(bind ?minPrec (send ?barato get-Precio))
		(send ?barato imprimir)

		(bind ?caro (obtener-caro ?lista))
		(bind ?maxPrec (send ?caro get-Precio))

		(bind ?medio (obtener-medio ?lista ?minPrec ?maxPrec))
		(printout t "El menu medio es: " crlf)
		(send ?medio imprimir)

		(printout t "El menu caro es: " crlf)
		(send ?caro imprimir)
)
