class FacultiesController < ApplicationController
    before_action :set_faculty, only: %i[ show edit update destroy ]
    
    def index
        @faculties = Faculty.all
    end

    def new
        @faculty = Faculty.new
    end

    def create
        @faculty = Faculty.new(faculty_params)
    
        respond_to do |format|
            if @faculty.save
                format.html { redirect_to faculty_url(@faculty), notice: "Faculty was successfully created." }
                format.json { render :show, status: :created, location: @faculty }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @faculty.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @faculty.update(faculty_params)
                format.html { redirect_to faculty_url(@faculty), notice: "Faculty was successfully updated." }
                format.json { render :show, status: :ok, location: @faculty }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @faculty.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @faculty.destroy
    
        respond_to do |format|
            format.html { redirect_to faculties_url, notice: "Faculty was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

    def set_faculty
        @faculty = Faculty.find(params[:id])
    end

    def faculty_params
      params.require(:faculty).permit(:name, :course_id)
    end
end