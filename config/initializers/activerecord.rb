# frozen_string_literal: true

OTR::ActiveRecord.configure_from_file! 'config/database.yml'

ActiveRecord::Base.logger = App.logger
