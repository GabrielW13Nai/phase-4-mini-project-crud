class SpicesController < ApplicationController

  wrap_parameters format: []
  def index
    spice = Spice.all
    if spice
      render json: spice, status: :ok
    else
      error_spice
    end
  end


    def create
      spice =Spice.create(spice_params)
      render json: spice, status: :created
    end

    def update
      spice = find_spice
      if spice
        spice.update(spice_params)
        render json:spice, status: :accepted
      else
        error_spice
      end
    end

    def destroy
      spice = find_spice
      if spice
        spice.destroy
        head :no_content
      else
        error_spice
      end
    end

    private

    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
    def find_spice
      Spice.find_by(id: params[:id])
    end

    def error_spice
      render json: { error: "Spice not found" }, status: :not_found
    end
end

