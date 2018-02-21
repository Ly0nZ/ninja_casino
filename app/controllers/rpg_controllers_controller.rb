class RpgControllersController < ApplicationController
	@activity = []
	def index
    session.clear
		if session[:gold].nil?
			session[:gold] = 0
    session[:message] = []
		render 'index.html'
		end
	end
  def farm
  	dice = Random.new
  	gold = dice.rand(10..20)
  	session[:gold] += gold
    session[:message] ||= []
    d = DateTime.parse('3rd Feb 2001 04:05:06+03:30')
    stamp = d.strftime('%I:%M:%S %p')
    session[:message].push("Earned #{gold} gold from the farm! (#{ stamp })")
  	render 'index'
  end

  def cave
  	dice = Random.new
  	gold = dice.rand(5..10)
  	session[:gold] += gold
    session[:message] ||= []
    d = DateTime.parse('3rd Feb 2001 04:05:06+03:30')
    stamp = d.strftime('%I:%M:%S %p')
    session[:message].push("Earned #{gold} gold from the cave! (#{ stamp })")
  	render 'index'
  end
  def house
  	dice = Random.new
  	gold = dice.rand(2..5)
  	session[:gold] += gold
    session[:message] ||= []
    d = DateTime.parse('3rd Feb 2001 04:05:06+03:30')
    stamp = d.strftime('%I:%M:%S %p')
    session[:message].push("Earned #{gold} gold from the house! (#{ stamp })")
  	render 'index'
  end
  def casino
    session[:message] ||= []
  	die = Random.new
  	dice = die.rand(0..100)
  	spin = Random.new
  	gold = spin.rand(0..50)
  	d = DateTime.parse('3rd Feb 2001 04:05:06+03:30')
  	stamp = d.strftime('%I:%M:%S %p')
  	if dice > 50
  		session[:gold] += gold
  		session[:message].push("Earned #{gold} gold from the casino! (#{ stamp })")
  		@activity = session[:activity]
  	else
  		session[:gold] -= gold
  		session[:message].push("Lost #{gold} gold from the casino! (#{ stamp })")
  	end
 		render 'index'
  end
end
