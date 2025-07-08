# TCP/IPとは
ネットワーク通信のプロトコル群のこと。なお、TCPはトランスポート層の通信方式、IPはインターネット層の通信方式のことを指す。
> TCP/IP（Transmission Control Protocol /Internet Protocol）とは、一般的にインターネットや他のネットワークで通信を行うための世界標準で使用されるプロトコル群のことを指し、インターネットプロトコルスイートとも呼ばれております。

# TCP/IPの階層
> ネットワーク通信の役割を階層的に分類し、各層での機能の目的を分かりやすく共有するため、以下の4階層のモデルで表されます。 
> - アプリケーション層
> - トランスポート層
> - インターネット層
> - ネットワークインターフェース層

# TCP(トランスポート層)とは
> TCPは、高い信頼性を提供するプロトコルです。コネクション型通信(疎通確認前提の通信)と呼ばれる通信方法で、正常に相手と通信できているかを確認してから接続し、データの通信を行います。

## 前提知識
### コネクション型通信とは
> コネクション型通信は、データ転送を行う前に「正常に相手と接続できているか？」を確認したうえで通信を開始する通信方法です。

## 実践
ローカルループバックアドレス(127.0.0.1)をクライアントとして設定し、ポート(12345)に接続を行った。

```
nc -l 12345
```

```
nc 127.0.0.1 12345
```

# IP(インターネット層)とは
> IPは、ネットワーク上の宛先IPアドレスに基づいてデータを送受信します。さらに、コンピュータAからコンピュータBへデータを転送する際の最適経路を判断する方法や、送受信にはデータを小分けした「パケット」を利用するパケット交換方式を定めています。 

# 参考資料
- [TCP接続とは - Google 検索](https://www.google.com/search?q=TCP%E6%8E%A5%E7%B6%9A%E3%81%A8%E3%81%AF&client=firefox-b-d&sca_esv=2a2a93e8be91f013&sxsrf=AHTn8zpnDd-UCbUtEDDcdOprQZvHg9cG9w%3A1742964523895&ei=K4fjZ4m1Nuro1e8P__6NwA8&ved=0ahUKEwjJ9rXq-KaMAxVqdPUHHX9_A_gQ4dUDCBA&uact=5&oq=TCP%E6%8E%A5%E7%B6%9A%E3%81%A8%E3%81%AF&gs_lp=Egxnd3Mtd2l6LXNlcnAiD1RDUOaOpee2muOBqOOBrzIFEAAYgAQyCBAAGIAEGKIEMggQABiABBiiBEiuD1CmBFiRDXAAeAKQAQGYAasCoAGrCKoBBTAuMi4zuAEDyAEA-AEBmAIEoAKOBMICBBAAGEfCAgYQABgHGB6YAwCIBgGQBgqSBwUxLjIuMaAH2wmyBwUwLjIuMbgHhQQ&sclient=gws-wiz-serp)
- [プロトコルとは　ネットワーク - Google 検索](https://www.google.com/search?q=%E3%83%97%E3%83%AD%E3%83%88%E3%82%B3%E3%83%AB%E3%81%A8%E3%81%AF%E3%80%80%E3%83%8D%E3%83%83%E3%83%88%E3%83%AF%E3%83%BC%E3%82%AF&client=firefox-b-d&sca_esv=2a2a93e8be91f013&sxsrf=AHTn8zrHPdk6cRX9WEb99Od0gfpu4PasnQ%3A1742964763360&ei=G4jjZ-rfFauVvr0PgtTY4A4&ved=0ahUKEwiq2c3c-aaMAxWriq8BHQIqFuwQ4dUDCBA&uact=5&oq=%E3%83%97%E3%83%AD%E3%83%88%E3%82%B3%E3%83%AB%E3%81%A8%E3%81%AF%E3%80%80%E3%83%8D%E3%83%83%E3%83%88%E3%83%AF%E3%83%BC%E3%82%AF&gs_lp=Egxnd3Mtd2l6LXNlcnAiKuODl-ODreODiOOCs-ODq-OBqOOBr-OAgOODjeODg-ODiOODr-ODvOOCrzIFEAAYgAQyCBAAGIAEGKIEMggQABiABBiiBEjiK1BuWJspcAR4AZABAZgBjwKgAe4ZqgEGMC4xNS40uAEDyAEA-AEBmAIPoALDEMICChAAGLADGNYEGEfCAgcQABiABBgEwgIGEAAYBBgewgIIEAAYBBgIGB7CAggQABiiBBiJBcICBBAAGB7CAgUQIRigAcICBRAAGO8FmAMAiAYBkAYKkgcFNC42LjWgB5owsgcFMC42LjW4B6oQ&sclient=gws-wiz-serp)
- [コネクション型/コネクションレス型通信を分かりやすく１分で解説【ネットワーク】 | ビズドットオンライン](https://it-biz.online/it-skills/connection/)
- [ポート疎通確認方法 #Mac - Qiita](https://qiita.com/seaka829/items/ded68d0fa0bf0a57e973)
- [ポートとは　プログラミング　mac - Google 検索](https://www.google.com/search?q=%E3%83%9D%E3%83%BC%E3%83%88%E3%81%A8%E3%81%AF%E3%80%80%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E3%80%80mac&client=firefox-b-d&sca_esv=2a2a93e8be91f013&sxsrf=AHTn8zr4b-Tvtbmiz62JT0OKBdAIq4ZxEA%3A1742965468577&ei=3IrjZ5iAI_fm2roP7ubkwAE&ved=0ahUKEwiY3vCs_KaMAxV3s1YBHW4zGRgQ4dUDCBA&uact=5&oq=%E3%83%9D%E3%83%BC%E3%83%88%E3%81%A8%E3%81%AF%E3%80%80%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E3%80%80mac&gs_lp=Egxnd3Mtd2l6LXNlcnAiLeODneODvOODiOOBqOOBr-OAgOODl-ODreOCsOODqeODn-ODs-OCsOOAgG1hYzIIEAAYgAQYogQyBRAAGO8FMgUQABjvBTIFEAAY7wUyBRAAGO8FSJUPUNICWKEOcAF4AZABAJgBqQGgAeMDqgEDMC4zuAEDyAEA-AEBmAIEoAL2A8ICChAAGLADGNYEGEfCAgQQABgemAMAiAYBkAYKkgcDMS4zoAeIB7IHAzAuM7gH7gM&sclient=gws-wiz-serp)
- [MacのApacheで127.0.0.1以外のIPアドレスを使用する #Mac - Qiita](https://qiita.com/HanaeKae/items/79d783521b83e350fa42)
