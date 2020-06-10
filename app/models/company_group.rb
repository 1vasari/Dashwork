# == Schema Information
#
# Table name: company_groups
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint
#
# Indexes
#
#  index_company_groups_on_tenant_id  (tenant_id)
#
class CompanyGroup < ApplicationRecord
  validates :name, presence: true
  belongs_to :tenant
  has_many :company_company_groups
  has_many :companies, through: :company_company_groups
  decorate_with CompanyGroupDecorator
end
