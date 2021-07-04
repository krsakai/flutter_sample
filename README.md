# Description

Flutterアプリのアーキテクチャサンプル

## How to debug

1. VSCode用に launch.json でAPI Keyの設定
```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "flutter_mobile",
      "program": "lib/main.dart",
      "request": "launch",
      "type": "dart",
      "args": [
        "--dart-define=GOOGLE_API_KEY=",
        "--dart-define=GOOGLE_API_KEY_IOS="
      ],
      "env": {
        "GOOGLE_API_KEY_ANDROID": ""
      }
    }
  ]
}
```

2. flutter build の実行 (環境変数登録のため、ios/Flutter/Runnder.xcworkspace でビルド実行）
