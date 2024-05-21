# From the Deep

## Random Partitioning

This approach prevents the boats from overloading with too much data,
but when searching for data it's likely to be slower because the queries iterate over every boat's data.

## Partitioning by Hour

This approach prevents search queries from being slow by storing data in specific boats,
but it is likely to overload one boat and require it to be stored in another boat.

## Partitioning by Hash Value

This approach prevents the boats from overloading with too much data and prevents slowness when trying to find specific data,
but when searching for all data it's likely to be slower because it's needed to hash every value in the range to find data and the queries are likely to iterate over every boat.
