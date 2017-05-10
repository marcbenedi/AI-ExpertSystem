;; Ontologia -----------------------
; Tue May 09 10:19:20 CEST 2017
;
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(multislot TipoPlato
		(type SYMBOL)
		(allowed-values Carne Pescado Vegano Sopa Pasta Ensalada Legumbre Arroz Fruta Postre)
		(cardinality 1 ?VARIABLE)
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
	(single-slot Segundo
		(type INSTANCE)
;+		(allowed-classes Plato)
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
	(single-slot Primero
		(type INSTANCE)
;+		(allowed-classes Plato)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
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
	(single-slot Postre
		(type INSTANCE)
;+		(allowed-classes Plato)
;+		(cardinality 1 1)
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
	(single-slot Primero
		(type INSTANCE)
;+		(allowed-classes Plato)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Segundo
		(type INSTANCE)
;+		(allowed-classes Plato)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Postre
		(type INSTANCE)
;+		(allowed-classes Plato)
;+		(cardinality 1 1)
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
		(create-accessor read-write)))
;; Instancias -----------------------
(definstances instancies
; Tue May 09 10:19:20 CEST 2017
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
	(Ordinal Postre)
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
	(Ordinal Segundo Primero)
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
	(Ordinal Segundo Primero)
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
	(Estilo Moderno)
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
; TO-DO
;añadir a cada plato si es complejo o no (string)
;para las bebidas añadir un campo de si es alcoholica
;bebida por plato

;-------------------------------------------------------------------------------

; (defclass Recomendacion
; 	(is-a USER)
; 	(role concrete)
;     (slot nombre_cuadro
; 		(type INSTANCE)
; 		(create-accessor read-write))
;     (slot puntuacion
;         (type INTEGER)
;         (create-accessor read-write))
;     (multislot justificaciones
; 		(type STRING)
; 		(create-accessor read-write))

;--------MODULES--------------
(defmodule MAIN (export ?ALL))

(defmodule recopilacion-restr
	 (import MAIN ?ALL)
	 (export ?ALL)
)

(defmodule abstraccion
	(import MAIN ?ALL)
	(import recopilacion-restr deftemplate ?ALL)
	(export ?ALL)
)

(defmodule generacion-soluciones
	(import MAIN ?ALL)
	(export ?ALL)
)

(defmodule refinamiento
	(import MAIN ?ALL)
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
	(multislot ingredientes (type STRING) (default "indef"))
	(slot gama-precio-min (type STRING)(default "indef"))
	(slot gama-precio-max (type STRING)(default "indef"))
	(slot alcohol (type STRING) (default "indef"))
	(slot bebida-por-plato (type STRING) (default "indef"))
)

(deftemplate MAIN::info-evento
	(slot mes (type INTEGER) (default -1))
	(slot tamanyo-grupo (type INTEGER) (default -1))
)

(deftemplate MAIN::info-evento-abs
	(slot temporada (type STRING) (default "indef")) ;VERANO-PRIMAVERA-OTONO-INVIERNO
	(slot tamanyo-grupo-abs (type STRING) (default "indef"));Individual-Pareja-Pequeño-Mediano-Grande
)

(deftemplate generacion-soluciones::lista-platos
  (multislot platos (type INSTANCE))
)

(defmessage-handler MAIN::Menu calculaPrecio()
  (bind ?coste (send ?self:Primero get-Precio))
	(bind ?coste (+ ?coste (send ?self:Segundo get-Precio)))
	(bind ?coste (+ ?coste (send ?self:Postre get-Precio)))
	(bind ?coste (+ ?coste (send ?self:BebidaUnica get-Precio)))
	(bind ?self:Precio ?coste)
)

(defmessage-handler MAIN::Plato imprimir()
  (printout t ?self:Nombre " " ?self:Precio "€" crlf)
)

(deffunction MAIN::restr-eleccion (?pregunta ?min ?max)
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

(deffunction MAIN::restr-multi-eleccion (?pregunta ?min ?max)
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

(deffunction MAIN::restr-multi-opciones (?preg $?opciones)
	(bind ?salida (format nil "%s" ?preg))
	(printout t ?salida crlf)
	(progn$ (?valor ?opciones)
		(bind ?salida (format nil " %d. %s" ?valor-index ?valor))
		(printout t ?salida crlf)
	)
	(bind ?resp (restr-multi-eleccion "Escoje opciones (0 para terminar):" 1 (length$ ?opciones)))
	?resp
)


; (deffunction MAIN::restr-si-no (?preg)
; 	(bind ?resp (restr-opciones ?preg si no))
; 	(if (or (eq ?resp si) (eq ?resp s))
; 		then (return "si")
; 		else (return "no")
; 	)
; )

(defrule MAIN::regla-inicial "Regla inicial"
	(declare (salience 10))
	=>
	(printout t"----------------------------------------------------------" crlf)
  (printout t"        Bienvenido a nuestro generador de menus           " crlf)
	(printout t"      Por favor responda a las siguentes preguntas          " crlf)
	(printout t"----------------------------------------------------------" crlf)
  (printout t crlf)
	(focus recopilacion-restr)
)


(defrule recopilacion-restr::ingredientes-prohibidos "Lista de ingredientes prohibidos"
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
	(printout t ?nombres crlf)
	(modify ?restr (ingredientes ?nombres))
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
)

(defrule recopilacion-restr::permite-alcoholica "Se permiten bebidas alcoholicas"
	?restr <- (restricciones (alcohol ?alcohol))
	(test (eq ?alcohol "indef"))
	=>
	(bind ?resp (restr-opciones "¿Quieres permitir que se incluyan bebidas alcoholicas?" Si No))
	(if (eq ?resp 1) then (bind ?r "si") else (bind ?r "no"))
	(modify ?restr (alcohol ?r))
)

(defrule recopilacion-restr::bebida-cada-plato "Se quiere una bebida por plato"
	?restr <- (restricciones (bebida-por-plato ?bpp))
	(test (eq ?bpp "indef"))
	=>
	(bind ?resp (restr-opciones "¿Quieres una bebida por cada plato?" Si No))
	(if (eq ?resp 1) then (bind ?r "si") else (bind ?r "no"))
	(modify ?restr (bebida-por-plato ?r))
)

(defrule recopilacion-restr::mes-evento "Mes en que será el evento"
	(not (info-evento))
	=>
	(bind ?mesR (restr-opciones "¿En que mes sera el evento?" Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre))
	(bind ?i (assert (info-evento (mes ?mesR))))

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
	(bind ?ie (assert (info-evento-abs (temporada ?temp))))
  (printout t crlf)
)

(defrule recopilacion-restr::tamanyo-del-grupo "Tamanyo del grupo"
	?info <- (info-evento (tamanyo-grupo ?tam))
	?info-abs <- (info-evento-abs)
	(test (eq ?tam -1))
	=>
	(bind ?tam (restr-eleccion "¿Cuantos comensales seran?" 1 250))
  (modify ?info (tamanyo-grupo ?tam))

	(if (eq ?tam 1) then (bind ?grup "Individual"))
	(if (eq ?tam 2) then (bind ?grup "Pareja")) ; 1 - 2 - (3 .. 20) - (21 .. 50) - (51 .. 250)

	(if (and (>= ?tam 3) (<= ?tam 20))  then (bind ?grup "Pequeno"))
	(if (and (>= ?tam 21) (<= ?tam 50))  then (bind ?grup "Mediano"))
	(if (>= ?tam 51)  then (bind ?grup "Grande"))

	(modify ?info-abs (tamanyo-grupo-abs ?grup))
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

(deffunction generacion-soluciones::platos-por-estilo (?estilo)
	(bind $?filtrados (find-all-instances ((?a Plato)) (eq (str-cat (send ?a get-Estilo)) ?estilo) ))
	(return ?filtrados)
) ;TESTADA

(deffunction generacion-soluciones::puede-ser (?plato ?ordinal)
	;(printout t "-->" (send ?plato get-Nombre) "<--" crlf) ;TESTING
	(bind ?lis (send ?plato get-Ordinal))
	(loop-for-count (?i 1 (length$ ?lis) ) do
		(bind ?e (nth$ ?i ?lis))
		;(printout t "-->" (str-cat ?e) "<--" crlf) ;TESTING
		(if ( eq (str-cat ?e) ?ordinal) then (return TRUE) )
	)
	(return FALSE)
) ; TESTED

;DADA UNA LISTA DE PLATOS, FILTRA POR ORDINAL ("Primero Segundo Postre")
(deffunction generacion-soluciones::filtra-ordinal (?lista ?ordinal)
	(bind $?ordinales (find-all-instances ((?a Plato)) (and (puede-ser ?a ?ordinal) (member ?a ?lista))))
	(return ?ordinales)
) ;TESTED

(deffunction generacion-soluciones::monta-menus-comida(?minP ?maxP ?estilo ?alc)
	(bind $?primeros (filtra-ordinal (platos-por-estilo ?estilo) "Primero" ))
	(bind $?segundos (filtra-ordinal (platos-por-estilo ?estilo) "Segundo" ))
	(bind $?postres (filtra-ordinal (platos-por-estilo ?estilo) "Postre" ))
	(printout t "bebida alcoholica:" ?alc crlf)
	(bind $?bebidas (find-all-instances ((?a Bebida))
		(if (eq ?alc "si") then (= 1 1) else (and (neq (str-cat (send ?a get-TipoBebida)) "Cerveza" ) (neq (str-cat (send ?a get-TipoBebida)) "Vino")) )))

	(loop-for-count (?i 1 (length ?primeros))
			(loop-for-count (?j 1 (length ?segundos))
					(loop-for-count (?k 1 (length ?postres))
							(loop-for-count (?b 1 (length ?bebidas))
									(bind ?ins
										(make-instance (gensym) of Menu
														(Primero (nth$ ?i ?primeros))
														(Segundo (nth$ ?j ?segundos))
														(Postre (nth$ ?k ?postres) )
														(BebidaUnica (nth$ ?b ?bebidas))
										)
									)
									(send ?ins calculaPrecio)
							)
					)
			)
	)

	(bind $?menus
		(find-all-instances ((?m Menu))
			(and
				(and (>= (send ?m get-Precio) ?minP) (<= (send ?m get-Precio) ?maxP))
				(neq (send (send ?m get-Primero) get-Nombre) (send (send ?m get-Segundo) get-Nombre) )
			)
		)
	)
  ;marc: a mi el foreach no mel troba (soposo que per versió de clips. amb progn fa el mateix)
	(progn$ (?r $?menus)
			(printout t (send (send ?r get-Primero) get-Nombre) crlf)
			(printout t (send (send ?r get-Segundo) get-Nombre) crlf)
			(printout t (send (send ?r get-Postre) get-Nombre) crlf )
			(printout t (send (send ?r get-BebidaUnica) get-Nombre) crlf )

			(printout t (send ?r get-Precio) crlf)
			(printout t "_________________" crlf)
	)
	(return ?menus)
)

(defrule generacion-soluciones::buscar-instancias "Busca instancias de platos"
  ?restr <- (restricciones (min ?minimo) (max ?maximo) (estilo ?estilo) (alcohol ?alc))
  (not (lista-platos))
  =>

	(bind $?m (monta-menus-comida ?minimo ?maximo ?estilo ?alc))


	; (bind ?style ?estilo)
	; (bind ?ordi "Primero")
	; (bind $?platosFilt (filtra-ordinal (platos-por-estilo ?style)  ?ordi  ))
	; (printout t "platos " ?style ", " ?ordi crlf)
	; (progn$ (?var $?platosFilt)
	; (printout t "****   " (send ?var get-Nombre) crlf)) ;TESTING

  ;(bind ?tercio (/ (- ?maximo ?minimo ) 3))

  ; (loop-for-count (?i 1 3) do
	;
  ;   (bind ?min-precio (+ ?minimo (* ?tercio (- ?i 1))))
  ;   (bind ?max-precio (+ ?minimo (* ?tercio ?i)))
	;
  ;   (bind $?primeros (find-all-instances ((?a Plato)) (and (eq (str-cat (nth$ 1 (send ?a get-Ordinal))) "Primero") (eq (str-cat (send ?a get-Estilo)) ?estilo)) ))
  ;   (bind $?segundos (find-all-instances ((?a Plato)) (and (eq (str-cat (nth$ 1 (send ?a get-Ordinal))) "Segundo") (eq (str-cat (send ?a get-Estilo)) ?estilo)) ))
  ;   (bind $?postres (find-all-instances ((?a Plato)) (and (eq (str-cat (nth$ 1 (send ?a get-Ordinal))) "Postre") (eq (str-cat (send ?a get-Estilo)) ?estilo)) ))
  ;   (bind $?bebidas (find-all-instances ((?a Bebida)) TRUE))
	;
  ;   (bind ?primero (random-slot ?primeros))
  ;   (bind ?segundo (random-slot ?segundos))
  ;   (bind ?postre (random-slot ?postres))
  ;   (bind ?bebida (random-slot ?bebidas))
	;
  ;   (printout t "Primer plato: " (send ?primero imprimir))
  ;   (printout t "Segundo plato: " (send ?segundo imprimir))
  ;   (printout t "Postre: " (send ?postre imprimir))
  ;   (printout t "Para beber: " (send ?bebida get-Nombre) " " (send ?bebida get-Precio) "€" crlf)
  ;   (printout t "Precio total: " (+ (+ (send ?primero get-Precio) (send ?segundo get-Precio)) (+ (send ?postre get-Precio) (send ?bebida get-Precio))) "€" crlf)
  ;   (printout t "--------------------" crlf)
	; )
)
