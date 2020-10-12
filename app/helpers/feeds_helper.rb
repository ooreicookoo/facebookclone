module FeedsHelper
  def choose_new_or_edit
     if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
       confirm_feeds_path
     elsif action_name == 'edit' || action_name == 'update'
       feed_path
     end
   end
end
