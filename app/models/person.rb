class Person < ApplicationRecord

  # 主テーブル側に書きます
  # has_one( :message )
  has_many( :message )

  validates(:name, {presence: { message: 'は、必須項目です' }})
  validates :age, {numericality: { message: 'は、数字で入力してください' }}
  validates :mail, {email: {message: 'は、メールアドレスではありません'}}
end
