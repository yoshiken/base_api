#!/bin/bash

ruby base_orders.rb $1 $2  |jq '.orders[].unique_key' > order_result
ruby base_orders_detail.rb | jq '.order|.c_c_payment_transaction|.collected_fee' > payment_result

while read line ; do
        sum=$(($sum + $line))

done < payment_result

echo $sum

rm order_result
rm payment_result
