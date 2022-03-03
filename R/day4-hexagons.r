
librarian::shelf(
    sf
    , tidyverse
    , raster
    , h3jsr
    , PeruData
    , RColorBrewer
)

alt <-
    raster_peru_alt |>
    mask(map_peru_depa) |>
    rasterToPoints() |>
    as_tibble() |>
    rename(alt = 3)


peru <- st_transform(map_peru_peru, crs = st_crs(map_peru_depa))

peru_4 <- polyfill(peru, simple = F, res = 4)

hex_peru <-
    unlist(peru_4$h3_polyfillers) |> h3_to_polygon(simple = F)

# mypal <- colorRampPalette(c("#5980a5", "#062a4c"))
mypal <- colorRampPalette(c("#F3F8F8", "#096060"))

h_c <- "#c5cfd8"
base_cl <- "#D1E7E7"

ggplot() +
    # geom_sf(data = map_peru_depa, aes(fill = depa), alpha = .2, color = "black")
    geom_raster(data = alt, aes(x, y, fill = alt)) +
    geom_sf(data = hex_peru, fill = NA, color = "#062a4c", size = .2) +
    geom_sf(data = map_peru_peru, fill = NA, color = h_c) +#"grey35") +
    geom_sf(data = map_peru_depa, fill = NA, color = "#08600a", size = .3) +#"grey35") +
    scale_fill_gradientn(colours = mypal(2))  +
    labs(
        title = "Perú: Metros Sobre el Nivel del Mar"
        , caption = "\n#30DayMapChallenge | Día 4: Hexagonos\nCreado por @JhonKevinFlore1"
        , fill = "M.S.N.M"
    ) +
    guides(
        fill = guide_colorbar(
            barheight = unit(1.8, units = "mm"),
            barwidth = unit(60, units = "mm"),
            direction = "horizontal",
            ticks.colour = "grey10",
            title.position = "top",
            title.hjust = 0.5
            )
        ) +
    theme_void() +
    theme(
        plot.background = element_rect(fill = "#062a4c", color = NA)
        , legend.title = element_text(color = base_cl, hjust = .5, size = 8)
        , legend.text = element_text(color = base_cl, size = 8)
        , legend.position = c(.3, .1)
        , plot.title = element_text(hjust = .5, color = base_cl)
        , plot.caption = element_text(hjust = 0, color = base_cl)
        , plot.caption.position = "panel"
    )
ggsave(
    here::here("plots", "day4.png")
    , units = "cm", width = 10.6, height = 17.7
    )


