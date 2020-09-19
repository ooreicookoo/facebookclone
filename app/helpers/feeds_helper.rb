module FeedsHelper
  def confirm_new_or_edit
    @feed.id ? feed_path : feeds_path
  end

  def confirm_form_method
    @feed.id ? 'patch' : 'post'
  end
end
