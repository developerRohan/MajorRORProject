module SmsTool
  account_sid = ENV['ACb830670cfeb66d9e8f7c8a959a8a5b18']
  auth_token = ENV['b213d4690405df3913174c5dc185258f']

  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send_sms(number:, message:)
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: "+1#{number}",
      body: "#{message}"
    )
  end
end