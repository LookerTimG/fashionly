connection: "thelook_events"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: adv_lookml {
  from: order_items
  join: inventory_items {
    type: left_outer
    relationship: many_to_many
    sql_on: ${inventory_items.id} = ${adv_lookml.inventory_item_id} ;;
  }
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${adv_lookml.user_id} = ${users.id} ;;
  }
  join: distribution_centers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory_items.product_distribution_center_id} = ${distribution_centers.id} ;;
  }
}
