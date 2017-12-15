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

```ruby
# 執行的時候會去專案資料夾的Gemfile，將所有的Gem套件去做檢查的動作，如果有套件則套用，若沒有時則是去https://rubygems.org/ 這個網址尋找Gem套件，下載回來後並套用，後續如果有Gem套件要再加裝，就到Gemfile檔案加上想要的套件後，將服務停止在執行一次bundle install指令，就可以把要加上去的套件下載回來並套用
```

2. (10 分) 請說明 `rails db:migrate` 這個指令的用途是什麼？

```ruby
# 讀取db底下的檔案，將之前指令執行所產生的model、migration轉換成資料表，如果建立model後沒有做這一行指令，rails會偵測問題說有建立但沒有作db:migrate的動作
```

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

```ruby
# 1:@的意思是指全域變數，因為view會需要用到這些資料，因此這些資料必須是全域的，拿掉的話雖然程式會成功執行，但是view會因為取不到books而不會顯示東西
# 2:在這個情況下拿掉不會有問題，因為這個變數不會再回到view裡面 (但如果是寫錯要 render :new 就一定要有@，不然會有問題)
```

## Git 題目 (20 分)

1. (10 分) 在你想像中的分支(branch)，是個什麼樣子的東西?
```ruby
# 像是分身一樣，從某個時間點複製成兩個甚至是多個，都有相同的背景，而這幾個人又能夠分開去做各自的事情，變得像是獨立的存在，可能過程分身有缺陷，最後選擇自我了斷，但自殺的記憶並不會回到本尊，或是最後想要回到本尊身上，就將從複製後的那一秒鐘到回到本尊的那一秒所記憶下來的都回到本尊身上，使本尊除了有自己的記憶之外，也有分身離開自己的時候所擁有的記憶，當然有種情況就是同一個時間分身A在吃水果，分身B在吃包子，兩個回到本尊的時候可能就會造成了混亂現象，這時本尊就可以選擇我這個時間是吃了水果還是包子，又或是兩個都有吃
# 就實務面來說則是有個版本的切換，我可以讓master分支一直都保持在最穩定的狀態，建立一個分支去做全新的功能，如果不小心做壞了，直接把那個分支移除，並不會影響到master，除了節省工程師的時間，肝也不會再更黑了，若功能做好了且測試穩定了，就把分支所做過的變動讓master merge上去，讓master保持穩定
```
1. (5 分) 空的資料夾無法被加入 Git 版控，但如果就是想讓這個資料夾留下來，你會怎麼處理?
```ruby
# 加入一個檔案，但若是不知道要加什麼則可以加入一個空白檔案 (如果不知道可以加 xxx.keep or xxx.gitkeep在資料夾內)
```

2. (5 分) 如果有些檔案，像是 `/config/database.yml` 之類比較機密的檔案，不想放在 Git 裡面，你會怎麼做？
```ruby
# 在自己專案的目錄底下加上 .gitignore 檔案，裡面放上這個內容
# config/database.yml
```
