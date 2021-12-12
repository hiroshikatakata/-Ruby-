require"csv"

x = []
w = []
i = 0
e = 0

puts"1(新規でメモを作成)2(既存のメモに追記)3(既存のメモの行変換)"

memo_type = gets.to_i
memo_type2 =memo_type.to_i

if memo_type2 == 1
  puts"拡張子を除いたファイル名を入力してください"
  name =gets.to_s
  puts"メモしたい内容を入力してください"
  puts"完了したらCtrl + Dを押します"
  open("#{name}.csv",'w')do|name|
  memo = STDIN.read
  name << memo
  puts"メモの作成が完了しました"
  end
elsif memo_type2 == 2
  puts"拡張子を除いたファイル名を入力してください"
  name =gets.to_s
  puts"追加でメモしたい内容を入力してください"
  puts"完了したらCtrl + Dを押します"
  open("#{name}.csv",'a')do|name|
  memo = STDIN.read
  name << memo
  puts"メモの追記が完了しました"
  end
elsif memo_type2 == 3
  puts"拡張子を除いたファイル名を入力してください"
  name =gets.to_s
  CSV.foreach("#{name}.csv") do |row|
  puts"#{i}:#{row}"
  x[i] = row
  w[i] = x[i].to_csv
  i=i+1
  end
  i =i-1
  puts"変換したい行の番号を入力してください"
  memo_type = gets.to_i
  memo_type2 =memo_type.to_i
  puts"新しくメモしたい内容を入力してください"
  puts"完了したらEnterを押します"
  memo =gets.to_s
  w[memo_type2] = memo
  open("#{name}.csv",'w')do|name|
    name << w[0]
    e =e+1
  end
  open("#{name}.csv",'a'){|name|
  i.times do
    p"#{i}"
    p"#{w[e]}"
    name << w[e]
    e =e+1
  end
}
  puts"メモの上書きが完了しました"
else
  puts"予期せぬ値が入力されました"
end
