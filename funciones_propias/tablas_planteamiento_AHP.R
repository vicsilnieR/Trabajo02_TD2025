
source("funciones_propias/otras_funciones.R")
datos <- read.csv2("datos/monitores.csv", header = FALSE, sep = ";")
colnames(datos) <- c("Modelo","Precio", "Tamaño", "Frecuencia", 
                    "Resolución", "Consumo", "Densidad", "Brillo", "Colores")
# Nivel 1: Criterios
matriz_criterios_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "1/7", "1/5",
             "7", "1", "3",
             "5", "1/3", "1"),
           nrow = 3, byrow = TRUE)
))
rownames(matriz_criterios_planteamiento) <- c("Coste", "Calidad de Imagen", "Experiencia de Usuario")
colnames(matriz_criterios_planteamiento) <- c("Coste", "Calidad de Imagen", "Experiencia de Usuario")

tbahp0101 <- crea_tabla_estilo_comparación(matriz_criterios_planteamiento)

# Nivel 2: Subcriterios

matriz_subcriterio_coste_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "5",
             "1/5", "1"),
           nrow = 2, byrow = TRUE)
))
rownames(matriz_subcriterio_coste_planteamiento) <- c("Precio", "Consumo")
colnames(matriz_subcriterio_coste_planteamiento) <- c("Precio", "Consumo")
tbahp0201 <- crea_tabla_estilo_comparación(matriz_subcriterio_coste_planteamiento)

matriz_subcriterio_calidad_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "2", "7", "5",
             "1/2", "1", "5", "3",
             "1/7", "1/5", "1", "1/3",
             "1/5", "1/3", "3", "1"),
           nrow = 4, byrow = TRUE)
))
rownames(matriz_subcriterio_calidad_planteamiento) <- c("Resolución", "Densidad", "Brillo", "Colores")
colnames(matriz_subcriterio_calidad_planteamiento) <- c("Resolución", "Densidad", "Brillo", "Colores")
tbahp0202 <- crea_tabla_estilo_comparación(matriz_subcriterio_calidad_planteamiento)

matriz_subcriterio_experiencia_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "3",
             "1/3", "1"),
           nrow = 2, byrow = TRUE)
))
rownames(matriz_subcriterio_experiencia_planteamiento) <- c("Tamaño", "Frecuencia")
colnames(matriz_subcriterio_experiencia_planteamiento) <- c("Tamaño", " Frecuencia")
tbahp0203 <- crea_tabla_estilo_comparación(matriz_subcriterio_experiencia_planteamiento)

# Nivel 3: Alternativas

matriz_alternativas_precio_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "1/7", "1/2", "1/9", "1/5",
             "7", "1", "5", "1/4", "3",
             "2", "1/5", "1", "1/7", "1/4",
             "9", "4", "7", "1", "5",
             "5", "1/3", "4", "1/5", "1"),
           nrow = 5, byrow = TRUE)
))
rownames(matriz_alternativas_precio_planteamiento) <- datos$Modelo
colnames(matriz_alternativas_precio_planteamiento) <- datos$Modelo
tbahp0301 <- crea_tabla_estilo_comparación(matriz_alternativas_precio_planteamiento)

matriz_alternativas_consumo_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "1/4", "1/2", "1/9", "1/3",
             "4", "1", "3", "1/6", "2",
             "2", "1/3", "1", "1/8", "3",
             "9", "6", "8", "1", "7",
             "3", "1/2", "1/3", "1/7", "1"),
           nrow = 5, byrow = TRUE)
))
rownames(matriz_alternativas_consumo_planteamiento) <- datos$Modelo
colnames(matriz_alternativas_consumo_planteamiento) <- datos$Modelo
tbahp0302 <- crea_tabla_estilo_comparación(matriz_alternativas_consumo_planteamiento)

matriz_alternativas_resolucion_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "5", "5", "9", "1",
             "1/5", "1", "1", "3", "1/5",
             "1/5", "1", "1", "3", "1/5",
             "1/9", "1/3", "1/3", "1", "1/9",
             "1", "5", "5", "9", "1"),
           nrow = 5, byrow = TRUE)
))
rownames(matriz_alternativas_resolucion_planteamiento) <- datos$Modelo
colnames(matriz_alternativas_resolucion_planteamiento) <- datos$Modelo
tbahp0303 <- crea_tabla_estilo_comparación(matriz_alternativas_resolucion_planteamiento)

matriz_alternativas_densidad_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "3", "5", "7", "1",
             "1/3", "1", "3", "5", "1/3",
             "1/5", "1/3", "1", "3", "1/5",
             "1/7", "1/5", "1/3", "1", "1/7",
             "1", "3", "5", "7", "1"),
           nrow = 5, byrow = TRUE)
))
rownames(matriz_alternativas_densidad_planteamiento) <- datos$Modelo
colnames(matriz_alternativas_densidad_planteamiento) <- datos$Modelo
tbahp0304 <- crea_tabla_estilo_comparación(matriz_alternativas_densidad_planteamiento)

matriz_alternativas_brillo_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "7", "2", "7", "6",
             "1/7", "1", "1/3", "1", "2",
             "1/2", "6", "1", "6", "5",
             "1/7", "1", "3", "1", "2",
             "1/6", "1/2", "1/5", "1/2", "1"),
           nrow = 5, byrow = TRUE)
))
rownames(matriz_alternativas_brillo_planteamiento) <- datos$Modelo
colnames(matriz_alternativas_brillo_planteamiento) <- datos$Modelo
tbahp0305 <- crea_tabla_estilo_comparación(matriz_alternativas_brillo_planteamiento)

matriz_alternativas_colores_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "7", "1", "7", "1",
             "1/7", "1", "1/7", "1", "1/7",
             "1", "7", "1", "7", "1",
             "1/7", "1", "1/7", "1", "1/7",
             "1", "7", "1", "7", "1"),
           nrow = 5, byrow = TRUE)
))
rownames(matriz_alternativas_colores_planteamiento) <- datos$Modelo
colnames(matriz_alternativas_colores_planteamiento) <- datos$Modelo
tbahp0306 <- crea_tabla_estilo_comparación(matriz_alternativas_colores_planteamiento)

matriz_alternativas_tamano_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "7", "1", "7", "5",
             "1/7", "1", "1/7", "1", "1/3",
             "1", "7", "1", "7", "5",
             "1/7", "1", "1/7", "1", "1/3",
             "1/5", "3", "1/5", "3", "1"),
           nrow = 5, byrow = TRUE)
))
rownames(matriz_alternativas_tamano_planteamiento) <- datos$Modelo
colnames(matriz_alternativas_tamano_planteamiento) <- datos$Modelo
tbahp0307 <- crea_tabla_estilo(matriz_alternativas_tamano_planteamiento, nombresfila = TRUE)

matriz_alternativas_frecuencia_planteamiento <- data.frame(as.data.frame(
    matrix(c("1", "1/5", "1/3", "5", "7",
             "5", "1", "3", "7", "9",
             "3", "1/3", "1", "6", "8",
             "1/5", "1/7", "1/6", "1", "3",
             "1/7", "1/9", "1/8", "1/3", "1"),
           nrow = 5, byrow = TRUE)
))
rownames(matriz_alternativas_frecuencia_planteamiento) <- datos$Modelo
colnames(matriz_alternativas_frecuencia_planteamiento) <- datos$Modelo
tbahp0308 <- crea_tabla_estilo_comparación(matriz_alternativas_frecuencia_planteamiento)

