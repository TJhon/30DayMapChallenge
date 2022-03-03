
librarian::shelf(
    tidyverse
    # , raster
    , sf
    , PeruData
    , cowplot
)
sysfonts::font_add_google("Montserrat")
showtext::showtext.auto()


lt_e <-
    map(dir(here::here(), recursive = T, pattern = ".shp$", full.names = T), read_sf) |>
    map(janitor::clean_names) |>
    map(drop_na)

centrales <-
    lt_e[[1]] |>
    st_as_sf() |>
    get_centroid() |>
    select(x_center, y_center, potencia_i) |>
    st_drop_geometry()


mypal <- colorRampPalette(c("#a6bed8", "#0b335e"))



temp <-
    ggplot() +
    # geom_sf(data = lt_e[[1]], aes(geometry = geometry), size = 3) +
    geom_sf(data = lt_e[[2]], aes(geometry = geometry, color = tension_no, size = tension_no)) +
    geom_sf(data = lt_e[[3]], aes(geometry = geometry, size = tension), linetype = 11, color = "#0b335e") +
    geom_sf(data = map_peru_peru, fill = NA, color = mypal(2)[2]) +
    scale_color_gradientn(colours = mypal(2)) +
    scale_size(range = c(.1, 4.4)) +
    geom_point(data = centrales, aes(x_center, y_center), size = 14, color = "#0b335e") +
    geom_point(data = centrales, aes(x_center, y_center), size = 10, color = "#dee7ef") +
    geom_point(data = centrales, aes(x_center, y_center), size = 6, color = "#0b335e") +
    theme_void() +
    theme(legend.position = "none")

ggdraw(temp, xlim = c(0, 1), ylim = c(0, 1.08)) +
    draw_label(
        x = .5, y = 1.03
        , color = mypal(2)[2]
        ,"Red eléctrica del Perú", size = 300
        , fontfamily = "Montserrat"
        , fontface = 'bold'
        ) +
    draw_label(
        "#30DayMapChallenge | Day9: Monochrome\nData: OSINERGMIN | @jhonkevinflore1"
        , hjust = .5
        , fontfamily = "Montserrat"
        , x = .3, y = .1
        , color = mypal(2)[2]
        , size = 100
        , lineheight = .3
    ) +
    theme(
        plot.background = element_rect(fill = "white")
    )

ggsave(
    here::here("plots", "day9.png")
    , width = 18
    , height = 25
    )



