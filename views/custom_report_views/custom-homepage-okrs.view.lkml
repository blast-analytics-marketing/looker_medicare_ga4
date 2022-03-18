view: custom_homepage_okrs {
  derived_table: {
    datagroup_trigger: ga4_default_datagroup
    partition_keys: ["session_date"]
    cluster_keys: ["session_date"]
    increment_key: "session_date"
    increment_offset: 3
    sql:
    SELECT
      event_date,
      user_pseudo_id,
      device.category as device_category,
      CONCAT((SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'source'), ' / ',
      (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'medium')) as source_medium,
      REGEXP_REPLACE((SELECT SPLIT(value.string_value, '?')[OFFSET(0)] FROM UNNEST(event_params) WHERE key = 'page_location'),'https://www.medicare.gov','') as page_path,
      IF((SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'entrances') = 1,1,0) AS isLandingPage,
      IF(REGEXP_REPLACE((SELECT SPLIT(value.string_value, '?')[OFFSET(0)] FROM UNNEST(event_params) WHERE key = 'page_location'),'https://www.medicare.com','') = '/',1,0) AS isHomePage
    FROM
      `@{GA4_SCHEMA}.@{GA4_TABLE_VARIABLE}` events
    WHERE
      --timestamp(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'[0-9]+'))) >= ((TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -731 DAY)))
      event_name = 'page_view'
    ;;

    }

## Dimensions
    dimension: event_date {
      type: date
      sql: ${TABLE}.event_date ;;
    }

    dimension: user_pseudo_id {
      type: string
      sql: ${TABLE}.user_pseudo_id ;;
    }

    dimension: device_category {
      type: string
      sql: ${TABLE}.device_category ;;
    }

    dimension: source_medium {
      type: string
      sql: ${TABLE}.source_medium ;;
    }

    dimension: page_path {
      type: string
      sql: ${TABLE}.page_path ;;
    }

    #dimension: device_is_mobile {
    #  group_label: "Device"
    #  label: "Is Mobile?"
    #  type: string
    #  sql: ${device_data}.device__is_mobile ;;
    #  description: "Is the user's device a mobile device? (Yes/No)"
    #}


## Measures

    measure: total_events {
      group_label: "User Events"
      label: "User Events"
      description: "Total Number of User Events"
      type: number
      sql: ${TABLE}.user_pseudo_id ;;
      value_format_name: formatted_number
    }

  }
