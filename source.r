librarian::shelf(
    tidyverse
    , ggtext
    , here
)

save_plot <- function(plot, name, w = 13, h = 12.8){
    s_p <- here::here("plots", name)
    ggsave(plot = plot, filename = s_p, width = w, height = h, units = "cm")
}



f_c <- function(day){
    pth_day <- here::here("R", paste0("day", day, ".r"))
    fs::file_create(pth_day)
}
message("f_c: day{name-}.r")
