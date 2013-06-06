module SmsNotifier
	#extend ActiveSupport::Concern

	#private
	#method to send sms
	def self.supply_sms_summary(waybill)
		@waybill = waybill

		sms = "{SUPPLY} Waybill#: "+@waybill.waybill_number+"; Station: "+@waybill.station.code+"; Product: "+@waybill.product.code+
		      "; Qty: "+@waybill.quantity_supplied.to_s

		send_sms(sms)		
		
	end

	def self.dipping_sms_summary(dipping)
		@dipping = dipping

		sms = "{DIPPING} Tank: "+@dipping.tank.code+"; Measured Volume: "+@dipping.measured_volume.to_s+"; Measurement Date: "+@dipping.measurement_date.to_s

		send_sms(sms)
	end

	def method_name
		
	end

	private
	def self.send_sms(msg)
		#find list of users to receive the sms
		users = ReportUser.where(receive_sms: true)

		#instantiate Twilio client
		client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

		#send sms to each of the users
		# begin
		# 	users.each do |user|
		# 		client.account.sms.messages.create(from: TWILIO_CONFIG['from'],
		# 			to: user.phone, body: sms)
		# 	end
		# rescue Exception => e
		# 	#logger.add(e)
		# end
		users.each do |user|
			client.account.sms.messages.create(from: TWILIO_CONFIG['from'],
				to: user.phone, body: msg) if user.phone == "+2348022932368"
		end
	end
end