namespace java com.rbkmoney.questionary_proxy_aggr.kontur_focus_beneficial_owner
namespace erlang kontur_focus_beneficial_owner

include "base.thrift"
include "base_kontur_focus.thrift"

struct BeneficialOwnerUl {
    1: optional string ogrn
    2: optional string inn
    // Полное наименование юридического лица
    3: optional string fullName
    // Размер доли в процентах. Доля вычисляется по цепочке учредителей и акционеров
    4: optional base.Percent share
    // Признак точной доли
    5: optional bool is_accurate
}

struct BeneficialOwnerFl {
    1: optional string fio
    2: optional string innfl
    3: optional base.Percent share
    4: optional bool is_accurate
}

/**
* Конечные владельцы - иностранные компании
*/
struct BeneficialOwnerForeign {
    1: optional string fullName
    2: optional string country
    3: optional base.Percent share
    4: optional bool is_accurate
}

/**
* Конечные владельцы - без категории. Это могут быть юрлица, физлица и иностранные лица
*/
struct BeneficialOwnerOther {
    1: optional string fullName
    2: optional base.Percent share
    3: optional bool is_accurate
}

struct BeneficialOwners {
    1: optional list<BeneficialOwnerFl> beneficial_owners_fl
    2: optional list<BeneficialOwnerUl> beneficial_owners_ul
    3: optional list<BeneficialOwnerForeign> beneficial_owners_foreign
    4: optional list<BeneficialOwnerOther> beneficial_owners_other
}

struct BeneficialOwnerQuery {
    1: optional list<string> ogrn
    2: optional list<string> inn
}

struct BeneficialOwnerResponse {
    1: required string inn
    2: required string ogrn
    // Ссылка на карточку юридического лица (ИП) в Контур.Фокусе
    3: required base.URL focus_href
    4: optional base_kontur_focus.StatedCapital stated_capital
    5: required BeneficialOwners beneficial_owners
    6: required BeneficialOwners historical_beneficial_owners
}

struct BeneficialOwnerResponses {
    1: required list<BeneficialOwnerResponse> beneficial_owner_responses
}
