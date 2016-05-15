class Topic < ActiveRecord::Base
  has_many :posts

  class <<self
    def statistic_posts_of_topic
      number_posts_of_topic = Array.new
      color = [
        "#00FFE7", "#FF0018", "#0000FF", "#FFFF00",
        "#008FFF", "#FF7000", "#9100FF", "#6EFF00",
        "#FF00C7", "#00FF38", "#FF004D", "#00FFB2"
      ]
      i = 0
      Topic.all.each do |topic|
        number_post_of_topic = topic.posts.length
        hash = { label: topic.name, value: number_post_of_topic, color: color[i] }
        number_posts_of_topic.push hash
        i += 1
      end
      number_posts_of_topic
    end
  end
end
