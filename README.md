
https://github.com/sap-samples
https://github.com/sap-samples/cap-sflight

# CAP
https://cap.cloud.sap/docs/

# Naming 
e.g.
cofco-salesorder-srv
cofco-salesorder-ui-app1
cofco-salesorder-ui-app1
cofco-salesorder-cap

# Dev Guide
https://cap.cloud.sap/docs/get-started/projects
https://cap.cloud.sap/docs/advanced/odata?q=oData+V2
https://cap.cloud.sap/docs/guides/domain-models
https://github.com/SAP-samples/cloud-cap-samples/blob/main/bookshop/test/requests.http

# Domain Modeling
cds watch
https://github.com/SAP-samples/btp-lcnc-espm/blob/main/db/schema.cds
https://api.sap.com/api/API_PRODUCT_SRV/overview
cds import API_PRODUCT_SRV.edmx --from edmx --as cds
mvn compile

# Service implementation
https://cap.cloud.sap/docs/guides/providing-services
https://cap.cloud.sap/docs/java/provisioning-api
cds deploy --to h2 --dry
mbt build
https://github.com/Cachetian/cap_so_2210/
https://cap.cloud.sap/docs/guides/databases?q=cds+deploy+--to+hana