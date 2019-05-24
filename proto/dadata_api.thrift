namespace java com.rbkmoney.questionary_proxy_aggr.dadata_api
namespace erlang dadata_api

include "dadata_address.thrift"
include "dadata_party.thrift"
include "dadata_bank.thrift"
include "dadata_fio.thrift"
include "dadata_fms_unit.thrift"
include "dadata_okved2.thrift"

enum DaDataEndpoint {
    // Подсказки по адресам
    suggest_address
    // Подсказки по оганизациям
    suggest_party
    // Подсказки по банкам
    suggest_bank
    // Подсказки по ФИО
    suggest_fio
    // Кем выдан паспорт
    suggest_fms_unit
    // Виды деятельности
    okved2
}

union DaDataRequest {
    1: dadata_address.AddressQuery address_query
    2: dadata_party.PartyQuery party_query
    3: dadata_bank.BankQuery bank_query
    4: dadata_fio.FioQuery fio_query
    5: dadata_fms_unit.FmsUnitQuery fms_unit_query
    6: dadata_okved2.OkvedQuery okved_query
}

union DaDataResponse {
    1: dadata_address.AddressResponse address_response
    2: dadata_party.PartyResponse party_response
    3: dadata_bank.BankResponse bank_response
    4: dadata_fio.FioResponse fio_response
    5: dadata_fms_unit.FmsUnitResponse fms_unit_response
    6: dadata_okved2.OkvedResponse okved_response
}
