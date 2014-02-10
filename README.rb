spy-games
=========

Turn a message into simple encrypted message and then decode the encrypted message back to a message.

def encrypting(message_to_encrypt)
  message_to_encrypt = message_to_encrypt.downcase.split("")
  a_z = ('a'..'z').to_a
  k_j = ('k'..'z').to_a  
  ('a'..'j').to_a.each {|letter| k_j << letter}  
 
  cipher = Hash[a_z.zip(k_j)]
  characters = %w[@ # $ % ^ & *]
  message_to_encrypt_sentence = message_to_encrypt.map do |message|
    if cipher.has_key?(message)
  	  cipher[message]
  	elsif (" ").include?(message)
      characters.shuffle.last 	  
  	else
  	  message
  	end
  end
  message_to_encrypt_sentence = message_to_encrypt_sentence.join("")
  return message_to_encrypt_sentence
end

p encrypting('Making two Arrays act like a Hash aint easy') 
p encrypting('Secret codes are old-school FUN')  
p encrypting('I think you are a SPY')

def decoding(encrypted_message)
  a_z = ('a'..'z').to_a
  k_j = ('k'..'z').to_a  
  ('a'..'j').to_a.each {|letter| k_j << letter}  


  cipher = Hash[k_j.zip(a_z)]
  
  decoded_sentence = encrypted_message.split("").map do |message|
  	if cipher.has_key?(message)
  	  cipher[message]
  	elsif %w(@ # $ % ^ & *).include?(message)
  	  " "
  	else
  	  message
  	end
  end
  decoded_sentence = decoded_sentence.join("")
  return decoded_sentence
end

p decoding('wkusxq$dgy$kbbkic@kmd&vsuo%k^rkcr@ksxd$okci')
p decoding('combod%mynoc*kbo^yvn-cmryyv#pex')
p decoding('s#drsxu^iye&kbo$k%czi')
