require 'cgi'
cgi = CGI.new
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya_bad']
  "<html>
    <body>
      <p>品質の悪いゴーヤは下記になります</p>
        <p>#{get}</p>
    </body>
  </html>"
}