namespace java com.rbkmoney.damsel.questionary_proxy_aggr
namespace erlang questionary_proxy_aggr

include "kontur_focus_api.thrift"
include "dadata_api.thrift"

exception KonturFocusRequestException {}

exception DaDataRequestException {}

service QuestionaryAggrProxyHandler {

    kontur_focus_api.KonturFocusResponse RequestKonturFocus(
                1: kontur_focus_api.KonturFocusRequest request,
                2: kontur_focus_api.KonturFocusEndPoint endPoint
            ) throws (1: KonturFocusRequestException ex)

    dadata_api.DaDataResponse RequestDaData(
                1: dadata_api.DaDataRequest request,
                2: dadata_api.DaDataEndpoint endPoint
            ) throws (1: DaDataRequestException ex)

}


