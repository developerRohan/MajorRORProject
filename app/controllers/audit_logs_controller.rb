class AuditLogsController < ApplicationController

	def index
		@audit = AuditLog.all.page(params[:page]).per(10)
		authorize @audit
	end
end
