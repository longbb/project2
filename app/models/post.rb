class Post < ActiveRecord::Base
  belongs_to :member
  belongs_to :topic
end
