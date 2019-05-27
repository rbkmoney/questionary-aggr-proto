namespace java com.rbkmoney.questionary_proxy_aggr.kontur_focus_egr_details
namespace erlang kontur_focus_egr_details

include "base.thrift"
include "base_kontur_focus.thrift"

/**
* Предшественники
*/
struct Predecessors {
    // Наименование организации
    1: optional string name
    2: optional string inn
    3: optional string ogrn
    4: optional base.Date date
}

/**
* Преемники
*/
struct Successors {
    // Наименование организации
    1: optional string name
    2: optional string inn
    3: optional string ogrn
    4: optional base.Date date
}

/**
* Документы, представленные при внесении записи
*/
struct RecordDocument {
    1: optional string name
    2: optional base.Date date
}

/**
* Свидетельства, подтверждающие факт внесения изменений
*/
struct Certificate {
    // Серия и номер
    1: optional string serial_number
    // Дата выдачи
    2: optional base.Date date
}

/**
* Акционеры - физлица
*/
struct ShareHolderFl {
    1: optional string fio
    // Местожительство физлица
    2: optional string address
    // Доля обыкновенных акций в процентах
    3: optional base.Percent voting_shares_percent
    // Доля участия в уставном капитале в процентах
    4: optional base.Percent capital_shares_percent
    5: optional base.Date date
}

/**
* Акционеры - юрлица
*/
struct ShareHolderUL {
    1: optional string ogrn
    2: optional string inn
    // Полное наименование юридического лица
    3: optional string full_name
    // Местонахождения юрлица
    4: optional string address
    // Доля обыкновенных акций в процентах
    5: optional base.Percent voting_shares_percent
    // Доля участия в уставном капитале в процентах
    6: optional base.Percent capital_shares_percent
    // Дата последнего изменения в долях
    7: optional base.Date date
}

struct ShareHolderOther {
    // Полное наименование лица
    1: optional string full_name
    // Местонахождения юрлица или Местожительство физлица
    2: optional string address
    // Доля обыкновенных акций в процентах
    3: optional base.Percent voting_shares_percent
    // Доля участия в уставном капитале в процентах
    4: optional base.Percent capital_shares_percent
    // Дата последнего изменения в долях
    5: optional base.Date date
}

/**
* Акционеры, являющиеся аффилированными лицами
*/
struct ShareHolders {
    1: optional base.Date date
    2: optional list<ShareHolderFl> share_holders_fl
    3: optional list<ShareHolderUL> share_holders_ul
    4: optional list<ShareHolderOther> share_holders_other
}

/**
* Запись в ЕГРЮЛ
*/
struct EgrRecord {
    // ГРН записи
    1: optional string grn
    // Дата внесения записи
    2: optional base.Date date
    // Причина внесения записи
    3: optional string name
    // Признак недействительности записи
    4: optional bool invalid
    // Имя регистрирующего органа, который внес запись
    5: optional string reg_name
    // Код регистрирующего органа, который внес запись
    6: optional string reg_code
    7: optional list<RecordDocument> documents
    8: optional list<Certificate> certificates
}

struct EgrDetailsHistory {
    1: required base.Date date
    2: optional list<ShareHolderFl> shareholders_fl
    3: optional list<ShareHolderUL> shareholders_ul
    4: optional list<ShareHolderOther> shareholders_other
    5: optional list<base_kontur_focus.StatedCapital> stated_capitals
    6: optional list<base_kontur_focus.FounderFL> founders_fl
    7: optional list<base_kontur_focus.FounderUL> founders_ul
    8: optional list<base_kontur_focus.FounderForeign> founders_foreign
}

struct EgrDetailsLegalEntity {
    1: required string okpo
    // Регистрационный номер ПФР
    2: required string pfr_reg_number
    // Регистрационный номер ФСС
    3: required string fss_reg_number
    // Регистрационный номер ФОМС
    4: required string foms_reg_number
    5: required base_kontur_focus.Activity activities
    6: required base_kontur_focus.RegInfo reg_info
    7: required base_kontur_focus.NalogRegBody nalog_reg_body
    8: required base_kontur_focus.RegBody reg_body
    9: required ShareHolders share_holders
    10: required base_kontur_focus.StatedCapital stated_capital
    11: required list<base_kontur_focus.FounderFL> founders_fl
    12: required list<base_kontur_focus.FounderUL> founders_ul
    13: required list<base_kontur_focus.FounderForeign> founders_foreign
    14: required list<Predecessors> predecessors
    15: required list<Successors> successors
    16: required list<EgrRecord> egr_records
    17: optional EgrDetailsHistory history
}

/**
* Информация о местонахождении ИП
*/
struct ShortenedAddress {
    1: required string region_code
    2: optional base_kontur_focus.Toponim region_name
    3: optional base_kontur_focus.Toponim district
    4: optional base_kontur_focus.Toponim city
    5: optional base_kontur_focus.Toponim settlement
}

struct EgrDetailsIndividualEntity {
    1: optional string okpo
    // Регистрационный номер ПФР
    2: optional string pfr_reg_number
    // Регистрационный номер ФСС
    3: optional string fss_reg_number
    // Регистрационный номер ФОМС
    4: optional string foms_reg_number
    5: optional string okato
    6: optional ShortenedAddress shortened_address
    7: optional base_kontur_focus.Activity activities
    8: optional base_kontur_focus.RegInfo reg_info
    9: optional base_kontur_focus.NalogRegBody nalog_reg_body
    10: optional base_kontur_focus.RegBody reg_body
    11: optional list<EgrRecord> egr_records
}

union Contractor {
    1: EgrDetailsIndividualEntity individual_entity
    2: EgrDetailsLegalEntity legal_entity
}

struct EgrDetailsQuery {
    1: optional list<string> ogrn
    2: optional list<string> inn
}

struct EgrDetailsResponse {
    1: required string inn
    2: required string ogrn
    // Ссылка на карточку юридического лица (ИП) в Контур.Фокусе
    3: required base.URL focus_href
    4: required Contractor contractor
}
