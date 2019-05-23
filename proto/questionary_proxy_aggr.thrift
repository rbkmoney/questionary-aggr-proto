namespace java com.rbkmoney.damsel.questionary_proxy_aggr
namespace erlang questionary_proxy_aggr

include "kontur_focus_api.thrift"

exception KonturFocusRequestException {}

service QuestionaryProxyAggrHandler {

    kontur_focus_api.KonturFocusResponse RequestKonturFocus(
                1: kontur_focus_api.KonturFocusRequest request,
                2: kontur_focus_api.KonturFocusEndPoint endPoint
            ) throws (1: KonturFocusRequestException ex)

}


