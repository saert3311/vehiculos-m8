class VehiculosController < ApplicationController
    def index
        @vehiculos = Vehiculo.all.page(params[:page]) 
    end
    
      def show
        @vehiculo = Vehiculo.find(params[:id])
      end
    
      def new
        @vehiculo = Vehiculo.new
      end
    
      def create
        @vehiculo = Vehiculo.new(vehiculo_params)
    
        if @vehiculo.save
          redirect_to @vehiculo
        else
          render :new
        end
      end
    
      def edit
        @vehiculo = Vehiculo.find(params[:id])
      end
    
      def update
        @vehiculo = Vehiculo.find(params[:id])
    
        if @vehiculo.update(article_params)
          redirect_to @vehiculo
        else
          render :edit
        end
      end
    
      def destroy
        @vehiculo = Vehiculo.find(params[:id])
        @vehiculo.destroy
    
        redirect_to root_path
      end
    
      private
        def vehiculo_params
          params.require(:vehiculo).permit(:titulo, :descripcion, :img)
        end
end
