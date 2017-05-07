

;;Ontologia --------------------------------------------------------------------

; Sat May 06 19:42:37 CEST 2017
;
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot Precio
		(type FLOAT)
		(range 0.0 %3FVARIABLE)
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
	(single-slot Estilo
		(type SYMBOL)
		(allowed-values Tradicional Moderno Minimalista Sibarita)
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
		(range 0.0 %3FVARIABLE)
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
	(single-slot Estilo
		(type SYMBOL)
		(allowed-values Tradicional Moderno Minimalista Sibarita)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Precio
		(type FLOAT)
		(range 0.0 %3FVARIABLE)
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
	(multislot Ingredientes
		(type INSTANCE)
;+		(allowed-classes Ingrediente)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot PlatoIncompatible
		(type INSTANCE)
;+		(allowed-classes Plato)
		(create-accessor read-write))
	(multislot Ordinal
		(type SYMBOL)
		(allowed-values Primero Segundo Postre)
		(cardinality 1 3)
		(create-accessor read-write)))

(defclass Bebida
	(is-a USER)
	(role concrete)
	(single-slot Precio
		(type FLOAT)
		(range 0.0 %3FVARIABLE)
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
		(create-accessor read-write)))

(defclass Ingrediente
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))


;;Instancias --------------------------------------------------------------------

; Sat May 06 19:42:37 CEST 2017
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
