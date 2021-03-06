node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'nodejs'
    Chef::Log.debug("Skipping deploy for application #{application} as it is not a node.js app")
    next
  end

  # TODO: determine if it's a Meteor app based on repo contents
  is_meteor = true

  if !is_meteor
    Chef::Log.debug("Skipping deploy for application #{application} as it is not a Meteor app")
    next
  end
  
  Chef::Log.debug("Start deploy for Meteor application #{application}")

  meteor_deploy do
    deploy_data deploy
    app application
  end

end
