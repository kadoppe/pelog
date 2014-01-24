---
title: Markdown + Live reloading + Travis CIなブログ環境をRailsで作ってみた
snippet: 自分好みのワークフローで快適に記事を投稿・公開するためのブログ環境をRailsで実装してみました。その機能について紹介します。
---

少し時間ができた（ような気がした）ので、自分好みのワークフローで記事を投稿・公開するためのブログ環境を作りました。この記事が載っているブログがそれです。せっかくなので、その機能について紹介します。

作ったブログ環境の名前は「pelog（ペログ）」といいます。Rails 4を使って実装したWebアプリケーションになります。ソースコードは[GitHubリポジトリ](https://github.com/kadoppe/pelog)で公開しているので、よろしければ御覧ください。

pelogをつくろうと思ったきっかけは、[@ruedap](https://twitter.com/ruedap) さんの以下のブログ記事をたまたま読んだことでした。実装にあたって、ソースコードも大いに参考にさせていただきました。この場を借りて、お礼を申し上げます。本当にありがとうございました。

* [Pull RequestとCIを使ったGitHub Flowなブログ環境を作ってみた - アインシュタインの電話番号](http://blog.ruedap.com/2013/11/11/github-flow-blog)

さて、pelogですが、以下のような機能を備えたブログ環境になります。

* Markdownファイルからの記事作成
* Live reloadingによる記事のリアルタイムプレビュー
* Travis CIによる記事の自動公開

では、それぞれの機能について紹介します。


### Markdownファイルからの記事作成

WordPressを使って公開していた以前のブログでは、[Markdown on Save Improved](http://wordpress.org/plugins/markdown-on-save-improved/) というプラグインによってMarkdownによる記事作成を実現していました。ですが、普段使っているデスクトップ上のテキストエディタと比べると、ブラウザのテキストエリアの使い勝手は少しイマイチ。

自分のマシンにインストールした、自分好みのテキストエディタで記事を編集し、その結果を簡単にブラウザで確認できたらいいのにな、と常々思っていました。pelogではそのフローを実現しています。

チェックアウトしたpelogリポジトリの`app/articles`ディレクトリ以下に、`YYYY-mm-dd-title.md`という形式でファイルを作成し、Markdown記法で記事を書いていきます。[JekyllのFront-matter](http://jekyllrb.com/docs/frontmatter/)という仕様を参考にし、タイトルや抜粋などのメタ情報をYAML形式でMarkdownファイルの先頭に記述できるようにしています。

~~~
---
title: 記事のタイトル
snippet: 記事の抜粋。この記事は…
---
~~~

Markdownで書いた記事をブラウザで確認するには、データベース(Sqlite3やPostgreSQL)に記事データをインポートする必要があります。pelogでは、その処理を行うためのrakeタスクを実装しました。以下のコマンドを実行することで、`app/articles`ディレクトリ内のすべてのMarkdownファイルとデータベースが同期します。

~~~
$ bundle exec rake articles:sync
~~~

あとは、`rails s`などでサーバを起動すれば、自分のマシン上で記事のプレビューを確認することができます。


### Live reloadingによる記事プレビュー

ここまでで、Markdownファイルから記事を作成できるようになりましたが、プレビューしたいタイミングでその都度`rake`コマンドを実行するのは手間です。なので、Markdownファイルを変更・保存したタイミングで自動的にブラウザを更新する「Live reloading」の機能を実装しました。

ただ、実装したといっても、ほとんどコードは書いていません。以下の3つのgemを活用させていただきました。

* [rack-livereload](https://github.com/johnbintz/rack-livereload)
* [guard-livereload](https://github.com/guard/guard-livereload)
* [guard-rake](https://github.com/rubyist/guard-rake)

rack-livereloadは、ブラウザに送信するHTML内にLive reloadingのためのJavaScriptコードを挿入してくれます。guard-livereloadは、ファイル変更のタイミングでブラウザにページ更新のための命令を送信してくれます。詳しくは以下の記事が参考になります。

* [Lightning-Fast Sass Reloading in Rails 3.2 • 55 Minutes Blog](http://blog.55minutes.com/2013/01/lightning-fast-sass-reloading-in-rails-32/)

guard-rakeは、ファイル変更のタイミングでGuardからrakeタスクを呼び出すために使っています。具体的には、Markdownファイルが変更されたタイミングで、前述の`articles:sync`タスクを実行するように設定しています。

これらを組み合わせると次のようなフローが実現できます。まず最初にguardのサーバを起動します。

~~~
$ bundle exec guard start
~~~

次に、ブラウザで編集対象の記事を開いておきます。その状態で、Markdownファイルを編集すると、ほぼリアルタイムに編集内容がブラウザ上に反映されます。ファイルを編集する度に、いちいちコマンドを実行したりブラウザを更新したりしなくて済むので、とても快適です。

![Live reloading](/assets/2014/01/24/live-reloading.png)


### Travis CIによる記事の自動公開

Gitのmasterブランチが更新されたタイミング（つまり、Pull Requestをマージしたタイミング）で、Travis CIが最新の記事を含むソースコードをHeroku上の本番環境に配備するように設定しました。

この部分に関しては、冒頭に紹介した @ruedap さんが実践されている方法とほとんど同じなります。@ruedap さんの記事に以下のように書かれている部分があり、この部分にとても共感したことがpelogを作り始めたきっかけになっています。

> この手の話では静的なブログツールが主流で、当時はJekyllやOctopressが流行っていて、最近ではMiddlemanを使うのが流行りつつある印象。でも自分が作ってみたかったのは、Webサービスを開発するのと同じフローで、ブログも更新できるようにするというもの。そのフローとは、表題の通りPull RequestとCIを使ったGitHub Flowのこと。
>
> [Pull RequestとCIを使ったGitHub Flowなブログ環境を作ってみた - アインシュタインの電話番号](http://blog.ruedap.com/2013/11/11/github-flow-blog)

リポジトリには、ブログの記事を書くブランチと、ブログ本体への機能修正や改善、デザイン変更のためのブランチが混在しています。記事をコミットしても、機能修正をコミットしても、Travis CI上でテストコードが実行されます。記事だけではなく、それを入れるお皿としてのブログ本体も含めて自分の手で作っているからか、ブログ環境に関するあらゆる作業が同じフローで実現できることに喜びを感じています。

pelogを作っている最中に、「[Jekyll](http://jekyllrb.com/)でいいやん」「[Middleman](http://middlemanapp.com/jp/)でいいやん」「[Ghost](https://ghost.org/)でいいやん」という悪魔の声が何度となく聴こえてきましたが、誘惑に負けずに良かったです。



### おわりに

自分好みのブログ環境をRails 4を使って作ったので、その機能について紹介しました。一から自分でつくることで、少しでも使いにくかったり困ったりすることがあれば、自分で環境を改善できるのが良いなぁと、作ってみて思いました。

今後はRailsや、JavaScriptやCSSなどのWeb関連の技術を試す場所としても使っていこうと思っています。ブログなのでそんなに試すことは多くないかもしれませんが。

そんな感じで、これからはこの自分好みのブログ環境を使って、色んなことをアウトプットしていく予定です。今後とも、どうぞよろしくお願いします。
