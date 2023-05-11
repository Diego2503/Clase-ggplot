# dplyr
library(tidyverse)
library(palmerpenguins)

# Carga de los datos de delitos cometidos en 2022
delitos_2022 <-
  read_csv(
    "https://raw.githubusercontent.com/gf0604-procesamientodatosgeograficos/2023-i/main/datos/oij/estadisticas-policiales/estadisticaspoliciales2022.csv"
  )

delitos_2022

## select ()
penguins |>
  select(species, bill_length_mm, sex)

select(penguins, species, bill_length_mm, sex)

##cambio de nombres de columnas 

penguins |>
  select(especie = species, lomgitud_pico_mm = bill_length_mm, 
         sexo = sex)

glimpse(penguins)

penguins |>
  select(where(is.numeric))


## filter 

# Pingüinos de la especie 'Adelie'  con longitud del pico mayor o igual a 45 mm

penguins |>
  filter(species == 'Adelie' & bill_length_mm >= 45)

# Pingüinos de las especies 'Adelie' o 'Gentoo'
penguins |>
  filter(species == 'Adelie' | species == 'Gentoo')


#delitos comtido en el cantón de Osa

delitos_2022 |>
  filter(Canton == 'OSA') |>
  select(Delito, Fecha, Canton) |>
  view()

#delitos comtido en el cantón de Osa

delitos_2022 |>
  filter(Canton == 'OSA' |  Canton == "CORREDORES") |>
  select(Delito, Fecha, Canton) |>
  view()

#DELITOS COMETIDOS EN CORREDORES  MENORES DE EDAD

delitos_2022 |>
  filter(Canton == "CORREDORES" & Edad == "Menor de edad") |>
  select(Delito, Fecha, Canton, Edad) |>
View()

# Delitos cometidos en osa o corredores a menores de edad
delitos_2022 |>
  filter(Canton == 'OSA' |  Canton == "CORREDORES") |>
  filter(Edad == "Menor de edad") |>
  select (Delito, Fecha, Canton, Edad) |>
  view()
  

# delitos de la provincia de Puntarenas excepto el cntón de osa

delitos_2022 |>
  Filter(Provincia == "PUNTARENAS") |>
  Filter(Canton != "OSA") |>
  select (Delito, Fecha, Canton,) |>
  view()

