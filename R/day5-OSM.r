librarian::shelf(
    osmdata
    , tidyverse
    , sf
    , sysfonts
    , showtext
    , cowplot
)

showtext_auto()

font_add_google("Quicksand")
font_add_google("Fira Sans")

f1 <- "Quicksand"
f2 <- "Fira Sans"

city_streets <- function(cityname){
    # border <- opq(bbox=cityname) %>%
    #     add_osm_feature(key="admin_level", value="8") %>%
    #     osmdata_sf() %>%
    #     .$osm_multipolygons

    lines <- opq(bbox=cityname) %>%
        add_osm_feature(key="highway", value=c("primary", "secondary", "tertiary", "residential")) %>%
        osmdata_sf() %>%
        .$osm_lines |>
        drop_na(lanes) |>
        select(osm_id, name, geometry, highway, lanes) |>
        mutate(lanes = as.numeric(lanes))
    # sf_file <- list(border, lines)
    return(lines)
}

lima <- city_streets("Lima, Peru")

arq <- city_streets("Arequipa, Peru")

tru <- city_streets("Trujillo, Peru")

ref_color <-
    c(
        "Primaria" =  "#c60b31"
        , "Secundaria" ="#5084bf" #secundario
        , "Terciaria" ="#d37f1f" #residencial
        , "Residencial" ="#cee8dc"#77ad0a"
    )
nn <- function(n=1, ref = ref_color) {
    names(ref)[[n]]
}

plot_t <- function(df){
    df <-
        mutate(
            df,
            highway = factor(highway, c("primary", 'secondary', "tertiary", "residential"))
        )
    p <-
        ggplot() +
        geom_sf(data = df, aes(color = highway, size = lanes)) +
        scale_color_manual(values = c(
            "#c60b31"
            , "#5084bf" #secundario
            , "#d37f1f" #residencial
            , "#cee8dc"#77ad0a"
        )
        ) +
        theme_void() +
        scale_size(range = c(0.1, .6)) +
        theme(
            legend.position = "none"
        )
    return(p)
}

p_lima <- plot_t(lima)
p_arq <- plot_t(arq)
p_tru <- plot_t(tru)

col_city <-
    c(
        "Lima" = "#F8B302"
        , "Arequipa" = "#900C3F"
        , "Trujillo" = "#FFFFFF"
    )


tm <- .6
day5 <-
    ggdraw(xlim = c(0, 2), ylim = c(0, 1.5)) +
    draw_label(
        "Ciudades más pobladas del Perú", color = col_city[3], fontface = "bold", fontfamily = f1
        , x = 1, y = 1.4, size = 350
        ) +
    draw_line(
        color = "#fdf9f5"
        , x = c(0, .6)
        , y = c(1.4, 1.4)
        , size = 4
    ) +
    draw_line(
        color = "#fdf9f5"
        , x = c(1.4, 2)
        , y = c(1.4, 1.4)
        , size = 4
    ) +
    draw_label(
        "Vías de transito", color = col_city[3], fontfamily = f1
        , x = 1, y = 1.34, size = 300
    ) +
    draw_plot(p_lima, y = .25, x = -.3, width = 1.7) +
    draw_plot(p_arq, x = 1, y = .5, width = tm - .1) +
    draw_plot(p_tru, x = 1, y = -.05, width = tm + .1) +
    draw_label(
        names(col_city[1]), color = col_city[1], fontface = "bold", fontfamily = f1, size = 280
        , x = .3, y = .45
        ) +
    draw_label(
        names(col_city[2]), color = col_city[2], fontface = "bold", fontfamily = f1, size = 280
        , x = 1.7, y =  1
        ) +
    draw_label(
        names(col_city[3]), color = col_city[3], fontface = "bold", fontfamily = f1, size = 280
        , x = 1.7, y = .45
        )  +
    draw_label(nn(1), color = ref_color[1], size = 230, fontfamily = f2, y = .10, x = .60) +
    draw_label(nn(2), color = ref_color[2], size = 230, fontfamily = f2, y = .10, x = .85) +
    draw_label(nn(3), color = ref_color[3], size = 230, fontfamily = f2, y = .10, x = 1.1) +
    draw_label(nn(4), color = ref_color[4], size = 230, fontfamily = f2, y = .10, x = 1.35) +
    draw_line(x = c(.530, .660), size = 3, color = ref_color[1], y = .12) +
    draw_line(x = c(.764, .926), size = 3, color = ref_color[2], y = .12) +
    draw_line(x = c(1.03, 1.18), size = 3, color = ref_color[3], y = .12) +
    draw_line(x = c(1.26, 1.43), size = 3, color = ref_color[4], y = .12) +
    draw_label(
        "#30DayMapChallenge | Day 5: Open Street Map\nData: Wikipedia | VIZ: @JhonKevinFlore1"
        , fontfamily = f1
        , x = 0, y = 0.05
        , size = 150
        , color = ref_color[4]
        , lineheight = .12
        , hjust = 0
    ) +
    theme(
        plot.background = element_rect(fill = "#162447")
    )

# day5
ggsave(plot = day5, here::here("plots/day5.png"), width = 70, height = 50, units = "cm", dpi = 700)
