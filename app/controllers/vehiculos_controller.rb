class VehiculosController < ApplicationController
    def index
        @vehiculos =
        if params[:buscar]
            Vehiculo.where('titulo ILIKE ?', "%#{params[:buscar]}%").order(created_at: :desc).per_page_kaminari(params[:pagina]) ||
            Vehiculo.where('descripcion ILIKE ?', "%#{params[:buscar]}%").order(created_at: :desc).per_page_kaminari(params[:pagina])
        else
            Vehiculo.all.order(created_at: :desc).per_page_kaminari(params[:pagina])
        end
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
    
        if @vehiculo.update(vehiculo_params)
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
