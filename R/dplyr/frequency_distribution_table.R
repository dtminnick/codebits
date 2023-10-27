
# Use dplyr to generate a frequency distribution table.

source <- source %>%
    dplyr::rename(count = V1) %>%
    dplyr::mutate(group = rownames(source)) %>%
    dplyr::arrange(dplyr::desc(count)) %>%
    dplyr::mutate(cumulative_count = cumsum(count),
                  frequency = round(count / sum(count), dec_pos),
                  cumulative_frequency = round(cumulative_count / sum(count), dec_pos)) %>%
    dplyr::select(group,
                  count,
                  frequency,
                  cumulative_count,
                  cumulative_frequency)
