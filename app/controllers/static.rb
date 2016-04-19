#controller

get '/' do
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
    erb :"static/index"
end

post '/urls' do
	long_url = params[:long_url]
	@url = Url.new(long_url: long_url)
	@url.shorten
	@url.save
	erb :"static/index"
end

get '/table' do
	@url = Url.all
	erb :"static/url_count"
end

#the arrangement of the methods is cruciaal in this case!!
#it only reads from top to below

get '/:short_url' do
	@url = Url.find_by(short_url: params[:short_url])

	count = @url.counter.to_i
	count += 1

	@url.counter = count
	@url.save

	redirect 'https://' + @url.long_url
end

