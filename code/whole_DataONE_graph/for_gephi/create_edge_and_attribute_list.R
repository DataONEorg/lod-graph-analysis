# make the edge list
load("code/whole_DataONE_graph/edge_list.Rdata")
edge_list <- edge_list[,-1]
names(edge_list) <- c("Source", "Target")
write.csv(edge_list, file = "code/whole_DataONE_graph/for_gephi/gephi_edge_list.csv", row.names = FALSE)

# make the attribute list, including DataONE node IDs
load("code/whole_DataONE_graph/dataset_attributes.Rdata")
names(attribute_df)[1] <- "ID"
write.csv(attribute_df, file = "code/whole_DataONE_graph/for_gephi/smaller_nodes_attribs.csv", row.names = FALSE)
