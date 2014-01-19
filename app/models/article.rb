class Article
  include Redis::Objects

  attr_accessor :file_name

  # コンストラクタ
  # @param file_name [String] エントリーの内容が記述されたMarkdownファイル名
  def initialize(file_name)
    @file_name = file_name
  end

  # Redis用の識別子を取得する
  # @return Redisで用いる識別子
  def id
    self.file_name
  end
end
