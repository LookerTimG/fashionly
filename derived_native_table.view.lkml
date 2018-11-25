  view: derived_native_table {
    derived_table: {
      explore_source: order_items {
        column: order_id {}
        column: count {}
        column: total_sale_price {}
        derived_column: order_revenue_rank {
          sql: rank() over(order by total_revenue desc) ;;
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
    }

    dimension: order_revenue_rank {
      type: number

      }

}
