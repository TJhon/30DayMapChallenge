librarian::shelf(
    here
    , tidyverse
    , PeruData
    , raster
    , sf
)

extrafont::loadfonts(
    device = "win"
)

peru_crop <-
    map_peru_depa |>
    filter(
        depa %in% c(
            "ancash"
            , "ucayali"
            , "junin"
            , "huanuco"
            , "pasco"
            , "huancavelica"
        )
    ) |> st_as_sf()


point_raster <- function(.raster){
    daf <-
    .raster |>
    crop(peru_crop) |>
    mask(peru_crop) |>
    rasterToPoints() |>
    data.frame() |>
    as_tibble() |>
    rename(fill1 = 3)
    return(daf)
}

tavg <- raster(
    here::here("data", "peru-clima", "tavg.tif")
) |> point_raster()
prec <- raster(
    here::here("data", "peru-clima", "prec.tif")
) |> point_raster()

t_a <- colorRampPalette(c("#14e4e8", "#c61707"))
t_p <- colorRampPalette(c("#7dd89a", "#0d4099"))

p_g <- function(datos, tt){
    if(tt == "Temperatura"){
        colores <- t_a(2)
    }
    if(tt == "Precipitacion"){
        colores <- t_p(2)
    }
    p <-
        ggplot() +
        geom_raster(data = datos, aes(x, y, fill = fill1)) +
        geom_sf(data = peru_crop, fill = NA, color = "#15233f") +
        geom_text(
            data = peru_crop, aes(x_center, y_center, label = str_to_sentence(depa))
            , size = 8, color = "#15233f"
            , nudge_x = .1
            ) +
        theme_void() +
        scale_fill_gradientn(colors = colores) +
        labs(
            fill = tt
        ) +
        guides(
            fill = guide_colorbar(
                barheight = unit(3.8, units = "mm"),
                barwidth = unit(150, units = "mm"),
                direction = "horizontal",
                ticks.colour = "grey10",
                title.position = "top",
                title.hjust = 0.5
            )
        ) +
        theme(
            legend.position = c(.77, .2)
            , legend.text = element_text(color = "white", size = 30)
            , legend.title = element_text(color = "white", size = 30)
        )
    plot(p)
}

library(cowplot)

semi <-
    ggdraw(x = c(0, 2), y = c(0, 1.2)) +
    draw_plot(p_g(tavg, "Temperatura")) +
    draw_plot(p_g(prec, "Precipitacion"), x = 1) +
    draw_label(
        "Perú: zona centro"
        , x = 1
        , y = 1.1
        , size = 60
        , color = "white"
    ) +
    draw_label(
        "Promedio de temperatura y precipitaciones \n [1970 - 2000]"
        , x = 1
        , y = 1
        , size = 44
        , color = "white"
    ) +
    draw_label(
        "#30DayMapChallenge | Day 10: Raster \n Data: WorldClim | Created by @jhonkevinflore1"
        , x = 1
        , y = .1
        , color = "white"
        , hjust = .5
        , size = 30
    ) +
    theme(
        plot.background = element_rect(fill = "#152749")
    )


ggsave(
    plot = semi
    , filename = here::here(
        "plots"
        , "day10.png"
    )
    , width = 30
    , height = 15
    , dpi = 700
)



