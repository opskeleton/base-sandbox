# Class: local_security
#
# This module manages local_security
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class local_security {
  package{"encfs":
  	ensure	=> present
  }

  package{"pwsafe":
  	ensure	=> present
  }

  package{"pwgen":
  	ensure	=> present
  }
}
