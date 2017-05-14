;; Ontologia -----------------------
; Fri May 12 11:16:51 CEST 2017
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
	(single-slot Estilo
		(type SYMBOL)
		(allowed-values Tradicional Moderno Sibarita)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
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
	(single-slot Alcoholica
		(type STRING)
		(default "No")
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Complejo
		(type STRING)
		(default "No")
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Segundo
		(type INSTANCE)
;+		(allowed-classes Plato)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot BebidaIncompatible
		(type INSTANCE)
;+		(allowed-classes Bebida)
		(create-accessor read-write))
	(single-slot Disponibilidad
		(type SYMBOL)
		(allowed-values Total Invierno Primavera Verano Otono)
		(default Total)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Primero
		(type INSTANCE)
;+		(allowed-classes Plato)
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
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Primero
		(type INSTANCE)
;+		(allowed-classes Plato)
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
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Complejo
		(type STRING)
		(default "No")
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
	(single-slot Estilo
		(type SYMBOL)
		(allowed-values Tradicional Moderno Sibarita)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot BebidaIncompatible
		(type INSTANCE)
;+		(allowed-classes Bebida)
		(create-accessor read-write))
	(single-slot Disponibilidad
		(type SYMBOL)
		(allowed-values Total Invierno Primavera Verano Otono)
		(default Total)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Ingredientes
		(type INSTANCE)
;+		(allowed-classes Ingrediente)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot PlatoIncompatible
		(type INSTANCE)
;+		(allowed-classes Plato)
		(create-accessor read-write)))

(defclass Bebida
	(is-a USER)
	(role concrete)
	(single-slot Precio
		(type FLOAT)
		(range 0.0 9999.99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot TipoBebida
		(type SYMBOL)
		(allowed-values Refresco Agua Vino Cerveza Zumo Cava)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Alcoholica
		(type STRING)
		(default "No")
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
; Fri May 12 11:16:51 CEST 2017
; 
;+ (version "3.5")
;+ (build "Build 663")

([KB_565836_Class23] of  Ingrediente

	(Nombre "Tomate"))

([KB_565836_Class24] of  Ingrediente

	(Nombre "Macarrones"))

([KB_565836_Class25] of  Plato

	(Complejo "No")
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

	(Alcoholica "No")
	(Nombre "Agua natural sin gas")
	(Precio 1.0)
	(TipoBebida Agua))

([KB_565836_Class27] of  Bebida

	(Alcoholica "Si")
	(Nombre "Vino blanco")
	(Precio 15.0)
	(TipoBebida Vino))

([KB_565836_Class28] of  Bebida

	(Alcoholica "Si")
	(Nombre "Vino tinto")
	(Precio 17.0)
	(TipoBebida Vino))

([KB_565836_Class29] of  Bebida

	(Alcoholica "No")
	(Nombre "Cocacola")
	(Precio 1.5)
	(TipoBebida Refresco))

([KB_565836_Class30] of  Bebida

	(Alcoholica "No")
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
	(Complejo "Si")
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

	(Complejo "No")
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

	(Complejo "No")
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
	(Complejo "No")
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

	(Complejo "No")
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
	(Complejo "No")
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

	(Complejo "No")
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

	(Alcoholica "Si")
	(Nombre "Cava con motas de oro de 24 kilates")
	(Precio 200.0)
	(TipoBebida Cava))

([KB_565836_Class66] of  Bebida

	(Alcoholica "No")
	(Nombre "Champan pinky")
	(Precio 10.0)
	(TipoBebida Cava))

([KB_565836_Class67] of  Plato

	(BebidaUnica [KB_565836_Class65])
	(Complejo "Si")
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

	(Complejo "Si")
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

	(Complejo "No")
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

	(Complejo "No")
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

	(Complejo "No")
	(Disponibilidad Total)
	(Estilo Moderno)
	(Ingredientes
		[KB_565836_Class34]
		[ProjectIA2_Class11]
		[KB_565836_Class37])
	(Nombre "Salchichas a la jardinera")
	(Ordinal Segundo)
	(Precio 12.0)
	(Temperatura Caliente)
	(TipoPlato Carne))

([ProjectIA2_Class2] of  Ingrediente

	(Nombre "Calamar"))

([ProjectIA2_Class21] of  Plato

	(Complejo "No")
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

	(Complejo "No")
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

	(Complejo "No")
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

	(Complejo "Si")
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

	(Complejo "No")
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

	(Complejo "No")
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

	(Complejo "Si")
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

	(Complejo "Si")
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

	(Complejo "No")
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

	(Complejo "No")
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

;Modulo encargado de imprimir 3 menus (economico, medio,caro)
(defmodule resultados-output
	(import MAIN ?ALL)
	(import generacion-soluciones ?ALL)
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

; (defmessage-handler MAIN::Menu calculaPrecio()
;   (bind ?coste (send ?self:Primero get-Precio))
; 	(bind ?coste (+ ?coste (send ?self:Segundo get-Precio)))
; 	(bind ?coste (+ ?coste (send ?self:Postre get-Precio)))
; 	(bind ?coste (+ ?coste (send ?self:BebidaUnica get-Precio)))
; 	(bind ?self:Precio ?coste)
; )

; (defmessage-handler MAIN::Plato imprimir()
;   (printout t ?self:Nombre " " ?self:Precio "€" crlf)
; )

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
	(printout t ?nombres crlf)
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
) ;TESTADA

;Devuelve TRUE o FALSE dependiendo de si el plato puede ser servido como ordinal
(deffunction generacion-soluciones::puede-ser (?plato ?ordinal)
	(bind ?lis (send ?plato get-Ordinal))
	(loop-for-count (?i 1 (length$ ?lis) ) do
		(bind ?e (nth$ ?i ?lis))
		(if ( eq (str-cat ?e) ?ordinal) then (return TRUE) )
	)
	(return FALSE)
) ; TESTED

;Dada una lista de platos, filtra por ordinal ("Primero Segundo Postre")
(deffunction generacion-soluciones::filtra-ordinal (?lista ?ordinal)
	(bind $?ordinales (find-all-instances ((?a Plato)) (and (puede-ser ?a ?ordinal) (member ?a ?lista))))
	(return ?ordinales)
) ;TESTED

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

; (deffunction generacion-soluciones::eliminar-menus-duplicados(?lista)
; 	(bind ?respuesta (create$))
; 	;Para todos los menus de la ?lista miramos si hay algunos que sean iguales
; 	(progn$ (?menu ?lista)
; 		(bind ?boolean "no_existent")
; 		;Miramos que no haya un menu igual a ?menu es la lisa ?respuesta
; 		(progn$ (?existent ?respuesta)
; 			(if
; 				(and
; 					(eq (send (send ?menu get-Primero) get-Nombre) (send (send ?existent get-Primero) get-Nombre))
; 					(eq (send (send ?menu get-Segundo) get-Nombre) (send (send ?existent get-Segundo) get-Nombre))
; 					(eq (send (send ?menu get-Postre) get-Nombre) (send (send ?existent get-Postre) get-Nombre))
; 				)
; 				then
; 					(bind ?boolean "existent")
; 			)
; 		)
; 		;Cuando ya los hemos mirado todos de ?respuesta, si no hemos encontrado uno igual insertamos
; 		(if (neq ?boolean "existent") then (bind ?respuesta (insert$ ?respuesta 1 ?menu)))
; 	)
; 	(return ?respuesta )
; )

;Elimina de la lista los menus que contienen platos incompatibles entre si
(deffunction  generacion-soluciones::eliminar-menus-platos-incompatibles(?lista)
	; (progn$ (?menu ?lista)
	;
	; 	(bind  ?platos-incompatibles (create$)) ;lista donde se guardara el nombre de todos los platos incompatibles del menu
	;
	; 	(bind ?inc-primero (send (send ?menu get-Primero) get-PlatoIncompatible))
	; 	;(printout t (length ?inc-primero) crlf)
	; 	(loop-for-count (?i 1 (length$ ?inc-primero)) do
	; 		;?p <- (nth$ ?i ?inc-primero)
	; 		(bind ?p (nth$ ?i ?inc-primero))                   ;No funciona, diu que no troba l'instancia
	; 		(printout t (send ?p get-Nombre) crlf)
	; 	)
	; )
	(return ?lista)
)

;Elimina los menus que tengan algun plato disponible en una temporada
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

	(return ?respuesta )
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
				(if (or (eq ?tam "Medianoi") (eq ?tam Grande))
					then
						(bind ?respuesta (insert$ ?respuesta 1 ?m)) ;Hay platos complejos pero son mucha gente
				)
			else
				(bind ?respuesta (insert$ ?respuesta 1 ?m)) ;No hay platos complejos
		)

	)

	(return ?respuesta )
)

;Asigna una bebida al menu (o por plato)
(deffunction generacion-soluciones::asignar-bebida(?lista ?bpp ?pa)
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
(deffunction generacion-soluciones::calcular-precio(?lista)
	(loop-for-count (?i 1 (length$ ?lista)) do

			(bind ?m (nth$ ?i ?lista))

			(bind ?primer-plato (send ?m get-Primero))
			(bind ?segundo-plato (send ?m get-Segundo))
			(bind ?postre (send ?m get-Postre))

			;(bind ?bebida (send ?m get-BebidaUnica))
			;(bind ?preu (+ (send ?primer-plato get-Precio)  (send ?segundo-plato get-Precio) (send ?postre get-Precio)  (send ?bebida get-Precio) ))
			(bind ?preu (+ (send ?primer-plato get-Precio)  (send ?segundo-plato get-Precio) (send ?postre get-Precio) ))

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
	(if (eq ?min "Economico") then (bind ?min-def 3))

	(if (eq ?max "Economico") then (bind ?max-def 0))
	(if (eq ?max "Normal") then (bind ?max-def 1))
	(if (eq ?max "Medio") then (bind ?max-def 2))
	(if (eq ?max "Economico") then (bind ?max-def 3))

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

		(if (and (>= ?def ?min-def) (>= ?max-def ?def)) ;<---------TODO:Comprobar que estiguib bé les comparacions
				then
					(insert$ ?resultado 1 ?m)
		)

	)
	(return ?resultado)
)

; (deffunction generacion-soluciones::random-slot ( ?li )
;  (bind ?li (create$ ?li))
;  (bind ?max (length ?li))
;  (bind ?r (random 1 ?max))
;  (bind ?ins (nth$ ?r ?li))
;  (return ?ins)
; )

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
		;Por la generación que hacemos, no se pueden dar menus duplicados
		;(bind ?lista (eliminar-menus-duplicados ?lista))
		(bind ?lista (eliminar-menus-platos-incompatibles ?lista))
		(bind ?lista (filtrar-temporada ?lista ?temp))
		(bind ?lista (filtrar-complejidad ?lista ?tam))
		(bind ?lista (asignar-bebida ?lista ?bpp ?pa))
		(bind ?lista (calcular-precio ?lista))
		(bind ?lista (filtrar-rango-precio ?lista ?min ?max))

		(assert (lista-menus (menus ?lista)))

		(focus refinamiento)

)
;-------------------------------refinamiento------------------------------------
;-------------------------------------------------------------------------------

;Elimina los menus que contengan un plato que contenga un ingrediente prohibido
(deffunction refinamiento::filtrar-ingredientes-prohibidos(?lista ?proh)
	(return ?lista)
)

;Elimina los menus que no esten dentro del rango de precio
(deffunction refinamiento::filtrar-precio-concreto(?lista ?min ?max)
	(return ?lista)
)

;Ordena los menus por precio
(deffunction refinamiento::ordenar(?lista)
	(return ?lista)
)

;Filtra los menus con las restricciones concretas
(defrule refinamiento::refinar ""
		;(lista-menus)
		(declare (salience 499))
		?listam <- (lista-menus (menus ?lista))
		?restr <- (restricciones (min ?min) (max ?max) (ingredientes ?proh))
	=>
		(bind ?lista (filtrar-ingredientes-prohibidos ?lista ?proh))
		(bind ?lista (filtrar-precio-concreto ?lista ?min ?max))
		(bind ?lista (ordenar ?lista))
		(modify ?listam (menus ?lista))
		(focus resultados-output)
)

;----------------------------resultados-output----------------------------------
;-------------------------------------------------------------------------------

;Imprime 3 menus, el más barato, el más caro y el del medio
(defrule resultados-output::printear ""
		(declare (salience 399))
		?listam <- (lista-menus (menus ?lista))
	=>
		(send (nth$ 1 ?lista) imprimir)
		(send (nth$ (/ (length$ ?lista) 2) ?lista) imprimir)
		(send (nth$ (length$ ?lista) ?lista) imprimir)
)
