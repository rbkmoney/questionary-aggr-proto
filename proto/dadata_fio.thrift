namespace java com.rbkmoney.questionary_proxy_aggr.dadata_fio
namespace erlang dadata_fio

include "base_dadata.thrift"

struct FioContent {
    1: required string value
    2: required string unrestricted_value
    3: optional string surname
    4: optional string name
    5: optional string patronymic
    6: optional base_dadata.Gender gender
    // Код качества
    7: optional i8 qc
}

struct FioQuery {
    1: required string query
    2: optional i8 count
    3: optional list<string> parts
    4: optional base_dadata.Gender gender
}

struct FioResponse {
    1: required list<FioContent> suggestions
}
