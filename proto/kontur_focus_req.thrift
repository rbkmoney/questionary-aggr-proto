namespace java com.rbkmoney.questionary_proxy_aggr.kontur_focus_req
namespace erlang kontur_focus_req

include "base.thrift"
include "base_kontur_focus.thrift"

/**
* Статус ИП
*/
struct PrivateEntityStatusDetail {
    // Неформализованное описание статуса
    1: optional string status
    // Недействующий
    2: optional bool dissolved
    // Дата
    3: optional base.Date date
}

/**
* Статус организации
*/
struct LegalEntityStatusDetail {
    // Неформализованное описание статуса
    1: optional string status
    2: optional bool reorganizing
    3: optional bool dissolved
    4: optional base.Date date
}

/**
* Информация об индивидуальном предпринимателе - IP
*/
struct RegIndividualEntity {
    1: optional string fio
    2: optional string okpo
    3: optional string okato
    4: optional string okfs
    5: optional string okogu
    // Код ОКОПФ
    6: optional string okopf
    // Наименование организационно-правовой формы
    7: optional string opf
    8: optional string oktmo
    9: optional base.Date registration_date
    10: optional base.Date dissolution_date
    11: optional PrivateEntityStatusDetail status_detail
}

struct ReqKppHistory {
    1: optional string kpp
    2: optional base.Date date
}

struct ReqHistory {
    1: optional list<ReqKppHistory> kpps
    2: optional list<base_kontur_focus.LegalName> legal_names
    3: optional list<base_kontur_focus.LegalAddress> legal_addresses
    4: optional list<base_kontur_focus.Branch> branches
    5: optional list<base_kontur_focus.ManagementCompany> management_companies
    6: optional list<base_kontur_focus.Head> heads
}

/**
* Информация о юридическом лице - UL
*/
struct RegLegalEntity {
    1: optional string kpp
    2: optional string okpo
    3: optional string okato
    4: optional string okfs
    5: optional string oktmo
    6: optional string okogu
    7: optional string okopf
    8: optional string opf
    9: optional base_kontur_focus.LegalName legal_name
    10: optional base_kontur_focus.LegalAddress legal_address
    11: optional list<base_kontur_focus.Branch> branches
    12: optional LegalEntityStatusDetail status
    13: optional base.Date registration_date
    14: optional base.Date dissolution_date
    15: optional list<base_kontur_focus.Head> heads
    16: optional list<base_kontur_focus.ManagementCompany> management_companies
    17: optional ReqHistory history
}

union Contractor {
    1: RegIndividualEntity individual_entity
    2: RegLegalEntity legal_entity
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
    5: required base_kontur_focus.BriefReport brief_report
    6: required base_kontur_focus.ContactPhones contact_phones
}
