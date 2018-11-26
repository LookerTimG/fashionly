  view: derived_native_table {
    derived_table: {
      persist_for: "4 hours"
#      distribution_style: even
      distribution: "order_id"
      sortkeys: ["order_id"]
      explore_source: order_items {
        column: order_id {}
        column: count {}
        column: total_sale_price {}
        derived_column: order_revenue_rank {
          sql: rank() over(order by total_sale_price desc) ;;
        }
      }
    }
    dimension: order_id {
      type: number
    }
    dimension: count {
      type: number
    }
    dimension: total_sale_price {
      type: number
      value_format: "$#,##0.00"
    }

    dimension: order_revenue_rank {
      type: number

      }

}
