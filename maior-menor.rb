def ascii_boas_vindas
  puts
  puts  "        P  |_|  P                                "
  puts  "       |_|_|_|_|_|                               "
  puts  "   n_n | ||. .|| | n_n        Bem-vindo ao       "
  puts  "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!  "
  puts  "  |' '  |  |_|  |'  ' |                          "
  puts  "  |_____| ' _ ' |_____|                          "
  puts  "        |__|_|__|                                "
  puts
end

def ascii_ganhador
  ganhadorASCII = "
                          oooo$$$$$$$$$$$$oooo
                       oo$$$$$$$$$$$$$$$$$$$$$$$$o
                    oo$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o         o$   $$ o$
    o $ oo        o$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o       $$ $$ $$o$
 oo $ $ '$      o$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$o       $$$o$$o$
 '$$$$$$o$     o$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$o    $$$$$$$$
   $$$$$$$    $$$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$$$$$$$$$$$$$$
   $$$$$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$$$$$$  '''$$$
    '$$$'''$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     '$$$
     $$$   o$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     '$$$o
    o$$'   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$       $$$o
    $$$    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$' '$$$$$$ooooo$$$$o
   o$$$oooo$$$$$  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   o$$$$$$$$$$$$$$$$$
   $$$$$$$$'$$$$   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     $$$$''''''''
  ''''       $$$$    '$$$$$$$$$$$$$$$$$$$$$$$$$$$$'      o$$$
             '$$$o     '''$$$$$$$$$$$$$$$$$$'$$'         $$$
               $$$o          '$$''$$$$$$''''           o$$$
                $$$$o                                o$$$'
                 '$$$$o      o$$$$$$o'$$$$o        o$$$$
                   '$$$$$oo     ''$$$$o$$$$$o   o$$$$''
                      ''$$$$$oooo  '$$$o$$$$$$$$$'''
                         ''$$$$$$$oo $$$$$$$$$$
                                 ''''$$$$$$$$$$$
                                     $$$$$$$$$$$$
                                      $$$$$$$$$$'
                                         '$$$'''
                             ACERTOU!! QUE BELEZA!!
 "

end

def da_boas_vindas
  ascii_boas_vindas

  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"

  nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade que deseja? (1) Muito fácil (2) Fácil (3)Normal (4)Difícil (5)Impossível"
  dificuldade = gets.to_i

  dificuldade
end

def sorteia_numero_secreto(dificuldade)
  maximo = dificuldade * 30

  puts "Escolhendo um número secreto entre 1 e #{maximo}"

  sorteado = rand(maximo) + 1
  puts "Escolhido... que tal adivinhar hoje nosso número secreto?"

  sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativa)
  puts "\n\n\n\n\n\n"
  puts "Tentativa #{tentativa} de #{limite_de_tentativa}"
  puts "Chutes até agora: #{chutes}"
  puts "Entre com um número"
  chute = gets.strip
  puts "Será que acertou? Você chutou #{chute}"

  chute.to_i
end



def verifica_se_acertou(numero_secreto, chute)
  acertou = numero_secreto == chute

  if acertou
    puts ascii_ganhador
    return true
  elsif numero_secreto > chute
    puts "O número secreto é maior!"
  else
    puts "O número secreto é menor!"
  end
end

def joga(nome,dificuldade)
  # numero_secreto =
  pontos_ate_agora = tentativas(5, dificuldade)

  puts "Você ganhou #{pontos_ate_agora} pontos."
end

def tentativas(limite_de_tentativas, dificuldade)
  pontos_ate_agora = 1000
  numero_secreto = sorteia_numero_secreto dificuldade
  chutes = []
  for tentativa in 1..limite_de_tentativas
    chute = pede_um_numero chutes, tentativa, limite_de_tentativas
    chutes << chute

    pontos_a_perder = (chute - numero_secreto).abs / 2
    pontos_ate_agora = pontos_ate_agora - pontos_a_perder

    if verifica_se_acertou numero_secreto, chute
      break
    end

    if tentativa == limite_de_tentativas && (chute - numero_secreto).abs == 1
      puts
      puts "Quase!! Voce Errou por 1! Ultima Chance!"
      tentativas(1, dificuldade)
    end
  end

    pontos_ate_agora
end

def nao_quer_jogar
  puts "Deseja continuar jogando?(S/N)"
  quero_jogar = gets.strip

  nao_quero_jogar= quero_jogar.upcase == "N"
end

# Inicio do jogo aqui

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
  joga nome, dificuldade

   if nao_quer_jogar
     puts "Bye..."
     break
   end
end
