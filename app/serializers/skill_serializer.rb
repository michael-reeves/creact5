class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :details, :level, :created_at, :updated_at
end
