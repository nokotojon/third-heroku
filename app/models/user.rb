class User < ApplicationRecord
  validates :name, presence: true,
                   length: {maximum: 15}
                  
            
  validates :email, presence: true,
                    format: {with: /[a-zA-Z0-9.+]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*/}

 

   validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
   
   has_secure_password
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :coments
  has_many :coments_topics, through: :coments, source: 'topic'
end