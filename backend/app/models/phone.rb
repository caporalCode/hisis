class Phone < ApplicationRecord
  belongs_to :user
  enum gender: { home: 'home', mobile: 'mobile', whatsapp: 'whatsapp', work: 'work', other: 'other' }
end
