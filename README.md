##what
　baseのAPIを叩くコード

##HOW
 - base_items.rb
    - 商品の一覧を出す
 - base_orders.rb
    - 注文情報を出す
    - 第一引数〜第二引数の間の範囲を取得
 - base_token.rb
    - tokenとか入れるやつ。
    - https://github.com/baseinc/api-docs/blob/master/samples/ruby/oauth/token.rb   
 - base_orders_detail.rb
    - 注文の詳細を取得するやつ
    - 今色々やってくっそ汚い
 - base_orders_ccpaument.sh
    - 一番のメイン
    - 第一引数〜第二引数の範囲のクレジットカード決済にかかった手数料の合計を出す
    - ちなみに形式は yyyy-mm-dd
