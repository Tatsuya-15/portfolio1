class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]  #選択したmodelを@modelに代入
    @value = params["search"]["value"]  #検索にかけた文字列(ここではvalue)を@valueに代入
    @how = params["search"]["how"]      #選択した検索方法howを@howに代入
    @datas = search_for(@how, @model, @value)      #search_forの引数にインスタンス変数を定義
  end
  
  private

  def match(model, value)                     #def search_forでhowがmatchだった場合の処理
    if model == 'member'                        #modelがuserの場合の処理
      Member.where(last_name: value)                 #whereでvalueと完全一致するnameを探します
    elsif model == 'customer'
      Customer.where(company: value)
    end
  end

  def partical(model, value)
    if model == 'member'                       
      Member.where("last_name LIKE ?", "%#{value}%")                
    elsif model == 'customer'
      Customer.where("company LIKE ?", "%#{value}%")
    end
  end

  def search_for(how, model, value)       #searchアクションで定義した情報が引数に入っている
    case how                              #検索方法のhowの中身がどれなのかwhenの条件分岐の中から探す処理
    when 'match'
      match(model, value)                 #検索方法の引数に(model, value)を定義している
    when 'partical'
      partical(model, value)
    end
  end
  
end
