library(dplyr)
library(ggplot2)
library(deldir)
install.packages("streamgraph")


vp <- read.csv("C:/Users/Dana/Documents/UOC/Dades/VD/London_Airbnb_Listings_March_2023.csv")
pubs <- read.csv("C:/Users/Dana/Documents/UOC/Dades/VD/open_pubs.csv")

pubs$latitude <- as.numeric(pubs$latitude)
pubs$longitude <- as.numeric(pubs$longitude)

pubs_f <- pubs %>%
  filter(between(latitude, 51.40, 51.55)) %>%
  filter(between(longitude, -0.5, 0.0)) 

pubs_f1 <- pubs_f[sample(nrow(pubs_f), 25), ]

vp_f <-vp %>%
  filter(property_type == "Boat")
  


teselation <- deldir(round(as.numeric(vp_f$longitude),2), round(as.numeric(vp_f$latitude),2))
tiles <- tile.list(teselation)


plot(tiles, pch = 19, close = T, fillcol = hcl.colors(11, "PiYG")) %>%
  legend(x = "bottom", 
         #inset = c(0, -1),
         legend = c("Boats", "Pubs"), 
         col = c("black", "#6959CD"),
         pch = c(19,18),
         xpd = TRUE,
         horiz = TRUE) 
points(pubs_f1$longitude, pubs_f1$latitude, col = "#6959CD", pch= 18)


v
