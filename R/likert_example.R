
library("dplyr")
library("likert")

item <- c("Item 1", "Item 2", "Item 3", "Item 4")

strongly_disagree <- c(0, 20, 10, 10)

disagree <- c(0, 25, 47, 37)

neutral <- c(7,0,0, 10)

agree <- c(3, 15, 38, 10)

strongly_agree  <- c(90, 40, 5, 10)

df <- data.frame(item, strongly_disagree, disagree, neutral, agree, strongly_agree)

df <- df  %>%
    rename("Strongly Disagree" = strongly_disagree,
           "Disagree" = disagree,
           "Neutral" = neutral,
           "Agree" = agree,
           "Strongly Agree" = strongly_agree)

lk <- likert::likert(summary = df)

ggplot() + geom_bar(data=df, aes(x = item, y=value, fill=col), position="stack", stat="identity") +
    geom_bar(data=lows, aes(x = outcome, y=-value, fill=col), position="stack", stat="identity") +
    geom_hline(yintercept = 0, color =c("white")) +
    scale_fill_identity("Percent", labels = mylevels, breaks=legend.pal, guide="legend") +
    theme_fivethirtyeight() +
    coord_flip() +
    labs(title=mytitle, y="",x="") +
    theme(plot.title = element_text(size=14, hjust=0.5)) +
    theme(axis.text.y = element_text(hjust=0)) +
    theme(legend.position = "bottom") +
    scale_y_continuous(breaks=seq(mymin,mymax,25), limits=c(mymin,mymax))
