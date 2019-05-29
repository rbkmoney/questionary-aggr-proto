namespace java com.rbkmoney.damsel.questionary_proxy_aggr
namespace erlang questionary_proxy_aggr

include "kontur_focus_api.thrift"
include "dadata_api.thrift"

exception KonturFocusRequestException {
    1: required string error_msg
}

exception DaDataRequestException {
    1: required string error_msg
}

service QuestionaryAggrProxyHandler {

    kontur_focus_api.KonturFocusResponse RequestKonturFocus(
                1: kontur_focus_api.KonturFocusRequest request,
                2: kontur_focus_api.KonturFocusEndPoint endpoint
            ) throws (1: KonturFocusRequestException ex)

    dadata_api.DaDataResponse RequestDaData(
                1: dadata_api.DaDataRequest request,
                2: dadata_api.DaDataEndpoint endpoint
            ) throws (1: DaDataRequestException ex)

}


