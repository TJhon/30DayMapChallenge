librarian::shelf(
    tidyverse
    , tidytuesdayR
    , sf
    , maps
    , sysfonts
)

font_add_google("Quicksand")
font_add_google("Fira Sans")

showtext::showtext_auto()

f1 <- "Quicksand"
f2 <- "Fira Sans"

data <- tt_load("2022-02-22")

freedom <-
    data$freedom |>
    janitor::clean_names()# |>

freedom |>
    count(region_name) #americas

freedom_lt <-
    freedom |>
    filter(
        region_name == "Americas"
        , !(str_detect(country, "America|Canada"))
        ) |>
    mutate(
        country =
            case_when(
                str_detect(country, "Bolivia") ~ "Bolivia"
                , str_detect(country, "Venez") ~ "Venezuela"
                , T ~ country
            )
        , status =
            ifelse(status == "F", "Libre", ifelse(status == "NF", "No Libre", "Parcialmente Libre")) |>
            factor(c("Libre", "Parcialmente Libre", "No Libre"))
    )


world <-
    map_data("world") |>
    as_tibble() |>
    rename(country = region)
latam <-
    right_join(world, freedom_lt) #|>

anios <- unique(latam$year)

libre <- c("#006f3c", "#264b96", "#bf212f")


animation::saveGIF(
    {
        purrr::walk(anios, function(y, latam){
            cli::cli_process_start("Compute {.val {y}}")
            p <- latam |>
                dplyr::filter(year == y) |>
                ggplot() +
                aes(long, lat, group = paste(country, group), fill = status) +
                geom_polygon(color = "gray80", size = .25) +
                coord_fixed() +
                scale_fill_manual(values = libre) +
                labs(
                    title = glue::glue("{y} - Libertad en Latinomerica")
                    , subtitle = "Función de las libertades civiles y derechos políticos"
                    , caption = "\n#30DayMapChallenge | Día 5, 6 y 7: Red, Green, Blue\nCreado por @JhonKevinFlore1\nData: Freedom House a travéz de Arthur Cheiv\n#TidyTuesday 2022/08\n"
                    , fill = ""
                ) +
                guides(
                    fill = guide_legend(
                        direction = "horizontal"
                        , title.position = "top"
                        , title.hjust = .5
                        , label.hjust = .5
                        , label.position = "bottom"
                        , keywidth = 2
                        , keyheight = .4

                    )
                ) +
                theme_void() +
                # hrbrthemes::theme_ft_rc(grid = FALSE, axis_text_size = 0) +
                theme(
                    legend.position = c(.3, .35)
                    , legend.text = element_text(size = 20, family = f2)
                    , plot.title = element_text(hjus = .5, family = f2, size = 40, face = "bold")
                    , plot.subtitle = element_text(size = 30, hjust = .5, family = f2)
                    , plot.caption = element_text(size = 15, lineheight = .3, hjust = 1, vjust = .5, family = f1)
                    , plot.caption.position = 'panel'
                )
            plot(p)
            cli::cli_process_done()
        }, latam = latam)
    },
    movie.name = here::here("Plots", "day6-8.gif")
    , interval = 1
    , ani.width = 1385
    , ani.height = 1500
    , ani.res = 300
)
