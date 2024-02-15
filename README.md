![version](https://img.shields.io/badge/version-20%20R3%2B-E23089)

# 4d-example-quasar-inventory
在庫管理サンプル

<img src="https://github.com/miyako/4d-example-quasar-inventory/assets/1725068/2f58a29c-9733-4650-9d61-49141b05ee78" height="400" />

<img src="https://github.com/miyako/4d-example-quasar-inventory/assets/1725068/744358fb-d00e-46e9-86d5-71f55087521f" height="400" />

```
npm install -g npm@10.4.0
npm i -g @quasar/cli
npm install -g @quasar/legacy-create
npm init quasar
```

### 開発

* App with Quasar CLI, let's go!
* Project folder: `quasar-inventory`
* Quasar v2 (Vue 3 | latest and greatest)
* Javascript
* Quasar App CLI with Vite 2 (stable | v1)
* Package name: `quasar-inventory`
* Project product name: `Inventory`
* Sass with SCSS syntax
* cd quasar-inventory
* quasar dev

### ビルド

```
quasar build
```

### Cordova

WebSocketを許可するために

* config.xml

```xml
<access origin="*" />
```

* サーバーのIPアドレスを`window.location.hostname`から参照せずに取得する
* `quasar build -m ios --ide`でXcodeを開き，Teamを設定する

<img src="https://github.com/miyako/4d-example-quasar-inventory/assets/1725068/95782382-4b43-4f4e-a1f8-caaba643849b" height="50" />
