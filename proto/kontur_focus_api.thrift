namespace java com.rbkmoney.questionary_proxy_aggr.kontur_focus_api
namespace erlang kontur_focus_api

include "kontur_focus_req.thrift"
include "kontur_focus_egr_details.thrift"
include "kontur_focus_licences.thrift"
include "kontur_focus_beneficial_owner.thrift"

enum KonturFocusEndPoint {
    /* Актуализация реквезитов */
    req
    /* Расширенные сведения на основе ЕГРЮЛ/ЕГРИП */
    egrDetails
    /* Информация о лицензиях */
    licences
    /* Конечные бенефициары */
    beneficial_owners
}

union KonturFocusRequest {
    1: kontur_focus_req.ReqQuery req_query
    2: kontur_focus_egr_details.EgrDetailsQuery egr_details_query
    3: kontur_focus_licences.LicencesQuery licences_query
    4: kontur_focus_beneficial_owner.BeneficialOwnerQuery beneficial_owner_query
}

union KonturFocusResponse {
    1: kontur_focus_req.ReqResponses req_responses
    2: kontur_focus_egr_details.EgrDetailsResponses egr_details_responses
    3: kontur_focus_licences.LicencesResponses licences_responses
    4: kontur_focus_beneficial_owner.BeneficialOwnerResponses beneficial_owner_responses
}
