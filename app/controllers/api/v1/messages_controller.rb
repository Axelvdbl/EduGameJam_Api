class Api::V1::MessagesController < Api::V1::BaseController

	def index
			messages = Api::V1::MessagesFilter.new(Message.all, params).collection
			render :json => array_serializer(messages)
		end

		def show
			message = Message.find_by_id(params[:id])
			render :json => message.render_api
		end

		def create
			message = CreateMessageService.perform(permitted_params)
			return api_error(status: 422, errors: message.errors) unless message.save
			render(
				json: message,
				status: 201,
				location: api_v1_message_path(message.id)
			)
		end

		def update
			message = UpdateMessageService.perform(permitted_params, params[:id])
			return api_error(status: 422, errors: message.errors) unless message.save
			render(
				json: message.render_api,
				status: 201,
				location: api_v1_message_path(message.id)
			)
		end

		def destroy
			message = DeleteMessageService.perform(params[:id])
			return api_error(status: 422, errors: message.errors) unless message.destroyed?
			render(
				json: {},
				status:   204,
				location: api_v1_message_path(message.id)
			)
		end

		private

		def permitted_params
			params.require(:message).permit(
				:id,
				:title,
				:percent
			)
		end

		def array_serializer messages
		messages_serialized = Array.new
		messages.each do |message|
				messages_serialized.push(message.render_api)
			end
			messages_serialized
		end

end
