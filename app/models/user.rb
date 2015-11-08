class User < ActiveRecord::Base

  has_many :top_coder_srm_solutions

  VALID_USERNAME_REGEX = /\A[A-Za-z0-9_-]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A[\w\s-]+\z/

  validates :username, presence: true, allow_nil: false, uniqueness: {case_sensitive: false},
            format: {with: VALID_USERNAME_REGEX},
            length: {in: 3..20}

  validates :email, presence: true, allow_nil: false, uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX},
            length: {in: 3..50}

  validates :firstname, presence: false, allow_nil: true, uniqueness: false,
            format: {with: VALID_NAME_REGEX}, length: {in: 1..50}

  validates :lastname, presence: false, allow_nil: true, uniqueness: false,
            format: {with: VALID_NAME_REGEX}, length: {in: 1..50}

  before_save :downcase_email
  before_save :downcase_username

  private
    def downcase_username
      username.downcase!
    end

    def downcase_email
      email.downcase!
    end

end
