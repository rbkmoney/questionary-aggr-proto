namespace java com.rbkmoney.questionary_proxy_aggr.kontur_focus_req
namespace erlang kontur_focus_req

include "base.thrift"
include "base_kontur_focus.thrift"

/**
* Сводная информация из экспресс-отчета
*/
struct BriefReportSummary {
    1: bool red_statements
    2: bool yellow_statement
    3: bool green_statement
}

/**
* Экспресс-отчет по контрагенту
*/
struct BriefReport {
    1: required BriefReportSummary summary,
    2: optional base.URL href;
}

struct ContactPhones {
    1: required i64 count
    2: optional list<string> phones
}

/**
* Статус ИП
*/
struct PrivateEntityStatusDetail {
    // Неформализованное описание статуса
    1: required string status
    // Недействующий
    2: required bool dissolved
    // Дата
    3: required base.Date date
}

/**
* Статус организации
*/
struct LegalEntityStatusDetail {
    // Неформализованное описание статуса
    1: required string status
    2: required bool reorganizing
    3: required bool dissolved
    4: required base.Date date
}

/**
* Информация об индивидуальном предпринимателе - IP
*/
struct IndividualEntity {
    1: required string fio
    2: required string okpo
    3: required string okato
    4: required string okfs
    5: required string okogu
    // Код ОКОПФ
    6: required string okopf
    // Наименование организационно-правовой формы
    7: required string opf
    8: required string oktmo
    9: required base.Date registration_date
    10: required base.Date dissolution_date
    11: required PrivateEntityStatusDetail status_detail
}

/**
* Наименование юридического лица
*/
struct LegalName {
    1: required string short_name
    2: required string full_name
    3: required base.Date date
}

/**
* Разобранный на составляющие адрес в РФ
*/
struct ParsedAddressRF {
    // Индекс
    1: required string zip_code
    // Код КЛАДР
    2: required string kladr_code
    // Код региона
    3: required string region_code
    // Регион
    4: required base_kontur_focus.Toponim region_name
    // Район
    5: optional base_kontur_focus.Toponim district
    // Город
    6: optional base_kontur_focus.Toponim city
    // Населенный пункт
    7: optional base_kontur_focus.Toponim settlement
    // Улица
    8: optional base_kontur_focus.Toponim street
    // Дом
    9: optional base_kontur_focus.Toponim house
    // Корпус
    10: optional base_kontur_focus.Toponim bulk
    // Офис/квартира/комната
    11: optional base_kontur_focus.Toponim flat
    // Полное значение поля "Дом" из ЕГРЮЛ
    12: optional string house_raw
    // Полное значение поля "Корпус" из ЕГРЮЛ
    13: optional string bulk_raw
    // Полное значение поля "Квартира" из ЕГРЮЛ
    14: optional string flat_raw
}

/**
* Юридический адрес
*/
struct LegalAddress {
    1: required ParsedAddressRF address_rf
    2: required base.Date date
    3: optional base.Date first_date
}

/**
* Адрес вне РФ
*/
struct ForeignAddress {
    // Наименование страны
    1: required string country_name
    // Строка, содержашая адрес
    2: required string address
}

/**
* Филиалы и представительства
*/
struct Branch {
    // Наименование филиала или представительства
    1: required string name
    2: required ParsedAddressRF address_rf
    3: required ForeignAddress foreign_address
    4: required base.Date date
}

/**
* Лицо имеющее право подписи без доверенности (руководитель)
*/
struct Head {
    // ФИО
    1: required string fio
    // ИННФЛ
    2: required string innfl
    // Должность
    3: required string position
    // Дата последнего внесения изменений
    4: required base.Date date
    // Дата первого внесения сведений
    5: required base.Date first_date
}

/**
* Управляющая компания
*/
struct ManagementCompany {
    // Наименование управляющей организации
    1: required string name
    2: optional string inn
    3: optional string ogrn
    4: required base.Date date
    5: required base.Date first_date
}

struct KppHistory {
    1: required string kpp
    2: required base.Date date
}

struct History {
    1: required list<KppHistory> kpps
    2: required list<LegalName> legal_names
    3: required list<LegalAddress> legal_addresses
    4: required list<Branch> branches
    5: required list<ManagementCompany> management_companies
    6: required list<Head> heads
}

/**
* Информация о юридическом лице - UL
*/
struct LegalEntity {
    1: required string kpp
    2: required string okpo
    3: required string okfs
    4: required string oktmo
    5: required string okogu
    6: required string okopf
    7: required string opf
    8: required LegalName legal_name
    9: required LegalAddress legal_address
    10: required list<Branch> branches
    11: required LegalEntityStatusDetail status
    12: required base.Date registration_date
    13: optional base.Date dissolutionDate
    14: required list<Head> heads
    15: required list<ManagementCompany> management_companies
    16: optional History history
}

union Contractor {
    1: IndividualEntity individual_entity
    2: LegalEntity legal_entity
}

struct ReqQuery {
    1: optional list<string> ogrn
    2: optional list<string> inn
}

struct RegResponse {
    1: required string inn
    2: required string ogrn
    3: required base.URL focus_href
    4: required Contractor private_entity
    5: required BriefReport brief_report
    6: required ContactPhones contact_phones
}
