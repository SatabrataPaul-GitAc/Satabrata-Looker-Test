# Define the database connection to be used for this model.
connection: "atlan_snowflake"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

include: "/explores/orders_explore1.explore.lkml"
include: "/views/orders.view"

explore: orders_explore2 {
  view_name: orders
  from: orders
}
