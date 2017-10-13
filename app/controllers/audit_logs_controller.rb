class AuditLogsController < ApplicationController

	def index
		@audit = AuditLog.page(params[:page]).per(10)
		authorize @audit
	end

	def confirm
	  audit_log = AuditLog.find(params[:id])
	  authorize audit_log
	  audit_log.confirmed!
	  redirect_to root_path, notice: "Thank you, your confirmation has been successfully made."
	end
end
