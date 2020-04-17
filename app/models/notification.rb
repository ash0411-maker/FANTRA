class Notification < ApplicationRecord

  # default_scopeでは、デフォルトの並び順を「作成日時の降順」で指定
  # optional: trueは、nilを許可するもの
  default_scope -> { order(created_at: :desc) }
  belongs_to :tour, optional: true
  belongs_to :comment, optional: true
  belongs_to :tourist
  belongs_to :guide

end
