class ScientistsController < ApplicationController
    def index
        scientist = Scientist.all
        render json: scientist
    end

    def show
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            render json: scientist, serializer: ScientistWithPlanetsSerializer, status: :ok
        else
            render json: {error: "Scientist not found"}, status: :not_found 
        end
    end

    def create
        scientist = Scientist.create(name: params[:name],field_of_study: params[:field_of_study], avatar: params[:avatar])
        if scientist.valid?
            render json: scientist, status: :created
        else
            render json: {errors: scientist.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update 
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            scientist.update(name: params[:name],field_of_study: params[:field_of_study], avatar: params[:avatar])
            if scientist.valid?
                render json: scientist, status: :accepted
            else
                render json: {errors: scientist.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Scientist not found"}, status: :not_found 
        end
    end

    def destroy
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            scientist.destroy
            render json: {}, status: :no_content
        else
            render json: {error: "Scientist not found"}, status: :not_found 
        end
    end


end
