;; Ontologia -----------------------
; Sun May 07 12:14:37 CEST 2017
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot TipoPlato
		(type SYMBOL)
		(allowed-values Carne Pescado Vegano Sopa Pasta Ensalada Legumbre Arroz Fruta Postre)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot Temperatura
		(type SYMBOL)
		(allowed-values Frio Caliente)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot TipoBebida
		(type SYMBOL)
		(allowed-values Refresco Agua Vino Cerveza Zumo Cava)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Ordinal
		(type SYMBOL)
		(allowed-values Primero Segundo Postre)
		(cardinality 1 3)
		(create-accessor read-write))
	(single-slot BebidaUnica
		(type INSTANCE)
;+		(allowed-classes Bebida)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Estilo
		(type SYMBOL)
		(allowed-values Tradicional Moderno Sibarita)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot PlatoIncompatible
		(type INSTANCE)
;+		(allowed-classes Plato)
		(create-accessor read-write))
	(multislot Platos
		(type INSTANCE)
;+		(allowed-classes Plato)
		(cardinality 3 3)
		(create-accessor read-write))
	(single-slot Disponibilidad
		(type SYMBOL)
		(allowed-values Total Invierno Primavera Verano Otono)
		(default Total)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot BebidaIncompatible
		(type INSTANCE)
;+		(allowed-classes Bebida)
		(create-accessor read-write))
	(multislot Ingredientes
		(type INSTANCE)
;+		(allowed-classes Ingrediente)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass Menu "Esta clase representa un menu"
	(is-a USER)
	(role concrete)
	(single-slot BebidaUnica
		(type INSTANCE)
;+		(allowed-classes Bebida)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Platos
		(type INSTANCE)
;+		(allowed-classes Plato)
		(cardinality 3 3)
		(create-accessor read-write)))

(defclass Plato
	(is-a USER)
	(role concrete)
	(single-slot BebidaUnica
		(type INSTANCE)
;+		(allowed-classes Bebida)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Estilo
		(type SYMBOL)
		(allowed-values Tradicional Moderno Sibarita)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Disponibilidad
		(type SYMBOL)
		(allowed-values Total Invierno Primavera Verano Otono)
		(default Total)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot BebidaIncompatible
		(type INSTANCE)
;+		(allowed-classes Bebida)
		(create-accessor read-write))
	(multislot TipoPlato
		(type SYMBOL)
		(allowed-values Carne Pescado Vegano Sopa Pasta Ensalada Legumbre Arroz Fruta Postre)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot Temperatura
		(type SYMBOL)
		(allowed-values Frio Caliente)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot PlatoIncompatible
		(type INSTANCE)
;+		(allowed-classes Plato)
		(create-accessor read-write))
	(multislot Ingredientes
		(type INSTANCE)
;+		(allowed-classes Ingrediente)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot Ordinal
		(type SYMBOL)
		(allowed-values Primero Segundo Postre)
		(cardinality 1 3)
		(create-accessor read-write)))

