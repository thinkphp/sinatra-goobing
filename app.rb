class MyApp < Sinatra::Base

  get '/' do

      @title = "Home" 

      erb:index

  end

  get '/search' do

       @title = "search" 

       erb:search
  end

  get '/search/:n' do

       @q = params[:n]

       google = Google.new('no-api-key')

       results = google.search(q=@q)

       out = '<div class="yui-u first" id="google">'

       out = out + '<h2>Google</h2><ul>'

       results['responseData']['results'].each do |item|

                out = out + '<li><h3><a target="_blank" href="'+ item['url'] +'">' + item['title'] + '</a></h3><p>'+ item['content'] +'</p></li>'
       end

       out = out + '</ol>'

       out = out + '</div>'

       @title = "GooBing"

       bing = Bing.new('49EB4B94127F7C7836C96DEB3F2CD8A6D12BDB71')

       results2 = bing.search(q=@q,sources='web')

       out = out + '<div class="yui-u" id="bing">'

       out = out + '<h2>Bing</h2><ul>'

       results2['SearchResponse']['Web']['Results'].each do |item|
       
                 out = out + '<li><h3><a target="_blank" href="'+ item['Url'] +'">' + item['Title'] + '</a></h3><p>'+ item['Description'] +'</p></li>'
       end

       out = out + '</ul>'

       out = out + '</div>'

       @what = out;

       erb:search
  end
end

