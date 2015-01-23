# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141113075622) do

  create_table "tARAPList", primary_key: "ARAPListID", force: true do |t|
    t.integer "ARAPTypeID"
    t.integer "BPID",       limit: 8
    t.integer "AccountID"
    t.boolean "Active",               default: true,  null: false
    t.boolean "IsAR",                 default: false, null: false
  end

  create_table "tARAPType", primary_key: "ARAPTypeID", force: true do |t|
    t.string  "ARAPType", limit: 50,                 null: false
    t.boolean "IsAR",                default: false, null: false
    t.boolean "Active",              default: true,  null: false
  end

  create_table "tAbnormals", primary_key: "AbnormalID", force: true do |t|
    t.string  "AbnormalDesc",    limit: 100
    t.decimal "AbnormalScore",               precision: 5, scale: 2
    t.boolean "Request",                                             default: false, null: false
    t.boolean "WageDeduction",                                       default: false
    t.decimal "DeductionFactor",             precision: 5, scale: 2
    t.integer "TimeCode",        limit: 1
    t.decimal "MaxReqHours",                 precision: 5, scale: 2
    t.decimal "ReduceStock",                 precision: 5, scale: 2
    t.integer "StockCode",       limit: 2
  end

  create_table "tAccDoc", primary_key: "DocID", force: true do |t|
    t.string   "DocNo",               limit: 50
    t.datetime "DateIssued"
    t.datetime "DateCreated"
    t.integer  "StatusID",            limit: 2
    t.integer  "DocTypeID",           limit: 2
    t.integer  "DocParentType",       limit: 2
    t.integer  "DocYear",             limit: 2
    t.integer  "DocMonth",            limit: 2
    t.integer  "DocCounter"
    t.string   "Description",         limit: 500
    t.integer  "OwnerID",             limit: 8
    t.integer  "FromAccountID"
    t.integer  "ToAccountID"
    t.decimal  "Amount",                          precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "PayeeID",             limit: 8
    t.integer  "CurrencyID",          limit: 2
    t.decimal  "ExchangeRate",                    precision: 9,  scale: 2
    t.datetime "DatePosted"
    t.integer  "OrderID",             limit: 8
    t.integer  "BPID",                limit: 8
    t.integer  "BankID"
    t.integer  "FromBankID"
    t.integer  "ProjectID",           limit: 8
    t.integer  "OrgID",               limit: 8
    t.integer  "FiscalID"
    t.decimal  "TransferAmount",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.string   "ChequeNumber",        limit: 50
    t.datetime "ChequeDueDate"
    t.integer  "ChequeBankID"
    t.integer  "CompanyID",           limit: 8
    t.integer  "RefOrderID",          limit: 8
    t.boolean  "ARAPDeduct",                                               default: false, null: false
    t.decimal  "DeductAmount",                    precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "RefAccDocID",         limit: 8
    t.integer  "OwnerOrgID",          limit: 8
    t.integer  "TransTypeID"
    t.boolean  "Imported",                                                 default: false, null: false
    t.boolean  "Transit",                                                  default: false, null: false
    t.integer  "AccTransitID",        limit: 8
    t.datetime "DateTransfered"
    t.integer  "InvoiceCurrencyID",   limit: 2
    t.decimal  "InvoiceExchangeRate",             precision: 9,  scale: 2, default: 1.0,   null: false
    t.integer  "AdvancedPaymentPOID", limit: 8
    t.integer  "AdvancedPaymentSOID", limit: 8
  end

  add_index "tAccDoc", ["OrderID"], name: "ndx_tAccDoc_OrderID"
  add_index "tAccDoc", ["StatusID"], name: "IX_StatusID"

  create_table "tAccDocDetail", primary_key: "AccDocDetailID", force: true do |t|
    t.integer "BankID"
    t.integer "DocID",          limit: 8
    t.integer "InvoiceID",      limit: 8
    t.integer "OrderID",        limit: 8
    t.decimal "PaidPercentage",           precision: 19, scale: 4, default: 0.0, null: false
    t.decimal "PaidAmount",               precision: 19, scale: 4, default: 0.0, null: false
    t.decimal "LastPaid",                 precision: 19, scale: 4,               null: false
  end

  create_table "tAccDocHistory", primary_key: "AccDocHistoryID", force: true do |t|
    t.integer  "DocID",       limit: 8
    t.datetime "DateUpdated"
    t.integer  "UpdatedByID", limit: 8
    t.integer  "StatusID",    limit: 2
  end

  create_table "tAccTransit", primary_key: "AccTransitID", force: true do |t|
    t.string   "TransitCode",   limit: 200
    t.datetime "DateBegin"
    t.datetime "DateEnd"
    t.datetime "DateSent"
    t.boolean  "Processed",                 default: false, null: false
    t.integer  "DocID",         limit: 8
    t.integer  "FromOrgID",     limit: 8
    t.boolean  "SendMode",                  default: false, null: false
    t.datetime "DateProcessed"
    t.datetime "DateReceived"
    t.integer  "MessageID",     limit: 8
    t.boolean  "SyncMaster",                default: false, null: false
    t.string   "Log",           limit: 200
    t.integer  "ProcessedByID", limit: 8
  end

  create_table "tAccess", primary_key: "AccessID", force: true do |t|
    t.integer "ResID",           limit: 8
    t.integer "GroupID"
    t.integer "MenuID"
    t.boolean "OpenForm",                  default: false
    t.boolean "ViewOnly",                  default: false
    t.boolean "AddData",                   default: false
    t.boolean "UpdateData",                default: false
    t.boolean "DeleteData",                default: false
    t.boolean "ProcessData",               default: false
    t.boolean "CancelProcess",             default: false
    t.boolean "ReserveStock",              default: false
    t.boolean "SuperAdmin",                default: false
    t.boolean "PrintDocument",             default: false
    t.boolean "AddDocument",               default: false
    t.boolean "DeleteDocument",            default: false
    t.boolean "UpdateDocument",            default: false
    t.boolean "ApproveDocument",           default: false
    t.boolean "RejectDocument",            default: false
    t.boolean "SpecialPrint",              default: false
    t.boolean "SpecialAdd",                default: false
    t.boolean "SpecialDelete",             default: false
    t.boolean "SpecialUpdate",             default: false
    t.boolean "SpecialAdmin",              default: false
    t.boolean "PriceAdmin",                default: false
    t.boolean "ViewPrice",                 default: false
    t.boolean "StockViewSA",               default: false
  end

  create_table "tAccessory", primary_key: "AccessoryID", force: true do |t|
    t.integer "ProductID",          limit: 8,                         null: false
    t.integer "AccessoryProductID", limit: 8
    t.decimal "Quantity",                     precision: 8, scale: 2
  end

  add_index "tAccessory", ["AccessoryProductID"], name: "AccessoryProductID_ndx"
  add_index "tAccessory", ["ProductID"], name: "ProductID_ndx"

  create_table "tAccount", primary_key: "AccountID", force: true do |t|
    t.string  "AccountNumber", limit: 50,                  null: false
    t.string  "AccountName",   limit: 100,                 null: false
    t.integer "AccountTypeID",                             null: false
    t.boolean "Active",                    default: true,  null: false
    t.integer "OrgID",         limit: 8
    t.integer "BPID",          limit: 8
    t.boolean "IsAR",                      default: false, null: false
    t.boolean "IsPLYear",                  default: false, null: false
  end

  create_table "tAccountClass", primary_key: "AccountClassID", force: true do |t|
    t.string  "AccountClass",  limit: 50
    t.string  "AccountNumber", limit: 50
    t.integer "ClassType",     limit: 2
    t.boolean "Active",                   default: false, null: false
    t.integer "PLGroupID"
    t.boolean "IsAR",                     default: false, null: false
  end

  create_table "tAccountType", primary_key: "AccountTypeID", force: true do |t|
    t.string  "AccountType",    limit: 100,                 null: false
    t.integer "AccountClassID"
    t.integer "ParentID"
    t.boolean "Active",                     default: false, null: false
    t.string  "AccountNumber",  limit: 50
    t.integer "PLGroupID"
    t.boolean "IsAR",                       default: false, null: false
  end

  create_table "tAddress", primary_key: "AddressID", force: true do |t|
    t.integer "BPID",             limit: 8
    t.integer "ResID",            limit: 8
    t.string  "Address",          limit: 1000
    t.string  "Phone",            limit: 150
    t.string  "Fax",              limit: 150
    t.boolean "IsDefault"
    t.boolean "Billing"
    t.boolean "Shipment"
    t.string  "Contacts",         limit: 150
    t.string  "Email",            limit: 150
    t.string  "Website",          limit: 150
    t.string  "BranchName",       limit: 150
    t.integer "ReceivableAccID"
    t.integer "PayDiscountAccID"
    t.integer "PayableAccID"
    t.integer "BankChargeAccID"
    t.integer "ExchDiffAccID"
    t.integer "ProfitLossAccID"
    t.integer "RetainedAccID"
    t.integer "FreightAccID"
    t.integer "SalesAccID"
    t.integer "PseudoSalesAccID"
    t.integer "SalesDiscAccID"
    t.integer "PromptPayAccID"
    t.integer "InventoryAccID"
    t.integer "COGSAccID"
    t.integer "StockAdjAccID"
    t.integer "AssemblyAccID"
    t.integer "PayrollAccID"
    t.integer "PurchDiscAccID"
    t.integer "CashSalesAccID"
    t.integer "TaxTypeID"
    t.string  "PostCode",         limit: 15
    t.integer "TownshipID"
    t.integer "CountyID"
    t.integer "PrefectureID"
    t.integer "ProvinceID"
    t.integer "OrgID",            limit: 8
  end

  add_index "tAddress", ["AddressID"], name: "IX_tAddress", unique: true

  create_table "tAllocInv", primary_key: "AllocInvID", force: true do |t|
    t.integer  "ComponentID", limit: 8
    t.datetime "StartDate"
    t.float    "QtyRequired", limit: 53
    t.float    "QtyOnHand",   limit: 53
    t.float    "RemainQty",   limit: 53
    t.float    "GetIn",       limit: 53
    t.float    "OnOrder",     limit: 53
  end

  create_table "tAltSN", primary_key: "AltSNID", force: true do |t|
    t.integer "SNTypeID"
    t.integer "StockID",      limit: 8
    t.string  "SerialNumber", limit: 100
  end

  create_table "tAltUOM", primary_key: "AltUOMID", force: true do |t|
    t.integer "ProductID",   limit: 8,                                          null: false
    t.integer "UOMID"
    t.decimal "Conversion",            precision: 19, scale: 4, default: 1.0
    t.boolean "PurchaseUOM",                                    default: false
  end

  create_table "tAppFlow", primary_key: "AppFlowID", force: true do |t|
    t.integer  "ELeaveID",     limit: 8
    t.integer  "OrderID",      limit: 8
    t.integer  "DocID",        limit: 8
    t.integer  "OTID",         limit: 8
    t.integer  "ApproveSeq",   limit: 2, default: 1,     null: false
    t.integer  "ApproverID",   limit: 8,                 null: false
    t.boolean  "Approved",               default: false, null: false
    t.boolean  "Rejected",               default: false, null: false
    t.datetime "DateUpdated"
    t.datetime "LastNotified"
  end

  create_table "tAppSetting", primary_key: "AppSettingID", force: true do |t|
    t.integer "ResID",       limit: 8,                 null: false
    t.text    "SettingsXML"
    t.boolean "IsGlobal",              default: false, null: false
  end

  create_table "tApproval", primary_key: "ApprovalID", force: true do |t|
    t.integer "ResID",         limit: 8
    t.string  "Approval",      limit: 100
    t.integer "ApprovalLevel", limit: 2
    t.integer "ParentID"
    t.integer "DocParentType", limit: 2
  end

  create_table "tAsset", primary_key: "AssetID", force: true do |t|
    t.string   "AssetCode",         limit: 50
    t.string   "AssetName",         limit: 200
    t.integer  "AssetLocationID"
    t.string   "AssetSN",           limit: 100
    t.integer  "AssetConditionID",  limit: 2
    t.integer  "AssetStatusID",     limit: 2
    t.integer  "StockID",           limit: 8
    t.integer  "ProjectID",         limit: 8
    t.integer  "OrgID",             limit: 8
    t.datetime "DateAcquired"
    t.datetime "DateDisposed"
    t.decimal  "AcquisitionValue",              precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "ResidualValue",                 precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "DepreciationRate",              precision: 10, scale: 4
    t.integer  "CalculateMethod",   limit: 2
    t.integer  "FixedAssetAccID"
    t.integer  "DepreciationAccID"
    t.integer  "AccuDepreAccID"
    t.integer  "DisposalAccID"
    t.integer  "LossAccID"
    t.decimal  "UsefullLifeYears",              precision: 5,  scale: 2
  end

  create_table "tAssetLocation", primary_key: "AssetLocationID", force: true do |t|
    t.string "AssetLocationCode", limit: 15,  null: false
    t.string "AssetLocationName", limit: 200, null: false
  end

  create_table "tAssetTrans", primary_key: "AssetTransID", force: true do |t|
    t.integer  "AssetID",            limit: 8
    t.datetime "DepreciationPeriod"
    t.datetime "DateAdded"
    t.integer  "DocID",              limit: 8,                                          null: false
    t.integer  "AccountID",                                                             null: false
    t.decimal  "Amount",                       precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean  "Depreciation",                                          default: false, null: false
    t.boolean  "AssetDisposal",                                         default: false, null: false
  end

  create_table "tAssetType", primary_key: "AssetTypeID", force: true do |t|
    t.string  "AssetType",       limit: 50
    t.integer "AssetAccID"
    t.integer "DepreAccID"
    t.integer "AccuDepreAccID"
    t.integer "TaxAccID"
    t.integer "GainAccID"
    t.integer "LossAccID"
    t.integer "SalesAccID"
    t.integer "DepreMethod",     limit: 2
    t.decimal "BookEffLife",                precision: 8, scale: 4
    t.decimal "BookMultiplier",             precision: 8, scale: 4
    t.integer "TaxDepreMethod",  limit: 2
    t.decimal "TaxEffLife",                 precision: 8, scale: 4
    t.decimal "TaxMultiplier",              precision: 8, scale: 4
    t.integer "CalculateMethod", limit: 2
  end

  create_table "tAssignPriv", primary_key: "AssignPrivID", force: true do |t|
    t.integer  "ResID",       limit: 8
    t.integer  "MenuID"
    t.boolean  "IsUpdate",              default: false
    t.boolean  "IsDelete",              default: false
    t.boolean  "IsPrint",               default: false
    t.boolean  "IsProcess",             default: false, null: false
    t.boolean  "SuperAdmin",            default: false, null: false
    t.datetime "DateCreated"
    t.datetime "AssignStart"
    t.datetime "AssignEnd"
  end

  create_table "tAttd", primary_key: "AttdID", force: true do |t|
    t.integer  "FingerID"
    t.integer  "StatusID",      limit: 1
    t.integer  "VerifyIn",      limit: 1
    t.integer  "VerifyOut",     limit: 1
    t.integer  "AbnormalID",    limit: 2
    t.integer  "ELeaveID",      limit: 8
    t.datetime "DateAbsent"
    t.datetime "Time1"
    t.datetime "Time2"
    t.datetime "Time3"
    t.datetime "Time4"
    t.datetime "Time5"
    t.datetime "Time6"
    t.decimal  "AbnormalScore",            precision: 5, scale: 2
    t.string   "Notes",         limit: 50
    t.boolean  "Override",                                         default: false, null: false
    t.integer  "UpdatedByID",   limit: 8
    t.datetime "DateUpdated"
    t.decimal  "OTHours",                  precision: 6, scale: 2
  end

  add_index "tAttd", ["FingerID", "Time1"], name: "tAttd_idx"

  create_table "tAttdPatChild", primary_key: "AttdPatChildID", force: true do |t|
    t.integer  "AttdPatternID"
    t.integer  "DOW",           limit: 1
    t.datetime "TimeCode11"
    t.datetime "TimeCode12"
    t.datetime "TimeCode21"
    t.datetime "TimeCode22"
  end

  create_table "tAttdPatterns", primary_key: "AttdPatternID", force: true do |t|
    t.string "PatternDesc", limit: 100
  end

  create_table "tAttrInfo", primary_key: "AttrInfoID", force: true do |t|
    t.integer "ProductID",   limit: 8
    t.integer "AttributeID"
    t.string  "Weight",      limit: 15
  end

  create_table "tAttrList", primary_key: "AttrListID", force: true do |t|
    t.integer "AttrTypeID"
    t.string  "AttrList",   limit: 20
  end

  create_table "tAttrTypes", primary_key: "AttrTypeID", force: true do |t|
    t.string "AttrType", limit: 20
  end

  create_table "tAttributes", primary_key: "AttributeID", force: true do |t|
    t.string  "Attribute",      limit: 100
    t.integer "OverideFreq",    limit: 2
    t.integer "OveridePhase",   limit: 2
    t.integer "OverideVoltage", limit: 2
    t.boolean "Alternate",                  default: false
    t.integer "ParentID",       limit: 2
    t.string  "AttributeCode",  limit: 10
  end

  create_table "tBOM", primary_key: "BOMID", force: true do |t|
    t.integer  "ProductID",     limit: 8
    t.integer  "ComponentID",   limit: 8
    t.decimal  "QtyRequired",               precision: 19, scale: 4, default: 1.0
    t.boolean  "LinkAttribute",                                      default: false
    t.decimal  "Length",                    precision: 19, scale: 4
    t.decimal  "Width",                     precision: 19, scale: 4
    t.decimal  "Thickness",                 precision: 19, scale: 4
    t.integer  "StationID"
    t.integer  "StorageID"
    t.integer  "DefLocationID"
    t.integer  "AttributeID",   limit: 2
    t.decimal  "Area",                      precision: 19, scale: 4
    t.integer  "ProcessID",     limit: 8
    t.integer  "PhaseID",       limit: 8
    t.integer  "OutputID",      limit: 8
    t.datetime "DateCreated"
    t.datetime "DateUpdated"
    t.string   "UpdatedBy",     limit: 100
    t.string   "CreatedBy",     limit: 100
    t.boolean  "Alternative",                                        default: false
    t.integer  "AltBOMID",      limit: 8
    t.integer  "AltProductID",  limit: 8
    t.boolean  "Optional",                                           default: false
  end

  add_index "tBOM", ["ProductID", "ComponentID"], name: "ProductID_ComponentID_idx"
  add_index "tBOM", ["StationID"], name: "StationID_idx"
  add_index "tBOM", ["StorageID"], name: "StorageID_idx"

  create_table "tBPBusiness", primary_key: "BPBusinessID", force: true do |t|
    t.integer "BPID",        limit: 8
    t.integer "BusinessID"
    t.string  "Description", limit: 500
  end

  add_index "tBPBusiness", ["Description"], name: "Description_idx"

  create_table "tBPDeposit", primary_key: "BPDepositID", force: true do |t|
    t.integer  "BPID",         limit: 8
    t.datetime "DateTrans",                                                     null: false
    t.integer  "CurrencyID",   limit: 2,                                        null: false
    t.decimal  "ExchangeRate",           precision: 19, scale: 4, default: 1.0, null: false
    t.decimal  "Amount",                 precision: 19, scale: 4, default: 0.0, null: false
    t.integer  "OrderID",      limit: 8
    t.integer  "AccDocID",     limit: 8
    t.integer  "DepositType",  limit: 2
  end

  create_table "tBPType", primary_key: "BPTypeID", force: true do |t|
    t.string  "BPType",          limit: 100,                 null: false
    t.boolean "DefaultCustomer",             default: false, null: false
    t.boolean "DefaultSupplier",             default: false, null: false
    t.boolean "DefaultLeasing",              default: false, null: false
    t.boolean "Customer",                    default: false, null: false
    t.boolean "Supplier",                    default: false, null: false
    t.boolean "Leasing",                     default: false, null: false
    t.string  "BPTypeDesc",      limit: 50
  end

  create_table "tBPartners", primary_key: "BPID", force: true do |t|
    t.string   "BPCode",             limit: 10
    t.string   "BPName",             limit: 200
    t.boolean  "Customer",                       default: false, null: false
    t.boolean  "Supplier",                       default: false, null: false
    t.boolean  "Company",                        default: false, null: false
    t.string   "PIC",                limit: 500
    t.string   "DefaultFax",         limit: 150
    t.string   "DefaultPhone",       limit: 150
    t.string   "DefaultCellPhone",   limit: 150
    t.integer  "CurrencyID",         limit: 2
    t.integer  "PaymentID",          limit: 2
    t.datetime "DateRegistered"
    t.float    "DiscountRate",       limit: 53
    t.float    "TaxRate",            limit: 53
    t.string   "DefaultAddress",     limit: 500
    t.boolean  "ProductUser",                    default: false, null: false
    t.boolean  "ServiceContract",                default: false, null: false
    t.datetime "ContractBegin"
    t.datetime "ContractEnd"
    t.string   "CitizenIDNum",       limit: 50
    t.datetime "DateOfBirth"
    t.integer  "PlaceOfBirth"
    t.integer  "StateID"
    t.string   "ChassisSN",          limit: 50
    t.string   "EngineSN",           limit: 50
    t.integer  "VehicleBrandID"
    t.integer  "VehicleTypeID"
    t.string   "VehicleRegID",       limit: 50
    t.string   "VehicleRegName",     limit: 50
    t.string   "VehicleRegAddr",     limit: 200
    t.datetime "VehicleRegExpired"
    t.integer  "VehicleAttributeID"
    t.integer  "VehicleYear",        limit: 2
    t.integer  "VehicleSubTypeID"
    t.string   "TaxNumber",          limit: 50
    t.binary   "CompanyLogo"
    t.integer  "ReligionID",         limit: 2
    t.boolean  "Leasing",                        default: false, null: false
    t.integer  "ReceivableAccID"
    t.integer  "PayDiscountAccID"
    t.integer  "PayableAccID"
    t.integer  "BankChargeAccID"
    t.integer  "ExchDiffAccID"
    t.integer  "ProfitLossAccID"
    t.integer  "RetainedAccID"
    t.integer  "FreightAccID"
    t.integer  "SalesAccID"
    t.integer  "PseudoSalesAccID"
    t.integer  "SalesDiscAccID"
    t.integer  "PromptPayAccID"
    t.integer  "InventoryAccID"
    t.integer  "COGSAccID"
    t.integer  "StockAdjAccID"
    t.integer  "AssemblyAccID"
    t.integer  "PayrollAccID"
    t.integer  "PurchDiscAccID"
    t.integer  "CashSalesAccID"
    t.integer  "UsageAccID"
    t.integer  "IncentiveAccID"
    t.integer  "TaxTypeID"
    t.integer  "ServiceTaxTypeID"
    t.integer  "Gender"
    t.boolean  "ShowTax",                        default: false, null: false
    t.boolean  "AutoJournal",                    default: false, null: false
    t.boolean  "AutoPosting",                    default: false, null: false
    t.boolean  "ShowLogo",                       default: false, null: false
    t.integer  "AccuDepreAccID"
    t.integer  "DepreciationAccID"
    t.integer  "DisposalAccID"
    t.integer  "FixedAssetAccID"
    t.integer  "LossAccID"
    t.integer  "InvWriteOffAccID"
    t.integer  "BPTypeID"
    t.string   "AddInfo",            limit: 500
    t.boolean  "UseAvgCOGS",                     default: false, null: false
    t.boolean  "COGSIncludeTax",                 default: false, null: false
    t.integer  "DownPaymentAccID"
    t.integer  "CCSalesAccID"
    t.integer  "CCReceivableAccID"
    t.integer  "DCSalesAccID"
    t.integer  "DCReceivableAccID"
    t.integer  "PODownPaymentAccID"
    t.string   "IMAPServer",         limit: 50
    t.string   "IMAPUser",           limit: 50
    t.string   "IMAPPassword",       limit: 50
    t.integer  "IMAPPort",           limit: 2
    t.boolean  "IMAPTLS",                        default: true,  null: false
    t.boolean  "IMAPSSL",                        default: false, null: false
    t.string   "TransitAddress",     limit: 200
    t.string   "SMTPServer",         limit: 50
    t.string   "SMTPUser",           limit: 50
    t.string   "SMTPPassword",       limit: 50
    t.integer  "SMTPPort",           limit: 2
    t.boolean  "SMTPTLS",                        default: true,  null: false
    t.boolean  "SMTPSSL",                        default: false, null: false
    t.string   "BankAccount",        limit: 200
    t.string   "Email",              limit: 100
    t.string   "DealerCode",         limit: 10
    t.integer  "DeleteBeforeMonths", limit: 2,   default: 3,     null: false
    t.string   "AltCode",            limit: 20
  end

  add_index "tBPartners", ["BPCode", "Supplier", "Customer", "Company"], name: "tBPartners_uq", unique: true
  add_index "tBPartners", ["BPCode"], name: "BPCode_idx"
  add_index "tBPartners", ["BPName"], name: "BPName_idx"
  add_index "tBPartners", ["CitizenIDNum"], name: "CitizenIDNum_ndx"
  add_index "tBPartners", ["Company"], name: "Company_ndx"
  add_index "tBPartners", ["Customer"], name: "Customer_ndx"
  add_index "tBPartners", ["Leasing"], name: "Leasing_ndx"
  add_index "tBPartners", ["Supplier"], name: "Supplier_ndx"
  add_index "tBPartners", ["VehicleRegID"], name: "VehicleRegID_ndx"

  create_table "tBackRest", primary_key: "BackRestID", force: true do |t|
    t.datetime "DateProcessed"
    t.boolean  "IsBackup",                  default: false, null: false
    t.integer  "FileSize",      limit: 8
    t.string   "FileName",      limit: 500
    t.integer  "CreatedByID",   limit: 8
  end

  create_table "tBankAccount", primary_key: "BankID", force: true do |t|
    t.string   "BankName",          limit: 100
    t.string   "AccountNumber",     limit: 30
    t.integer  "AccountID"
    t.integer  "CurrencyID",        limit: 2
    t.integer  "BankChargeAccID"
    t.string   "BankAddress",       limit: 500
    t.datetime "DateReconciled"
    t.decimal  "ReconciledBalance",             precision: 19, scale: 4
    t.boolean  "PettyCash",                                              default: false, null: false
    t.boolean  "Active",                                                 default: true,  null: false
    t.string   "VoucherCode",       limit: 50
    t.integer  "TransTypeID"
    t.string   "AccountOwner",      limit: 100
    t.decimal  "BankAdmin",                     precision: 8,  scale: 2, default: 0.0,   null: false
  end

  create_table "tBrand", primary_key: "BrandID", force: true do |t|
    t.string  "BrandName",   limit: 150,                          null: false
    t.integer "ParentID"
    t.integer "BrandTypeID"
    t.integer "PassengerID"
    t.integer "FuelTypeID"
    t.decimal "CylVolume",               precision: 10, scale: 2
  end

  create_table "tBrandType", primary_key: "BrandTypeID", force: true do |t|
    t.string "BrandType", limit: 30
  end

  create_table "tBudget", primary_key: "BudgetID", force: true do |t|
    t.datetime "BudgetPeriod",                                                  null: false
    t.integer  "FiscalID",                                                      null: false
    t.integer  "AccountID",                                                     null: false
    t.integer  "ProjectID",    limit: 8
    t.integer  "OrgID",        limit: 8
    t.decimal  "Amount",                 precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tBusiness", primary_key: "BusinessID", force: true do |t|
    t.string "Business", limit: 200
  end

  add_index "tBusiness", ["Business"], name: "Business_idx"

  create_table "tCalPriv", primary_key: "CalPrivID", force: true do |t|
    t.integer "OwnerID",   limit: 8
    t.integer "AllowedID", limit: 8
  end

  add_index "tCalPriv", ["AllowedID"], name: "tCalPriv_idx"

  create_table "tCalcBOM", primary_key: "CalcBOMID", force: true do |t|
    t.string  "ProdRunKey",     limit: 100
    t.integer "ComponentID",    limit: 8
    t.float   "QtyEachRun",     limit: 53
    t.integer "ProdRunID",      limit: 8
    t.float   "TotalProdQty",   limit: 53
    t.float   "TotalComponent", limit: 53
  end

  create_table "tCard", primary_key: "CardID", force: true do |t|
    t.integer "OrgID",      limit: 8
    t.string  "CardName",   limit: 100
    t.integer "CardType",   limit: 2
    t.string  "MerchantID", limit: 50
  end

  create_table "tCareer", primary_key: "CareerID", force: true do |t|
    t.datetime "DateStart"
    t.integer  "ResID",      limit: 8
    t.integer  "JobTitleID", limit: 8
  end

  create_table "tCategory", primary_key: "CategoryID", force: true do |t|
    t.string  "CategoryCode",     limit: 15
    t.string  "Category",         limit: 200,                 null: false
    t.string  "Description",      limit: 500
    t.boolean "Engine",                       default: false, null: false
    t.boolean "SparePart",                    default: false, null: false
    t.boolean "FinishedGoods",                default: false, null: false
    t.boolean "OnlySA",                       default: false, null: false
    t.integer "ParentID",         limit: 2
    t.integer "SalesAccID"
    t.integer "COGSAccID"
    t.integer "InventoryAccID"
    t.integer "AdjAccID"
    t.integer "WIPAccID"
    t.integer "UsageAccID"
    t.integer "InvWriteOffAccID"
    t.string  "SubCategory",      limit: 200
    t.string  "SubCategoryCode",  limit: 15
    t.boolean "Vehicle",                      default: false, null: false
  end

  add_index "tCategory", ["Category"], name: "Category_idx"

  create_table "tCities", primary_key: "CityID", force: true do |t|
    t.integer "StateID",             null: false
    t.string  "City",    limit: 200, null: false
  end

  create_table "tContacts", primary_key: "ContactID", force: true do |t|
    t.text    "ContactName"
    t.integer "BPID",        limit: 8
    t.string  "Phone",       limit: 150
    t.string  "Cellular",    limit: 150
    t.string  "Fax",         limit: 150
    t.string  "Email",       limit: 150
    t.integer "Salutation",  limit: 2
  end

  create_table "tConvert", primary_key: "ConvertID", force: true do |t|
    t.integer "OLineID",      limit: 8
    t.integer "OrderID",      limit: 8
    t.integer "ProductID",    limit: 8
    t.decimal "QtyConverted",             precision: 19, scale: 4, default: 1.0
    t.integer "CurrencyID",   limit: 2
    t.decimal "ExchangeRate",             precision: 19, scale: 4, default: 1.0
    t.decimal "UnitPrice",                                         default: 0.0
    t.decimal "DiscountRate",             precision: 19, scale: 4, default: 0.0
    t.decimal "Discount",                 precision: 19, scale: 4
    t.decimal "TaxRate",                  precision: 19, scale: 4, default: 0.0
    t.boolean "TaxIncluded",                                       default: false
    t.decimal "ConvertCost",              precision: 19, scale: 4, default: 0.0
    t.integer "AttributeID",  limit: 2
    t.integer "StatusID",     limit: 2
    t.string  "SerialNumber", limit: 100
    t.string  "Remarks",      limit: 200
  end

  create_table "tCostType", primary_key: "CostTypeID", force: true do |t|
    t.string  "CostType",    limit: 50
    t.string  "Description", limit: 200
    t.boolean "Active",                  default: true, null: false
  end

  create_table "tCosting", primary_key: "CostingID", force: true do |t|
    t.integer  "ProductID",    limit: 8
    t.decimal  "LowestPrice",            precision: 19, scale: 4
    t.decimal  "AveragePrice",           precision: 19, scale: 4
    t.decimal  "HighestPrice",           precision: 19, scale: 4
    t.datetime "LastUpdate"
    t.integer  "Components"
    t.boolean  "IncludeScrap",                                    default: false
  end

  create_table "tCounty", primary_key: "CountyID", force: true do |t|
    t.integer "PrefectureID"
    t.string  "Name",         limit: 100, null: false
    t.string  "AltCode",      limit: 20
  end

  create_table "tCurrStock", primary_key: "StockID", force: true do |t|
    t.integer "ProductID",   limit: 8
    t.float   "QtyStocked",  limit: 53
    t.float   "QtyReserved", limit: 53
  end

  create_table "tCurrency", primary_key: "CurrencyID", force: true do |t|
    t.string  "ISOCode",     limit: 3
    t.string  "CurrSymbol",  limit: 10
    t.string  "Description"
    t.boolean "IsDefault"
    t.decimal "CurrentRate"
  end

  create_table "tDOReceive", primary_key: "DOReceiveID", force: true do |t|
    t.integer  "OrgID",          limit: 8
    t.string   "Subject",        limit: 100
    t.integer  "MessageID",      limit: 8
    t.datetime "DateReceived"
    t.datetime "DateProcessed"
    t.boolean  "ProcessError",               default: false, null: false
    t.string   "ProcessMessage", limit: 100
    t.boolean  "Processed",                  default: false, null: false
    t.string   "Attachment",     limit: 50
    t.string   "OrderNo",        limit: 20
    t.integer  "OrderID",        limit: 8
  end

  create_table "tDWG", primary_key: "DWGID", force: true do |t|
    t.integer  "ProcessID",   limit: 8
    t.integer  "OutputID",    limit: 8
    t.integer  "PhaseID",     limit: 8
    t.string   "DWGCode",     limit: 100
    t.string   "DWGDesc",     limit: 500
    t.string   "DWGPath",     limit: 500
    t.datetime "DWGCreated"
    t.datetime "DWGUpdated"
    t.boolean  "ActiveDWG",                default: false
    t.string   "Version",     limit: 15
    t.integer  "DWGLinkTo",   limit: 8
    t.string   "RevNotes",    limit: 1000
    t.integer  "UpdatedByID", limit: 8
    t.integer  "CreatedByID", limit: 8
  end

  add_index "tDWG", ["OutputID", "PhaseID", "DWGCode", "Version"], name: "tDWG_uq", unique: true

  create_table "tDelegates", primary_key: "DelegateID", force: true do |t|
    t.integer "ResID",       limit: 8
    t.integer "DelegatedID", limit: 8
  end

  create_table "tDiscDetail", primary_key: "DiscDetailID", force: true do |t|
    t.integer  "DiscPkgID"
    t.string   "Description",     limit: 100
    t.decimal  "Discount",                    precision: 19, scale: 4,                 null: false
    t.decimal  "DiscountPct",                 precision: 5,  scale: 2,                 null: false
    t.boolean  "Visible",                                                              null: false
    t.boolean  "IsActive",                                                             null: false
    t.integer  "AccountID"
    t.datetime "DateCreated"
    t.integer  "CreatedByID",     limit: 8
    t.datetime "DateUpdated"
    t.integer  "UpdatedByID",     limit: 8
    t.integer  "DebitAccountID"
    t.integer  "CreditAccountID"
    t.boolean  "IsSubsidizedDP",                                       default: false, null: false
  end

  create_table "tDiscPkg", primary_key: "DiscPkgID", force: true do |t|
    t.string   "DiscPkgCode",      limit: 20,                  null: false
    t.string   "Description",      limit: 200
    t.datetime "DateBegin"
    t.datetime "DateEnd"
    t.datetime "DateCreated"
    t.integer  "CreatedByID",      limit: 8
    t.datetime "DateUpdated"
    t.integer  "UpdatedByID",      limit: 8
    t.integer  "OrgID",            limit: 8
    t.integer  "CompanyID",        limit: 8
    t.boolean  "ForPurchaseOrder",             default: false, null: false
  end

  create_table "tDocCost", primary_key: "DocCostID", force: true do |t|
    t.integer "DocID",        limit: 8
    t.integer "CostTypeID"
    t.integer "CurrencyID",   limit: 2
    t.decimal "ExchangeRate",           precision: 19, scale: 4, default: 1.0, null: false
    t.decimal "Amount",                 precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tDocHistory", primary_key: "HistoryID", force: true do |t|
    t.integer  "DocID",       limit: 8
    t.datetime "DateUpdated"
    t.integer  "UpdatedByID", limit: 8
    t.integer  "StatusID",    limit: 2
  end

  create_table "tDocSeq", primary_key: "DocSeqID", force: true do |t|
    t.integer "DocTypeID"
    t.integer "DocMonth",   limit: 2
    t.integer "DocYear"
    t.integer "DocCounter"
  end

  add_index "tDocSeq", ["DocTypeID", "DocMonth", "DocYear"], name: "tDocSeq_uq", unique: true

  create_table "tDocType", primary_key: "DocTypeID", force: true do |t|
    t.string "DocType", limit: 30
  end

  create_table "tDocument", primary_key: "DocID", force: true do |t|
    t.string   "Code",               limit: 30
    t.string   "OfficialNbr",        limit: 50
    t.integer  "DocTypeID"
    t.datetime "DateIssued"
    t.datetime "DateExpired"
    t.string   "OwnerName",          limit: 100
    t.string   "Address",            limit: 500
    t.string   "TaxNumber",          limit: 20
    t.string   "Telephone",          limit: 50
    t.string   "CitizenIDNbr",       limit: 50
    t.datetime "DOB"
    t.integer  "Gender",             limit: 2
    t.string   "PostCode",           limit: 10
    t.integer  "TownshipID"
    t.integer  "BrandID",            limit: 8
    t.string   "VehicleRegNbr",      limit: 15
    t.string   "ChassisSN",          limit: 100
    t.string   "EngineSN",           limit: 100
    t.decimal  "PurchaseValue",                  precision: 19, scale: 4
    t.integer  "VehicleYear"
    t.integer  "VehicleAttributeID", limit: 2
  end

  add_index "tDocument", ["Code"], name: "tDocument_uq2", unique: true
  add_index "tDocument", ["OfficialNbr"], name: "tDocument_uq", unique: true

  create_table "tEAttdPatterns", primary_key: "EAttdPatternID", force: true do |t|
    t.integer  "ResID",         limit: 8
    t.integer  "AttdPatternID"
    t.datetime "ValidBegin"
    t.datetime "ValidEnd"
  end

  create_table "tELeave", primary_key: "ELeaveID", force: true do |t|
    t.integer  "SuperiorID", limit: 8,                                           null: false
    t.integer  "ResID",      limit: 8,                                           null: false
    t.datetime "LeaveBegin"
    t.datetime "LeaveEnd"
    t.integer  "AbnormalID", limit: 2
    t.boolean  "Processed",                                      default: false, null: false
    t.boolean  "Approved",                                       default: false, null: false
    t.boolean  "Rejected",                                       default: false, null: false
    t.string   "LeaveNotes", limit: 250
    t.integer  "DocID",      limit: 8,                                           null: false
    t.decimal  "Days",                   precision: 5, scale: 2
  end

  create_table "tFPTypes", primary_key: "FPTypeID", force: true do |t|
    t.string "FPType", limit: 50
  end

  create_table "tFingers", primary_key: "FingerID", force: true do |t|
    t.integer "ResID",       limit: 8
    t.integer "FingerIndex", limit: 1
    t.string  "FingerData",  limit: 500
  end

  create_table "tFiniteSch", primary_key: "FiniteSchID", force: true do |t|
    t.integer  "ProductID",       limit: 8
    t.float    "Qty",             limit: 53
    t.float    "IdleHour",        limit: 53
    t.float    "RunHours",        limit: 53
    t.datetime "StartProduction"
    t.datetime "StopProduction"
    t.float    "LowestCover",     limit: 53
    t.float    "Offset",          limit: 53
    t.integer  "NextProductID",   limit: 8
    t.float    "Inventory",       limit: 53
    t.float    "Speed",           limit: 53
    t.float    "Forecast",        limit: 53
    t.float    "MinimumCover",    limit: 53
    t.float    "MinimumUnit",     limit: 53
    t.float    "MaximumUnit",     limit: 53
    t.float    "ToMake",          limit: 53
  end

  create_table "tFirm", primary_key: "FirmID", force: true do |t|
    t.string  "FirmCode",   limit: 15
    t.string  "FirmName",   limit: 100
    t.string  "Address",    limit: 500
    t.integer "TownshipID", limit: 8
    t.string  "Telephone",  limit: 50
    t.string  "Fax",        limit: 50
  end

  create_table "tFirmArea", primary_key: "FirmAreaID", force: true do |t|
    t.integer "FirmID",     limit: 8
    t.integer "TownshipID", limit: 8
  end

  create_table "tFiscal", primary_key: "FiscalID", force: true do |t|
    t.datetime "PeriodBegin"
    t.datetime "PeriodEnd"
    t.boolean  "Closed",                default: false, null: false
    t.boolean  "Active",                default: false, null: false
    t.datetime "DateUpdated"
    t.integer  "UpdatedByID", limit: 8
    t.datetime "DateClosed"
    t.integer  "DocID",       limit: 8
  end

  create_table "tFlatBOM", primary_key: "FlatBOMID", force: true do |t|
    t.integer "ProductID",     limit: 8
    t.integer "ComponentID",   limit: 8
    t.decimal "QtyRequired",             precision: 19, scale: 4
    t.integer "CurrencyID"
    t.decimal "ExchangeRate",            precision: 19, scale: 4
    t.decimal "LowestPrice"
    t.decimal "HighestPrice"
    t.decimal "AveragePrice"
    t.boolean "MultiCurrency",                                    default: false
  end

  add_index "tFlatBOM", ["ComponentID"], name: "ComponentID_idx"
  add_index "tFlatBOM", ["ProductID", "ComponentID"], name: "ProductID_ComponentID_idx"
  add_index "tFlatBOM", ["ProductID"], name: "ProductID_idx"

  create_table "tFuelType", primary_key: "FuelTypeID", force: true do |t|
    t.string "FuelType", limit: 30
  end

  create_table "tGLedger", primary_key: "GLID", force: true do |t|
    t.datetime "GLPeriod"
    t.integer  "AccountID"
    t.decimal  "Amount",    precision: 19, scale: 4
  end

  create_table "tGNSRoom", primary_key: "GNSRoomID", force: true do |t|
    t.integer "SurveyID",      limit: 8
    t.integer "CheckFactorID"
    t.string  "FreeText",      limit: 500
    t.integer "YesNo",         limit: 1
  end

  create_table "tGroups", primary_key: "GroupID", force: true do |t|
    t.string "GroupName", limit: 100
    t.string "GroupDesc", limit: 1000
  end

  create_table "tHRDoc", primary_key: "DocID", force: true do |t|
    t.string   "DocNo",         limit: 10
    t.datetime "DateIssued"
    t.string   "CreatedBy",     limit: 30
    t.datetime "DateCreated"
    t.string   "UpdatedBy",     limit: 30
    t.datetime "DateUpdated"
    t.integer  "StatusID",      limit: 2
    t.integer  "DocTypeID",     limit: 2
    t.integer  "DocParentType", limit: 2
    t.integer  "DocYear",       limit: 2
    t.integer  "DocMonth",      limit: 2
    t.integer  "DocCounter"
    t.string   "Remarks",       limit: 500
    t.integer  "OwnerID",       limit: 8
    t.integer  "ApproverID",    limit: 8
  end

  create_table "tHolidays", id: false, force: true do |t|
    t.datetime "Holiday"
  end

  create_table "tImports", id: false, force: true do |t|
    t.integer  "ProductID",    limit: 8
    t.decimal  "QtyIn",                    precision: 19, scale: 4
    t.integer  "CurrencyID"
    t.decimal  "UnitPrice"
    t.datetime "DateMovedIn"
    t.string   "VendorPartNo", limit: 100
    t.string   "StorageBin",   limit: 15
    t.decimal  "AdjustQty",                precision: 19, scale: 4
    t.integer  "StockID",      limit: 8
    t.string   "Weight",       limit: 15
    t.float    "Length",       limit: 53
    t.float    "Width",        limit: 53
    t.float    "Height",       limit: 53
    t.float    "StandbyKVA",   limit: 53
    t.string   "BrandName",    limit: 50
    t.string   "Voltage",      limit: 15
    t.integer  "Phase",        limit: 2
    t.string   "Frequency",    limit: 15
    t.float    "PrimeKVA",     limit: 53
    t.decimal  "Area",                     precision: 38, scale: 7
  end

  create_table "tIncentive", primary_key: "IncentiveID", force: true do |t|
    t.string  "IncentiveName", limit: 50
    t.integer "CalcMethod",    limit: 2,  default: 0
  end

  create_table "tIncentiveRule", primary_key: "IncentiveRuleID", force: true do |t|
    t.integer "IncentiveID"
    t.decimal "LowerBound",             precision: 19, scale: 4
    t.decimal "UpperBound",             precision: 19, scale: 4
    t.integer "RuleOperator", limit: 2
    t.integer "RuleOrder",    limit: 2
    t.decimal "ByPercentage",           precision: 8,  scale: 2
    t.decimal "ByAmount",               precision: 19, scale: 4
  end

  create_table "tIncoterm", primary_key: "ID", force: true do |t|
    t.string "Code",        limit: 10,  null: false
    t.string "Description", limit: 250
  end

  add_index "tIncoterm", ["Code"], name: "uq_Code", unique: true

  create_table "tIncotermDst", primary_key: "ID", force: true do |t|
    t.integer "IncotermID",                  null: false
    t.string  "DestinationCode", limit: 10,  null: false
    t.string  "DestinationName", limit: 100
  end

  add_index "tIncotermDst", ["IncotermID", "DestinationCode"], name: "uq_DestinationCode", unique: true

  create_table "tInvCover", primary_key: "InvCoverID", force: true do |t|
    t.integer "ProductID",       limit: 8
    t.float   "SpeedPerDay",     limit: 53
    t.float   "FSPerMonth",      limit: 53
    t.float   "MinCoverPerDay",  limit: 53
    t.float   "MaxCoverPerDay",  limit: 53
    t.float   "MinUnitPerMonth", limit: 53
    t.float   "MaxUnitPerMonth", limit: 53
  end

  create_table "tInvoice", primary_key: "InvoiceID", force: true do |t|
    t.integer  "DocID",            limit: 8
    t.string   "InvoiceNo",        limit: 50
    t.integer  "OrderID",          limit: 8
    t.datetime "InvoiceDate"
    t.datetime "DueDate"
    t.integer  "CurrencyID",       limit: 2
    t.decimal  "ExchangeRate",                 precision: 19, scale: 4, default: 1.0, null: false
    t.decimal  "InvoiceValue",                 precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "CashAmount",                   precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "OrderValue",                   precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "OrderTaxValue",                precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "OrderShipment",                precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "InventoryValue",               precision: 19, scale: 4, default: 0.0, null: false
    t.string   "Notes",            limit: 200
    t.decimal  "CurrExchangeRate",             precision: 19, scale: 4, default: 1.0, null: false
    t.decimal  "PaidAmount",                   precision: 19, scale: 4, default: 0.0, null: false
  end

  add_index "tInvoice", ["InvoiceNo"], name: "tInvoice_idx"

  create_table "tJobQ", primary_key: "JobQID", force: true do |t|
    t.string   "JobQNumber",       limit: 20
    t.datetime "DateIssued"
    t.datetime "DateConfirmed"
    t.integer  "BPID",             limit: 8
    t.integer  "SvcPackID"
    t.integer  "QueueNumber",      limit: 2
    t.string   "Description",      limit: 500
    t.datetime "DateAssigned"
    t.string   "Suggestion",       limit: 500
    t.string   "Analysis",         limit: 500
    t.integer  "CreatedByID",      limit: 8
    t.integer  "UpdatedByID",      limit: 8
    t.datetime "DateUpdated"
    t.integer  "SignInMileage"
    t.integer  "ResID",            limit: 8
    t.integer  "OrderID",          limit: 8
    t.decimal  "EstimateDuration",             precision: 6,  scale: 2, default: 0.0
    t.decimal  "TipAmount",                    precision: 9,  scale: 2, default: 0.0
    t.datetime "DateStarted"
    t.datetime "DateChecked"
    t.datetime "DateCompleted"
    t.datetime "DateClosed"
    t.decimal  "AddDiscount",                  precision: 9,  scale: 2, default: 0.0
    t.integer  "StatusID",         limit: 2
    t.string   "VoucherNumber",    limit: 20
    t.decimal  "TotalSPPrice",                 precision: 12, scale: 2
    t.decimal  "TotalSVCPrice",                precision: 12, scale: 2
    t.decimal  "TotalOtherSP",                 precision: 12, scale: 2
    t.decimal  "TotalOtherSVC",                precision: 12, scale: 2
    t.integer  "CurrencyID",       limit: 2
    t.decimal  "ExchangeRate",                 precision: 7,  scale: 2
    t.integer  "PrintCount",       limit: 2,                            default: 0
    t.datetime "DatePrinted"
  end

  create_table "tJobQItem", primary_key: "JobQItemID", force: true do |t|
    t.integer "JobQID",       limit: 8
    t.integer "ProductID",    limit: 8
    t.integer "AttributeID",  limit: 2
    t.decimal "Quantity",               precision: 7,  scale: 2
    t.integer "CurrencyID",   limit: 2
    t.decimal "ExchangeRate",           precision: 7,  scale: 2, default: 1.0
    t.decimal "UnitPrice",              precision: 19, scale: 2, default: 0.0
    t.decimal "Discount",               precision: 10, scale: 2, default: 0.0
    t.decimal "DiscountRate",           precision: 3,  scale: 2, default: 0.0
    t.decimal "TaxRate",                precision: 3,  scale: 2, default: 0.0
    t.boolean "TaxIncluded",                                     default: false
    t.boolean "SvcPackItem",                                     default: false
    t.boolean "Pseudo",                                          default: false
  end

  create_table "tJobQPrice", primary_key: "JobQPriceID", force: true do |t|
    t.integer "JobQID",       limit: 8
    t.integer "PriceListID",  limit: 8
    t.integer "SvcPackID"
    t.decimal "UnitPrice",              precision: 19, scale: 4, default: 0.0
    t.integer "CurrencyID",   limit: 2
    t.decimal "ExchangeRate",           precision: 19, scale: 4, default: 1.0
    t.decimal "DiscountRate",           precision: 19, scale: 4, default: 0.0
    t.decimal "Discount",               precision: 19, scale: 4, default: 0.0
    t.decimal "TaxRate",                precision: 19, scale: 4, default: 0.0
    t.boolean "TaxIncluded",                                     default: false
    t.integer "PricingType",  limit: 2,                          default: 0
  end

  create_table "tJobTitles", primary_key: "JobTitleID", force: true do |t|
    t.string "JobTitle", limit: 100
  end

  create_table "tJournal", primary_key: "JournalID", force: true do |t|
    t.integer  "AccountID",                                                         null: false
    t.integer  "CurrencyID",                                                        null: false
    t.decimal  "ExchangeRate",             precision: 19, scale: 4, default: 1.0,   null: false
    t.decimal  "Amount",                   precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "FiscalID",                                                          null: false
    t.integer  "FromFiscalID"
    t.integer  "ResID",        limit: 8
    t.integer  "BPID",         limit: 8
    t.integer  "BankID"
    t.integer  "OrderID",      limit: 8
    t.integer  "DocID",        limit: 8
    t.integer  "CompanyID",    limit: 8,                                            null: false
    t.integer  "OrgID",        limit: 8,                                            null: false
    t.integer  "InvoiceID",    limit: 8
    t.integer  "ProjectID",    limit: 8
    t.integer  "SalesmanID",   limit: 8
    t.datetime "DateJournal"
    t.boolean  "Verified",                                          default: false, null: false
    t.string   "Notes",        limit: 200
    t.datetime "DateCreated"
    t.integer  "CreatedByID",  limit: 8
    t.datetime "DateUpdated"
    t.integer  "UpdatedByID",  limit: 8
    t.boolean  "IsPaidAP",                                          default: false, null: false
    t.boolean  "IsPaidDP",                                          default: false, null: false
    t.datetime "DueDate"
  end

  add_index "tJournal", ["AccountID"], name: "IX_AccountID"
  add_index "tJournal", ["Verified"], name: "IX_Verified"

  create_table "tLeaseDetail", primary_key: "LeaseDetailID", force: true do |t|
    t.integer  "LeasePkgID"
    t.decimal  "Amount",                      precision: 19, scale: 4,                 null: false
    t.decimal  "AmountPct",                   precision: 5,  scale: 2,                 null: false
    t.string   "Description",     limit: 100
    t.boolean  "Visible",                                                              null: false
    t.boolean  "IsActive",                                                             null: false
    t.boolean  "AsDiscount",                                                           null: false
    t.integer  "DebitAccountID"
    t.integer  "CreditAccountID"
    t.datetime "DateCreated"
    t.integer  "CreatedByID",     limit: 8
    t.datetime "DateUpdated"
    t.integer  "UpdatedByID",     limit: 8
    t.boolean  "IsSubsidizedDP",                                       default: false, null: false
  end

  create_table "tLeasePkg", primary_key: "LeasePkgID", force: true do |t|
    t.integer  "BPID",                  limit: 8
    t.string   "PackageCode",           limit: 20
    t.string   "PackageName",           limit: 100
    t.datetime "DateBegin"
    t.datetime "DateEnd"
    t.decimal  "SubsidizedDiscount",                precision: 10, scale: 2
    t.decimal  "SubsidizedDiscountPct",             precision: 5,  scale: 2
    t.datetime "DateCreated"
    t.integer  "CreatedByID",           limit: 8
    t.datetime "DateUpdated"
    t.integer  "UpdatedByID",           limit: 8
    t.integer  "OrgID",                 limit: 8
    t.integer  "CompanyID",             limit: 8
    t.decimal  "Tenor",                             precision: 5,  scale: 2, default: 0.0, null: false
    t.decimal  "InterestRate",                      precision: 5,  scale: 2, default: 0.0, null: false
    t.decimal  "InsuranceRate",                     precision: 5,  scale: 2, default: 0.0, null: false
    t.decimal  "AdminFee",                          precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "DownPayment",                       precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tLeaseScheme", primary_key: "LeaseSchemeID", force: true do |t|
    t.string   "LeaseSchemeName", limit: 200
    t.integer  "BPID",            limit: 8
    t.datetime "DateBegin"
    t.datetime "DateEnd"
  end

  create_table "tLeaveStk", primary_key: "LeaveStkID", force: true do |t|
    t.integer  "StockCode",    limit: 2,                                       null: false
    t.integer  "ResID",        limit: 8,                                       null: false
    t.decimal  "Days",                   precision: 6, scale: 3, default: 0.0, null: false
    t.datetime "DateIssued",                                                   null: false
    t.integer  "PeriodYear",   limit: 2,                                       null: false
    t.decimal  "DaysUsed",               precision: 6, scale: 3, default: 0.0, null: false
    t.decimal  "DaysReserved",           precision: 6, scale: 3, default: 0.0, null: false
    t.decimal  "DaysCash",               precision: 6, scale: 3, default: 0.0, null: false
    t.datetime "DateRedeemed"
  end

  create_table "tLeaveUsg", primary_key: "LeaveUsgID", force: true do |t|
    t.integer  "ELeaveID",    limit: 8,                                       null: false
    t.integer  "LeaveStkID",  limit: 8,                                       null: false
    t.decimal  "DaysInStock",           precision: 6, scale: 3, default: 0.0, null: false
    t.decimal  "DaysUsed",              precision: 6, scale: 3, default: 0.0, null: false
    t.integer  "DocID",       limit: 8,                                       null: false
    t.integer  "ResID",       limit: 8,                                       null: false
    t.datetime "DateCreated"
  end

  create_table "tLoadTest", primary_key: "LoadTestID", force: true do |t|
    t.integer  "DocID",          limit: 8
    t.float    "LoadPct",        limit: 53
    t.float    "PowerKW",        limit: 53
    t.float    "RunHours",       limit: 53
    t.float    "VoltRS",         limit: 53
    t.float    "VoltST",         limit: 53
    t.float    "VoltTR",         limit: 53
    t.float    "PowerFactor",    limit: 53
    t.float    "AmpereR",        limit: 53
    t.float    "AmpereS",        limit: 53
    t.float    "AmpereT",        limit: 53
    t.float    "Speed",          limit: 53
    t.float    "AmbientTemp",    limit: 53
    t.float    "EngineTemp",     limit: 53
    t.float    "OilTemp",        limit: 53
    t.float    "ExhaustTemp",    limit: 53
    t.float    "Frequency",      limit: 53
    t.float    "OilPress",       limit: 53
    t.datetime "DateCreated"
    t.datetime "DateUpdated"
    t.float    "ChargeAirTemp",  limit: 53
    t.float    "ChargeAirPress", limit: 53
    t.string   "ParamName",      limit: 20
  end

  create_table "tLocations", primary_key: "LocationID", force: true do |t|
    t.integer "BPID",         limit: 8
    t.string  "LocationCode", limit: 20
    t.string  "Description",  limit: 200
    t.boolean "Virtual",                  default: false, null: false
    t.boolean "Active",                   default: true,  null: false
    t.integer "OrgID",        limit: 8
    t.integer "CompanyID",    limit: 8
    t.boolean "IsActive",                 default: false, null: false
    t.boolean "IsDefault",                default: false, null: false
    t.boolean "IsHQ",                     default: false, null: false
  end

  create_table "tMembers", primary_key: "MemberID", force: true do |t|
    t.integer "GroupID",           null: false
    t.integer "ResID",   limit: 8, null: false
  end

  create_table "tMenus", primary_key: "MenuID", force: true do |t|
    t.string "MenuName",     limit: 50
    t.string "FormName",     limit: 30
    t.string "AssemblyName", limit: 200
  end

  add_index "tMenus", ["AssemblyName", "FormName", "MenuName", "MenuID"], name: "U_dbo_tMenus_1", unique: true

  create_table "tNCRLines", primary_key: "NCRLineID", force: true do |t|
    t.integer  "OrderID",     limit: 8
    t.string   "ImagePath",   limit: 500
    t.string   "Description", limit: 1000
    t.datetime "DateCreated"
    t.datetime "DateUpdated"
  end

  create_table "tNotes", primary_key: "NoteID", force: true do |t|
    t.integer  "OrderID",     limit: 8
    t.datetime "DateIssued"
    t.integer  "StatusID",    limit: 2
    t.string   "Description", limit: 1000
    t.string   "PIC",         limit: 100
  end

  create_table "tNotify", primary_key: "NotifyID", force: true do |t|
    t.integer "ProductID", limit: 8
    t.string  "Email",     limit: 1000
  end

  create_table "tODoc", primary_key: "ODocID", force: true do |t|
    t.integer  "OLineID",      limit: 8
    t.integer  "OrderID",      limit: 8
    t.integer  "DocID",        limit: 8
    t.datetime "DateReceived"
    t.integer  "StatusID",     limit: 2
    t.integer  "FirmID",       limit: 8
  end

  create_table "tOLines", primary_key: "OLineID", force: true do |t|
    t.integer  "OrderID",          limit: 8
    t.integer  "ProductID",        limit: 8
    t.integer  "CurrencyID",       limit: 2
    t.decimal  "ExchangeRate",                 precision: 19, scale: 4, default: 1.0,   null: false
    t.decimal  "UnitPrice",                    precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "DiscountRate",                 precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "Discount",                     precision: 19, scale: 4,                 null: false
    t.decimal  "TaxRate",                      precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean  "TaxIncluded",                                           default: false, null: false
    t.decimal  "MakeToOrder",                  precision: 19, scale: 4
    t.decimal  "MakeToStock",                  precision: 19, scale: 4
    t.integer  "ColorID",          limit: 2
    t.integer  "AttributeID",      limit: 2
    t.integer  "StatusID",         limit: 2
    t.decimal  "QtyOrdered",                   precision: 19, scale: 4, default: 1.0,   null: false
    t.decimal  "QtyReceived",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "QtyShortage",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "ProcessID",        limit: 8
    t.boolean  "ExternalWO",                                            default: false, null: false
    t.integer  "StockID",          limit: 8
    t.string   "SerialNumber",     limit: 100
    t.integer  "RefOrderID",       limit: 8
    t.string   "Reference",        limit: 100
    t.integer  "InvoiceID",        limit: 8
    t.integer  "FromLocationID"
    t.integer  "UsageID",          limit: 8
    t.integer  "ReturnStatusID",   limit: 2
    t.boolean  "Paid",                                                  default: false, null: false
    t.integer  "FromStockID",      limit: 8
    t.boolean  "PriceInclTax",                                          default: false, null: false
    t.integer  "RetrievalID",      limit: 8
    t.boolean  "SoldByConsignee",                                       default: false, null: false
    t.integer  "UOMID"
    t.decimal  "Conversion",                   precision: 19, scale: 4, default: 1.0,   null: false
    t.integer  "WOProdID",         limit: 8
    t.integer  "RefOLineID",       limit: 8
    t.datetime "PlanStart"
    t.datetime "PlanEnd"
    t.datetime "ActualStart"
    t.datetime "ActualEnd"
    t.decimal  "MaxReturnQty",                 precision: 19, scale: 4, default: 0.0
    t.decimal  "ProcessQty",                   precision: 19, scale: 4
    t.string   "AddSN",            limit: 100
    t.decimal  "DOQty",                        precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "RefOLineIDForDO",  limit: 8
    t.boolean  "Included",                                              default: false, null: false
    t.boolean  "SvcPackItem",                                           default: false, null: false
    t.string   "ScanCode",         limit: 12
    t.integer  "SvcPackID"
    t.boolean  "Additional",                                            default: false, null: false
    t.decimal  "ReadyStock",                   precision: 19, scale: 4
    t.decimal  "Reserved",                     precision: 19, scale: 4
    t.decimal  "UnitFreightCost",              precision: 19, scale: 4, default: 0.0
    t.decimal  "ReturnCOGS",                   precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "ReturnTax",                    precision: 19, scale: 4, default: 0.0
    t.decimal  "AvgCOGS",                      precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "DiscountRate2",                precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "LocationID"
    t.boolean  "IncludeInClaim",                                        default: false, null: false
    t.integer  "ClaimToBPID",      limit: 8
    t.decimal  "Discount2",                    precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean  "AltDiscMethod",                                         default: false, null: false
    t.string   "POSOrderNo",       limit: 20
    t.integer  "PromoID",          limit: 8
    t.string   "PromoCode",        limit: 15
    t.string   "EngineSN",         limit: 100
    t.integer  "IncotermID"
    t.integer  "IncotermDstID"
    t.decimal  "AltUnitPrice",                 precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "AltDiscountRate",              precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "AltDiscountRate2",             precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "AltDiscount",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "AltDiscount2",                 precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "AltExchangeRate",              precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean  "AltTaxIncluded",                                        default: false, null: false
    t.boolean  "AltDiscMethod2",                                        default: false, null: false
    t.decimal  "AltTaxRate",                   precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "AltCurrencyID",    limit: 2,                            default: 0,     null: false
    t.string   "VehicleRegNumber", limit: 20
    t.integer  "ParentID",         limit: 8
    t.decimal  "VehicleTax",                   precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "ActualStockValue",             precision: 19, scale: 4, default: 0.0,   null: false
  end

  add_index "tOLines", ["OLineID"], name: "IX_tOLines", unique: true
  add_index "tOLines", ["OrderID"], name: "OrderID_idx"
  add_index "tOLines", ["ParentID"], name: "IX_tOLines_ParentID"
  add_index "tOLines", ["ProductID"], name: "ProductID_idx"
  add_index "tOLines", ["SerialNumber"], name: "SerialNumber_idx"
  add_index "tOLines", ["WOProdID"], name: "WOProdID_idx"

  create_table "tOT", primary_key: "OTID", force: true do |t|
    t.integer  "SuperiorID", limit: 8
    t.integer  "ResID",      limit: 8
    t.integer  "DocID",      limit: 8
    t.datetime "OTBegin"
    t.datetime "OTEnd"
    t.decimal  "OTHours",                precision: 5, scale: 3, default: 0.0
    t.integer  "OTTypeID",   limit: 2
    t.string   "OTNotes",    limit: 250
    t.boolean  "Approved",                                       default: false, null: false
    t.boolean  "Rejected",                                       default: false, null: false
    t.boolean  "Processed",                                      default: false, null: false
    t.decimal  "OTIndex",                precision: 6, scale: 3
  end

  create_table "tOTTypes", primary_key: "OTTypeID", force: true do |t|
    t.string "OTType", limit: 100
  end

  create_table "tObjCounter", primary_key: "ObjSeqID", force: true do |t|
    t.integer "ObjTypeID",    limit: 2,             null: false
    t.integer "CounterYear",  limit: 2,             null: false
    t.integer "CounterMonth", limit: 2,             null: false
    t.integer "LastCount",              default: 0, null: false
    t.integer "OrgID",        limit: 8
  end

  add_index "tObjCounter", ["OrgID", "ObjTypeID", "CounterYear", "CounterMonth"], name: "IX_tObjCounter", unique: true
  add_index "tObjCounter", ["OrgID", "ObjTypeID", "CounterYear", "CounterMonth"], name: "tObjCounter_OrgID_ndx"

  create_table "tObjOption", primary_key: "ObjOptionID", force: true do |t|
    t.integer "ObjSelectionID"
    t.integer "OptionValue",    limit: 2
    t.string  "OptionName",     limit: 50
  end

  create_table "tObjProp", primary_key: "ObjPropID", force: true do |t|
    t.integer "ObjTypeID",       limit: 2,  null: false
    t.integer "DocParentTypeID", limit: 2
    t.string  "ValueCode",       limit: 10, null: false
    t.string  "ValueName",       limit: 50, null: false
    t.integer "ValueType",       limit: 2,  null: false
    t.integer "ObjSelectionID"
    t.string  "DisplayFormat",   limit: 50
    t.string  "EditFormat",      limit: 50
    t.integer "EditFormatType",  limit: 2
    t.integer "TextLength"
  end

  create_table "tObjPropValue", primary_key: "ObjPropValueID", force: true do |t|
    t.integer  "ResID",           limit: 8
    t.integer  "OrderID",         limit: 8
    t.integer  "DocParentTypeID", limit: 2
    t.integer  "ObjPropID",       limit: 8,                          null: false
    t.integer  "IntergerValue"
    t.decimal  "DecimalValue",              precision: 19, scale: 2
    t.integer  "SelectionValue",  limit: 2
    t.text     "FreeTextValue"
    t.integer  "BPID",            limit: 8
    t.datetime "DateTimeValue"
  end

  create_table "tObjSelection", primary_key: "ObjSelectionID", force: true do |t|
    t.integer "ObjPropID",     limit: 8,  null: false
    t.string  "SelectionName", limit: 50, null: false
  end

  create_table "tOldUnits", id: false, force: true do |t|
    t.string   "Reference",    limit: 200
    t.datetime "DateReceived"
    t.string   "ProductCode",  limit: 50
    t.string   "ProductSN",    limit: 100
    t.decimal  "KVA",                      precision: 6, scale: 2
    t.string   "EngineCode",   limit: 50
    t.string   "EngineSN",     limit: 100
    t.string   "AltCode",      limit: 50
    t.string   "AltSN",        limit: 100
  end

  create_table "tOrderDisc", primary_key: "OrderDiscID", force: true do |t|
    t.integer "OrderID",      limit: 8
    t.integer "DiscDetailID", limit: 8
    t.decimal "Discount",               precision: 19, scale: 4, default: 0.0, null: false
    t.decimal "DiscountPct",            precision: 5,  scale: 2, default: 0.0, null: false
  end

  create_table "tOrderHistory", primary_key: "HistoryID", force: true do |t|
    t.integer  "OrderID",     limit: 8
    t.datetime "DateUpdated"
    t.integer  "UpdatedByID", limit: 8
    t.integer  "StatusID",    limit: 2
  end

  create_table "tOrderLease", primary_key: "OrderLeaseID", force: true do |t|
    t.integer "OrderID",       limit: 8
    t.integer "LeaseDetailID", limit: 8
    t.decimal "Amount",                  precision: 19, scale: 4, default: 0.0, null: false
    t.decimal "AmountPct",               precision: 5,  scale: 2, default: 0.0, null: false
  end

  create_table "tOrderPromo", primary_key: "OrderPromoID", force: true do |t|
    t.integer "OrderID", limit: 8
    t.integer "PromoID", limit: 8
  end

  create_table "tOrderRef", primary_key: "OrderRefID", force: true do |t|
    t.integer  "ResID",          limit: 8
    t.integer  "OrgID",          limit: 8
    t.integer  "OrderID",        limit: 8
    t.string   "OrderRefNumber", limit: 25
    t.datetime "DateCreated"
    t.integer  "RefCounter",     limit: 8
    t.integer  "StatusID",       limit: 2
    t.string   "Notes",          limit: 500
  end

  create_table "tOrderRefStatus", primary_key: "StatusID", force: true do |t|
    t.string "Status", limit: 100, null: false
  end

  create_table "tOrders", primary_key: "OrderID", force: true do |t|
    t.string   "OrderNo",             limit: 20
    t.integer  "InvoiceID",           limit: 8
    t.datetime "DateCreated"
    t.string   "CreatedBy",           limit: 30
    t.string   "UpdatedBy",           limit: 30
    t.integer  "CreatedByID",         limit: 8
    t.integer  "UpdatedByID",         limit: 8
    t.integer  "SvcPackID"
    t.datetime "DateIssued"
    t.datetime "DateUpdated"
    t.datetime "DateConfirmed"
    t.datetime "DateAssigned"
    t.datetime "DateChecked"
    t.datetime "DateStarted"
    t.datetime "DateCompleted"
    t.datetime "DateClosed"
    t.datetime "DatePaid"
    t.datetime "DateRequired"
    t.datetime "DatePlanStart"
    t.datetime "DatePlanEnd"
    t.datetime "DateActualStart"
    t.datetime "DateActualEnd"
    t.datetime "DatePrinted"
    t.datetime "DateInvoiced"
    t.integer  "PrintCount",          limit: 2,                            default: 0
    t.datetime "DuePayment"
    t.datetime "ExtWODueDate"
    t.datetime "DeliveryDate"
    t.integer  "QueueNumber",         limit: 2
    t.integer  "StatusID",            limit: 2
    t.integer  "DocTypeID",           limit: 2
    t.integer  "CurrencyID",          limit: 2
    t.decimal  "ExchangeRate",                    precision: 7,  scale: 2, default: 1.0
    t.integer  "ShipTo",              limit: 8
    t.integer  "BillTo",              limit: 8
    t.integer  "DocYear",             limit: 2
    t.integer  "DocMonth",            limit: 2
    t.integer  "DocCounter"
    t.integer  "BPID",                limit: 8
    t.string   "Reference",           limit: 100
    t.boolean  "PartialShipment"
    t.integer  "DocParentType",       limit: 2
    t.integer  "PaymentID",           limit: 2
    t.decimal  "ShipmentCost",                    precision: 19, scale: 4, default: 0.0
    t.string   "Notes",               limit: 500
    t.integer  "RefOrderID",          limit: 8
    t.integer  "FromLocationID"
    t.integer  "ToLocationID"
    t.integer  "Revision",            limit: 2
    t.integer  "RefOrderIDForDO",     limit: 8
    t.integer  "PackagingID",         limit: 2
    t.string   "VesselName",          limit: 100
    t.integer  "Approval1"
    t.integer  "Approval2"
    t.integer  "WOToLocationID"
    t.string   "AltShipTo",           limit: 500
    t.integer  "ProductUserID",       limit: 8
    t.integer  "SalesmanID",          limit: 8
    t.integer  "RMATypeID"
    t.boolean  "Paid",                                                     default: false
    t.integer  "ValidityID"
    t.integer  "SOState"
    t.integer  "ProductID",           limit: 8
    t.decimal  "NCRQty",                          precision: 19, scale: 4, default: 0.0
    t.string   "SerialNumber",        limit: 100
    t.integer  "ContractID",          limit: 8
    t.string   "AltPhoneNo",          limit: 100
    t.string   "AltCustomer",         limit: 100
    t.string   "AltPIC",              limit: 100
    t.boolean  "Urgent",                                                   default: false
    t.integer  "WOProdID",            limit: 8
    t.integer  "OwnerID",             limit: 8
    t.decimal  "AddDiscount",                     precision: 19, scale: 4, default: 0.0
    t.integer  "MechanicID",          limit: 8
    t.string   "Analysis",            limit: 500
    t.string   "Suggestion",          limit: 500
    t.integer  "SignInMileage"
    t.integer  "ReturnMileage"
    t.decimal  "EstimateDuration",                precision: 6,  scale: 2, default: 0.0
    t.decimal  "TipAmount",                       precision: 9,  scale: 2, default: 0.0
    t.decimal  "TotalSPPrice",                    precision: 12, scale: 2, default: 0.0
    t.decimal  "TotalSVCPrice",                   precision: 12, scale: 2, default: 0.0
    t.decimal  "TotalOtherSP",                    precision: 12, scale: 2
    t.decimal  "TotalOtherSVC",                   precision: 12, scale: 2
    t.string   "VoucherNumber",       limit: 20
    t.integer  "ReasonID"
    t.string   "CancelNotes",         limit: 500
    t.integer  "PaymentDocID",        limit: 8
    t.string   "InvoiceNumber",       limit: 20
    t.integer  "FiscalID"
    t.integer  "OrgID",               limit: 8
    t.integer  "ProjectID",           limit: 8
    t.integer  "AccDocID",            limit: 8
    t.integer  "BankID"
    t.integer  "CompanyID",           limit: 8
    t.integer  "RefAccDocID",         limit: 8
    t.integer  "ReturnType",          limit: 2,                            default: 0
    t.decimal  "DownPayment",                     precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "SalesPersonID",       limit: 8
    t.string   "CreditCard",          limit: 16
    t.integer  "POSPaymentType",      limit: 2,                            default: 0,     null: false
    t.decimal  "POSTotalAmount",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "POSActualPaid",                   precision: 19, scale: 4, default: 0.0,   null: false
    t.string   "CCOwner",             limit: 50
    t.integer  "FromOrgID",           limit: 8
    t.integer  "ToOrgID",             limit: 8
    t.string   "OverrideNotes",       limit: 50
    t.datetime "DateOverride"
    t.datetime "CCExpired"
    t.decimal  "CashPayment",                     precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "POSReceiveID",        limit: 8
    t.integer  "LeasingID",           limit: 8
    t.integer  "LeasePkgID"
    t.datetime "DateDelivered"
    t.integer  "ProcessForBPID",      limit: 8
    t.integer  "IncotermID"
    t.integer  "IncotermDstID"
    t.string   "TaxInvoiceNbr",       limit: 50
    t.string   "POSOrderNo",          limit: 20
    t.integer  "POSOrderID",          limit: 8
    t.string   "LeasePONumber",       limit: 50
    t.decimal  "OrderDiscountPct",                precision: 8,  scale: 4, default: 0.0,   null: false
    t.decimal  "OrderDiscount",                   precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "DriverID",            limit: 8
    t.integer  "CarrierID",           limit: 8
    t.decimal  "LoanTenor",                       precision: 5,  scale: 2, default: 0.0,   null: false
    t.decimal  "LoanAmount",                      precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "SubsidizedDP",                    precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "InstallmentAmount",               precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "AnnualInterestRate",              precision: 5,  scale: 2, default: 0.0,   null: false
    t.decimal  "FirstPaymentAmount",              precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "LoanInsuranceAmount",             precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "PaidDP",                          precision: 19, scale: 4, default: 0.0,   null: false
    t.datetime "DateEmailed"
  end

  add_index "tOrders", ["BPID"], name: "BPID_idx"
  add_index "tOrders", ["DateIssued"], name: "DateIssued_idx"
  add_index "tOrders", ["DocParentType"], name: "DocParentType_idx"
  add_index "tOrders", ["DocYear", "DocParentType", "DocTypeID", "DocCounter"], name: "DocCounter_idx"
  add_index "tOrders", ["DuePayment"], name: "DuePayment_idx"
  add_index "tOrders", ["InvoiceNumber"], name: "ndx_tOrders_InvoiceNumber"
  add_index "tOrders", ["Notes"], name: "Notes_idx"
  add_index "tOrders", ["OrderNo"], name: "OrderNo_idx", unique: true
  add_index "tOrders", ["POSReceiveID"], name: "ndx_tOrders_POSReceiveID"
  add_index "tOrders", ["Reference"], name: "Reference_idx"
  add_index "tOrders", ["StatusID"], name: "StatusID_idx"

  create_table "tOrg", primary_key: "OrgID", force: true do |t|
    t.integer "CompanyID",          limit: 8
    t.string  "OrgCode",            limit: 15,                  null: false
    t.string  "OrgName",            limit: 200,                 null: false
    t.integer "OrgType",            limit: 2
    t.integer "ParentID",           limit: 8
    t.boolean "Active",                         default: true,  null: false
    t.string  "VoucherCode",        limit: 15
    t.boolean "SyncMaster",                     default: false, null: false
    t.string  "MerchantID",         limit: 50
    t.string  "IMAPServer",         limit: 50
    t.string  "IMAPUser",           limit: 50
    t.string  "IMAPPassword",       limit: 50
    t.integer "IMAPPort",           limit: 2
    t.boolean "IMAPTLS",                        default: true,  null: false
    t.boolean "IMAPSSL",                        default: false, null: false
    t.string  "TransitAddress",     limit: 200
    t.string  "SMTPServer",         limit: 50
    t.string  "SMTPUser",           limit: 50
    t.string  "SMTPPassword",       limit: 50
    t.integer "SMTPPort",           limit: 2
    t.boolean "SMTPTLS",                        default: true,  null: false
    t.boolean "SMTPSSL",                        default: false, null: false
    t.integer "DeleteBeforeMonths", limit: 2,   default: 3,     null: false
    t.boolean "DataTransit",                    default: false, null: false
    t.string  "DealerCode",         limit: 10
    t.boolean "IsIntern"
  end

  create_table "tOrgGroup", primary_key: "OrgGroupID", force: true do |t|
    t.string "OrgGroupCode", limit: 20,  null: false
    t.string "OrgGroupName", limit: 200, null: false
  end

  create_table "tOrgGroupDetail", primary_key: "OrgGroupDetailID", force: true do |t|
    t.integer "OrgID",       limit: 8
    t.boolean "IsDrillDown",           default: false, null: false
    t.integer "OrgGroupID"
  end

  create_table "tOutputs", primary_key: "OutputID", force: true do |t|
    t.integer  "ProcessID",   limit: 8
    t.integer  "ProductID",   limit: 8
    t.decimal  "QtyProduced",             precision: 19, scale: 4
    t.boolean  "ExternalWO"
    t.integer  "AttributeID", limit: 2
    t.string   "DrawingCode", limit: 100
    t.decimal  "EffArea",                 precision: 19, scale: 4, default: 0.0
    t.string   "DWGPath",     limit: 500
    t.string   "DWGDesc",     limit: 500
    t.datetime "DWGCreated"
    t.datetime "DWGUpdated"
    t.decimal  "Duration",                precision: 19, scale: 4
    t.decimal  "ManPower",                precision: 10, scale: 2
    t.boolean  "ExcludeInWO",                                      default: false
  end

  create_table "tPLGroup", primary_key: "PLGroupID", force: true do |t|
    t.string  "PLGroup",       limit: 200, null: false
    t.integer "GroupPosition", limit: 2
  end

  create_table "tPOActions", primary_key: "POActionID", force: true do |t|
    t.integer  "ComponentID", limit: 8
    t.datetime "StartDate"
    t.string   "ProdRunKey",  limit: 100
    t.float    "GetIn",       limit: 53
    t.float    "OnOrder",     limit: 53
    t.float    "Balance",     limit: 53
  end

  create_table "tPOSOrder", primary_key: "POSOrderID", force: true do |t|
    t.string   "OrderNo",       limit: 20
    t.integer  "OrderID",       limit: 8
    t.integer  "OrgID",         limit: 8
    t.datetime "DateProcessed"
    t.integer  "POSReceivedID", limit: 8
    t.string   "CreditCard",    limit: 16
    t.string   "CCOwner",       limit: 50
    t.datetime "CCExpired"
    t.integer  "AccDocID",      limit: 8
    t.integer  "DocParentType", limit: 2
  end

  create_table "tPOSReceive", primary_key: "POSReceiveID", force: true do |t|
    t.integer  "OrgID",             limit: 8
    t.string   "Subject",           limit: 100
    t.integer  "MessageID",         limit: 8
    t.datetime "DateReceived"
    t.datetime "DateProcessed"
    t.boolean  "ProcessError",                  default: false, null: false
    t.string   "ProcessMessage",    limit: 100
    t.boolean  "Processed",                     default: false, null: false
    t.string   "Attachment",        limit: 50
    t.string   "OrderNo",           limit: 20
    t.integer  "OrderID",           limit: 8
    t.string   "AccDocNo",          limit: 50
    t.integer  "AccDocID",          limit: 8
    t.boolean  "IsShortage",                    default: false, null: false
    t.integer  "ShortageProductID", limit: 8
    t.text     "ErrorDetail"
  end

  add_index "tPOSReceive", ["DateProcessed"], name: "ndx_tPOSReceive_DateProcessed"
  add_index "tPOSReceive", ["DateReceived"], name: "ndx_tPOSReceive_DateReceived"
  add_index "tPOSReceive", ["OrgID"], name: "ndx_tPOSReceive_OrgID"

  create_table "tPOSTransit", primary_key: "POSTransitID", force: true do |t|
    t.integer  "OrderID",         limit: 8
    t.string   "OrderNo",         limit: 100
    t.datetime "DateSent"
    t.datetime "DateReceived"
    t.datetime "DateProcessed"
    t.integer  "OriginOrderID",   limit: 8
    t.string   "OriginOrderNo",   limit: 20
    t.string   "OriginOrgCode",   limit: 15
    t.integer  "ReceivedByID",    limit: 8
    t.integer  "SentByID",        limit: 8
    t.integer  "ProcessedByID",   limit: 8
    t.boolean  "ProcessError",                 default: false, null: false
    t.string   "ErrorMessage",    limit: 500
    t.integer  "SendCount",                    default: 0,     null: false
    t.string   "Notes",           limit: 1000
    t.datetime "TransactionDate"
  end

  create_table "tPOSch", primary_key: "POSchID", force: true do |t|
    t.integer  "ProductID",  limit: 8
    t.float    "QtyOrdered", limit: 53
    t.datetime "DueIn"
  end

  create_table "tPackaging", primary_key: "PackagingID", force: true do |t|
    t.string "Packaging", limit: 100
  end

  create_table "tPassenger", primary_key: "PassengerID", force: true do |t|
    t.string "Passenger", limit: 30
  end

  create_table "tPayments", primary_key: "PaymentID", force: true do |t|
    t.string  "PaymentTerm",     limit: 100
    t.integer "OnDateMonthly",   limit: 2
    t.integer "NetDaysAfterGR",  limit: 2
    t.boolean "IsDefault"
    t.integer "NetMonthAfterGR", limit: 2
    t.integer "NetWeeksAfterGR", limit: 2
    t.boolean "IsSales",                     default: false, null: false
    t.boolean "IsSalesDefault",              default: false, null: false
    t.boolean "CashPayment",                 default: false, null: false
  end

  create_table "tPhases", primary_key: "PhaseID", force: true do |t|
    t.integer  "ProcessID",     limit: 8
    t.string   "ParentDrawing", limit: 100
    t.string   "ChildDrawing",  limit: 100
    t.string   "Description",   limit: 500
    t.integer  "ComponentID",   limit: 8
    t.decimal  "Length",                    precision: 19, scale: 4
    t.decimal  "Width",                     precision: 19, scale: 4
    t.integer  "AttributeID"
    t.decimal  "QtyRequired",               precision: 19, scale: 4
    t.string   "DWGPath",       limit: 500
    t.string   "DWGDesc",       limit: 500
    t.datetime "DWGCreated"
    t.datetime "DWGUpdated"
    t.decimal  "Duration",                  precision: 19, scale: 4
    t.integer  "OutputID",      limit: 8
    t.decimal  "ManPower",                  precision: 10, scale: 2
    t.integer  "ProductID",     limit: 8
  end

  create_table "tPowerAttr", primary_key: "PowerAttrID", force: true do |t|
    t.string  "Attribute",        limit: 100
    t.integer "Phase",            limit: 1
    t.float   "Frequency",        limit: 53
    t.float   "Voltage",          limit: 53
    t.float   "PowerFactor",      limit: 53
    t.float   "ConversionFactor", limit: 53
    t.float   "RPM",              limit: 53
  end

  create_table "tPrefecture", primary_key: "PrefectureID", force: true do |t|
    t.integer "ProvinceID"
    t.string  "Name",       limit: 100,                 null: false
    t.boolean "City",                   default: false, null: false
    t.string  "AltCode",    limit: 20
  end

  create_table "tPriceList", primary_key: "PriceListID", force: true do |t|
    t.integer  "BPID",          limit: 8
    t.integer  "ProductID",     limit: 8
    t.integer  "SvcPackID"
    t.decimal  "UnitPrice",               precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "CurrencyID",    limit: 2
    t.decimal  "ExchangeRate",            precision: 19, scale: 4, default: 1.0,   null: false
    t.decimal  "DiscountRate",            precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "Discount",                precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "TaxRate",                 precision: 19, scale: 4, default: 0.0,   null: false
    t.datetime "DateBegin"
    t.datetime "DateEnd"
    t.boolean  "TaxIncluded",                                      default: false, null: false
    t.integer  "PricingTypeID", limit: 2,                          default: 0
    t.boolean  "IsSalesPrice",                                     default: true,  null: false
    t.decimal  "DiscountRate2",           precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "Discount2",               precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean  "AltDiscMethod",                                    default: false, null: false
    t.datetime "DateSetup"
    t.integer  "OrgID",         limit: 8
    t.integer  "CompanyID",     limit: 8
    t.decimal  "VehicleTax",              precision: 19, scale: 4, default: 0.0,   null: false
  end

  create_table "tPricingType", primary_key: "PricingTypeID", force: true do |t|
    t.string "PricingType", limit: 50
  end

  create_table "tProcess", primary_key: "ProcessID", force: true do |t|
    t.string  "ProcessCode", limit: 20
    t.string  "ProcessName", limit: 200
    t.integer "FPTypeID",    limit: 2
    t.boolean "Raw",                     default: false, null: false
    t.boolean "CompleteSet",             default: true,  null: false
    t.boolean "Active",                  default: true,  null: false
  end

  create_table "tProdLoc", primary_key: "ProdLocID", force: true do |t|
    t.integer "ProductID",  limit: 8
    t.integer "OrgID",      limit: 8
    t.integer "LocationID"
  end

  create_table "tProdPlans", primary_key: "ProdPlanID", force: true do |t|
    t.integer  "DocID",       limit: 8
    t.integer  "ProductID",   limit: 8
    t.integer  "AttributeID"
    t.decimal  "QtyProduced",           precision: 19, scale: 4
    t.datetime "PlanStart"
    t.datetime "PlanFinish"
  end

  create_table "tProdRuns", primary_key: "ProdRunID", force: true do |t|
    t.integer  "ProductID",  limit: 8
    t.string   "ProdRunKey", limit: 100
    t.datetime "ProdTime"
    t.float    "TotalQty",   limit: 53
  end

  create_table "tProductImg", primary_key: "ProductImgID", force: true do |t|
    t.integer "ProductID",    limit: 8
    t.binary  "ProductImage"
  end

  create_table "tProductSN", primary_key: "ProductSNID", force: true do |t|
    t.integer "ProductID", limit: 8
    t.integer "SNTypeID"
    t.boolean "Mandatory",           default: true, null: false
  end

  create_table "tProductStatus", primary_key: "ProductStatusID", force: true do |t|
    t.string  "ProductStatusCode", limit: 5
    t.string  "ProductStatus",     limit: 200
    t.decimal "DiscountRate",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal "Discount",                      precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal "DiscountRate2",                 precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal "Discount2",                     precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean "TaxIncluded",                                            default: false, null: false
    t.boolean "AltDiscMethod",                                          default: false, null: false
    t.boolean "DefaultStatus",                                          default: false, null: false
    t.boolean "Active",                                                 default: true,  null: false
    t.integer "ParentID"
    t.boolean "ApplyDiscount",                                          default: false, null: false
    t.decimal "TaxRate",                       precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal "UnitPrice",                     precision: 19, scale: 4
    t.decimal "QtyPerUnitPrice",               precision: 8,  scale: 2, default: 1.0,   null: false
  end

  create_table "tProductStatusHistory", primary_key: "ProductStatusHistoryID", force: true do |t|
    t.integer  "ProductStatusID"
    t.datetime "DateUpdated"
    t.integer  "ProductID",       limit: 8
    t.integer  "AttributeID",     limit: 2
  end

  create_table "tProducts", primary_key: "ProductID", force: true do |t|
    t.string   "KeyName",             limit: 50
    t.string   "ShortDesc",           limit: 400
    t.text     "LongDesc"
    t.integer  "UOMID"
    t.integer  "CategoryID",          limit: 2
    t.boolean  "Serialized",                                               default: false
    t.string   "SNPrefix",            limit: 10
    t.string   "SNSuffix",            limit: 10
    t.decimal  "MinimumStock",                    precision: 19, scale: 4
    t.decimal  "LeadTime",                        precision: 19, scale: 4
    t.decimal  "SafetyStock",                     precision: 19, scale: 4
    t.decimal  "Area",                            precision: 19, scale: 4
    t.decimal  "Length",                          precision: 19, scale: 4
    t.decimal  "Width",                           precision: 19, scale: 4
    t.decimal  "Height",                          precision: 19, scale: 4
    t.decimal  "Thickness",                       precision: 19, scale: 4
    t.decimal  "Weight",                          precision: 19, scale: 4
    t.decimal  "ScrapFactor",                     precision: 6,  scale: 3
    t.integer  "BPID",                limit: 8
    t.integer  "SNStart"
    t.boolean  "Pseudo",                                                   default: false, null: false
    t.boolean  "Residual",                                                 default: false
    t.boolean  "RoundedQty",                                               default: false
    t.boolean  "PreShipment",                                              default: false
    t.boolean  "Purchased",                                                default: false
    t.boolean  "Produced",                                                 default: false
    t.boolean  "Obsolete",                                                 default: false
    t.datetime "DateCreated"
    t.string   "CreatedBy",           limit: 100
    t.datetime "DateUpdated"
    t.string   "UpdatedBy",           limit: 100
    t.integer  "FPTypeID",            limit: 2
    t.boolean  "ReqAttribute",                                             default: false
    t.decimal  "LowestCost",                      precision: 19, scale: 4
    t.decimal  "AverageCost",                     precision: 19, scale: 4
    t.decimal  "HighestCost",                     precision: 19, scale: 4
    t.boolean  "CostIncludeScrap",                                         default: false
    t.datetime "CostLastUpdate"
    t.decimal  "LotSize",                         precision: 19, scale: 4, default: 1.0
    t.decimal  "AvgUsage",                        precision: 19, scale: 4
    t.boolean  "NoCosting",                                                default: false
    t.integer  "LocationID"
    t.integer  "StorageID"
    t.integer  "BrandID"
    t.integer  "BrandTypeID"
    t.integer  "SubTypeID"
    t.boolean  "ForSaleOnly",                                              default: false
    t.integer  "SalesAccID"
    t.integer  "InventoryAccID"
    t.integer  "COGSAccID"
    t.integer  "StockAdjAccID"
    t.integer  "AssemblyAccID"
    t.decimal  "ReadyStock",                      precision: 19, scale: 4, default: 0.0
    t.decimal  "QtyReserved",                     precision: 19, scale: 4, default: 0.0
    t.decimal  "FIFOCOGS",                        precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "AvgCOGS",                         precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "LIFOCOGS",                        precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean  "Consumables",                                              default: false
    t.integer  "UsageAccID"
    t.boolean  "FixedAsset",                                               default: false, null: false
    t.integer  "FixedAssetAccID"
    t.boolean  "Active",                                                   default: true,  null: false
    t.decimal  "LastAvgCOGS",                     precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "UnderQtyRate",                    precision: 5,  scale: 4, default: 0.0,   null: false
    t.decimal  "OverQtyRate",                     precision: 5,  scale: 4, default: 0.0,   null: false
    t.decimal  "ShelfLife",                       precision: 19, scale: 4
    t.boolean  "AutoSN",                                                   default: false, null: false
    t.string   "AutoSNFormat",        limit: 50
    t.string   "UPC",                 limit: 20
    t.integer  "LastProductStatusID"
  end

  add_index "tProducts", ["CategoryID"], name: "Category_idx"
  add_index "tProducts", ["FPTypeID"], name: "FPTypeID_idx"
  add_index "tProducts", ["KeyName"], name: "tProducts_uq", unique: true
  add_index "tProducts", ["ShortDesc"], name: "ShortDesc_idx"

  create_table "tProjCover", primary_key: "ProjCoverID", force: true do |t|
    t.integer "FiniteSchID", limit: 8
    t.integer "ProductID",   limit: 8
    t.float   "CoverRatio",  limit: 53
  end

  create_table "tProjStock", primary_key: "ProjStockID", force: true do |t|
    t.integer "FiniteSchID", limit: 8
    t.integer "ProductID",   limit: 8
    t.float   "Qty",         limit: 53
  end

  create_table "tProject", primary_key: "ProjectID", force: true do |t|
    t.string   "ProjectCode", limit: 15,  null: false
    t.string   "ProjectName", limit: 200, null: false
    t.datetime "DateStart",               null: false
    t.datetime "DateEnd",                 null: false
    t.integer  "CompanyID",   limit: 8
  end

  create_table "tPromo", primary_key: "PromoID", force: true do |t|
    t.string   "PromoCode",            limit: 15,                                           null: false
    t.string   "Description",          limit: 200
    t.datetime "DateBegin",                                                                 null: false
    t.datetime "DateEnd",                                                                   null: false
    t.integer  "CurrencyID",           limit: 2
    t.decimal  "ExchangeRate",                     precision: 19, scale: 4, default: 1.0,   null: false
    t.decimal  "UnitPrice",                        precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "Discount",                         precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "DiscountRate",                     precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "Discount2",                        precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "DiscountRate2",                    precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "TaxRate",                          precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean  "TaxIncluded",                                               default: false, null: false
    t.boolean  "AltDiscMethod",                                             default: false, null: false
    t.boolean  "ForAllOrg",                                                 default: true,  null: false
    t.decimal  "PromoMaxQty",                      precision: 9,  scale: 2, default: 0.0,   null: false
    t.boolean  "IsPackagePrice",                                            default: false, null: false
    t.decimal  "PackageQty",                       precision: 9,  scale: 2, default: 1.0,   null: false
    t.decimal  "FreeQty",                          precision: 9,  scale: 2
    t.boolean  "PromoFreeProduct",                                          default: false, null: false
    t.boolean  "IsDiscountForLowest",                                       default: false, null: false
    t.boolean  "IsDiscountForProduct",                                      default: false, null: false
  end

  create_table "tPromoItem", primary_key: "PromoItemID", force: true do |t|
    t.integer "PromoID",          limit: 8
    t.integer "ProductID",        limit: 8
    t.integer "AttributeID",      limit: 2
    t.decimal "PromoQty",                   precision: 19, scale: 4, default: 1.0,   null: false
    t.integer "CurrencyID",       limit: 2,                                          null: false
    t.decimal "ExchangeRate",               precision: 19, scale: 4, default: 1.0,   null: false
    t.decimal "UnitPrice",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal "DiscountRate",               precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal "Discount",                   precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal "DiscountRate2",              precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal "Discount2",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal "TaxRate",                    precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean "TaxIncluded",                                         default: false, null: false
    t.boolean "AltDiscMethod",                                       default: false, null: false
    t.boolean "OptionalItem",                                        default: false, null: false
    t.boolean "IsPackageProduct",                                    default: false, null: false
    t.boolean "IsFreeProduct",                                       default: false, null: false
  end

  create_table "tPromoOrg", primary_key: "PromoOrgID", force: true do |t|
    t.integer "PromoID", limit: 8
    t.integer "OrgID",   limit: 8
  end

  create_table "tProvince", primary_key: "ProvinceID", force: true do |t|
    t.integer "CountryID"
    t.string  "Name",      limit: 100, null: false
    t.string  "AltCode",   limit: 20
  end

  create_table "tRFQLines", primary_key: "RFQLineID", force: true do |t|
    t.integer "OrderID",      limit: 8
    t.integer "ProductID",    limit: 8
    t.decimal "QtyDesired",               precision: 19, scale: 4, default: 1.0
    t.integer "CurrencyID",   limit: 2
    t.decimal "ExchangeRate",                                      default: 1.0
    t.decimal "TaxRate",                  precision: 19, scale: 4, default: 0.0
    t.integer "AttributeID",  limit: 8
    t.string  "Notes",        limit: 500
    t.integer "StatusID",     limit: 2
    t.decimal "UnitPrice",                                         default: 0.0
    t.decimal "DiscountRate",             precision: 19, scale: 4, default: 0.0
    t.integer "BPID",         limit: 8
    t.integer "RefOrderID",   limit: 8
  end

  create_table "tRMATypes", primary_key: "RMATypeID", force: true do |t|
    t.string  "RMAType",       limit: 100
    t.integer "StatusID"
    t.boolean "Scrapped",                  default: false
    t.integer "DocParentType", limit: 2
    t.boolean "NCR",                       default: false
  end

  create_table "tReason", primary_key: "ReasonID", force: true do |t|
    t.string "Reason", limit: 250
  end

  create_table "tRelDoc", primary_key: "RelDocID", force: true do |t|
    t.integer "ParentDocID",  limit: 8
    t.integer "RelatedDocID", limit: 8
  end

  create_table "tReligion", primary_key: "ReligionID", force: true do |t|
    t.string "Religion", limit: 15
  end

  create_table "tRes", primary_key: "ResID", force: true do |t|
    t.string   "ResCode",          limit: 20
    t.string   "ResName",          limit: 100
    t.integer  "ResTypeID",        limit: 2
    t.datetime "DateCreated"
    t.string   "CreatedBy",        limit: 50
    t.datetime "DateUpdated"
    t.string   "UpdatedBy",        limit: 50
    t.string   "Email",            limit: 100
    t.string   "LoginName",        limit: 100
    t.datetime "DOB"
    t.integer  "CityID"
    t.string   "POB",              limit: 100
    t.binary   "ResImage"
    t.integer  "ResGrpID",         limit: 2
    t.string   "ResDomain",        limit: 30
    t.boolean  "SuperAdmin",                                           default: false, null: false
    t.string   "UserName",         limit: 50
    t.string   "ResTitle",         limit: 30
    t.string   "NickName",         limit: 20
    t.integer  "FingerID"
    t.boolean  "Active",                                               default: true,  null: false
    t.boolean  "TimeAttd",                                             default: true,  null: false
    t.integer  "PatternID",        limit: 8,                           default: 1
    t.boolean  "ConfirmedSOMail",                                      default: false, null: false
    t.boolean  "ClosedWOMail",                                         default: false, null: false
    t.boolean  "DeliveredDOMail",                                      default: false, null: false
    t.integer  "BPID",             limit: 8
    t.boolean  "Mechanic",                                             default: false, null: false
    t.binary   "IDCardPicture"
    t.datetime "DateEmployed"
    t.datetime "DateDismissed"
    t.decimal  "ServiceIncentive",             precision: 4, scale: 2, default: 0.0
    t.integer  "CompanyID",        limit: 8
    t.integer  "OrgID",            limit: 8
    t.integer  "ReligionID",       limit: 2
    t.string   "SocialIDNbr",      limit: 50
    t.boolean  "SalesPerson",                                          default: false, null: false
    t.boolean  "SAStock",                                              default: false, null: false
    t.string   "AltCode",          limit: 20
  end

  add_index "tRes", ["ResCode"], name: "tRes_uq", unique: true
  add_index "tRes", ["ResGrpID"], name: "tRes_idx"

  create_table "tResGrp", primary_key: "ResGrpID", force: true do |t|
    t.string "ResGrp", limit: 100
  end

  create_table "tResSch", primary_key: "UniqueID", force: true do |t|
    t.text     "ResCode"
    t.integer  "ResID",          limit: 8
    t.integer  "Status"
    t.string   "Subject",        limit: 100
    t.string   "Description",    limit: 1000
    t.integer  "Label"
    t.datetime "StartDate"
    t.datetime "EndDate"
    t.string   "Location",       limit: 50
    t.boolean  "AllDay",                                              default: false
    t.integer  "EventType"
    t.text     "ReminderInfo"
    t.text     "RecurrenceInfo"
    t.text     "CustomField1"
    t.string   "OutlookEntryID", limit: 256
    t.integer  "OwnerID",        limit: 8
    t.integer  "OrderID",        limit: 8
    t.boolean  "Completed",                                           default: false
    t.decimal  "Progress",                    precision: 6, scale: 4, default: 0.0
    t.integer  "BPID",           limit: 8
    t.integer  "JobQID",         limit: 8
  end

  add_index "tResSch", ["OrderID"], name: "tResSch_idx3"
  add_index "tResSch", ["OutlookEntryID"], name: "tResSch_idx"
  add_index "tResSch", ["OwnerID"], name: "tResSch_idx2"

  create_table "tResTree", primary_key: "OrgID", force: true do |t|
    t.integer "SuperiorID", limit: 8
    t.integer "SubOrdID",   limit: 8
    t.boolean "Direct",               default: true,  null: false
    t.boolean "Delegated",            default: false, null: false
  end

  add_index "tResTree", ["SuperiorID", "SubOrdID"], name: "tResTree_uq", unique: true

  create_table "tResTypes", primary_key: "ResTypeID", force: true do |t|
    t.string "ResType", limit: 50
  end

  create_table "tRestriction", primary_key: "RestrictionID", force: true do |t|
    t.integer  "RestrictionType",  limit: 2
    t.integer  "ResID",            limit: 8
    t.datetime "DateBegin"
    t.datetime "DateEnd"
    t.datetime "TransactionBegin"
    t.datetime "TransactionEnd"
  end

  create_table "tRetrieval", primary_key: "RetrievalID", force: true do |t|
    t.datetime "DateRetrieved"
    t.integer  "OrderID",          limit: 8
    t.integer  "ProductID",        limit: 8
    t.integer  "AttributeID",      limit: 2
    t.string   "SerialNumber",     limit: 100
    t.decimal  "QtyRemained",                  precision: 19, scale: 4
    t.decimal  "QtyRetrieved",                 precision: 19, scale: 4
    t.decimal  "QtyReturned",                  precision: 19, scale: 4, default: 0.0
    t.decimal  "QtyAdvanced",                  precision: 19, scale: 4
    t.integer  "ToLocationID"
    t.integer  "StockID",          limit: 8
    t.integer  "StatusID"
    t.integer  "NCROrderID",       limit: 8
    t.integer  "LocationID"
    t.integer  "RetrievedVia",     limit: 8
    t.integer  "WOProdID",         limit: 8
    t.string   "AddSN",            limit: 100
    t.integer  "StorageID"
    t.integer  "UsageID",          limit: 8
    t.integer  "DOID",             limit: 8
    t.string   "EngineSN",         limit: 100
    t.string   "VehicleRegNumber", limit: 20
  end

  add_index "tRetrieval", ["DateRetrieved"], name: "DateRetrieved_idx"
  add_index "tRetrieval", ["OrderID"], name: "OrderID_idx"
  add_index "tRetrieval", ["ProductID"], name: "ProductID_idx"
  add_index "tRetrieval", ["StockID"], name: "StockID_idx"

  create_table "tRetrvDetail", primary_key: "ID", force: true do |t|
    t.integer "RetrievalID",  limit: 8
    t.integer "UsageID",      limit: 8
    t.decimal "QtyRetrieved",           precision: 19, scale: 4, null: false
    t.integer "OrderID",      limit: 8
  end

  add_index "tRetrvDetail", ["OrderID"], name: "IX_OrderID"
  add_index "tRetrvDetail", ["RetrievalID"], name: "IX_RetrievalID"
  add_index "tRetrvDetail", ["UsageID"], name: "IX_UsageID"

  create_table "tRevOLines", primary_key: "OLineID", force: true do |t|
    t.integer "OrderID",      limit: 8
    t.integer "ProductID",    limit: 8
    t.float   "QtyOrdered",   limit: 53,  default: 1.0
    t.integer "CurrencyID",   limit: 2
    t.float   "ExchangeRate", limit: 53,  default: 1.0
    t.float   "TaxRate",      limit: 53,  default: 0.0
    t.float   "MakeToOrder",  limit: 53
    t.float   "MakeToStock",  limit: 53
    t.integer "AttributeID",  limit: 8
    t.string  "FreeText",     limit: 300
    t.integer "StatusID",     limit: 2
    t.float   "UnitPrice",    limit: 53,  default: 0.0
    t.float   "QtyReceived",  limit: 53,  default: 0.0
    t.integer "ProcessID",    limit: 8
    t.float   "QtyShortage",  limit: 53
    t.boolean "ExternalWO"
    t.float   "DiscountRate", limit: 53,  default: 0.0
  end

  create_table "tRevOrders", primary_key: "OrderID", force: true do |t|
    t.string   "OrderNo",         limit: 20
    t.datetime "DateCreated"
    t.string   "CreatedBy",       limit: 30
    t.datetime "DateUpdated"
    t.string   "UpdatedBy",       limit: 30
    t.datetime "DateRequired"
    t.datetime "DatePlanStart"
    t.datetime "DatePlanEnd"
    t.datetime "DateActualStart"
    t.datetime "DateActualEnd"
    t.integer  "StatusID",        limit: 2
    t.integer  "DocTypeID",       limit: 2
    t.integer  "CurrencyID",      limit: 2
    t.float    "ExchangeRate",    limit: 53,  default: 1.0
    t.integer  "ShipTo"
    t.integer  "BillTo"
    t.integer  "DocYear",         limit: 2
    t.integer  "DocMonth",        limit: 2
    t.integer  "DocCounter"
    t.datetime "DateIssued"
    t.integer  "BPID",            limit: 8
    t.string   "Reference",       limit: 100
    t.boolean  "PartialShipment"
    t.integer  "DocParentType",   limit: 2
    t.integer  "PaymentID",       limit: 2
    t.float    "ShipmentCost",    limit: 53
    t.string   "Notes",           limit: 500
    t.integer  "RefOrderID",      limit: 8
    t.integer  "FromLocationID"
    t.integer  "ToLocationID"
    t.integer  "Revision",        limit: 2
    t.datetime "DuePayment"
  end

  create_table "tSCAdd", primary_key: "SCAddID", force: true do |t|
    t.string  "Description", limit: 500
    t.integer "SCReportID",  limit: 8
  end

  create_table "tSMSHistory", id: false, force: true do |t|
    t.string   "Sender",       limit: 50
    t.datetime "DateReceived"
    t.string   "CommandMsg",   limit: 100
    t.string   "ReplyMsg",     limit: 320
  end

  create_table "tSMSReg", primary_key: "SMSRegID", force: true do |t|
    t.string "CellularNo", limit: 50
  end

  add_index "tSMSReg", ["CellularNo"], name: "tSMSReg_uq", unique: true

  create_table "tSN", primary_key: "CategoryID", force: true do |t|
    t.integer "SNYear",              null: false
    t.integer "SNCounter",           null: false
    t.integer "WOProdID",  limit: 8
    t.integer "OrderID",   limit: 8
  end

  create_table "tSNType", primary_key: "SNTypeID", force: true do |t|
    t.integer "CategoryID", limit: 2
    t.integer "ProductID",  limit: 8
    t.string  "SNType",     limit: 100
  end

  create_table "tSOProd", primary_key: "SOProdID", force: true do |t|
    t.integer  "ProductID",    limit: 8
    t.string   "SerialNumber", limit: 20
    t.integer  "AttributeID",  limit: 8
    t.datetime "DateSold"
    t.integer  "OrderID",      limit: 8
    t.integer  "OLineID",      limit: 8
    t.integer  "SNCounter"
    t.decimal  "QtySold",                 precision: 19, scale: 4
    t.integer  "StatusID",     limit: 2,                           default: 0
  end

  create_table "tSORef", primary_key: "SORefID", force: true do |t|
    t.integer  "DOID",        limit: 8
    t.integer  "SOID",        limit: 8
    t.integer  "DOItems",     limit: 2
    t.string   "CreatedBy",   limit: 100
    t.datetime "DateCreated"
    t.string   "UpdatedBy",   limit: 100
    t.datetime "DateUpdated"
  end

  add_index "tSORef", ["DOID", "SOID"], name: "tSORef_uq", unique: true

  create_table "tSVCheck", primary_key: "SVCheckID", force: true do |t|
    t.integer "OrderID",     limit: 8
    t.integer "SVParamID",   limit: 8
    t.string  "Description", limit: 1000
  end

  create_table "tSVParam", primary_key: "SVParamID", force: true do |t|
    t.string "ParamDesc", limit: 50
  end

  create_table "tSVTool", primary_key: "SVToolID", force: true do |t|
    t.integer "OrderID", limit: 8
    t.integer "ResID",   limit: 8
  end

  create_table "tSalesRate", primary_key: "SalesRateID", force: true do |t|
    t.decimal "MonthlyUpperRate", precision: 19, scale: 4
    t.decimal "MonthlyLowerRate", precision: 19, scale: 4
    t.integer "ProductStatusID"
  end

  create_table "tSalesRateHistory", primary_key: "SalesRateHistoryID", force: true do |t|
    t.datetime "PeriodBegin"
    t.datetime "PeriodEnd"
    t.integer  "ProductID",       limit: 8
    t.integer  "AttributeID",     limit: 2
    t.decimal  "QuantityInStock",           precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "SalesRate",                 precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "ProductStatusID"
    t.boolean  "StatusChanged",                                      default: false, null: false
    t.integer  "OrgID",           limit: 8
  end

  create_table "tSalesman", primary_key: "SalesmanID", force: true do |t|
    t.string  "PersonName", limit: 50
    t.integer "BPID",       limit: 8
  end

  create_table "tScan", primary_key: "ScanCode", force: true do |t|
    t.integer  "ScanYear"
    t.integer  "ScanMonth",     limit: 2
    t.integer  "ScanCounter",   limit: 8
    t.integer  "OrderID",       limit: 8
    t.integer  "NCROrderID",    limit: 8
    t.integer  "OLineID",       limit: 8
    t.integer  "NCROLineID",    limit: 8
    t.decimal  "Quantity",                  precision: 19, scale: 4
    t.string   "SerialNumber",  limit: 100
    t.integer  "StockID",       limit: 8
    t.integer  "AttributeID"
    t.integer  "LocationID"
    t.integer  "ProductID",     limit: 8
    t.boolean  "Inbound",                                            default: false
    t.integer  "DocParentType", limit: 2
    t.integer  "RefOrderID",    limit: 8
    t.integer  "WOProdID",      limit: 8
    t.integer  "UsageID",       limit: 8
    t.boolean  "IsRMA",                                              default: false
    t.datetime "LastUpdate"
    t.integer  "RetrievedVia",  limit: 8
    t.string   "AddSN",         limit: 100
  end

  add_index "tScan", ["OrderID", "ProductID", "AttributeID", "OLineID"], name: "tScan_idx3"
  add_index "tScan", ["OrderID", "ProductID", "AttributeID", "SerialNumber"], name: "tScan_idx"
  add_index "tScan", ["ScanYear", "ScanMonth"], name: "tScan_idx2"

  create_table "tScanCounter", primary_key: "ScanYear", force: true do |t|
    t.integer "ScanMonth",   limit: 2, null: false
    t.integer "ScanCounter"
  end

  create_table "tSetup", id: false, force: true do |t|
    t.boolean "Emerge",      default: false
    t.boolean "CheckOnce",   default: false
    t.boolean "ReserveLock", default: false
    t.boolean "Routing",     default: false
    t.boolean "XT",          default: false
  end

  create_table "tState", primary_key: "StateID", force: true do |t|
    t.string "StateName", limit: 200, null: false
  end

  create_table "tStock", primary_key: "StockID", force: true do |t|
    t.integer  "OrderID",          limit: 8
    t.integer  "OLineID",          limit: 8
    t.integer  "ConvertID",        limit: 8
    t.integer  "WOProdID",         limit: 8
    t.integer  "ProductID",        limit: 8
    t.datetime "DateMovedIn"
    t.datetime "DateExpired"
    t.integer  "ColorID",          limit: 2
    t.integer  "AttributeID",      limit: 2
    t.string   "SerialNumber",     limit: 100
    t.decimal  "QtyIn",                        precision: 19, scale: 4, default: 1.0
    t.decimal  "QtyOut",                       precision: 19, scale: 4, default: 0.0
    t.decimal  "QtyReserved",                  precision: 19, scale: 4, default: 0.0
    t.integer  "LocationID"
    t.integer  "StorageID"
    t.integer  "RetrievalID",      limit: 8
    t.string   "DOReference",      limit: 150
    t.integer  "StatusID",         limit: 2
    t.integer  "FromLocationID"
    t.integer  "ReturnIndex"
    t.boolean  "IsReturned",                                            default: false, null: false
    t.boolean  "IsConverted",                                           default: false, null: false
    t.boolean  "IsAdjustment",                                          default: false, null: false
    t.integer  "FromStockID",      limit: 8
    t.integer  "FromUsageID",      limit: 8
    t.integer  "RefWOProdID",      limit: 8
    t.string   "Notes",            limit: 200
    t.integer  "RsvOrderID",       limit: 8
    t.integer  "CurrencyID",       limit: 2
    t.decimal  "ExchangeRate",                 precision: 19, scale: 4
    t.decimal  "UnitPrice",                    precision: 19, scale: 4
    t.decimal  "DiscountRate",                 precision: 19, scale: 4
    t.decimal  "Discount",                     precision: 19, scale: 4
    t.decimal  "DiscountRate2",                precision: 19, scale: 4
    t.decimal  "TaxRate",                      precision: 19, scale: 4
    t.boolean  "TaxIncluded",                                           default: false, null: false
    t.boolean  "OldItem",                                               default: false, null: false
    t.decimal  "UnitFreightCost",              precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "InvoiceID",        limit: 8
    t.decimal  "AvgCOGS",                      precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "LastAvgCOGS",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean  "COGSIncludeTax",                                        default: false, null: false
    t.decimal  "QtyMoved",                     precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "FirstAvgCOGS",                 precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "Discount2",                    precision: 19, scale: 4, default: 0.0
    t.boolean  "AltDiscMethod",                                         default: false, null: false
    t.string   "EngineSN",         limit: 100
    t.string   "VehicleRegNumber", limit: 20
    t.integer  "ProductionYear",   limit: 2
    t.integer  "FromOrgID",        limit: 8
    t.decimal  "VehicleTax",                   precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "AccDocID",         limit: 8
    t.decimal  "ActualStockValue",             precision: 19, scale: 4, default: 0.0,   null: false
  end

  add_index "tStock", ["DateMovedIn"], name: "DateMovedIn_idx"
  add_index "tStock", ["OrderID"], name: "OrderID_idx"
  add_index "tStock", ["ProductID", "DateMovedIn"], name: "ProductID_DateMovedIn_idx"
  add_index "tStock", ["ProductID", "SerialNumber"], name: "ProductID_SN_idx"
  add_index "tStock", ["ProductID"], name: "ProductID_idx"
  add_index "tStock", ["SerialNumber"], name: "SerialNumber_idx"
  add_index "tStock", ["WOProdID"], name: "WOProdID_idx"

  create_table "tStockSN", primary_key: "StockSNID", force: true do |t|
    t.integer "StockID",      limit: 8
    t.integer "SNTypeID"
    t.string  "SerialNumber", limit: 100
  end

  create_table "tStockView", primary_key: "StockViewID", force: true do |t|
    t.integer "ResID", limit: 8
    t.integer "OrgID", limit: 8
  end

  create_table "tStorage", primary_key: "StorageID", force: true do |t|
    t.integer "LocationID"
    t.string  "Storage",    limit: 15
  end

  create_table "tSvcCat", primary_key: "SvcCatID", force: true do |t|
    t.string  "SvcCat",       limit: 50
    t.boolean "SvcClaim",                default: false, null: false
    t.boolean "SvcExpense",              default: false, null: false
    t.integer "BPID",         limit: 8
    t.integer "ExpenseAccID"
  end

  create_table "tSvcIncentive", primary_key: "SvcIncentiveID", force: true do |t|
    t.integer  "SvcPackID"
    t.datetime "DateBegin"
    t.datetime "DateEnd"
    t.integer  "IncentiveID"
    t.boolean  "ForAgent",    default: false, null: false
  end

  create_table "tSvcLine", primary_key: "SvcLineID", force: true do |t|
    t.integer "OrderID",       limit: 8
    t.integer "PricingTypeID", limit: 2
    t.integer "CurrencyID",    limit: 2
    t.decimal "ExchangeRate",            precision: 19, scale: 4, default: 1.0
    t.decimal "UnitPrice",               precision: 19, scale: 4, default: 0.0
    t.decimal "DiscountRate",            precision: 19, scale: 4, default: 0.0
    t.decimal "Discount",                precision: 19, scale: 4, default: 0.0
    t.decimal "TaxRate",                 precision: 19, scale: 4, default: 0.0
    t.boolean "TaxIncluded",                                      default: false
    t.integer "InvoiceID",     limit: 8
    t.integer "SvcPackID"
  end

  create_table "tSvcPack", primary_key: "SvcPackID", force: true do |t|
    t.integer "SvcCatID"
    t.string  "SvcPackCode",  limit: 50
    t.string  "SvcPackName",  limit: 200
    t.boolean "Active",                                           default: true
    t.decimal "EstDuration",              precision: 6, scale: 2, default: 0.0
    t.integer "BrandID"
    t.integer "BrandTypeID"
    t.integer "SubTypeID"
    t.boolean "SPPackPrice",                                      default: false
    t.boolean "SVCPackPrice",                                     default: true
    t.integer "DocTypeID"
  end

  create_table "tSvcPackItem", primary_key: "SvcPackItemID", force: true do |t|
    t.integer  "SvcPackID"
    t.integer  "ProductID",    limit: 8
    t.integer  "AttributeID",  limit: 2
    t.decimal  "QtyRequired",            precision: 6,  scale: 2, default: 1.0
    t.boolean  "Pseudo",                                          default: false
    t.integer  "CurrencyID",   limit: 2
    t.decimal  "ExchangeRate",           precision: 19, scale: 4, default: 1.0
    t.decimal  "UnitPrice",              precision: 19, scale: 4, default: 0.0
    t.decimal  "DiscountRate",           precision: 19, scale: 4, default: 0.0
    t.decimal  "Discount",               precision: 19, scale: 4, default: 0.0
    t.decimal  "TaxRate",                precision: 19, scale: 4, default: 0.0
    t.boolean  "TaxIncluded",                                     default: false
    t.datetime "DateBegin"
    t.datetime "DateEnd"
  end

  create_table "tSvcPackList", primary_key: "SvcPackListID", force: true do |t|
    t.integer "OrderID",   limit: 8
    t.integer "SvcPackID"
  end

  create_table "tSvcResource", primary_key: "SvcResID", force: true do |t|
    t.integer  "ResID",          limit: 8
    t.datetime "DateBegin"
    t.datetime "DateEnd"
    t.boolean  "Mechanic",                 default: true
    t.string   "PitNumber",      limit: 3
    t.integer  "IncentiveAccID"
  end

  create_table "tSvcRpt", primary_key: "SvcRptID", force: true do |t|
    t.integer  "ResSchID",    limit: 8
    t.datetime "DateIssued"
    t.integer  "ReporterID",  limit: 8
    t.string   "Notes",       limit: 1000
    t.string   "CreatedBy",   limit: 100
    t.datetime "DateCreated"
    t.string   "UpdatedBy",   limit: 100
    t.datetime "DateUpdated"
  end

  create_table "tTaxCounter", primary_key: "ID", force: true do |t|
    t.string   "Prefix",            limit: 20
    t.string   "Suffix",            limit: 20
    t.boolean  "IsForeignCurrency",            default: false, null: false
    t.integer  "SequenceStart",                                null: false
    t.integer  "SequenceLength",                               null: false
    t.integer  "LastSequence",                                 null: false
    t.integer  "LastOrderID",       limit: 8
    t.datetime "DateAdded"
    t.datetime "DateUpdated"
  end

  create_table "tTaxType", primary_key: "TaxTypeID", force: true do |t|
    t.string  "TaxType",         limit: 30
    t.decimal "TaxRate",                    precision: 3, scale: 2
    t.integer "SalesTaxAccID"
    t.integer "PurcTaxAccID"
    t.boolean "TaxShipping",                                        default: false, null: false
    t.boolean "DefaultTax",                                         default: false, null: false
    t.integer "ServiceTaxAccID"
    t.integer "TaxCategory",     limit: 2
  end

  create_table "tTownship", primary_key: "TownshipID", force: true do |t|
    t.integer "CountyID"
    t.string  "Name",     limit: 150,                null: false
    t.string  "PostCode", limit: 15
    t.boolean "Active",               default: true
    t.string  "AltCode",  limit: 20
  end

  create_table "tTransType", primary_key: "TransTypeID", force: true do |t|
    t.string  "TransType",     limit: 5,                   null: false
    t.string  "Description",   limit: 100
    t.integer "ObjectType",    limit: 2
    t.boolean "Active",                    default: true,  null: false
    t.boolean "IsDownPayment",             default: false, null: false
    t.boolean "IsInstallment",             default: false, null: false
  end

  create_table "tUOM", primary_key: "UOMID", force: true do |t|
    t.string "UOM",     limit: 15
    t.string "ISOCode", limit: 5
  end

  create_table "tUsage", primary_key: "UsageID", force: true do |t|
    t.integer  "ProductID",           limit: 8
    t.integer  "AttributeID",         limit: 2
    t.integer  "StockID",             limit: 8
    t.integer  "WOProdID",            limit: 8
    t.integer  "JobQItemID",          limit: 8
    t.integer  "JobQID",              limit: 8
    t.integer  "OrderID",             limit: 8
    t.integer  "OLineID",             limit: 8
    t.decimal  "QtyUsed",                         precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "QtyShortage",                     precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "QtyRetrieved",                    precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "QtyReturned",                     precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "QtyAdvanced",                     precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "StatusID",            limit: 2
    t.integer  "LocationID"
    t.integer  "ToLocationID"
    t.integer  "SOWOProdID",          limit: 8
    t.integer  "WOID",                limit: 8
    t.integer  "DOID",                limit: 8
    t.decimal  "LastQtyRtrvd",                    precision: 19, scale: 4, default: 0.0,   null: false
    t.decimal  "DOQty",                           precision: 19, scale: 4, default: 0.0,   null: false
    t.boolean  "ConsignmentSold",                                          default: false
    t.integer  "NCROrderID",          limit: 8
    t.integer  "NCROLineID",          limit: 8
    t.boolean  "IsReturned",                                               default: false
    t.integer  "RefNCROrderID",       limit: 8
    t.boolean  "IsReplacement",                                            default: false
    t.boolean  "IsConverted",                                              default: false
    t.integer  "Counter"
    t.integer  "FromUsageID",         limit: 8
    t.integer  "ToUsageID",           limit: 8
    t.datetime "DateReserved"
    t.datetime "DateRequired"
    t.datetime "DateTransfered"
    t.datetime "DateDelivered"
    t.datetime "DateRetrieved"
    t.datetime "DatePrinted"
    t.integer  "ToOrderID",           limit: 8
    t.boolean  "PreShipment",                                              default: false
    t.string   "AddSN",               limit: 100
    t.string   "Notes",               limit: 150
    t.boolean  "ForceRetrieved",                                           default: false
    t.decimal  "NCRQtyReturned",                  precision: 19, scale: 4, default: 0.0,   null: false
    t.integer  "RetrievalID",         limit: 8
    t.string   "ScanCode",            limit: 16
    t.integer  "PrintCount",          limit: 2,                            default: 0
    t.decimal  "AvgCOGS",                         precision: 19, scale: 4, default: 0.0,   null: false
    t.datetime "DateQCPassed"
    t.integer  "InspectedByID",       limit: 8
    t.string   "OwnerLicenseNbr",     limit: 50
    t.string   "VehicleTaxNbr",       limit: 50
    t.string   "VehicleLicensePlate", limit: 10
    t.datetime "DateLicCompleted"
    t.datetime "DateLicDelivered"
  end

  add_index "tUsage", ["OLineID"], name: "OLineID_idx"
  add_index "tUsage", ["OrderID"], name: "Orders_idx"
  add_index "tUsage", ["ProductID"], name: "ProductID_idx"
  add_index "tUsage", ["QtyShortage", "ProductID"], name: "Shortage_idx"
  add_index "tUsage", ["ScanCode"], name: "ScanCode_idx"
  add_index "tUsage", ["StockID"], name: "StockID_idx"
  add_index "tUsage", ["WOProdID"], name: "WOProdID_idx"

  create_table "tVPartNo", primary_key: "VPartNoID", force: true do |t|
    t.integer "ProductID",    limit: 8,                   null: false
    t.string  "VendorPartNo", limit: 50
    t.boolean "Obsolete",                 default: false
    t.boolean "Hidden",                   default: false
    t.integer "BPID",         limit: 8
    t.string  "BrandName",    limit: 50
    t.string  "ShortDesc",    limit: 200
  end

  add_index "tVPartNo", ["Obsolete"], name: "Obsolete_idx"
  add_index "tVPartNo", ["ProductID"], name: "ProductID_idx"
  add_index "tVPartNo", ["VPartNoID"], name: "IX_tVPartNo", unique: true
  add_index "tVPartNo", ["VendorPartNo"], name: "tVPartNo_idx"

  create_table "tValidThru", primary_key: "ValidityID", force: true do |t|
    t.string  "Validity",  limit: 150
    t.decimal "EffDays",               precision: 5, scale: 1
    t.decimal "EffMonths",             precision: 5, scale: 1
    t.decimal "EffWeeks",              precision: 5, scale: 1
  end

  create_table "tVoucherSeq", primary_key: "VoucherSeqID", force: true do |t|
    t.integer "TransTypeID",                       null: false
    t.integer "OrgID",       limit: 8,             null: false
    t.integer "SeqMonth",    limit: 2,             null: false
    t.integer "SeqYear",     limit: 2,             null: false
    t.integer "SeqCounter",            default: 1, null: false
    t.integer "BankID"
  end

  add_index "tVoucherSeq", ["TransTypeID", "BankID", "OrgID", "SeqMonth", "SeqYear"], name: "IX_tVoucherSeq", unique: true

  create_table "tWOProd", primary_key: "WOProdID", force: true do |t|
    t.integer  "ProductID",      limit: 8
    t.string   "SerialNumber",   limit: 20
    t.integer  "AttributeID",    limit: 2
    t.datetime "DateCompleted"
    t.integer  "OrderID",        limit: 8,                                            null: false
    t.integer  "OLineID",        limit: 8
    t.integer  "SNCounter"
    t.decimal  "QtyProduced",                precision: 19, scale: 4, default: 0.0
    t.decimal  "QtyCompleted",               precision: 19, scale: 4, default: 0.0
    t.integer  "StatusID",       limit: 2,                            default: 0
    t.integer  "SNYear",         limit: 2
    t.integer  "SOID",           limit: 8
    t.decimal  "WorkshopPct",                precision: 4,  scale: 2, default: 0.0
    t.datetime "ProgressUpdate"
    t.string   "Notes",          limit: 500
    t.datetime "PlanStart"
    t.datetime "PlanEnd"
    t.datetime "ActualStart"
    t.datetime "ActualEnd"
    t.boolean  "UseAddSN",                                            default: false, null: false
  end

  add_index "tWOProd", ["OLineID"], name: "OLineID_idx"
  add_index "tWOProd", ["OrderID"], name: "OrderID_idx"
  add_index "tWOProd", ["ProductID", "SerialNumber"], name: "ProductID_SN_idx"
  add_index "tWOProd", ["SerialNumber"], name: "SerialNumber_idx"
  add_index "tWOProd", ["WOProdID"], name: "IX_tWOProd", unique: true

  create_table "tWOSO", primary_key: "WOSOID", force: true do |t|
    t.integer "WOID",        limit: 8
    t.integer "SOID",        limit: 8
    t.decimal "QtyReserved",           precision: 19, scale: 4
  end

  add_index "tWOSO", ["WOID", "SOID"], name: "tWOSO_uq", unique: true

  create_table "tXAttr", primary_key: "XAttrID", force: true do |t|
    t.integer "StockID",    limit: 8
    t.integer "AttrTypeID"
    t.integer "AttrListID"
  end

  create_table "tests", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