(defclass Bebida
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot TipoBebida
		(type SYMBOL)
		(allowed-values Refresco Agua Vino Cerveza Zumo Cava)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Ingrediente
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)));; Instancias -----------------------
(definstances instancies
; Sun May 07 12:14:37 CEST 2017
; 
;+ (version "3.5")
;+ (build "Build 663")

([KB_565836_Class23] of  Ingrediente

	(Nombre "Tomate"))

([KB_565836_Class24] of  Ingrediente

	(Nombre "Macarrones"))

([KB_565836_Class25] of  Plato

	(Disponibilidad Total)
	(Estilo Tradicional)
	(Ingredientes
		[KB_565836_Class24]
		[KB_565836_Class23])
	(Nombre "Macarrones con tomate")
	(Ordinal Primero)
	(Precio 6.0)
	(Temperatura Caliente)
	(TipoPlato Pasta))

([KB_565836_Class26] of  Bebida

	(Nombre "Agua natural sin gas")
	(Precio 1.0)
	(TipoBebida Agua))

([KB_565836_Class27] of  Bebida

	(Nombre "Vino blanco")
	(Precio 15.0)
	(TipoBebida Vino))

([KB_565836_Class28] of  Bebida

	(Nombre "Vino tinto")
	(Precio 17.0)
	(TipoBebida Vino))

([KB_565836_Class29] of  Bebida

	(Nombre "Cocacola")
	(Precio 1.5)
	(TipoBebida Refresco))

([KB_565836_Class30] of  Bebida

	(Nombre "Zumo naranja natural")
	(Precio 2.0)
	(TipoBebida Zumo))

([KB_565836_Class32] of  Ingrediente

	(Nombre "Vaca"))

([KB_565836_Class33] of  Ingrediente

	(Nombre "Cerdo"))

([KB_565836_Class34] of  Ingrediente

	(Nombre "Salchicha"))

([KB_565836_Class35] of  Ingrediente

	(Nombre "Lechuga"))

([KB_565836_Class36] of  Ingrediente

	(Nombre "Arroz"))

([KB_565836_Class37] of  Ingrediente

	(Nombre "Guisantes"))

([KB_565836_Class38] of  Ingrediente

	(Nombre "Gambas"))

([KB_565836_Class39] of  Ingrediente

	(Nombre "Pollo"))

([KB_565836_Class40] of  Plato

	(BebidaIncompatible [KB_565836_Class30])
	(BebidaUnica [KB_565836_Class27])
	(Disponibilidad Total)
	(Estilo Tradicional)
	(Ingredientes
		[KB_565836_Class36]
		[KB_565836_Class38]
		[KB_565836_Class34]
		[KB_565836_Class37]
		[KB_565836_Class39])
	(Nombre "Paella")
	(Ordinal Primero Segundo)
	(PlatoIncompatible [KB_565836_Class25])
	(Precio 29.99)
	(Temperatura Caliente)
	(TipoPlato Carne Arroz Pescado))

([KB_565836_Class43] of  Ingrediente

	(Nombre "Yogur natural"))

([KB_565836_Class44] of  Ingrediente

	(Nombre "Boleto trufa"))

([KB_565836_Class45] of  Ingrediente

	(Nombre "Caviar"))

([KB_565836_Class46] of  Ingrediente

	(Nombre "Salmon"))

([KB_565836_Class47] of  Ingrediente

	(Nombre "Patatas"))

([KB_565836_Class48] of  Ingrediente

	(Nombre "Limon"))

([KB_565836_Class49] of  Ingrediente

	(Nombre "Percebe"))

([KB_565836_Class50] of  Ingrediente

	(Nombre "Langostino"))

([KB_565836_Class51] of  Ingrediente

	(Nombre "Navaja"))

([KB_565836_Class52] of  Ingrediente

	(Nombre "Bogavante"))

([KB_565836_Class53] of  Ingrediente

	(Nombre "Pan"))

([KB_565836_Class55] of  Plato

	(Disponibilidad Total)
	(Estilo Tradicional)
	(Ingredientes
		[KB_565836_Class47]
		[KB_565836_Class39])
	(Nombre "Pollo con patatas")
	(Ordinal Primero Segundo)
	(Precio 5.5)
	(Temperatura Caliente)
	(TipoPlato Carne))

([KB_565836_Class57] of  Plato

	(Disponibilidad Total)
	(Estilo Tradicional)
	(Ingredientes [KB_565836_Class43])
	(Nombre "Yogur")
	(Ordinal Postre)
	(Precio 1.5)
	(Temperatura Frio)
	(TipoPlato Postre))

([KB_565836_Class59] of  Plato

	(BebidaUnica [KB_565836_Class27])
	(Disponibilidad Total)
	(Estilo Tradicional)
	(Ingredientes
		[KB_565836_Class46]
		[KB_565836_Class48]
		[KB_565836_Class35])
	(Nombre "Filete de salmon")
	(Ordinal Segundo)
	(Precio 19.0)
	(Temperatura Caliente)
	(TipoPlato Pescado))

([KB_565836_Class61] of  Plato

	(Disponibilidad Total)
	(Estilo Tradicional)
	(Ingredientes [KB_565836_Class62])
	(Nombre "Pina en almibar")
	(Ordinal Primero)
	(Precio 4.0)
	(Temperatura Frio)
	(TipoPlato Fruta Postre))

([KB_565836_Class62] of  Ingrediente

	(Nombre "Pina"))

([KB_565836_Class63] of  Plato

	(BebidaIncompatible [KB_565836_Class28])
	(BebidaUnica [KB_565836_Class27])
	(Disponibilidad Total)
	(Estilo Sibarita)
	(Ingredientes
		[KB_565836_Class52]
		[KB_565836_Class38]
		[KB_565836_Class50]
		[KB_565836_Class51]
		[KB_565836_Class49])
	(Nombre "Mariscada")
	(Ordinal Primero Segundo)
	(PlatoIncompatible [KB_565836_Class55])
	(Precio 70.0)
	(Temperatura Caliente)
	(TipoPlato Pescado))

([KB_565836_Class64] of  Plato

	(Disponibilidad Total)
	(Estilo Sibarita)
	(Ingredientes
		[KB_565836_Class45]
		[KB_565836_Class53])
	(Nombre "Canapes de caviar")
	(Ordinal Primero)
	(Precio 50.0)
	(Temperatura Frio)
	(TipoPlato Pescado))

([KB_565836_Class65] of  Bebida

	(Nombre "Cava con motas de oro de 24 kilates")
	(Precio 200.0)
	(TipoBebida Cava))

([KB_565836_Class66] of  Bebida

	(Nombre "Champan pinky")
	(Precio 10.0)
	(TipoBebida Cava))

([KB_565836_Class67] of  Plato

	(BebidaUnica [KB_565836_Class65])
	(Disponibilidad Verano)
	(Estilo Sibarita)
	(Ingredientes
		[KB_565836_Class68]
		[KB_565836_Class69]
		[KB_565836_Class70]
		[KB_565836_Class73])
	(Nombre "Sultan’s Golden Cake")
	(Ordinal Postre)
	(Precio 1000.0)
	(Temperatura Frio)
	(TipoPlato Postre))

([KB_565836_Class68] of  Ingrediente

	(Nombre "Durazno (melocoton)"))

([KB_565836_Class69] of  Ingrediente

	(Nombre "Pera"))

([KB_565836_Class70] of  Ingrediente

	(Nombre "Ron"))

([KB_565836_Class73] of  Ingrediente

	(Nombre "Oro"))

([ProjectIA2_Class0] of  Plato

	(Disponibilidad Total)
	(Estilo Tradicional)
	(Ingredientes
		[ProjectIA2_Class1]
		[ProjectIA2_Class2])
	(Nombre "Fideua")
	(Ordinal Primero Segundo)
	(Precio 20.0)
	(Temperatura Caliente)
	(TipoPlato Pasta))

([ProjectIA2_Class1] of  Ingrediente

	(Nombre "Fideo"))

([ProjectIA2_Class10] of  Ingrediente

	(Nombre "Cebolla"))

([ProjectIA2_Class11] of  Ingrediente

	(Nombre "Zanahoria"))

([ProjectIA2_Class12] of  Ingrediente

	(Nombre "Pepino"))

([ProjectIA2_Class13] of  Ingrediente

	(Nombre "Mantequilla"))

([ProjectIA2_Class14] of  Ingrediente

	(Nombre "Queso"))

([ProjectIA2_Class15] of  Plato

	(Disponibilidad Total)
	(Estilo Moderno)
	(Ingredientes
		[ProjectIA2_Class16]
		[ProjectIA2_Class11]
		[ProjectIA2_Class14])
	(Nombre "Garbanzos salteados")
	(Ordinal Primero)
	(Precio 10.0)
	(Temperatura Caliente)
	(TipoPlato Legumbre))

([ProjectIA2_Class16] of  Ingrediente

	(Nombre "Garbanzos"))

([ProjectIA2_Class17] of  Plato

	(Disponibilidad Total)
	(Estilo Moderno)
	(Ingredientes
		[ProjectIA2_Class18]
		[ProjectIA2_Class26])
	(Nombre "Habas con huevo escalfado")
	(Ordinal Primero)
	(Precio 15.0)
	(Temperatura Caliente)
	(TipoPlato Legumbre))

([ProjectIA2_Class18] of  Ingrediente

	(Nombre "Habas"))

([ProjectIA2_Class19] of  Plato

	(Disponibilidad Total)
	(Estilo Moderno)
	(Ingredientes
		[KB_565836_Class34]
		[ProjectIA2_Class11]
		[KB_565836_Class37])
	(Nombre "Salsichas a la jardinera")
	(Ordinal Segundo)
	(Precio 12.0)
	(Temperatura Caliente)
	(TipoPlato Carne))

([ProjectIA2_Class2] of  Ingrediente

	(Nombre "Calamar"))

([ProjectIA2_Class21] of  Plato

	(Disponibilidad Total)
	(Estilo Moderno)
	(Ingredientes
		[ProjectIA2_Class22]
		[ProjectIA2_Class23]
		[ProjectIA2_Class13])
	(Nombre "Costillas de cerdo caramelizadas")
	(Ordinal Segundo)
	(Precio 20.0)
	(Temperatura Caliente)
	(TipoPlato Carne))

([ProjectIA2_Class22] of  Ingrediente

	(Nombre "Costillas de cerdo"))

([ProjectIA2_Class23] of  Ingrediente

	(Nombre "Mazorca maiz"))

([ProjectIA2_Class24] of  Plato

	(Disponibilidad Total)
	(Estilo Moderno)
	(Ingredientes
		[KB_565836_Class39]
		[ProjectIA2_Class14])
	(Nombre "Flautas de pollo fritas")
	(Ordinal Segundo)
	(Precio 12.0)
	(Temperatura Caliente)
	(TipoPlato Carne))

([ProjectIA2_Class25] of  Plato

	(Disponibilidad Total)
	(Estilo Tradicional)
	(Ingredientes
		[KB_565836_Class39]
		[KB_565836_Class23]
		[ProjectIA2_Class10]
		[ProjectIA2_Class26])
	(Nombre "Pechuga de pollo arrebozadas con tomate picante")
	(Ordinal Segundo)
	(Precio 7.0)
	(Temperatura Caliente)
	(TipoPlato Carne))

([ProjectIA2_Class26] of  Ingrediente

	(Nombre "Huevo"))

([ProjectIA2_Class27] of  Plato

	(Disponibilidad Total)
	(Estilo Sibarita)
	(Ingredientes [ProjectIA2_Class28])
	(Nombre "Rollos de verdel con germinados y algas")
	(Ordinal Primero Segundo)
	(Precio 15.0)
	(Temperatura Frio)
	(TipoPlato Pescado))

([ProjectIA2_Class28] of  Ingrediente

	(Nombre "Filete de verdel"))

([ProjectIA2_Class29] of  Plato

	(Disponibilidad Primavera)
	(Estilo Moderno)
	(Ingredientes
		[ProjectIA2_Class30]
		[ProjectIA2_Class31]
		[KB_565836_Class23])
	(Nombre "Cocktail de camarones")
	(Ordinal Primero)
	(Precio 12.0)
	(Temperatura Frio)
	(TipoPlato Pescado))

([ProjectIA2_Class3] of  Plato

	(Disponibilidad Total)
	(Estilo Sibarita)
	(Ingredientes
		[ProjectIA2_Class4]
		[ProjectIA2_Class5]
		[ProjectIA2_Class6]
		[ProjectIA2_Class7])
	(Nombre "Crema de hongos y castanas con pato confinado")
	(Ordinal Primero)
	(Precio 30.0)
	(Temperatura Caliente)
	(TipoPlato Carne))

([ProjectIA2_Class30] of  Ingrediente

	(Nombre "Camarones"))

([ProjectIA2_Class31] of  Ingrediente

	(Nombre "Aguacate"))

([ProjectIA2_Class32] of  Plato

	(Disponibilidad Total)
	(Estilo Sibarita)
	(Ingredientes
		[ProjectIA2_Class33]
		[ProjectIA2_Class34])
	(Nombre "Ostra escabechada con granizado de pepino")
	(Ordinal Primero)
	(Precio 10.0)
	(Temperatura Frio)
	(TipoPlato Pescado))

([ProjectIA2_Class33] of  Ingrediente

	(Nombre "Ostra"))

([ProjectIA2_Class34] of  Ingrediente

	(Nombre "Manzana"))

([ProjectIA2_Class35] of  Plato

	(Disponibilidad Total)
	(Estilo Sibarita)
	(Ingredientes
		[ProjectIA2_Class36]
		[KB_565836_Class43])
	(Nombre "Amaranto frito, flores y yogur")
	(Ordinal Postre)
	(Precio 15.0)
	(Temperatura Frio)
	(TipoPlato Postre))

([ProjectIA2_Class36] of  Ingrediente

	(Nombre "Amaranto"))

([ProjectIA2_Class37] of  Plato

	(Disponibilidad Total)
	(Estilo Tradicional)
	(Ingredientes [ProjectIA2_Class38])
	(Nombre "Helado")
	(Ordinal Postre)
	(Precio 3.0)
	(Temperatura Frio)
	(TipoPlato Postre))

([ProjectIA2_Class38] of  Ingrediente

	(Nombre "Helado"))

([ProjectIA2_Class4] of  Ingrediente

	(Nombre "Pato"))

([ProjectIA2_Class5] of  Ingrediente

	(Nombre "Setas"))

([ProjectIA2_Class6] of  Ingrediente

	(Nombre "Nata"))

([ProjectIA2_Class7] of  Ingrediente

	(Nombre "Castanas"))

([ProjectIA2_Class8] of  Plato

	(Disponibilidad Total)
	(Estilo Moderno)
	(Ingredientes
		[ProjectIA2_Class9]
		[ProjectIA2_Class10]
		[ProjectIA2_Class11]
		[ProjectIA2_Class12]
		[ProjectIA2_Class13]
		[ProjectIA2_Class14])
	(Nombre "Tortitas de zanahoria blanca con ensalada de quinua negra")
	(Ordinal Primero)
	(Precio 15.0)
	(Temperatura Caliente)
	(TipoPlato Ensalada))

([ProjectIA2_Class9] of  Ingrediente

	(Nombre "Quinua"))
)
;; Nuestro codigo -----------------------
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
