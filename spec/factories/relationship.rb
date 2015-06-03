FactoryGirl.define do
  factory :relationship do
    follower {User.all.sample}
    followed {User.all.sample}
  end
end
