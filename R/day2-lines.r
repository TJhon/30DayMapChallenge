librarian::shelf(
    PeruData
    , cowplot
)

c_color <- c(
    "#add7ff"
    , "#cc5612"
    , "#2b9574"
    # , "#48686B"
    , "#df4576"
    , "#2e62aa"#4a5a70
)


cuencas <-
    read_rds(here::here("data", "cuencas.rds")) |>
    janitor::clean_names()
# cuencas |>
#     sf::st_drop_geometry() |>
#     count(nomb_uh_n2, sort = T)

amz <- cuencas |> filter(str_detect(nomb_uh_n2, "Amazonas"))
amz_sub <-
    amz |>
    sf::st_drop_geometry() |>
    count(nomb_uh_n3, sort = T) |>
    add_column(color = c_color)

amz_cuencas <-
    ggplot() +
    geom_sf(data =  map_peru_peru, color = "white", fill = NA, size = .2) +
    geom_sf(data = amz, aes(size = area_km2, group = nomb_uh_n3, color = nomb_uh_n3), fill = NA) +
    scale_size(range = c(0, 1.3)) +
    scale_color_manual(values = pull(amz_sub, color)) +
    theme_void()

amz_cuencas1 <- amz_cuencas +
    theme(legend.position = "none")

lab_c <- pull(amz_sub, nomb_uh_n3)
lab_c[3] <- "U.H. 497"

ggdraw(xlim = c(0, 1), ylim = c(0, 1))  +
    draw_plot(amz_cuencas1, x = -.2) +
    theme(
        plot.background = element_rect(fill = "#242c34")
    ) +
    draw_label(label = lab_c[3], x = 0.55, y = 0.85, color = c_color[4], fontfamily = font1,hjust = 0, fontface = "bold", size = 55) +
    draw_label(label = lab_c[1], x = 0.55, y = 0.79, color = c_color[1], fontfamily = font1,hjust = 0, fontface = "bold", size = 55) +    # draw_label(label = lab_c[1], x = 0.55, y = 0.85, color = c_color[1], fontfamily = font1,hjust = 0, fontface = "bold", size = 55) +
    draw_label(label = lab_c[2], x = 0.55, y = 0.73, color = c_color[3], fontfamily = font1,hjust = 0, fontface = "bold", size = 55) +
    draw_label(label = lab_c[4], x = 0.55, y = 0.6169, color = c_color[2], fontfamily = font1,hjust = 0, fontface = "bold", size = 55) +
    draw_label(label = lab_c[5], x = 0.55, y = 0.67, color = c_color[5], fontfamily = font1,hjust = 0, fontface = "bold", size = 55) +
    draw_label(
        label = "Cuencas hidrograficas del Perú (UH Amazonas)\n#30DayMapChallenge | Day 2: Lines\nData: ANA | Created by @JhonKevinFlore1"
        , lineheight = .3
        , color = "white"
        , x = .92
        , y = .08
        , hjust = 1
        , fontfamily = font1
        )

ggsave(here::here('plots/day2.png'), units = "cm", width = 9.6, height = 8.73)

