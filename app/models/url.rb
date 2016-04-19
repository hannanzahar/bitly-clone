class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url, presence: true
	#=> /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/,
	validates :short_url, presence: true, uniqueness:true

	def shorten
		list = ("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a
		self.short_url = list.sample(8).join
	end
end