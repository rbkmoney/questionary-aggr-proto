namespace java com.rbkmoney.questionary_proxy_aggr.dadata_fms_unit
namespace erlang dadata_fms_unit

include "base_dadata.thrift"

struct FmsUnitContent {
    1: required string value
    2: required string unrestrictd_value
    3: optional string code
    4: optional string name
    5: optional string region_code
    6: optional string type
}

struct FmsUnitQueryFilter {
    1: optional string region_code
    2: optional string type
}

struct FmsUnitQuery {
    1: required string query
    2: required base_dadata.QueryType query_type
    3: optional list<FmsUnitQueryFilter> filters
}

struct FmsUnitResponse {
    1: required list<FmsUnitContent> suggestions
}
