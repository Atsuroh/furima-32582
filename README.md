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

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items, purchases

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| product_name  | string     | null: false |
| text          | string     | null: false |
| category_id   | string     | null: false |
| status_id     | string     | null: false |
| burden_id     | string     | null: false |
| prefecture_id | string     | null: false |
| price         | integer    | null: false |
| user_id       | references |             |

### Association

- has_many :users, comments
- has_one :purchases

## comment テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| text    | text       | null: false |
| user_id | references |             |
| item_id | references |             |

### Association

- belongs_to :items

## deliveries テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_code     | integer    | null: false |
| prefecture_id | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     | null: false |
| phone_number  | integer    | null: false |
| purchase_id   | references | null: false |

### Association

- has_one :purchases

## purchase テーブル

| Column  | Type       | Options |
| ------- | ---------- | ------- |
| user_id | references |         |
| item_id | references |         |

### Association

- has_one :items, deliveries
- belongs_to :user