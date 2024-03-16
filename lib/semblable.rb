# frozen_string_literal: true

require_relative "semblable/version"

module Semblable
  extend ActiveSupport::Concern

  included do
    def self.symbolify(* args)
      args.each do |column|
        define_method "#{column}" do
          read_attribute(column.to_sym)&.to_s&.to_sym
        end
      end
    end
  end
end
