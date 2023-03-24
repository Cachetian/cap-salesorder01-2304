using { Currency, User, managed, cuid } from '@sap/cds/common';

namespace my.bookshop;

entity Books {
  key ID : Integer;
  title  : String;
  stock  : Integer;
}

entity SalesOrders : cuid, managed {
  name        : String;
  description : String;
}

entity SalesOrderHeaders : cuid, managed {
  CurrencyCode        : String(5);
  GrossAmount         : Decimal(15, 3);
  LifeCycleStatus     : String(1) not null;
  LifeCycleStatusName : String(255) not null;
  NetAmount           : Decimal(15, 3);
  TaxAmount           : Decimal(15, 3);
  Items               : Association to many SalesOrderItems
                          on Items.Header = $self;
}

entity SalesOrderItems {
  key Id           : UUID
      @Core.Computed;
      CurrencyCode : String(5);
      DeliveryDate : DateTime;
      GrossAmount  : Decimal(15, 3);
      NetAmount    : Decimal(15, 3);
      Quantity     : Decimal(15, 3);
      QuantityUnit : String(3);
      TaxAmount    : Decimal(15, 3);
      Header       : Association to one SalesOrderHeaders;
}

@sap.content.version : '1'
@sap.label           : 'Product'
entity Products {
      @sap.display.format : 'UpperCase'
      @sap.label          : 'Product'
      @sap.quickinfo      : 'Product Number'
  key Product                       : String(40) not null;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Product Type'
      ProductType                   : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'CrossPlantProdStatus'
      @sap.quickinfo      : 'Cross-Plant Product Status'
      CrossPlantStatus              : String(2);

      @sap.display.format : 'Date'
      @sap.label          : 'Valid from'
      @sap.quickinfo      : 'Date from which the cross-plant material status is valid'
      CrossPlantStatusValidityDate  : Date;

      @sap.display.format : 'Date'
      @sap.label          : 'Created On'
      @sap.creatable      : 'false'
      @sap.updatable      : 'false'
      CreationDate                  : Date;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Created By'
      @sap.quickinfo      : 'Name of Person Responsible for Creating the Object'
      @sap.creatable      : 'false'
      @sap.updatable      : 'false'
      CreatedByUser                 : String(12);

      @sap.display.format : 'Date'
      @sap.label          : 'Last Change'
      @sap.quickinfo      : 'Date of Last Change'
      @sap.creatable      : 'false'
      @sap.updatable      : 'false'
      LastChangeDate                : Date;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Changed By'
      @sap.quickinfo      : 'Name of Person Who Changed Object'
      @sap.creatable      : 'false'
      @sap.updatable      : 'false'
      LastChangedByUser             : String(12);

      @odata.Type         : 'Edm.DateTimeOffset'
      @odata.Precision    : 7
      @sap.label          : 'Last Changed'
      @sap.quickinfo      : 'Change Time Stamp'
      @sap.creatable      : 'false'
      @sap.updatable      : 'false'
      LastChangeDateTime            : Timestamp;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Marked for Deletion'
      @sap.quickinfo      : 'Deletion Indicator'
      IsMarkedForDeletion           : Boolean;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Old Product Number'
      ProductOldID                  : String(40);

      @sap.unit           : 'WeightUnit'
      @sap.label          : 'Gross Weight'
      GrossWeight                   : Decimal(13, 3);

      @sap.label          : 'Order Unit'
      @sap.quickinfo      : 'Purchase Order Unit of Measure'
      @sap.semantics      : 'unit-of-measure'
      PurchaseOrderQuantityUnit     : String(3);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Source of supply'
      @sap.quickinfo      : 'Source of Supply'
      SourceOfSupply                : String(1);

      @sap.label          : 'Unit of Weight'
      @sap.semantics      : 'unit-of-measure'
      WeightUnit                    : String(3);

      @sap.unit           : 'WeightUnit'
      @sap.label          : 'Net Weight'
      NetWeight                     : Decimal(13, 3);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Cntry/Reg of Origin'
      @sap.quickinfo      : 'Country/Region of Origin of Material (Non-Preferential Ori.)'
      CountryOfOrigin               : String(3);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Competitor'
      CompetitorID                  : String(10);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Product Group'
      ProductGroup                  : String(9);

      @sap.label          : 'Base Unit of Measure'
      @sap.semantics      : 'unit-of-measure'
      BaseUnit                      : String(3);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Gen. item cat. grp'
      @sap.quickinfo      : 'General item category group'
      ItemCategoryGroup             : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Product Hierarchy'
      ProductHierarchy              : String(18);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Division'
      Division                      : String(2);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Var. Order Unit'
      @sap.quickinfo      : 'Variable Purchase Order Unit Active'
      VarblPurOrdUnitIsActive       : String(1);

      @sap.label          : 'Volume Unit'
      @sap.semantics      : 'unit-of-measure'
      VolumeUnit                    : String(3);

      @sap.unit           : 'VolumeUnit'
      @sap.label          : 'Volume'
      MaterialVolume                : Decimal(13, 3);

      @sap.display.format : 'NonNegative'
      @sap.label          : 'ANP Code'
      ANPCode                       : String(9);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Brand'
      Brand                         : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Procurement rule'
      ProcurementRule               : String(1);

      @sap.display.format : 'Date'
      @sap.label          : 'Valid From'
      @sap.quickinfo      : 'Valid-From Date'
      ValidityStartDate             : Date;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Low-Level Code'
      LowLevelCode                  : String(3);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Generic Material'
      @sap.quickinfo      : 'Material Number of the Generic Material in Prepack Materials'
      ProdNoInGenProdInPrepackProd  : String(40);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Serial No. Profile'
      @sap.quickinfo      : 'Serial Number Profile'
      SerialIdentifierAssgmtProfile : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Size/dimensions'
      SizeOrDimensionText           : String(32);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Industry Std Desc.'
      @sap.quickinfo      : 'Industry Standard Description (such as ANSI or ISO)'
      IndustryStandardName          : String(18);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'GTIN'
      @sap.quickinfo      : 'Global Trade Item Number (EAN/UPC/GTIN)'
      ProductStandardID             : String(18);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'EAN category'
      @sap.quickinfo      : 'Category of International Article Number (EAN)'
      InternationalArticleNumberCat : String(2);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Configurable'
      @sap.quickinfo      : 'Product is Configurable'
      ProductIsConfigurable         : Boolean;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Batch Management'
      @sap.quickinfo      : 'Batch Management Requirement Indicator'
      IsBatchManagementRequired     : Boolean;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Ext. Product Group'
      @sap.quickinfo      : 'External Product Group'
      ExternalProductGroup          : String(18);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Cross-plant CP'
      @sap.quickinfo      : 'Cross-Plant Configurable Product'
      CrossPlantConfigurableProduct : String(40);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Serialization level'
      @sap.quickinfo      : 'Level of Explicitness for Serial Number'
      SerialNoExplicitnessLevel     : String(1);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Mfr Part Number'
      @sap.quickinfo      : 'Manufacturer Part Number'
      ProductManufacturerNumber     : String(40);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Manufacturer'
      @sap.quickinfo      : 'Number of a Manufacturer'
      ManufacturerNumber            : String(10);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Mfr part profile'
      ManufacturerPartProfile       : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'QM in Procur. Active'
      @sap.quickinfo      : 'QM in Procurement Is Active'
      QltyMgmtInProcmtIsActive      : Boolean;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Industry'
      IndustrySector                : String(1);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Change Number'
      ChangeNumber                  : String(12);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Revision Level'
      MaterialRevisionLevel         : String(2);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Handling Indicator'
      HandlingIndicator             : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'WH Material Group'
      @sap.quickinfo      : 'Warehouse Material Group'
      WarehouseProductGroup         : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Whse Stor. Condition'
      @sap.quickinfo      : 'Warehouse Storage Condition'
      WarehouseStorageCondition     : String(2);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Standard HU Type'
      StandardHandlingUnitType      : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Serial No. Profile'
      @sap.quickinfo      : 'Serial Number Profile'
      SerialNumberProfile           : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Adjust. Profile'
      @sap.quickinfo      : 'Adjustment Profile'
      AdjustmentProfile             : String(3);

      @sap.label          : 'Preferred UoM'
      @sap.quickinfo      : 'Preferred Alternative UoM for Warehouse Operations'
      @sap.semantics      : 'unit-of-measure'
      PreferredUnitOfMeasure        : String(3);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Pilferable'
      IsPilferable                  : Boolean;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Relevant for HS'
      @sap.quickinfo      : 'Relevant for Hazardous Substances'
      IsRelevantForHzdsSubstances   : Boolean;

      @sap.label          : 'Quarant. Per.'
      @sap.quickinfo      : 'Quarantine Period'
      QuarantinePeriod              : Decimal(3, 0);

      @sap.label          : 'Time Unit'
      @sap.quickinfo      : 'Time Unit for Quarantine Period'
      @sap.semantics      : 'unit-of-measure'
      TimeUnitForQuarantinePeriod   : String(3);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Quality Inspec. Grp'
      @sap.quickinfo      : 'Quality Inspection Group'
      QualityInspectionGroup        : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Authorization Group'
      AuthorizationGroup            : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'CAD Indicator'
      DocumentIsCreatedByCAD        : Boolean;

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Handling Unit Type'
      HandlingUnitType              : String(4);

      @sap.display.format : 'UpperCase'
      @sap.label          : 'Varb. Tare Weight'
      @sap.quickinfo      : 'Variable Tare Weight'
      HasVariableTareWeight         : Boolean;

      @sap.unit           : 'UnitForMaxPackagingDimensions'
      @sap.label          : 'Max. Pack. Length'
      @sap.quickinfo      : 'Maximum Packing Length of Packaging Material'
      MaximumPackagingLength        : Decimal(15, 3);

      @sap.unit           : 'UnitForMaxPackagingDimensions'
      @sap.label          : 'Max. Pack. Width'
      @sap.quickinfo      : 'Maximum Packing Width of Packaging Material'
      MaximumPackagingWidth         : Decimal(15, 3);

      @sap.unit           : 'UnitForMaxPackagingDimensions'
      @sap.label          : 'Max. Pack. Height'
      @sap.quickinfo      : 'Maximum Packing Height of Packaging Material'
      MaximumPackagingHeight        : Decimal(15, 3);

      @sap.label          : 'Unit of Measurement'
      @sap.quickinfo      : 'Unit of Measure for Maximum Packing Length/Width/Height'
      @sap.semantics      : 'unit-of-measure'
      UnitForMaxPackagingDimensions : String(3);
};