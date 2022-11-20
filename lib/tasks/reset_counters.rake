namespace :counters do
  task update: :environment do
    Post.all.each do |post|
      Post.reset_counters(post.id, :comments)
    end
  end
end
