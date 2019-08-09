# lod-graph-analysis
Linked Open Data graph analysis 2019 summer intern project 

## File structure:
Root
    -data folder
      - .csv files for input into the MakeNetworkGeneric.RMD file.  Structure and content for these files are described in the RMD.
    -analysis folder
      - MakeNetworkGeneric.RMD  The R Markdown file with the code to make the network.  See notes below.
      - subfolders with specific analyses for specific networks.  For example, the ADC_datasets_graph subfolder contains the MakeNetwork.RMD file customized for the ADC datasets graph, along with output files: dataset_attributes (.csv and .Rdata), datasets_graph.Rdata, edge_list.Rdata, gephi_dataset_attributes.csv, gephi_edge_list.csv, network_statistics(.csv and .Rdata)
    -gephi_visualizations folder
      -.gephi files that were used to make the visualizations in the final report
    -FinalReport.pdf file
    -lod-graph-analysis.Rproj file
    -DESRIPTION
    -LICENCE
    -README

## MakeNetworkGeneric.RMD:

This R Markdown document presents code to build a network of datasets from a DataONE archive.  It takes as input a .csv file with two columns (a list of users in one column, and a list of datasets in the other), works on the .csv table to build a network describing the relationships among datasets in the archive, then calculates statistics of interest for that network.  The RMD file produces two outputs: 1. A table of networks statistics, saved as a dataframe and a .csv file.  2. A .csv file with three node characteristics: node degree, and node modularity class for two different community detection algorithms. Details about how to run the code are included in the RMD file.  The MakeNetowrkGeneric.RMD file will run as-is, but the analyst will probably want to customize it for the particular network being built.
