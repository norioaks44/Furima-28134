# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル
| Column              | Type    | Options     |
|---------------------------------------------|
| nickname            | string  | null: false |
| email               | string  | null: false |
| password_encrypted  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birth_date          | date    | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :comments

## items テーブル
| Column                 | Type       | Options                        |
|----------------------------------------------------------------------|
| user                   | references | null: false, foreign_key: true |
| name                   | string     | null: false                    |
| text                   | text       | null: false                    |
| category_id            | integer     | null: false                   |
| condition_id           | integer     | null: false                   |
| delivery_charge_id     | integer     | null: false                   |
| delivery_prefecture_id | integer     | null: false                   |
| delivery_day_id        | integer     | null: false                   |
| price                  | integer     | null: false                   |

### Association

- has_many :comments
- belongs_to :user
- has_one :purchase

## comments テーブル
| Column       | Type       | Options                        |
|------------------------------------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| comment_text | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :item


## purchases テーブル
| Column         | Type       | Options                        |
|--------------------------------------------------------------|
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
| Column        | Type       | Options                        |
|-------------------------------------------------------------|
| purchase      | references | null: false, foreign_key: true |
| post_number   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association

belongs_to :purchase