# make the edge list
load("code/ADC_people_final/edge_list.Rdata")
edge_list <- edge_list[,-1]
names(edge_list) <- c("Source", "Target")
write.csv(edge_list, file = "code/ADC_people_final/for_gephi/gephi_edge_list.csv", row.names = FALSE)

length(count.fields("code/ADC_people_final/for_gephi/gephi_edge_list.csv", skip = 1))
nrow(edge_list)

# make the attribute list with orcids for people
attribs <- read.csv("data/creators.csv", header = TRUE, stringsAsFactors = FALSE)
attribs <- attribs[,c("id", "last", "orcid")]
names(attribs) <- c("ID", "LastName", "ORCID")
attribs$ORCID[is.na(attribs$ORCID)] <- ""
write.csv(attribs, file = "code/ADC_people_final/for_gephi/ADC_people_attributes.csv", row.names = FALSE)
