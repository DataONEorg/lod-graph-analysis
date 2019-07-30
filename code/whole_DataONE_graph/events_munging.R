events <- read.csv("data/events.csv", header = TRUE, stringsAsFactors = FALSE)

#Remove duplicate entries
sum(duplicated(events))
events <- events[!duplicated(events),]

#Remove entries with no pid (dataset identifier).  This also removes all recordType = "search"
events <- events[which(nchar(events$pid) != 0),]

#Drop extra columns
events <- events[,c("timestamp", "sessionId", "pid", "nodeId")]
sum(duplicated(events))

#Clean up column types
events$nodeId <- gsub(pattern = "urn:node:", replacement = "", x = events$nodeId)
events$nodeId <- as.factor(events$nodeId)

events$timestamp <- lubridate::ymd_hms(events$timestamp)

sum(duplicated(events))

#Rename sessionId's and pid's with something less memory-intensive
events$user <- as.factor(events$sessionId)
events$userID <- as.factor(plyr::mapvalues(events$user, from = levels(events$user), to = seq(1:length(levels(events$user)))))
events[c(1:20), c("sessionId", "user", "userID")]
unique(events[which(events$sessionId == "e2bbdddca60526db17a813210a4796bb|2018092118"), c("sessionId", "user", "userID")])

sum(duplicated(events))

events$pid2 <- as.factor(events$pid)
events$datasetID <- as.factor(plyr::mapvalues(events$pid2, from = levels(events$pid2), to = as.hexmode(seq(1:length(levels(events$pid2))))))
events[which(events$datasetID == "248189"), c("pid", "pid2", "datasetID")]
events[which(events$pid == "https://pasta.lternet.edu/package/data/eml/knb-lter-arc/10345/1/2b217f184292a3067447700b94a7aa64"), c("pid", "pid2", "datasetID")]

sum(duplicated(events))

events <- events[,c("timestamp", "userID", "datasetID", "nodeId")]
names(events)[c(2:4)] <- c("user_id", "pid", "node_id")

sum(duplicated(events))

#Save the dataframe with 4 columns
save(events, file = "code/users_datasets_nodes/events_with_nodeID.Rdata")
write.csv(events, file = "data/events_with_nodeID.csv", row.names = FALSE)

#Save the dataframe with 2 columns: user_id and pid, for import into network-making code
events_for_import <- events[,c("user_id", "pid")]
head(events_for_import)

sum(duplicated(events_for_import))  #removing the time stamp creates duplicate entries
events_for_import <- events_for_import[!duplicated(events_for_import),]  #get rid of the duplicate entries because we don't care how many times a particular session accessed a particular pid

sum(duplicated(events_for_import))

save(events_for_import, file = "code/users_datasets_nodes/events_for_import.Rdata")
write.csv(events_for_import, file = "data/events_for_import.csv", row.names = FALSE)
