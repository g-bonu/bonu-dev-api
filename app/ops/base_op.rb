# frozen_string_literal: true

require 'dry/monads'

# Base class for all Ops
class BaseOp
  include Dry::Monads[:result, :do]
  include Dry::Monads[:try]

  # Convenience method to call an op if no constructor
  # params are required
  def self.call(...)
    new.call(...)
  end

  # Constructor should only receive arguments that persist
  # across multiple `calls`. An example might be a third
  # party API key, or another Op class
  def initialize(...); end

  # Primary method for an op. All subclasses must
  # implement this and it should always return a Result monad
  #
  # @return [Dry::Monad::Result]
  #
  def call(...)
    raise NotImplementedError, '#call must be implemented in each op.'
  end

  protected

  #
  # Convenience method for declaring a transaction within an op.
  #
  #  @return [Dry::Monad::Result]
  #
  def transaction(&)
    ActiveRecord::Base.transaction(&)
  rescue StandardError => e
    Failure(e)
  end
end
