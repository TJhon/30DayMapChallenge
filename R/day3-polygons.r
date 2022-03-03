source("source.r")
librarian::shelf(
    PeruData
    , showtext
)





letalida <-
    covid_casos_fallecidos |>
    filter(
        lubridate::year(fecha) > 2021
        , total_casos > 0
        ) |>
    filter(!(departamento %in% c("arica", "callao"))) |>
    select(departamento, provincia, total_casos, total_fallecidos) |>
    # arrange(departamento, provincia) |>
    with_groups(
        c(departamento, provincia),
        ~mutate(., across(everything(), sum))
    ) |>
    distinct() |>
    drop_na() |>
    mutate(covid_leta = round((total_fallecidos/total_casos) * 100, 5)) |>
    rename(
        depa = 1
        , prov = 2
    )


prov_covid <-
    map_peru_prov |>
    rmapshaper::ms_simplify(keep = .03) |>
    right_join(letalida) |>
    drop_na(geometry)

ggplot()  +
    geom_sf(data = prov_covid, aes(fill = covid_leta, geometry = geometry)) +
    geom_sf(data = rmapshaper::ms_simplify(map_peru_depa, keep = .03), fill = NA, color = 'gray80', alpha = .2) +
    theme_void() +
    # scale_fill_continuous()
    # rcartocolor::scale_fill_carto_c(palette = "Tropic", na.value = "grey45", name = "Letalidad Covid") +
    # theme_dark()
    geom_text(
        data = map_peru_depa
        , aes(x_center, y_center, label = str_to_sentence(depa)
        )
        , color = "white"
        , size = 2.5
    ) +
    labs(
        title = "Letalidad COVID (2022)"
        , subtitle = "Por provincias"
        , caption = "#30DayMapChallenge | Day 3: Polygons\nData: MMINSA | Created by @JhonKevinFlore1"
        , fill = "Letalidad (%)"
    ) +
    guides(
        fill = guide_colorbar(
            barheight = unit(1.5, units = "mm"),
            barwidth = unit(90, units = "mm"),
            direction = "horizontal",
            ticks.colour = "grey10",
            title.position = "top",
            title.hjust = 0.5)
        ) +
    theme(
        plot.background = element_rect(fill = "grey10", color = NA)
        , legend.position = c(.5, .05)
        , legend.title = element_text(color = "grey75")
        , legend.text = element_text(color = "grey75")
        , plot.title = element_text(color = "grey75")
        , plot.subtitle = element_text(color = "grey75")
        , plot.caption = element_text(color = "grey75")
    )


ggsave(here::here("plots", "day3.png"))
