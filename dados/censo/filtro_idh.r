#install.packages('sqldf')
library(dplyr)
# library(sqldf)

 load("censo_siglas.RData")
load("censo_municipios.RData")
# load("censo_estados.RData")



ano <- 1991
idh_munic_1991 <- municipios %>% 
  dplyr::filter(ANO == ano & UF == 23) %>% 
  dplyr::select(Codmun7, IDHM)

quartis_1991 <- unname(quantile(idh_munic_1991$IDHM))


ano <- 2000
idh_munic_2000 <- municipios %>% 
  dplyr::filter(ANO == ano & UF == 23) %>% 
  dplyr::select(Codmun7, IDHM)

quartis_2000 <- unname(quantile(idh_munic_2000$IDHM))


ano <- 2010
idh_munic_2010 <- municipios %>% 
  dplyr::filter(ANO == ano & UF == 23) %>% 
  dplyr::select(Codmun7, IDHM)

quartis_2010 <- unname(quantile(idh_munic_2010$IDHM))




# teste <- c(quartis_1991, max(quartis_2010), min(quartis_2010))
# 
# teste


# Juntando todos os IDHs

idh_1991 <- idh_munic_1991 %>% 
  dplyr::select(IDHM)

idh_2000 <- idh_munic_2000 %>% 
  dplyr::select(IDHM)


idh_2010 <- idh_munic_1991 %>% 
  dplyr::select(IDHM)


idh <- rbind(idh_1991, idh_2000, idh_2010)

#idh <- unique(idh)

quartis <- unname(quantile(idh$IDHM))


# ATE AQUI TENHO OS VALORES DE IDH POR MUNICIPIO


ano <- 1991
idh_munic <- municipios %>% 
  dplyr::filter(ANO == ano & UF == 23) %>% 
  dplyr::select(Codmun7, IDHM)


shp_ce <- rgdal::readOGR(dsn = "CE-MUN", layer = "23MUE250GC_SIR")


summary(shp_ce)



# shp_ce@data %>% 
#   kable() %>%
#   kable_styling(bootstrap_options = "striped", 
#                 full_width = TRUE, 
#                 font_size = 12)


shp_dados_ce <- merge(x = shp_ce,
                      y = idh_munic,
                      by.x = "CD_GEOCODM",
                      by.y = "Codmun7")


# shp_dados_ce@data %>% 
#   kable() %>%
#   kable_styling(bootstrap_options = "striped", 
#                 full_width = TRUE, 
#                 font_size = 12)


# library(tmap)


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


tm_shape(shp = shp_dados_ce) + 
  tm_fill(col = "IDHM", 
          style = "quantile", 
          n = 4 ,
          palette = "Spectral") +
  tm_layout(legend.outside = TRUE,
            frame = FALSE,
            main.title = paste( "Distribuição do IDH nos Municípios do CE\n(", ano, ")" ) )

  



