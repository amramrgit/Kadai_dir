class Player
  attr_accessor :hand

  # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
  def hand
    err=true
    
    while err==true
      puts "0:グー、1:チョキ、2:パーです。いずれかを入力してください"
      hand = gets.to_i
    
      if hand==0
        puts "あなたが出したのは、#{hand}:グーですね。"
        err=false
      elsif hand==1
        puts "あなたが出したのは、#{hand}：チョキですね。"
        err=false
      elsif hand==2
        puts "あなたが出したのは、#{hand}：パーですね。"
        err=false
      else
        puts "あなたが出したのは、#{hand}：グーでもチョキでもパーでもありませんね。"
        err=true
      end
    
    end
   return hand 
  end

end

class Enemy
  attr_accessor :hand
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    hand=rand(0..2)
    
    
    if hand==0
      puts "相手が出したのは、#{hand}:グーです。"
    elsif hand==1
      puts "相手が出したのは、#{hand}：チョキです。"
    elsif hand==2
      puts "相手が出したのは、#{hand}：パーです。"
    else
      puts "システムエラー1 #{hand}"
    end
    
    return hand;
  
  end

end


class Janken
  #attr_accessor :pon
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    
    score = (player_hand - enemy_hand +3)%3
    
    #あなたが勝ちの場合
    if score==2
      puts "あなたの勝ちです。"
      return
    #あなたが負ける場合
    elsif score==1
      puts "あなたの負けです。"
      return
    #あいこの場合
    elsif score==0
        puts "あいこです。"
        player = Player.new
        enemy = Enemy.new
        janken = Janken.new
        janken.pon(player.hand, enemy.hand)
    else
      puts "システムエラー2"
    end

  end

end


  player = Player.new
  enemy = Enemy.new
  janken = Janken.new

  # 下記の記述で、ジャンケンメソッドが起動される
  player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
