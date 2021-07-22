class Feed
  def deliver!(posts:)
    body = body(posts: posts)

    mail = Mail.new do
      from    ENV["SENDER_ADDR"]
      to      ENV["RECIPIENT_ADDR"]
      subject "The Latest News!"
      html_part do
        content_type 'text/html; charset=UTF-8'
        body body
      end
    end
    
    mail.deliver!
  end

  private

  def body(posts:)
    template.result_with_hash(posts: posts)
  end

  def template
    ERB.new(
      File.read(File.join(File.dirname(__FILE__), 'templates/feed.html.erb'))
    )
  end
end
