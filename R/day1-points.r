source("source.r")


librarian::shelf(
    PeruData
    , lubridate
    , cowplot
    , sysfonts
    , showtext
)

font_add_google("Josefin Sans")

showtext_auto()

font1 <- "Josefin Sans"

igp_2022 <- filter(igp, year(date) > 2021)

map <-
    ggplot() +
    geom_sf(data = map_peru_depa, color = 'gray20', fill = "gray80") +
    geom_point(
        data = filter(igp_2022, alert != "Red")
        , aes(x = lon, y = lat, color = alert, size = magn)
        , alpha = .4
    ) +
    geom_point(
        data = filter(igp_2022, alert == "Red")
        , aes(x = lon, y = lat, color = alert, size = magn)
        , alpha = .6
    ) +
    geom_point(
        data = igp_2022
        , aes(x = lon, lat, color = alert)
    ) +
    scale_color_manual(
        values = c("#087004", "#890b0d", "#c9c912")
    ) +
    scale_size(range = c(2, 15)) +
    theme_void() +
    theme(
        legend.position = "none"
    )

ggdraw(map) +
    draw_label(label = "Alerta (Mag)", x = 0.85, y = 0.65, color = "white", fontfamily = font1,hjust = .6, fontface = "bold", size = 65) +
    draw_label(label = "> 6", x = 0.85, y = 0.60, color = "#d80d1a", fontfamily = font1,hjust = 1, fontface = "bold", size = 65) +
    draw_label(label = "4.5 - 6", x = 0.85, y = 0.55, color = "#dbcc29", fontfamily = font1,hjust = 1, fontface = "bold", size = 65) +
    draw_label(label = "< 4.5", x = 0.85, y = 0.5, color = "#3ebc40", fontfamily = font1, hjust = 1, fontface = "bold", size = 65) +
    theme(
        plot.background = element_rect(fill = "grey12")
        , legend.position = "none"
    ) +
    draw_label(label = "Earthquakes in Peruvian territory (year 2022)", color = "white", hjust = 0, x = 0.02, y = 0.12, fontfamily = font1, size = 32) +
    draw_label(label = "#30DayMapChallenge | Day 1: Points", color = "white", hjust = 0, x = 0.02, y = 0.09, fontfamily = font1, size = 32) +
    draw_label(label = "Data: IGP with PeruData library", color = "white", hjust = 0, x = 0.02, y = 0.06, fontfamily = font1, size = 32) +
    draw_label(label = "Created by @JhonKevinFlore1", color = "white", hjust = 0, x = 0.02, y = 0.03, fontfamily = font1, size = 32)
ggsave(here::here("plots/day1.png"), units = "cm")
