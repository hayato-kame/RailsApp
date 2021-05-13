class Message < ApplicationRecord

  # 従テーブル側に書きます
  # belongs_to( :person )
  belongs_to :person

  # validates(:message, presence: true)
  validates :message, {presence: {message: 'を書いてください'}}

end
