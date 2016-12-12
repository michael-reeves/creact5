class Api::V1::SkillsController < Api::V1::BaseController
  def index
    respond_with Skill.all
  end

  def show
    respond_with Skill.find_by(id: params[:id])
  end

  def create
    respond_with Skill.create(skill_params), location: nil
  end

  def update
    respond_with Skill.update(params[:id], skill_params)
  end

  def destroy
    respond_with Skill.destroy(params[:id])
  end

  private
    def skill_params
      params.require(:skill).permit(:id, :name, :details, :level)
    end
end
