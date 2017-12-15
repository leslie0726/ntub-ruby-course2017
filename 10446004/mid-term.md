## 說明

1. 答案直接寫在這個 `mid-term.md` 裡，並使用 Markdown 語法撰寫。
1. 題目總共分 Ruby、Rails 以及 Git 三大主題，請在每個主題完成時進行 Commit。
1. 完成後，請發送 PR 至 `mid-term` 分支。
1. 也就是說，你的 PR 應該只會有三或四次的 Commit。

## Ruby 題目 (50 分)

1. (10 分) 請完成本題實作內容

```ruby
class Cat
  #answer:
  attr_accessor :name
  def initialize (name)
    @name = name
  end
end

kitty = Cat.new("kitty")
puts kitty.name  # 在畫面上印出 kitty 字樣
```

2. (5 分) 假設有個 Hash：

```ruby
profile = {name: "kk", age: 18}
```

當執行這行程式：

```ruby
p profile["name"]
```

會得到什麼結果? 為什麼?

```ruby
    # answer:
    # 取得的結果為nil
    # p和puts不太一樣 p會用來debug使用，遇到換行符號也仍直接顯示不做換行(puts obj.inspect)；puts則是顯示字串，遇到換行符號就換行(puts obj.to_s)，至於為什麼會是nil，原因在於不是用"name"，而是用:name (Symbol)
```

3. (5 分) 如果要在 1 到 100 的數字當中，任意取出 5 個不重複的亂數，你會怎麼做？

```ruby
  puts [*1..100].shuffle.first(5)
  # 或者是
  puts [*1..100].simple(5)
```

4. (10 分)
```ruby
class Bank
  def transfer(amount)
    # ...
  end
end

Bank.transfer(10)
```

上面這段程式碼執行後會發生什麼事？為什麼？如果有錯誤又該如何修正？

    
```ruby
# answer:
# 在Bank.transfer(10)這一行錯誤，主要原因是沒有建立新的Bank類別，變成rails會自己去找"Bank.transfer(integer)"方法，但是程式碼並沒有定義，所以rails出現找不到方法的錯誤
#修正方法為修改為以下程式碼
class Bank
  def transfer(amount)
    # ...
  end
end

bank = Bank.new
bank.transfer(10)
# 修改並執行的結果為什麼都不出現，因transfer(amount)裡沒有程式碼，執行方法時不是用puts
```

5. (10 分) 請問以下方法：

```ruby
link_to "刪除", products_path(product), method: :delete, class: "btn btn-default"
```

`link_to` 方法共有幾個參數？為什麼？

```ruby
# answer:
# 三個
# 因hash可省略掉大括號，因此原型應該是這樣:
link_to "刪除", products_path(product), {method: :delete, class: "btn btn-default"}
# 傳遞了三個參數 其中hash又包含了method,class這兩個參數，且hash沒有順序的問題，所以mehtod跟class可變換(但不能跟刪除、products_path(product)換)
```
    
    

6. (10 分) 在 Ruby 裡面常會看到冒號的寫法，例如：

有的冒號靠右邊：

```ruby
class Store
  has_many :products
end
```

有的冒號靠左邊：

```ruby
link_to "檢視", books_path(book), class: "btn btn-default"
```

或是兩邊都有：

```ruby
user_profile = {name: "kk", age: 18, blood_type: :b_negative}
```

請問，這三種寫法分別代表什麼意思呢？

```ruby
  # 放左邊就是跟左邊的參數有關，放右邊就是跟符號或物件有關
  # 放左邊通常就是放參數的名稱(像 class: 就是代表要放class這個參數)
  # 放右邊通常就是符號、物件(像 :product 就是代表要放product這個物件，hash裡的 profile[:name] 就是要把name的key抓出來並取得value)
```

## Rails 題目 (30 分)

1. (10 分) 請簡述 `bundle install` 指令的用途。

2. (10 分) 請說明 `rails db:migrate` 這個指令的用途是什麼？

3. (10 分) 假設某個 Controller 的程式碼如下：

```ruby
class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(price: 100)
    redirect_to books_path, notice: "資料更新成功"
  end
end
```

請問：
- 第 3 行的 `@books` 前面的那個 `@` 是什麼意思？如果把 `@` 拿掉會發生什麼事？
- 第 7 行以及第 8 行的 `@book`，如果把 `@` 拿掉會發生什麼事？為什麼？

## Git 題目 (20 分)

1. (10 分) 在你想像中的分支(branch)，是個什麼樣子的東西?

1. (5 分) 空的資料夾無法被加入 Git 版控，但如果就是想讓這個資料夾留下來，你會怎麼處理?

2. (5 分) 如果有些檔案，像是 `/config/database.yml` 之類比較機密的檔案，不想放在 Git 裡面，你會怎麼做？

