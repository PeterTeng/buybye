class NotifySlackWorker
  def perform(title, icon, message)
    uri = URI(Rails.application.secrets.slack_webhook_url)
    contents = "```\n" + message + "\n```"
    hash = {
      "payload" => {
        "username"   => title,
        "text"       => contents,
        "icon_emoji" => icon,
      }.to_json
    }
    Net::HTTP.post_form(uri, hash)
  end
end
