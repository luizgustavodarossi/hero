class EnemiesController < ApplicationController
  before_action :set_enemy, only: %i[show update destroy]

  def index
    @enemies = Enemy.all

    render json: @enemies
  end

  def show
    @enemy = Enemy.find(params[:id])

    render json: @enemy
  end

  def create
    @enemy = Enemy.new(enemy_params)

    if @enemy.save
      render json: @enemy, status: :created
    else
      render json: @enemy.errors, status: :unprocessable_entity
    end
  end

  def update
    if @enemy.update(enemy_params)
      render json: @enemy, status: :ok
    else
      render json: { errors: @enemy.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @enemy.destroy
    render status: 204
  end

  private

  def enemy_params
    params.permit(:name, :kind, :level, :power_base, :power_step)
  end

  def set_enemy
    @enemy = Enemy.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end
end
