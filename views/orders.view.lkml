# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "PRODUCTION"."ORDERS"
    ;;
  drill_fields: [order_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

  dimension: bank_transfer_amount {
    type: number
    sql: ${TABLE}."BANK_TRANSFER_AMOUNT" ;;
  }

  dimension: coupon_amount {
    type: number
    sql: ${TABLE}."COUPON_AMOUNT" ;;
  }

  dimension: credit_card_amount {
    type: number
    sql: ${TABLE}."CREDIT_CARD_AMOUNT" ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: customer_status {
    type: string
    sql: ${TABLE}."CUSTOMER_STATUS" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: first_order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."FIRST_ORDER" ;;
  }

  dimension: gift_card_amount {
    type: number
    sql: ${TABLE}."GIFT_CARD_AMOUNT" ;;
  }

  dimension: had_bank_transfer_payment {
    type: yesno
    sql: ${TABLE}."HAD_BANK_TRANSFER_PAYMENT" ;;
  }

  dimension: had_coupon_payment {
    type: yesno
    sql: ${TABLE}."HAD_COUPON_PAYMENT" ;;
  }

  dimension: had_credit_card_payment {
    type: yesno
    sql: ${TABLE}."HAD_CREDIT_CARD_PAYMENT" ;;
  }

  dimension: had_gift_card_payment {
    type: yesno
    sql: ${TABLE}."HAD_GIFT_CARD_PAYMENT" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension_group: most_recent_order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MOST_RECENT_ORDER" ;;
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}."NUMBER_OF_ORDERS" ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ORDER_DATE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id, first_name, last_name]
  }
}
