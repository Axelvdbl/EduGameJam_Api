class Api::V1::ChannelsController < Api::V1::BaseController

	def index
			channels = Api::V1::ChannelsFilter.new(Channel.all, params).collection
			render :json => array_serializer(channels)
		end

		def show
			channel = Channel.find_by_id(params[:id])
			render :json => channel.render_api
		end

		def create
			channel = CreateChannelService.perform(permitted_params)
			return api_error(status: 422, errors: channel.errors) unless channel.save
			render(
				json: channel,
				status: 201,
				location: api_v1_channel_path(channel.id)
			)
		end

		def update
			channel = UpdateChannelService.perform(permitted_params, params[:id])
			return api_error(status: 422, errors: channel.errors) unless channel.save
			render(
				json: channel.render_api,
				status: 201,
				location: api_v1_channel_path(channel.id)
			)
		end

		def destroy
			channel = DeleteChannelService.perform(params[:id])
			return api_error(status: 422, errors: channel.errors) unless channel.destroyed?
			render(
				json: {},
				status:   204,
				location: api_v1_channel_path(channel.id)
			)
		end

		private

		def permitted_params
			params.require(:channel).permit(
				:id,
				:name,
				:teachers_id,
				:is_active
			)
		end

		def array_serializer channels
		channels_serialized = Array.new
		channels.each do |channel|
				channels_serialized.push(channel.render_api)
			end
			channels_serialized
		end

end
