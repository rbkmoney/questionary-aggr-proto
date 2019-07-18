namespace java com.rbkmoney.questionary_proxy_aggr.base_kontur_focus
namespace erlang base_kontur_focus

include "base.thrift"

struct Toponim {
    // Краткое наименование вида топонима
    1: optional string topo_short_name
    // Полное наименование вида топонима
    2: optional string topo_full_name
    // Значение топонима
    3: optional string topo_value
}

/**
* Управляющая компания
*/
struct ManagementCompany {
    // Наименование управляющей организации
    1: optional string name
    2: optional string inn
    3: optional string ogrn
    4: optional base.Date date
    5: optional base.Date first_date
}

/**
* Лицо имеющее право подписи без доверенности (руководитель)
*/
struct Head {
    // ФИО
    1: optional string fio
    // ИННФЛ
    2: optional string innfl
    // Должность
    3: optional string position
    // Дата последнего внесения изменений
    4: optional base.Date date
    // Дата первого внесения сведений
    5: optional base.Date first_date
}

/**
* Наименование юридического лица
*/
struct LegalName {
    1: optional string short_name
    2: optional string full_name
    3: optional base.Date date
}

/**
* Разобранный на составляющие адрес в РФ
*/
struct ParsedAddressRF {
    // Индекс
    1: optional string zip_code
    // Код КЛАДР
    2: optional string kladr_code
    // Код региона
    3: optional string region_code
    // Регион
    4: required Toponim region_name
    // Район
    5: optional Toponim district
    // Город
    6: optional Toponim city
    // Населенный пункт
    7: optional Toponim settlement
    // Улица
    8: optional Toponim street
    // Дом
    9: optional Toponim house
    // Корпус
    10: optional Toponim bulk
    // Офис/квартира/комната
    11: optional Toponim flat
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
    1: optional ParsedAddressRF address_rf
    2: optional base.Date date
    3: optional base.Date first_date
}

/**
* Адрес вне РФ
*/
struct ForeignAddress {
    // Наименование страны
    1: optional string country_name
    // Строка, содержашая адрес
    2: optional string address
}

/**
* Филиалы и представительства
*/
struct Branch {
    // Наименование филиала или представительства
    1: optional string name
    2: optional ParsedAddressRF address_rf
    3: optional ForeignAddress foreign_address
    4: optional base.Date date
}

/**
* Сводная информация из экспресс-отчета
*/
struct BriefReportSummary {
    1: optional bool red_statements
    2: optional bool yellow_statements
    3: optional bool green_statements
}

/**
* Экспресс-отчет по контрагенту
*/
struct BriefReport {
    1: optional BriefReportSummary summary,
    2: optional base.URL href;
}

struct ContactPhones {
    1: optional i64 count
    2: optional list<string> phones
}

/**
* Уставный капитал
*/
struct StatedCapital {
    1: optional base.Sum sum
    2: optional base.Date date
}

/**
* Доля в уставном капитале
*/
struct Share {
    1: optional base.Sum sum
    2: optional base.Percent percentage_plain
    3: optional i32 percentage_nominator
    4: optional i32 percentage_denominator
}

/**
* Учредитель физлица
*/
struct FounderFL {
    1: optional string fio
    2: optional string innfl
    3: optional Share share
    4: optional base.Date date
    5: optional base.Date first_date
}

/**
* Учредители - юрлица
*/
struct FounderUL {
    1: optional string ogrn
    2: optional string inn
    // Полное наименование юридического лица
    3: optional string full_name
    4: optional Share share
    5: optional base.Date date
    6: optional base.Date first_date
}

/**
* Учредители - иностранные компании
*/
struct FounderForeign {
    // полное наименование юридического лица
    1: optional string full_name
    2: optional string country
    3: optional Share share
    // Дата последнего внесения изменений
    4: optional base.Date date
    // Дата первого внесения изменений
    5: optional base.Date first_date
}

/**
* Основной вид деятельности
*/
struct PrincipalActivity {
    // Код вида деятельности
    1: optional string code
    // Название вида деятельности
    2: optional string text
    3: optional base.Date date
}

/**
* Дополнительный вид деятельности
*/
struct ComplementaryActivity {
    // Код вида деятельности
    1: optional string code
    // Название вида деятельности
    2: optional string text
    3: optional base.Date date
}

/**
* Вид деятельности
*/
struct Activity {
    1: optional PrincipalActivity principal_activity
    2: optional list<ComplementaryActivity> complementary_activities
    3: optional string okved_version
}

/**
* Сведения о регистрации
*/
struct RegInfo {
    // Дата присвоения ОГРН
    1: optional base.Date ogrn_date
    // Наименование органа, зарегистрировавшего юридическое лицо
    2: optional string reg_name
}

/**
* Сведения о постановке на учет в налоговом органе
*/
struct NalogRegBody {
    // Код налогового органа
    1: optional string nalog_code
    // Наименование налогового органа
    2: optional string nalog_name
    // Дата поставки на учет
    3: optional base.Date nalog_reg_date
    4: optional string kpp
    5: optional base.Date date
}

/**
* Сведения регистрирующего органа
*/
struct RegBody {
    1: optional string nalog_code
    2: optional string nalog_name
    3: optional base.Date nalog_reg_date
    4: optional string kpp
    5: optional base.Date date
}
