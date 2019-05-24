namespace java com.rbkmoney.questionary_proxy_aggr.dadata_okved2
namespace erlang dadata_okved2

include "base_dadata.thrift"

struct OkvedContent {
    1: required string value
    2: required string unrestricted_value
    // Индекс (раздел + код)
    3: required string idx
    // Код раздела
    4: required string razdel
    5: required string kod
    6: required string name
}

struct OkvedQueryFilter {
    1: optional string razdel
}

struct OkvedQuery {
    1: required string query
    2: required base_dadata.QueryType query_type
    3: optional list<OkvedQueryFilter> filters
}

struct OkvedResponse {
    1: required list<OkvedContent> suggestions
}
