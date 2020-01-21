namespace java com.rbkmoney.damsel.questionary_proxy_aggr
namespace erlang questionary_proxy_aggr

include "kontur_focus_api.thrift"
include "dadata_api.thrift"

exception KonturFocusInvalidRequest {
    1: required string error_msg
}

exception DaDataInvalidRequest {
    1: required string error_msg
}

exception KonturFocusNotFound {
}

exception DaDataNotFound {
}

service QuestionaryAggrProxyHandler {

    kontur_focus_api.KonturFocusResponse RequestKonturFocus(
                1: kontur_focus_api.KonturFocusRequest request,
                2: kontur_focus_api.KonturFocusEndPoint endpoint
            ) throws (1: KonturFocusInvalidRequest ex1, 2: KonturFocusNotFound ex2)

    dadata_api.DaDataResponse RequestDaData(
                1: dadata_api.DaDataRequest request,
                2: dadata_api.DaDataEndpoint endpoint
            ) throws (1: DaDataInvalidRequest ex1, 2: DaDataNotFound ex2)

}
