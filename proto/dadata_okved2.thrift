namespace java com.rbkmoney.questionary_proxy_aggr.dadata_okved2
namespace erlang dadata_okved2

include "base_dadata.thrift"

struct OkvedContent {
    1: required string value
    // Индекс (раздел + код)
    2: required string idx
    // Код раздела
    3: required string section
    4: required string code
    5: required string name
}

struct OkvedQueryFilter {
    // Код раздела
    1: optional string section
}

struct OkvedQuery {
    1: required string query
    2: required base_dadata.QueryType query_type
    3: optional list<OkvedQueryFilter> filters
}

struct OkvedResponse {
    1: required list<OkvedContent> suggestions
}
