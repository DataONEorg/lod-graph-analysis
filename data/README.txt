This is the initial dump from  most of the content from one Member Node in
DataONE, the Arctic Data Center (https://arcticdata.io). This contains
dataset<->creator linkages for about 4000 or so datasets.

creators.csv

Each row is an instance of a creator of some dataset.

columns:

  type: Type or creator (person, organizations, etc). You can ignore this for
    now.  
  id: Unique identifier. These are auto-generated and not persistent at this
    point.  
  last: Last name of the creator.  email: Email address of the creator.
  orcid: ORCID for the creator.

datasets.csv

Each row is an instance of a creator in creators.csv being the creator of a
single dataset.  For example, if dataset X has five creators, there will be five
rows.

columns:

  pid: DataONE's persistent identifier for the dataset. You can think of this is
    the dataset identifier.  
  creator_id: Unique identifier for each creator. Foriegn
    key to creators.csv's 'id' column.
