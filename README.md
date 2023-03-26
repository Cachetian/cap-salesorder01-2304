
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


# UI
@(path:'/odata/v4/CatalogService')
@(path:'odata/v4/CatalogService/')
@(path:'/mgrsalesorder01/webapp/odata/v4/CatalogService/')
cds bind --exec mvn spring-boot:run
cds bind --exec mvn spring-boot:run --spring.profiles.active=hybrid
cds bind --exec mvn spring-boot:run -Drun.profiles=hybrid
mvn spring-boot:run --spring.profiles.active=hybrid
cf login -a https://api.cf.us10-001.hana.ondemand.com --sso
https://github.com/SAP-samples/fiori-elements-feature-showcase
Side Effects
https://github.com/Cachetian/cap-java-2207-action-based-custom-create

```
@(
    cds.odata.bindingparameter.name : '_it',
    cds.odata.bindingparameter.collection,
    Common.SideEffects              : {TargetEntities : [_it]}
)
```
valueList
@Common.ValueList 

# Build
mbt build
cf deploy mta_archives/cofco-salesorder01-cap_1.0.0-
SNAPSHOT.mtar 
cf apps
cf logs cofco-salesorder01-cap-srv

# Deploy
https://help.sap.com/docs/WZ_STD/8c8e1958338140699bd4811b37b82ece/1b80373be4fc4cbb8a7529495c9c9d62.html