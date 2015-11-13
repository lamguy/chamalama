class TimelineMap < ActiveRecord::Base
  belongs_to :timeline
  belongs_to :article
end
