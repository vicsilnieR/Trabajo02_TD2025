library(qgraph)
library(magick)

construir_grafo_animado <- function(M, plantilla = "spring", grosorLineas = 2){

  rownames(M) <- colnames(M) <- paste0("a", 1:nrow(M))

  # Trabajaremos con 1 y O
  M_num <- 1 * M
  diag(M_num) <- 0

  # Lista de grafos para rellenar

  aristas <- which(M_num != 0, arr.ind = TRUE) #Almaceno las aristas que se crean en el grafo
  aristas_fila <- aristas[order(aristas[,1]),] #Ordeno las aristas para que se creen en orden de nodos
  n_pasos <- nrow(aristas) #Total de aristas a dibujar


  lista_grafos <- vector("list", n_pasos) ## crear una lista vacía

  for (i in 1:n_pasos) {
    M_paso <- matrix(0, nrow = nrow(M_num), ncol = ncol(M_num)) # Matriz de 0s, le introduciremos una arista a la vez
    # Coloco en la matriz de paso las aristas de cada paso (se mantienen las aristas anteriores)
    M_paso[aristas_fila[1:i,,drop = FALSE]] <- M_num[aristas_fila[1:i,,drop = FALSE]] 
    rownames(M_paso) <- colnames(M_paso) <- colnames(M_num) #Mantengo los nombres de las columnas
    lista_grafos[[i]] <- M_paso # Introduzco la matriz en la lista de grafos
  }
  # Layout fijo para que los nodos salgan en las mismas posiciones en todas las iteraciones.
  # Plantilla puede ser spring, circle..
  layout_fijo <- qgraph(M_num, layout = plantilla, DoNotPlot = TRUE)$layout

  # --- 5. Crear animación ---
  animacion <- qgraph.animate(
    lista_grafos,
    initLayout = layout_fijo,
    color = "#F8A29E",
    edge.color = "#005682",
    edge.width = grosorLineas,
    growth = "order",
    smooth = TRUE,
    sleep = 0.2,
    plotGraphs = FALSE,
    progress = FALSE,
    constraint = Inf #Fijar los nodos en el layout
  )


  # Crear gif; uso archivos temporales para no sobrecargar.
  img_list <- lapply(animacion, function(g) {
    # tmpfile <- tempfile(fileext = ".png") 
    img <- image_graph(width = 600, height = 600, res = 96)
    plot(g)
    dev.off()
    return(img)
    # image_read(tmpfile)
  })

  gif <- image_animate(image_join(img_list), fps = 0.5)


return(gif)
}


construir_grafo <- function(M, plantilla = "spring", 
                      grosorLineas = 2, que.alternativas = TRUE){
  
  if (!is.logical(que.alternativas)) {
    for (i in 1:length(que.alternativas)) {
  rownames(M) <- colnames(M) <- paste0("a", que.alternativas)
  }
  } else {
    rownames(M) <- colnames(M) <- paste0("a", 1:nrow(M))
  }
  # Trabajaremos con 1 y O
  M_num <- 1 * M
  diag(M_num) <- 0

  qgraph(M_num, 
         layout = plantilla, 
         edge.width = grosorLineas,
         color = "#F8A29E",
         edge.color = "#005682")
}
