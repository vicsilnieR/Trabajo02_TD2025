library(tinytable)

# Preparar tema propio para tablas
colores <- hcl.colors(5, palette = "Berlin")

crea_vector_posiciones_tabla <- function(numero_columnas) {
  posiciones <- ""
  for(i in 1:numero_columnas) {
    posiciones <- paste0(posiciones,"c")
  }
  return(posiciones)
}

crea_tabla_estilo <- function(tabla, nombresfila = TRUE) {

  if (nombresfila == TRUE) {
    rn <- rownames(tabla)
    if (is.null(rn)) rn <- rep("", nrow(tabla))
    tabla <- cbind(rn = rn, tabla, stringsAsFactors = FALSE)
    colnames(tabla)[1] <- ""   
    rownames(tabla) <- NULL 
  }

  t <- tt(tabla, theme = "empty", width=1) |>
    format_tt(quarto=TRUE) |>
    style_tt(j = 1:ncol(tabla), align = crea_vector_posiciones_tabla(ncol(tabla)), alignv = "m") |>
    style_tt(i = 0, line = "b", line_color = colores[2], line_width = 0.2,
    background = colores[5], color = colores[3]) |> 
    style_tt(i = 0, line = "t", line_color = colores[1], line_width = 0.1) |> 
    style_tt(i = 1:nrow(tabla), line = "b", line_color = colores[1], line_width = 0.1) |> style_tt(j = 1:(ncol(tabla)-1), line = "r", line_color = colores[1], line_width = 0.1)

  return(t)
}

crea_tabla_estilo_comparación <- function(tabla) {
  rn <- rownames(tabla)
    if (is.null(rn)) rn <- rep("", nrow(tabla))
    tabla <- cbind(rn = rn, tabla, stringsAsFactors = FALSE)
    colnames(tabla)[1] <- ""   
    rownames(tabla) <- NULL
t <- tt(tabla, theme = "empty") |>
    format_tt(quarto=TRUE) |>
    style_tt(j = 1:ncol(tabla), align = crea_vector_posiciones_tabla(ncol(tabla)), alignv = "m") |>
    style_tt(i = 0, line = "b", line_color = colores[2], line_width = 0.2,
             background = colores[5], color = colores[3]) |> 
    style_tt(i = 0, line = "t", line_color = colores[1], line_width = 0.1) |> 
    style_tt(i = 1:nrow(tabla), line = "b", line_color = colores[1], line_width = 0.1) |>
    style_tt(j = 1, line = "r", line_color = colores[2], line_width = 0.2,
             background = colores[5], color = colores[3]) |>
    style_tt(j = 2:(ncol(tabla)-1), line = "r", line_color = colores[1], line_width = 0.1)

  return(t)
  
}
