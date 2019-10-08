namespace java com.rbkmoney.questionary_proxy_aggr.dadata_bank
namespace erlang dadata_bank

include "base_dadata.thrift"
include "dadata_address.thrift"

struct BankContent {
    // Наименование организаци одной строкой
    1: required string value
    // Наименование компании одной строкой (полное)
    2: required string unrestricted_value
    3: required base_dadata.Opf opf
    4: required base_dadata.Payment payment
    5: required string bic
    6: required string swift
    7: optional string okpo
    8: required string correspondent_account
    9: required string registration_number
    // Ссылка на РКЦ. Структура идентична структуре объекта банка
    10: optional string rkc
    11: required dadata_address.Address address
    12: optional string phone
    13: required base_dadata.DaDataState status
}

struct BankQuery {
    1: required string query
    2: optional i8 count
    3: optional list<base_dadata.OrgStatus> status
    4: optional base_dadata.OrgType type
}

struct BankResponse {
    1: required list<BankContent> suggestions
}
