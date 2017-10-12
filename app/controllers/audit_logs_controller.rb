class AuditLogsController < ApplicationController

	def index
		@audit = AuditLog.all
		authorize @audit
	end
end
