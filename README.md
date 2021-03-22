# テーブル設計

## Usersテーブル
| Column    | Type   | Option      |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association
- has_many :items
- has_many :purchases

## Itemsテーブル
| Column          | Type       | Option                        |
| --------------- | ---------- | ----------------------------- |
| item_name       | string     | null: false                   |
| description     | text       | null: false                   |
| category        | string     | null: false                   |
| condition       | string     | null: false                   |
| responsibility  | string     | null: false                   |
| delivery_source | string     | null: false                   |
| days            | integer    | null: false                   |
| price           | string     | null: false                   |
| user            | references | null:false, foreign_key: true |
| purchase        | references | null:false, foreign_key: true |
| shippings       | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :shipping
- has_one :purchase

## Purchasesテーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| credit_number | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping


## Shippingsテーブル
| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postal_number | string  | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| address       | text    | null: false |
| building      | text    |             |
| phone_number  | integer | null: false |

### Association
- has_many :items
- has_many :purchase
