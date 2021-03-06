---
title: 短時間で全体像を把握する - 読書 - Javaデータ構造とアルゴリズム基礎講座
snippet: できるだけ短い時間でデータ構造やアルゴリズムについて勉強したい。そんなニーズを満たすを本を見つけたので読んでみました。
---

最近、データ構造やアルゴリズムの勉強をする必要に駆られているのですが、基礎から復習する目的で読んでみました。この分野にはたくさんの本がありますが、その中からこの本を選んだのは、以下のエントリーでオススメされていたから。

[アルゴリズムの勉強のしかた - きしだのはてな](http://d.hatena.ne.jp/nowokay/20110922)

<a href="http://www.amazon.co.jp/Java-%E3%83%87%E3%83%BC%E3%82%BF%E6%A7%8B%E9%80%A0%E3%81%A8%E3%82%A2%E3%83%AB%E3%82%B4%E3%83%AA%E3%82%BA%E3%83%A0%E5%9F%BA%E7%A4%8E%E8%AC%9B%E5%BA%A7-%E9%95%B7%E5%B0%BE-%E5%92%8C%E5%BD%A6/dp/4774136972%3FSubscriptionId%3D0AVSM5SVKRWTFMG7ZR82%26tag%3Dcreativestylekadoppe-22%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D4774136972" target="_blank" title="Java データ構造とアルゴリズム基礎講座"><img src="http://ecx.images-amazon.com/images/I/41XXm8UokQL.jpg" width="343" height="500" alt="Java データ構造とアルゴリズム基礎講座" /><br>Java データ構造とアルゴリズム基礎講座</a>

### 目次

* 第1章 アルゴリズムと計算量
* 第2章 アルゴリズムの設計手法
* 第3章 配列
* 第4章 スタックとキュー
* 第5章 リスト
* 第6章 木
* 第7章 グラフ
* 第8章 データの検索
* 第9章 ソート

### データ構造やアルゴリズムを勉強しようと思った理由

実は僕、最近「[HackerRank](https://www.hackerrank.com/)」というサービスにハマっています。HackerRankは、ユーザが公開されている様々なの問題をプログラミングを駆使して解くことで、解答結果に応じたポイントがもらえる、というサービスです。いつでもチャレンジできる問題に加えて、期間が限られたプログラミングコンテストもサイト内で開催されています（僕はまだコンテストには参加してないけど。）

[HackerRank: Programming problems and Competitions](https://www.hackerrank.com/)

HackerRankに掲載されている問題は、そのほとんとがアルゴリズムやデータ構造の知識を必要とするものです。まあ、知識がなくても無理矢理 or 偶然問題が解けてしまうこともあります。ですが、そうやって書かれたプログラムはメモリ使用量や処理時間について最適ではないことが多く、シンプルなインプットに対しては正しく解答できても、HackerRankが用意する意地悪な（データ数や数値がとても大きかったりする）入力に対しては、制限時間内に処理が終わらなかったり、メモリが足らなかったり、といった問題にぶつかってしまうことがあります。

そういった問題にぶつかったとき、データ構造やアルゴリズムに対する自分自身の知識の少なさに直面するわけです。大学の講義で勉強したことはあるのですが、もう10年近く前のこと。Webアプリやスマートフォンアプリの開発が主な仕事だと、データ構造やアルゴリズムについて意識することも少なく、いつの間にかすっかり忘れてしまっていたようです。

また、上に挙げたエントリーに次のように書かれていたこともあり、勉強の必要性を実感。

> アルゴリズムの勉強というのは、スポーツで言えば腕立て伏せや走り込みみたいな基礎体力を養うようなもので、「ソートなんか実際に自分で書くことないだろう」とかいうのは「サッカーは腕つかわないのに腕立ていらないだろう」とか「野球で1kmも走ることなんかないのに長距離の走り込みいらないだろう」とか言うようなものです。<br>
> [アルゴリズムの勉強のしかた - きしだのはてな](http://d.hatena.ne.jp/nowokay/20110922)

そんな経緯もあり、まずは基礎から復習ということで、本書を手にとってみました。

### 短時間で全体像がつかめる広くて浅い内容

本書は、スタック、キュー、木構造といった、様々なアルゴリズムで使われる基本的なデータ構造や、ソートや探索のためのいくつかのアルゴリズムについて、図やJavaのソースコードを交えながら「広く浅く」紹介してくれている本です。

この「広く浅く」というのが本書の良い所で、全体像を手っ取り早く掴むことや、次に本腰を入れて勉強するテーマを見つけることが目的の場合にぴったりマッチします。内容のボリュームも小さく、薄くまとまっているので、短時間で読めるのもいいですね。

個人的には、今の自分が理解している部分と、そうでない部分をはっきり把握することができたので、次に何を勉強するべきかを判断しやすくなったように思います。

### もう少し詳しく説明して欲しい部分も

とはいえ、全体像を掴む目的で読んだとしても、もう少し詳しく説明して欲しいと感じる部分もありました。

たとえば、グラフの探索アルゴリズムについて紹介している部分。ここでは、山登り法、最良優先探索法、A\*アルゴリズムといった「ヒューリスティック値」を利用したアルゴリズムについて紹介されています。ですが、そもそも「ヒューリスティック値」とは何なのか、なぜ必要になるのか、それぞれのアルゴリズムがどういった状況で有効なのか、といったことについては触れられていません。

結局本書だけではわからないので、Webに公開されている情報を検索したり、より詳しく解説されている本を探すことになります。

本書のような「広く浅く」というスタンスだと仕方のないことかもしれません。でも、欲を言うと、あとほんの少しだけ「深く」して欲しかった。それぞれのアルゴリズムについて、それが生まれた背景・必要になる理由・適用例などが合わせて紹介されていると、アルゴリズムの概要についてよりスムーズに理解できるんじゃないでしょうか。

### さて、次は

本書を読んで、ソートの中でも「クイックソート」「ヒープソート」が自分にとって苦手で、アルゴリズムをサッと実装できるかどうか自信がないことがわかりました。また、ヒューリスティックを活用したグラフの探索アルゴリズムに関する理解もぼんやりしているようです。それに気付けた／再確認できたことは、本書を読んでよかったことだと思います。

今の自分に足りていない部分がわかったので、次はそれをどうやって勉強するかを決める番です。残念ながら、まだそのための方法を知らない状態です。オススメの書籍などをご存知の方がいらっしゃいましたら、コメントなどで教えていただけるとうれしいです。

それでは以上です。ありがとうございました。
