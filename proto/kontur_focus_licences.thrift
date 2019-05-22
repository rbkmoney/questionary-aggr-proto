namespace java com.rbkmoney.questionary_proxy_aggr.kontur_focus_licences
namespace erlang kontur_focus_licences

include "base.thrift"
include "base_kontur_focus.thrift"

struct License {
    // Номер лицензии
    optional string official_num
    // Название органа, выдавшего лицензию
    optional string issuer_name
    // Дата лицензии
    optional base.Date date
    // Дата начала действия лицензии
    optional base.Date date_start
    // Дата окончания действия лицензии
    optional base.Date date_end
    // Строковое описание статуса
    optional string status_description
    // Описание вида деятельности
    optional string activity
    // Описание видов работ/услуг
    optional list<string> services
    // Места действия лицензии (массив неформализованных строк)
    optional list<string> addresses
}

struct LicencesQuery {
    1: optional list<string> ogrn
    2: optional list<string> inn
}

struct LicencesResponse {
    required string inn
    required string orgn
    required base.URL focus_href
    required list<License> licenses
}
