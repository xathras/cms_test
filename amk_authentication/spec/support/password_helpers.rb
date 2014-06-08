module PasswordHelpers
  def valid_password_hash
    '$2a$04$HuFzBiqaVEZKRNnVSqIOf.4oRqMEBMlL/SPtF/6xOwepxdo3WGyGW'
  end

  def invalid_password_hash
    '$2a$04$HuFzBiqaVEZKRNnVSqIOf.4oRqMEBMlL/SPtF/6xOwepxdo3WGyGw'
  end
end
include PasswordHelpers