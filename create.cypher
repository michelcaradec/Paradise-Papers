// Delete all
MATCH (n) DETACH DELETE n;

// Nodes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
    FROM "file:///paradise_papers.nodes.address.csv"
    AS row
    FIELDTERMINATOR ','
CREATE (:Address {valid_until: row.`n.valid_until`, country_codes: row.`n.country_codes`, countries: row.`n.countries`, node_id: toInteger(row.`n.node_id`), sourceID: row.`n.sourceID`, address: row.`n.address`, name: row.`n.name`, jurisdiction_description: row.`n.jurisdiction_description`, service_provider: row.`n.service_provider`, jurisdiction: row.`n.jurisdiction`, closed_date: row.`n.closed_date`, incorporation_date: row.`n.incorporation_date`, ibcRUC: row.`n.ibcRUC`, type: row.`n.type`, status: row.`n.status`, company_type: row.`n.company_type`, note: row.`n.note` });
// Added 59228 labels, created 59228 nodes, set 1006876 properties, completed after 6748 ms.

CREATE INDEX ON :Address(node_id);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
    FROM "file:///paradise_papers.nodes.entity.csv"
    AS row
    FIELDTERMINATOR ','
CREATE (:Entity {valid_until: row.`n.valid_until`, country_codes: row.`n.country_codes`, countries: row.`n.countries`, node_id: toInteger(row.`n.node_id`), sourceID: row.`n.sourceID`, address: row.`n.address`, name: row.`n.name`, jurisdiction_description: row.`n.jurisdiction_description`, service_provider: row.`n.service_provider`, jurisdiction: row.`n.jurisdiction`, closed_date: row.`n.closed_date`, incorporation_date: row.`n.incorporation_date`, ibcRUC: row.`n.ibcRUC`, type: row.`n.type`, status: row.`n.status`, company_type: row.`n.company_type`, note: row.`n.note`});
// Added 24957 labels, created 24957 nodes, set 424269 properties, completed after 1980 ms.

CREATE INDEX ON :Entity(node_id);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
    FROM "file:///paradise_papers.nodes.intermediary.csv"
    AS row
    FIELDTERMINATOR ','
CREATE (:Intermediary {valid_until: row.`n.valid_until`, country_codes: row.`n.country_codes`, countries: row.`n.countries`, node_id: toInteger(row.`n.node_id`), sourceID: row.`n.sourceID`, address: row.`n.address`, name: row.`n.name`, jurisdiction_description: row.`n.jurisdiction_description`, service_provider: row.`n.service_provider`, jurisdiction: row.`n.jurisdiction`, closed_date: row.`n.closed_date`, incorporation_date: row.`n.incorporation_date`, ibcRUC: row.`n.ibcRUC`, type: row.`n.type`, status: row.`n.status`, company_type: row.`n.company_type`, note: row.`n.note`});
// Added 186 labels, created 186 nodes, set 3162 properties, completed after 126 ms.

CREATE INDEX ON :Intermediary(node_id);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
    FROM "file:///paradise_papers.nodes.officer.csv"
    AS row
    FIELDTERMINATOR ','
CREATE (:Officer {valid_until: row.`n.valid_until`, country_codes: row.`n.country_codes`, countries: row.`n.countries`, node_id: toInteger(row.`n.node_id`), sourceID: row.`n.sourceID`, address: row.`n.address`, name: row.`n.name`, jurisdiction_description: row.`n.jurisdiction_description`, service_provider: row.`n.service_provider`, jurisdiction: row.`n.jurisdiction`, closed_date: row.`n.closed_date`, incorporation_date: row.`n.incorporation_date`, ibcRUC: row.`n.ibcRUC`, type: row.`n.type`, status: row.`n.status`, company_type: row.`n.company_type`, note: row.`n.note`});
// Added 77012 labels, created 77012 nodes, set 1309204 properties, completed after 5331 ms.

CREATE INDEX ON :Officer(node_id);

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
    FROM "file:///paradise_papers.nodes.other.csv"
    AS row
    FIELDTERMINATOR ','
CREATE (:Other {valid_until: row.`n.valid_until`, country_codes: row.`n.country_codes`, countries: row.`n.countries`, node_id: toInteger(row.`n.node_id`), sourceID: row.`n.sourceID`, address: row.`n.address`, name: row.`n.name`, jurisdiction_description: row.`n.jurisdiction_description`, service_provider: row.`n.service_provider`, jurisdiction: row.`n.jurisdiction`, closed_date: row.`n.closed_date`, incorporation_date: row.`n.incorporation_date`, ibcRUC: row.`n.ibcRUC`, type: row.`n.type`, status: row.`n.status`, company_type: row.`n.company_type`, note: row.`n.note`});
// Added 2031 labels, created 2031 nodes, set 34527 properties, completed after 242 ms.

CREATE INDEX ON :Other(node_id);

// Relationships
// Import for :REGISTERED_ADDRESS label. The same must be done for other labels.
// cut -d "," -f2 /importparadise_papers.edges.csv | sort -u
// "connected_to"
// "intermediary_of"
// "officer_of"
// "registered_address"
// "rel_type"
// "same_id_as"
// "same_name_as"
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
    FROM "file:///paradise_papers.edges.csv"
    AS row
    FIELDTERMINATOR ','
WITH row
WHERE row.rel_type = "registered_address"
MATCH (n1 {node_id: toInteger(row.node_1)})
MATCH (n2 {node_id: toInteger(row.node_2)})
CREATE (n1)-[:REGISTERED_ADDRESS {sourceID: row.`r.sourceID`, valid_until: row.`r.valid_until`, start_date: row.`r.start_date`, end_date: row.`r.end_date`}]->(n2);

// Metagraph
CALL apoc.meta.graph();
