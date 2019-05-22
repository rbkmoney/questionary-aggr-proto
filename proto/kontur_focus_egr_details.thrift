namespace java com.rbkmoney.questionary_proxy_aggr.kontur_focus_egr_details
namespace erlang kontur_focus_egr_details

include "base.thrift"
include "base_kontur_focus.thrift"

/**
* Основной вид деятельности
*/
struct PrincipalActivity {
    // Код вида деятельности
    1: required string code
    // Название вида деятельности
    2: required string text
    3: required base.Date date
}

/**
* Дополнительный вид деятельности
*/
struct ComplementaryActivity {
    // Код вида деятельности
    1: required string code
    // Название вида деятельности
    2: required string text
    3: required base.Date date
}

/**
* Вид деятельности
*/
struct Activity {
    1: required PrincipalActivity principal_activity
    2: required list<ComplementaryActivity> complementary_activities
    3: required string okved_version
}

/**
* Сведения о регистрации
*/
struct RegInfo {
    // Дата присвоения ОГРН
    1: required base.Date ogrn_date
    // Наименование органа, зарегистрировашего юридическое лицо
    2: optional string reg_name
}

/**
* Сведения о постановке на учет в налоговом органе
*/
struct NalogRegBody {
    // Код налогового органа
    1: required string nalog_code
    // Наименование налогового органа
    2: required string nalog_name
    // Дата поставки на учет
    3: required base.Date nalog_reg_date
    4: optional string kpp
    5: required base.Date date
}

/**
* Сведения регистрирующего органа
*/
struct RegBody {
    1: required string nalog_code
    2: required string nalog_name
    3: optional base.Date nalog_reg_date
    4: optional string kpp
    5: required base.Date date
}

/**
* Акционеры - физлица
*/
struct ShareHolderFl {
    1: required string fio
    // Местожительство физлица
    2: required string address
    // Доля обыкновенных акций в процентах
    3: required base.Percent voting_shares_percent
    // Доля участия в уставном капитале в процентах
    4: required base.Percent capital_shares_percent
    5: required base.Date date
}

/**
* Акционеры - юрлица
*/
struct ShareHolderUL {
    1: required string ogrn
    2: required string inn
    // Полное наименование юридического лица
    3: required string full_name
    // Местонахождения юрлица
    4: required string address
    // Доля обыкновенных акций в процентах
    5: required base.Percent voting_shares_percent
    // Доля участия в уставном капитале в процентах
    6: required base.Percent capital_shares_percent
    // Дата последнего изменения в долях
    7: required base.Date date
}

struct ShareHolderOther {
    // Полное наименование лица
    1: required string full_name
    // Местонахождения юрлица или Местожительство физлица
    2: required string address
    // Доля обыкновенных акций в процентах
    3: required base.Percent voting_shares_percent
    // Доля участия в уставном капитале в процентах
    4: required base.Percent capital_shares_percent
    // Дата последнего изменения в долях
    5: required base.Date date
}

/**
* Акционеры, являющиеся аффилированными лицами
*/
struct ShareHolders {
    1: required base.Date date
    2: required list<ShareHolderFl> share_holders_fl
    3: required list<ShareHolderUL> share_holders_ul
    4: required list<ShareHolderOther> share_holders_other
}

/**
* Уставный капитал
*/
struct StatedCapital {
    1: required base.Sum sum
    2: required base.Date date
}

/**
* Доля в уставном капитале
*/
struct Share {
    1: required base.Sum sum
    2: required base.Percent percentage_plain
    3: required i32 percentage_nominator
    4: required i32 percentage_denominator
}

/**
* Учредитель физлица
*/
struct FounderFL {
    1: required string fio
    2: required string innfl
    3: required Share share
    4: required base.Date date
    5: required base.Date first_date
}

/**
* Учредители - юрлица
*/
struct FounderUL {
    1: required string ogrn
    2: required string inn
    // Полное наименование юридического лица
    3: required string full_name
    4: required Share share
    5: required base.Date date
    6: required base.Date first_date
}

/**
* Учредители - иностранные компании
*/
struct FounderForeign {
    // полное наименование юридического лица
    1: required string full_name
    2: required string country
    3: required Share share
    // Дата последнего внесения изменений
    4: required base.Date date
    // Дата первого внесения изменений
    5: required base.Date first_date
}

/**
* Предшественники
*/
struct Predecessors {
    // Наименование организации
    1: required string name
    2: required string inn
    3: required string ogrn
    4: required base.Date date
}

/**
* Преемники
*/
struct Successors {
    // Наименование организации
    1: required string name
    2: required string inn
    3: required string ogrn
    4: required base.Date date
}

/**
* Документы, представленные при внесении записи
*/
struct RecordDocument {
    1: required string name
    2: required base.Date date
}

/**
* Свидетельства, подтверждающие факт внесения изменений
*/
struct Certificate {
    // Серия и номер
    1: required string serial_number
    // Дата выдачи
    2: required base.Date date
}

/**
* Запись в ЕГРЮЛ
*/
struct EgrRecord {
    // ГРН записи
    1: required string grn
    // Дата внесения записи
    2: required base.Date date
    // Причина внесения записи
    3: required string name
    // Признак недействительности записи
    4: required bool invalid
    // Имя регистрирующего органа, который внес запись
    5: required string reg_name
    // Код регистрирующего органа, который внес запись
    6: required string reg_code
    7: optional list<RecordDocument> documents
    8: optional list<Certificate> certificates
}

struct History {
    1: required base.Date date
    2: optional list<ShareHolderFl> shareholders_fl
    3: optional list<ShareHolderUL> shareholders_ul
    4: optional list<ShareHolderOther> shareholders_other
    5: optional list<StatedCapital> stated_capitals
    6: optional list<FounderFL> founders_fl
    7: optional list<FounderUL> founders_ul
    8: optional list<FounderForeign> founders_foreign
}

struct LegalEntity {
    1: required string okpo
    // Регистрационный номер ПФР
    2: required string pft_reg_number
    // Регистрационный номер ФСС
    3: required string fss_req_number
    // Регистрационный номер ФОМС
    4: required string foms_req_number
    5: required Activity activities
    6: required RegInfo reg_info
    7: required NalogRegBody nalog_reg_body
    8: required RegBody reg_body
    9: required ShareHolders share_holders
    10: required StatedCapital stated_capital
    11: required list<FounderFL> founders_fl
    12: required list<FounderUL> founders_ul
    13: required list<FounderForeign> founders_foreign
    14: required list<Predecessors> predecessors
    15: required list<Successors> successors
    16: required list<EgrRecord> egr_records
    17: optional History history
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

struct IndividualEntity {
    1: required string okpo
    // Регистрационный номер ПФР
    2: required string pfr_reg_number
    // Регистрационный номер ФСС
    3: required string fss_reg_number
    // Регистрационный номер ФОМС
    4: required string foms_reg_number
    5: optional string okato
    6: optional ShortenedAddress shortened_address
    7: required Activity activities
    8: required RegInfo reg_info
    9: required NalogRegBody nalog_reg_body
    10: required RegBody reg_body
    11: required list<EgrRecord> egr_records
}

union Contractor {
    1: IndividualEntity individual_entity
    2: LegalEntity legal_entity
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
