require 'cgi'
cgi = CGI.new
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya_sell']
  "<html>
    <body>
      <p>譲渡先が自家消費ではないゴーヤは下記になります</p>
        <p>#{get}</p>
    </body>
  </html>"
}