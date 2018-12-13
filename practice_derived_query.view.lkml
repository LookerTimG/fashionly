view: practive_derived_query {
  derived_table: {
    sql: SELECT oi.user_id
        , COUNT(DISTINCT oi.order_id) AS order_count_lifetime
        , CAST(SUM(oi.sale_price) AS DECIMAL(7,2)) AS sales_total
        , CAST(MIN(oi.created_at) AS DATE) AS first_order_date
        , CAST(MAX(oi.created_at) AS DATE) AS last_order_date
      FROM order_items oi
      GROUP BY oi.user_id;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: order_count_lifetime {
    type: number
    sql: ${TABLE}.order_count_lifetime ;;
  }

  dimension: sales_total {
    type: number
    sql: ${TABLE}.sales_total ;;
  }

  dimension: first_order_date {
    type: date
    sql: ${TABLE}.first_order_date ;;
  }

  dimension: last_order_date {
    type: date
    sql: ${TABLE}.last_order_date ;;
  }

  set: detail {
    fields: [user_id, order_count_lifetime, sales_total, first_order_date, last_order_date]
  }
}
