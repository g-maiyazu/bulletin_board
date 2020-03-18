# README

## BULLENTIN_BOARD
Web掲示板サイトです。

## 本番環境
https://bullentin-board.herokuapp.com/

## 実装できた機能
* ログイン機能 (email + pass)
* 閲覧・投稿機能
* スレッド機能 (スレッドにレスをつけていくスタイル)
* 検索機能 (単語 / スレッド及びレスの横断検索)
* カテゴリ設定 (スレッドごと / 1つのスレッドに複数付与可能)
* 本番環境へのデプロイ(heroku)
* circleCIを使った自動テスト

## 使用技術
* Ruby 2.6.3
* Ruby on Rails 5.2.3
* MYSQL 8.0.19
* Bootstrap
* Docker
* Git
* Rspec
* heroku(postgreSQL)

## テスト
* Rspec
  * 単体テスト(model)
  * 統合テスト(system)
