# ## Schema Information
#
# Table name: `users`
#
# ### Columns
# Name                              | Type               | Attributes
# --------------------------------- | ------------------ | ---------------------------
# **`id`**                          | `bigint`           | `not null, primary key`
# **`email`**
#
class User < ApplicationRecord
  has_secure_password

  has_many :posts, foreign_key: :created_user_id
  has_one_attached :avatar

  validates :email, presence: true, uniqueness: true

  action_store :like, :report, user_counter_cache: true, counter_cache: true
  action_store :like, :vote, user_counter_cache: true, counter_cache: true
  action_store :star, :comment, user_counter_cache: true, counter_cache: true
  action_store :follow, :user, counter_cache: 'followers_count', user_counter_cache: 'following_count'

  def avatar_url
    avatar.attached? ? avatar.service_url : default_avatar_url
  end

  def payload
    slice(:id)
  end

  def token
    Svc::JwtSignature.sign(payload)
  end

  def switch_action!(action_type, target)
    result = if find_action(action_type, target: target).present?
               destroy_action(action_type, target: target)
             else
               create_action(action_type, target: target)
             end
    raise ServerError, '操作失败' unless result

    reload
    find_action(action_type, target: target)
  end

  private

  def default_avatar_url
    "/images/fallback/#{id % 10}.png"
  end
end
