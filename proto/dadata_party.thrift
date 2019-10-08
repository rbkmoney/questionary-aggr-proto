namespace java com.rbkmoney.questionary_proxy_aggr.dadata_party
namespace erlang dadata_party

include "base.thrift"
include "base_dadata.thrift"
include "dadata_address.thrift"

/**
* Уставной капитал компании
*/
struct PartyCapital {
    1: optional string type
    // Размер капитала
    2: optional string value
}

/**
* Коды ОКВЭД дополнительных видов деятельности
*/
struct PartyOkved {
    // Основной или нет
    1: optional bool main
    // Версия справочника ОКВЭД
    2: optional string type
    // Код по справочнику
    3: optional string code
    // Наименование по справочнику
    4: optional string name
}

/**
* Сведения о налоговой, ПФР и ФСС
*/
struct PartyAuthorities {
    // ИФНС регистрации
    1: optional base_dadata.Authorities fts_registration
    // ИФНС отчетности
    2: optional base_dadata.Authorities fts_report
    // Отделение Пенсионного фонда
    3: optional base_dadata.Authorities pf
    // Отделение Фонда соц. страхования
    4: optional base_dadata.Authorities sif
}

/**
* Документы
*/
struct PartyDocuments {
    1: optional base_dadata.Registration fts_registration
    2: optional base_dadata.Registration pf_registration
    3: optional base_dadata.Registration sif_registration
}

struct PartyContent {
    1: optional string value
    2: optional string unrestricted_value
    3: optional string kpp
    4: optional base_dadata.Management management
    5: optional base_dadata.BranchType branch_type
    // Кол-во филиалов
    6: optional i32 branch_count
    7: optional base_dadata.HID hid
    8: optional base_dadata.DaDataState state
    9: optional base_dadata.Opf opf
    10: optional base_dadata.OrgName name
    11: optional string inn
    12: optional string ogrn
    13: optional base.Timestamp ogrn_date
    14: optional base_dadata.OrgType type
    15: optional string okpo
    16: optional string okved
    17: optional string okved_type
    18: optional dadata_address.Address address
    19: optional list<PartyOkved> okveds
    20: optional PartyAuthorities authorities
    21: optional base_dadata.CitizenshipIP citizenship
    22: optional list<base_dadata.Founder> founders
    23: optional list<base_dadata.Manager> managers
    24: optional PartyCapital capital
    25: optional PartyDocuments documents
    26: optional list<base_dadata.License> licenses
}

struct PartyQuery {
    1: required string query
    2: optional i8 count
    3: optional list<base_dadata.OrgStatus> status
    4: optional base_dadata.OrgType type
    5: optional list<base_dadata.LocationFilter> locations
    6: optional list<base_dadata.LocationBoostFilter> locations_boost
}

struct PartyResponse {
    1: required list<PartyContent> suggestions
}
