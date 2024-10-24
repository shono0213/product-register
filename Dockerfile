FROM ruby:2.5

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn

# rubygems をアップデート
RUN gem update --system 3.3.22

# 作業ディレクトリを設定
WORKDIR /product-register

# Gemfile と Gemfile.lock をコピー
COPY Gemfile Gemfile.lock /product-register

# bundle install を実行
RUN bundle install
