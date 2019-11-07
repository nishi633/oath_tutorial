# oath_tutorial

GitHubのOAuth認証の実装。

## 初期設定
[こちら](https://github.com/settings/developers)からGitHubのOAuthトークンを発行し、下記のように`myapp/.env`を作成する。

```.env
OMNIAUTH_GITHUB_KEY="YOUR_KEY"
OMNIAUTH_GITHUB_SECRET="YOUR_SECRET_KEY"
```

### imageの作成

```
docker-compose build
```

### 初回起動

```
docker-compose up -d
```

### migration

```
docker-compose run app rake db:migrate
```

## 起動

```
docker-compose up -d
```

## version
- Ruby: 2.6.5
- Rails: 5.2.3

