namespace java com.rbkmoney.questionary_proxy_aggr.dadata_address
namespace erlang dadata_address

include "base_dadata.thrift"

struct AddressRegionData {
    // Код ФИАС региона
    1: optional string region_fias_id
    // Код КЛАДР региона
    2: optional string region_kladr_id
    3: optional string region_with_type
    // Тип региона (сокращенный)
    4: optional string region_type
    5: optional string region_type_full
    6: optional string region
}

struct AddressAreaData {
    // Код ФИАС района в регионе
    1: optional string area_fias_id
    // Код КЛАДР района в регионе
    2: optional string area_kladr_id
    // Район в регионе с типом
    3: optional string area_with_type
    // Тип района в регионе (сокращенный)
    4: optional string area_type
    5: optional string area_type_full
     // Район в регионе
    6: optional string area
}

struct AddressCityData {
    1: optional string city_fias_id
    2: optional string city_kladr_id
    3: optional string city_with_type
    // Тип города (сокращенный)
    4: optional string city_type
    5: optional string city_type_full
    6: optional string city
    // Административный округ
    7: optional string city_area
}

struct AddressCityDistrictData {
    1: optional string city_district_fias_id
    2: optional string city_district_kladr_id
    3: optional string city_district_with_type
    // Тип района города (сокращенный)
    4: optional string city_district_type
    5: optional string city_district_type_full
    6: optional string city_district
}

struct AddressSettlementData {
    // Код ФИАС населенного пункта
    1: optional string settlement_fias_id
    // Код КЛАДР населенного пункта
    2: optional string settlement_kladr_id
    3: optional string settlement_with_type
    4: optional string settlement_type
    5: optional string settlement_type_full
    6: optional string settlement
}

struct AddressStreetData {
    1: optional string street_fias_id
    2: optional string street_kladr_id
    3: optional string street_with_type
    4: optional string street_type
    5: optional string street_type_full
    6: optional string street
}

struct AddressHouseData {
    1: optional string house_fias_id
    2: optional string house_kladr_id
    // Тип дома (сокращенный)
    3: optional string house_type
    // Тип дома
    4: optional string house_type_full
    // Дом
    5: optional string house
}

struct AddressBlockData {
    // Тип корпуса/строения (сокращенный)
    1: optional string block_type
    2: optional string block_type_full
    // Корпус/строение
    3: optional string block
}

struct AddressFlatData {
    // Тип квартиры (сокращенный)
    1: optional string flat_type
    2: optional string flat_type_full
    // Квартира
    3: optional string flat
    // Площадь квартиры
    4: optional string flat_area
    // Рыночная стоимость квартиры
    5: optional string flat_price
}

/**
* Список ближайших станций метро (до трех штук)
*/
struct AddressMetro {
    // Название станции
    1: optional string name
    // Название линии
    2: optional string line
    // Расстояние до станции в километрах
    3: optional string distance
}

struct Address {
    // Адрес одной строкой
    1: required string value
    // Адрес одной строкой
    2: required string unrestricted_value
    // Индекс
    3: required string postal_code
    4: required string country
    // Федеральный округ
    5: required string federal_district
    6: required AddressRegionData region
    7: required AddressAreaData area
    8: required AddressCityData city
    9: required AddressCityDistrictData city_district
    10: required AddressSettlementData settlement
    11: required AddressStreetData street
    12: required AddressHouseData house
    13: required AddressBlockData block
    14: required AddressFlatData flat_data
    15: required string postal_box
    16: required string fias_id
    17: required i8 fias_level
    18: required string kladr_id
    19: required string geoname_id
    20: required i8 capital_marker
    21: required string okato
    22: required string oktmo
    23: required string tax_office
    24: required string tax_office_legal
    25: required string source
    26: required list<string> history_values
    // Координаты: широта
    27: optional string geo_lat
    // Координаты: долгота
    28: optional string geo_lon
    // Код точности координат
    29: optional i8 qc_geo
    // Иерархический код адреса в ФИАС
    30: optional string fias_code
    // Признак актуальности адреса в ФИАС
    31: optional i8 fias_actuality_state
    // Внутри кольцевой
    32: optional string beltway_hit
    // Расстояние от кольцевой в километрах
    33: optional string beltway_distance
    34: optional string square_meter_price
    35: optional string timezone
    36: optional list<AddressMetro> metro_list
}

struct AddressLocationFilter {
    1: optional string kladr_id
    2: optional string city_fias_id
    3: optional string area_fias_id
    4: optional string region_fias_id
    5: optional string settlement_fias_id
    6: optional string street_fias_id
    7: optional string region
    8: optional string city
}

enum BoundType {
    region
    area
    city
    settlement
    street
    house
}

struct AddressQuery {
    // Запрос для которого нужно получить подсказки
    1: required string query
    // Количество возвращаемых подсказок
    2: optional i8 count
    // Ограничение области поиска
    3: optional list<AddressLocationFilter> locations
    4: optional list<base_dadata.LocationBoostFilter> locations_boost
    5: optional BoundType from_bound
    6: optional BoundType to_bound
    7: optional bool restrict_value
}

struct AddressResponse {
    1: required list<Address> suggestions
}
