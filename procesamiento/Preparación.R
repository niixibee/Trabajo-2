library(haven)
library(dplyr)
library(labelled)


datos <- read_sav("input/Latinobarometro_2020_Esp_Spss_v1_0.sav")


Chile <- datos %>% filter(IDENPA == 152)


datos <- Chile %>%
  select(REG, EDAD, SEXO, P38N, P37N.A, P37N.B, P37N.C, P37N.D) %>%
  rename(
    region = REG,
    edad = EDAD,
    sexo = SEXO,
    percepcion_inmigracion = P38N,
    P37NA = P37N.A,
    P37NB = P37N.B,
    P37NC = P37N.C,
    P37ND = P37N.D
  )


datos$percepcion_inmigracion <- as_factor(datos$percepcion_inmigracion)

datos$P37NA <- as.numeric(datos$P37NA)
datos$P37NB <- as.numeric(datos$P37NB)
datos$P37NC <- as.numeric(datos$P37NC)
datos$P37ND <- as.numeric(datos$P37ND)


saveRDS(datos, "procesamiento/datos_procesado.rds")
