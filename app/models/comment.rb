class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :has_user_id

  def has_user_id
    !!self.user_id
  end

  def username=(name)
    if !name.empty?
      user = User.find_or_create_by(username: name)
      self.user = user
    end
  end

  def username 
    self.user.username
  end
end
