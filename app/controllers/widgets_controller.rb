class WidgetsController < ApplicationController

	def index
		@skip_layout = true
		@content = User.find(params[:user_id]).content.html_safe
    @quotes_list = [
      "Life shrinks or expands in proportion to one's courage. –Anais Nin",
      "The best revenge is massive success. –Frank Sinatra",
      "Whether you think you can or you think you can’t, you’re right. –Henry Ford",
      "Either you run the day, or the day runs you. –Jim Rohn",
      "I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel. –Maya Angelou",
      "You can never cross the ocean until you have the courage to lose sight of the shore. –Christopher Columbus",
      "I am not a product of my circumstances. I am a product of my decisions. –Stephen Covey",
      "Winning isn’t everything, but wanting to win is. –Vince Lombardi",
      "Eighty percent of success is showing up. –Woody Allen",
      "Your time is limited, so don’t waste it living someone else’s life. –Steve Jobs",
      "The mind is everything. What you think you become.  –Buddha",
      "Life is 10% what happens to me and 90% of how I react to it. –Charles Swindoll",
      "We become what we think about. –Earl Nightingale",
      "Life is what happens to you while you’re busy making other plans. –John Lennon",
      "Life isn't about getting and having, it's about giving and being. –Kevin Kruse",
      "You miss 100% of the shots you don’t take. –Wayne Gretzky",
      "I attribute my success to this: I never gave or took any excuse. –Florence Nightingale",
      "Strive not to be a success, but rather to be of value. –Albert Einstein",
      "Whatever the mind of man can conceive and believe, it can achieve. –Napoleon Hill",
      "If you hear a voice within you say “you cannot paint,” then by all means paint and that voice will be silenced. –Vincent Van Gogh",
      "The only person you are destined to become is the person you decide to be. –Ralph Waldo Emerson",
      "Go confidently in the direction of your dreams.  Live the life you have imagined. –Henry David Thoreau",
      "Certain things catch your eye, but pursue only those that capture the heart. – Ancient Indian Proverb",
      "Believe you can and you’re halfway there. –Theodore Roosevelt"
    ]
  end

end
