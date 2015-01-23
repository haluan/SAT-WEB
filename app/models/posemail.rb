class Posemail
 	include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Attributes::Dynamic


	field :Subject
	field :DateReceived
	field :DateReceivedTemp, type: Date
	field :Status
	field :AsalOrg
	field :KeOrgCode
	field :KeOrganisasi
	field :Processed
	field :ProcessMessage

	def self.jamupirang
		self.create(Subject: 'NEHA')		
	end
end
