pacotes <- c("rgdal","raster","tmap","maptools","sf","rgeos","sp","adehabitatHR",
             "tidyverse","broom","rayshader","knitr","kableExtra","RColorBrewer",
             "profvis")

if(sum(as.numeric(!pacotes %in% installed.packages())) != 0){
  instalador <- pacotes[!pacotes %in% installed.packages()]
  for(i in 1:length(instalador)) {
    install.packages(instalador, dependencies = T)
    break()}
  sapply(pacotes, require, character = T) 
} else {
  sapply(pacotes, require, character = T) 
}


# library(dplyr)
# library(tmap)

load("censo_municipios.RData")

# ATE AQUI TENHO OS VALORES DE IDH POR MUNICIPIO


# Pegandos os quartis de todos os munucípios que ai 
# consigo comparar apenas com brasil

idh_munic_todos <- municipios %>% 
  dplyr::filter(ANO == ano) %>% 
  dplyr::select(Codmun7, IDHM)

quartis_municipios <- unname(quantile(idh_munic_todos$IDHM))

teste<-seq(21,29)

# quartis nordeste
idh_munic_ne <- municipios %>% 
  dplyr::filter(ANO == ano & (UF == 21 |  UF == 22 | UF == 23 | UF == 24 | UF == 25 | UF == 26 | UF == 27 | UF == 28 | UF == 29) %>% 
  dplyr::select(Codmun7, IDHM)

quartis_municipios <- unname(quantile(idh_munic_todos$IDHM))


ano <- 2010
idh_munic <- municipios %>% 
  dplyr::filter(ANO == ano & UF == 23) %>% 
  dplyr::select(Codmun7, IDHM)




#summary(idh_munic$IDHM)


shp_ce <- rgdal::readOGR(dsn = "CE-MUN", layer = "23MUE250GC_SIR")


#summary(shp_ce)



shp_ce@data %>%
  kable() %>%
  kable_styling(bootstrap_options = "striped",
                full_width = TRUE,
                font_size = 12)


shp_dados_ce <- merge(x = shp_ce,
                      y = idh_munic,
                      by.x = "CD_GEOCODM",
                      by.y = "Codmun7")


shp_dados_ce@data %>%
  kable() %>%
  kable_styling(bootstrap_options = "striped",
                full_width = TRUE,
                font_size = 12)





# tm_shape(shp = shp_dados_ce) +
#   tm_fill(col = "IDHM", palette = "Blues")


# tm_shape(shp = shp_dados_ce) + 
#   tm_fill(col = "IDHM", 
#           style = "fixed", 
#           breaks = quartis, 
#           palette = "Spectral") +
#   tm_layout(legend.outside = TRUE,
#             frame = FALSE,
#             main.title = "Distribuição do IDH nos Municípios do CE\n(2000)")


# tm_shape(shp = shp_dados_ce) + 
#   tm_fill(col = "IDHM", 
#           style = "quantile", 
#           n = 4 ,
#           palette = "Spectral") +
#   tm_layout(legend.outside = TRUE,
#             frame = FALSE,
# main.title = paste( "Distribuição do IDH \nnos Municípios do CE\n(", ano, ")" ) )

range <- c()
# faixas de idh
if (ano == 1991 ) {
  range <- c(0, 0.500, 0.800, 1)
} else {
  range <- c(0, 0.550, 0.700, 0.800, 1)
}


tm_shape(shp = shp_dados_ce) + 
  tm_fill(col = "IDHM", 
          style = "fixed", 
          breaks = quartis_municipios ,
          palette = "Spectral") +
  tm_layout(legend.outside = TRUE,
            frame = FALSE,
            main.title = paste( "Distribuição do IDH \nnos Municípios do CE\n(", ano, ")" ) )
