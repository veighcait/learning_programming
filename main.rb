class Conversation
  GOOD_ANSWERS = ["great", "awesome", "radical", "good"]
  BAD_ANSWERS = ["shitty", "terrible", "bad"]

  def initialize
    @ended = false
  end

  def ended
    @ended
  end

  def ask_for_name
    puts("Hey, what's your name?")
    @name = read
  end

  def greet
    if last_name
      puts("Why, hello, Mr or Mrs #{last_name}")
    else
      puts("Oh, nice to meet you, #{first_name}.")
    end
  end

  def ask_about_day
    puts("How was your day?")
    @day = read
  end

  def ask_is_this_nice
    puts("Is this nice?")
    nice_response(read)
  end

  def nice_response(answer)
    if answer == "no"
      ask_is_this_nice
    else
      puts("Is this one more nice?")
    end
  end

  def end_conversation
    if GOOD_ANSWERS.include?(@day)
      puts("Oh, great! I too had a good day.")
    elsif BAD_ANSWERS.include?(@day)
      puts("Aw, muffin. I'm sorry to hear.")
    else
      puts("Huh.")
    end

    puts("Your response is so interesting, that I will save it for later!")
    File.open('somefile', 'w') { |file| file.write("#{@name} had a #{@day} day") }
  end

  def end_conversation?
    puts("I am a lonely old woman and everyone hates me. Would you please keep talking to me?")
    keep_talking = read
    if keep_talking.split(" ").include?("no") or keep_talking.split(" ").include?("nope")
      @ended = true
    end

  end

  private

  def first_name
    @name.split(" ")[0].capitalize
  end

  def last_name
    name = @name.split(" ")[1]
    name.capitalize if name
  end

  def read
    gets.chomp.downcase
  end
end

class Game
  def start
    conversation = Conversation.new

  	conversation.ask_for_name
 	  conversation.greet
	  
    while conversation.ended == false
  	 conversation.ask_is_this_nice
     conversation.ask_about_day
  	 conversation.end_conversation
  	 conversation.end_conversation?
	  end
  end
end

Game.new.start