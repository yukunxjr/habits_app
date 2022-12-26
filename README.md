# Habits_app

## TOP-Image

<img width="1424" alt="habits_app_main_image" src="https://user-images.githubusercontent.com/109594942/209146779-d2fa64b0-52b4-4b22-937b-55a2178f6252.png">

## URL

## 概要

勉強時間を計測及び管理し、勉強時間や勉強量を可視化できるアプリです。

## 開発に至った背景

自身がプログラミングを学習する上で「学習を習慣化したい！」「効率よく勉強をしたい！」「勉強を続けたが成果が見えない」などと思っていました。

そのような状況の中で、学習を管理できるアプリケーションを思いつきました。

勉強することを楽しみモチベーションをあげることのできるサービスを作りたいという思いでこのアプリケーションを開発いたしました。

## 機能一覧

- ユーザー管理機能(devise)
- ノート機能（一覧リスト、詳細ページ、編集機能、ゴミ箱機能、削除機能）
- タイマー機能
- 目標設定機能
- スキル設定機能
- 学習時間登録機能 \*学習管理機能（棒グラフ、円グラフ）
- フラッシュメッセージ機能
- バリデーション機能 \*ログイン前後のリダイレクト機能

## 環境・使用技術

### フロントエンド

- CSS/SCSS
- Nuxt 2.0.0

###　主要パッケージ

- chart.js/vuetify/moment/vee-validate

### バックエンド

- Ruby 2.7.6
- Rails 6.1.7

### 主要 gem

- devise/devise_token_auth/devise-i18n/discard

### Nuxt.js と Rails の連携

- Axios/Auth Module

### 開発環境

MySQL 8.0.31

### 本番環境

- AWS(ECR,ECS,S3,Route53,ALB)
- RDB(AmazonAurora)

### ソースコード管理

GitHub

### テスト(バックエンド側のみ)

- RSpec(単体・結合)
- FactoryBot

### その他技術

レスポンス対応
非同期通信

### 工夫した点

1. 配色
2.
3.
4.
5.

### ER 図
