# make the edge list
load("code/ADC_datasets_final/edge_list.Rdata")
edge_list <- edge_list[,-1]
names(edge_list) <- c("Source", "Target")
write.csv(edge_list, file = "code/ADC_datasets_final/for_gephi/gephi_edge_list.csv", row.names = FALSE)

# make the attribute list, including URLs for datasets
attribs <- read.csv("data/datasets-fixedpids_and_urls.csv", header = TRUE, stringsAsFactors = FALSE)
attribs <- attribs[,-2]
names(attribs) <- c("ID", "URL")
write.csv(attribs, file = "code/ADC_datasets_final/for_gephi/ADC_final_attributes_datasetURLs.csv", row.names = FALSE)
