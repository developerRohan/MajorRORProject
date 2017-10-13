class AuditLogsController < ApplicationController

	def index
		@audit = AuditLog.page(params[:page]).per(10)
		authorize @audit
	end
end
