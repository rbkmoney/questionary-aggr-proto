namespace java com.rbkmoney.questionary_proxy_aggr.kontur_focus_licences
namespace erlang kontur_focus_licences

include "base.thrift"
include "base_kontur_focus.thrift"

struct License {
    // Номер лицензии
    1: optional string official_num
    // Название органа, выдавшего лицензию
    2: optional string issuer_name
    // Дата лицензии
    3: optional base.Date date
    // Дата начала действия лицензии
    4: optional base.Date date_start
    // Дата окончания действия лицензии
    5: optional base.Date date_end
    // Строковое описание статуса
    6: optional string status_description
    // Описание вида деятельности
    7: optional string activity
    // Описание видов работ/услуг
    8: optional list<string> services
    // Места действия лицензии (массив неформализованных строк)
    9: optional list<string> addresses
}

struct LicencesQuery {
    1: optional list<string> ogrn
    2: optional list<string> inn
}

struct LicencesResponse {
    1: required string inn
    2: required string ogrn
    3: required base.URL focus_href
    4: required list<License> licenses
}
