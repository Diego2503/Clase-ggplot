# Tidyverse

library(tidyverse)
library(palmerpenguins)

# Ejemplos de visualizaciones de datos

## Gráfico de visualizaciones de datos
penguins |>
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point(size = 4, col = "red") + 
  geom_smooth(method = "loess", se = TRUE)

penguins |>
  ggplot(aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species,
                 shape = species),
             size = 2) +
  geom_smooth(method = "lm", se = FALSE, aes(color = species)) +
  scale_color_manual(values = c("darkorange", "darkorchid", "cyan4")) +
  ggtitle("Longitud del pico vs. masa por especie") +
  xlab("Longitud del pico (mm)") +
  ylab("Masa (n)") +
  labs(color = "Especie", shape = "Especie")

penguins |>
  dplyr::filter(species == "Gentoo") |>
  select(island, species)


