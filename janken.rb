# 自分の選択肢
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"

    player_hand = gets.chomp
    
    # 入力値の判定
    while true
      if (player_hand =~ /^[+-]?[0-9]+$/  )
        if player_hand === "0" || player_hand === "1" || player_hand === "2"
          return player_hand.to_i
        else
          puts "選択肢以外の数字、または全角で入力されています。正しい選択肢を入力してください。"
          puts "0:グー, 1:チョキ, 2:パー"
          player_hand = gets.chomp                   
        end
      else
        puts "文字、またはスペースが入力されています。正しい選択肢を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        player_hand = gets.chomp
      end
    end
  end
end

# 相手の選択肢(ランダム数値)
class Enemy
  def hand
    enemy_hand = rand(2)
  end
end

# ジャンケンをプレイ
class Janken
  def pon(player_hand, enemy_hand)
  
    janken = ["グー", "チョキ", "パー"]  
    puts "相手の手は#{janken[enemy_hand]}です。"
      
    # 勝負の判定
    if player_hand === enemy_hand
      puts "あいこ"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      janken.pon(player.hand, enemy.hand)
    elsif 
      (player_hand === 0 && enemy_hand === 1 || player_hand === 2 && enemy_hand === 0 || player_hand === 1 && enemy_hand == 2)
      puts "あなたの勝ちです！"
    else
      puts "あなたの負けです"
    end
  end
end

# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new

# ジャンケンをプレイ
janken.pon(player.hand, enemy.hand)
