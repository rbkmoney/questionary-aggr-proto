namespace java com.rbkmoney.questionary_proxy_aggr.base_dadata
namespace erlang base_dadata

include "base.thrift"

typedef string HID

/**
* Наименование организации
*/
struct OrgName {
    1: optional string full_name
    2: optional string full_with_opf
    3: optional string latin
    4: optional string short_name
    5: optional string short_with_opf
}

struct Payment {
    // Платежное наименование
    1: optional string name
    2: optional string full_name
    3: optional string short_name
}

/**
* Организационно-правовая форма
*/
struct Opf {
    1: optional string code
    2: optional string full_name
    3: optional string short_name
    4: optional string type;
}

/**
* Приоритет города при ранжировании
*/
struct LocationBoostFilter {
    1: optional string kladr_id
}

enum Gender {
    MALE
    FEMALE
    UNKNOWN
}

/**
* Статус организации
*/
enum OrgStatus {
    ACTIVE
    LIQUIDATING
    LIQUIDATED
    REORGANIZING
}

/**
* Тип организации
*/
enum OrgType {
    LEGAL
    INDIVIDUAL
}

/**
* Тип учредителя
*/
enum FounderType {
    LEGAL
    PHYSICAL
}

/**
* Тип руководителя
*/
enum ManagerType {
    EMPLOYEE
    FOREIGNER
    LEGAL
}

/**
* Тип подразделения
*/
enum BranchType {
    MAIN
    BRANCH
}

enum QueryType {
    FULL_TEXT_SEARCH
    BY_INDENTIFIRE
}

struct DaDataState {
    1: optional base.Timestamp actuality_date
    2: optional base.Timestamp registration_date
    3: optional base.Timestamp liquidation_date
    4: optional OrgStatus status
}

/**
* Сведения о налогово ПФР и ФСС
*/
struct Authorities {
    1: optional string type
    2: optional string code
    3: optional string name
    4: optional string address
}

/**
* ИФНС регистрации
*/
struct Registration {
    1: optional string type
    2: optional string series
    3: optional string number
    4: optional string issue_date
    5: optional string issue_authority
}

// Гражданство ИП
struct CitizenshipIP {
    // Числовой код страны по ОКСМ
    1: optional string numeric
    // Трехбуквенный код страны по ОКСМ
    2: optional string alpha_3
    // Полное наименование страны
    3: optional string country_full_name
    // Краткое наименование страны
    4: optional string country_short_name
}

/**
* Учредитель компании
*/
struct Founder {
    1: optional string ogrn
    2: optional string inn
    3: optional string name
    4: optional string fio
    // Внутренний идентификатор
    5: optional HID hid
    // Тип учредителя
    6: optional FounderType type
}

/**
* Руководитель компании
*/
struct Management {
    1: optional string name
    2: optional string post
}

/**
* Руководство компании
*/
struct Manager {
    1: optional string ogrn
    2: optional string inn
    3: optional string name
    4: optional string fio
    5: optional string post
    6: optional HID hid
    7: optional ManagerType type
}

struct License {
    1: optional string series
    2: optional string number
    // Дата выдачи
    3: optional base.Timestamp issue_date
    // Название выдавшего органа
    4: optional base.Timestamp issue_authority
    // Дата приостановки
    5: optional string suspend_date
    // Название приостановившего органа
    6: optional string suspend_authority
    // Дата начала действия
    7: optional string valid_from
    // Дата окончания действия
    8: optional string valid_to
    // Перечень лицензируемых видов деятельности
    9: optional list<string> activities
    // Перечень адресов, по которым действует лицензия
    10: optional list<string> addresses
}

/**
* Ограничение по региону
*/
struct LocationFilter {
    1: optional string kladr_id
}
