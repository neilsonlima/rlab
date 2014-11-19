class ClientesController < ApplicationController
	def index
		@clientes = Cliente.paginate(:page => params[:page], :per_page => 2)
	end

	def new 
		@cliente = Cliente.new
	end

	def create
		#render plain: params[:cliente].inspect 
		@cliente = Cliente.new( cliente_params )
		if @cliente.save
			redirect_to @cliente
		else
			render 'new'
		end
		
	end

	def show
		@cliente = Cliente.find(params[:id])
	end

	def edit
		@cliente = Cliente.find(params[:id])
	end

	def update
		@cliente = Cliente.find(params[:id])

		if @cliente.update(cliente_params)
			redirect_to @cliente
		else
			render 'edit'
		end
	end

	def destroy
		@cliente = Cliente.find(params[:id])
		@cliente.destroy

		redirect_to clientes_path
	end

	private
	def cliente_params
		params.require(:cliente).permit(:nome, :email)
	end
end
