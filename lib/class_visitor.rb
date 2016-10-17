require 'faraday'

def self.call
  A_to_Z = [*?A..?Z]
  num = [*0..9]

  uri = "https://github.com/"
  conn = Faraday::Connection.new(:url => uri) do |builder|
    builder.use Faraday::Request::UrlEncoded
    builder.use Faraday::Adapter::NetHttp
  end

  A_to_Z.each do |alpha1|
    a_to_z.each do |alpha2|
      num.each do |n|
        id = alpha1 + alpha2 + n.to_s
        res = conn.get "/#{id}"
        puts id
        if res.status == 404
          puts "Congrats!!!"
        end
      end
    end
  end
end
