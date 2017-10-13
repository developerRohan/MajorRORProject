namespace :notification do
  desc "send sms to employees asking them to log if not overtimed"
  task sms: :environment do
  	# puts "i am in a rake"
  end

  desc "send mail notifications to admin users each day to inform of pending overtime requests"
  task manager_email: :environment do
  	 # puts "I'm in the manager email"
	# 1. Iterate over the overtime requests that have a status of "submitted".
	# 2. Check to see if there are any requests
	# 3. Iterate over the list of admin users/managers
	# 4. Send email to each admin
	submitted_posts = Post.submitted
  	admin_users = AdminUser.all

  	if submitted_posts.count > 0
    	admin_users.each do |admin|
      		ManagerMailer.email(admin).deliver_now
    	end
  	end
  end

end
