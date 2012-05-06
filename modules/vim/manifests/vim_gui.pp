class vim::gui::packages  {
    package{"libncurses-dev":
	  ensure	=> installed
    }

    package{"libgnome2-dev":
	  ensure	=> installed
    }

    package{"libgtk2.0-dev":
	  ensure	=> installed
    }

    package{"libatk1.0-dev":
	  ensure	=> installed
    }

    package{"libbonoboui2-dev":
	  ensure	=> installed
    }

#Add the following if desktop install: libncurses-dev libgnome2-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev
    package{"libcairo2-dev":
	  ensure	=> installed
    }

    package{"libx11-dev":
	  ensure	=> installed
    }

    package{"libxpm-dev":
	  ensure	=> installed
    }

    package{"libxt-dev":
	  ensure	=> installed
    }
}
