namespace java com.rbkmoney.questionary_proxy_aggr.kontur_focus_api
namespace erlang kontur_focus_api

include "kontur_focus_req.thrift"
include "kontur_focus_egr_details.thrift"
include "kontur_focus_licences.thrift"

enum KonturFocusEndPoint {
    /* Актуализация реквезитов */
    req
    /* Расширенные сведения на основе ЕГРЮЛ/ЕГРИП */
    egrDetails
    /* Информация о лицензиях */
    licences
}

union KonturFocusRequest {
    1: kontur_focus_req.ReqQuery req_query
    2: kontur_focus_egr_details.EgrDetailsQuery egr_details_query
    3: kontur_focus_licences.LicencesQuery licences_query
}

union KonturFocusResponse {
    1: kontur_focus_req.RegResponse req_response
    2: kontur_focus_egr_details.EgrDetailsResponse egr_details_response
    3: kontur_focus_licences.LicencesResponse licences_response
}
