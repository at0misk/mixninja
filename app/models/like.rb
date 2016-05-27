class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  def track_by_most_likes
  	Track.find_by_sql("SELECT tracks.title, COUNT(likes.id) AS num_of_likes FROM tracks JOIN likes ON likes.track_id = tracks.id GROUP BY tracks.id ORDER BY num_of_likes DESC")
  end
end



