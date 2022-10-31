Tigergraph
==========

Installation
------------

.. image:: pictures/TGLogo.png
  :width: 800
  :alt: TigerGraph Logo

There are a few requirements before installing TigerGraph in your system : 

1.  You need to have at least one machine that fulfills the minimum requirements for hardware and software.

2.  Access to Linux Super User with the same credentials on every machines.

3.  License Key provided by TigerGraph.

4.  TigerGraph system package, you can ask for this if you don't have it.

5.  If you choose to use cluster, make sure that every conected machines have the same SSH port and it's has 
    to be opened while the installation process still running.

There are two ways for you to install TigerGraph which are Non-Interactive Installation and Interactive Installation.
In this case, we use Non-Interactive Installation.

Interactive Installation
~~~~~~~~~~~~~~~~~~~~~~~~

Interactive installation allows the user to choose a username and installation file paths besides the defaults. 
The filename of your package may vary depending on the product edition and version. For the examples here, we use 
the filename tigergraph-<version>.tar.gz, which should be replaced by the actual filename of your package.

Step 1  : Extract the package
+++++++++++++++++++++++++++++

Extract TigerGraph package ``tigergraph-<version>-offline`` into a folder using this command:

.. code-block:: console

    $ tar -xzf tigergraph-<version>.tar.gz

Step 2: Run installation script
+++++++++++++++++++++++++++++++

Navigate to the ``tigergraph-<version>-offline`` folder and run the install.sh script with the following commands:

.. code-block:: console

    $ cd tigergraph-<version>-offline
    # to install enterprise license
    $ sudo ./install.sh
    
The installer will ask for the following information. You may choose to hit Enter to skip and use the system default or enter a new value:

  #. Your agreement to the License Terms and Conditions
  #. Your license key (not applicable for Enterprise Free)
  #. Username for the Linux user who will own and manage the TigerGraph platform
  
    - The installer creates a Linux user with this username who is the only authorized user that can run 
      gadmin commands to manage the TigerGraph Platform. If the installation and data folders are modified 
      from their defaults, the newly created user must have
    - appropriate permissions for these folders. The installation folder requires read/write/execute access, 
      and the other folders require read/write access. 

  4. Password for the Linux user who will own and manage the TigerGraph platform
  #. Path to where the installation folder will be
  #. Path to where the data folder will be
  #. Path to where the log folder will be
  #. Path to where the temp folder will be
  #. The SSH port for your machine

Step 3: Configure cluster settings
++++++++++++++++++++++++++++++++++

TigerGraph cluster configuration enables the graph database to be partitioned and distributed across multiple 
server nodes in a local network. After you have answered the questions described in the previous step, the installation 
script will ask for the following to complete cluster configuration:

   #. The number of nodes in your cluster. Each node will be given an alias following the input (m1, m2, m3, etc.)
   
      * If this is a single-node installation, enter 1
   #. The IP address of each node
   #. Username and credentials information of the sudo user
   
      * Every machine in the cluster must have a sudo user with the same username and password or SSH key.
   #. Permission to set NTP time synchronization
   #. Permission to set firewall rules among the cluster nodes

After all the questions are answered, the script will proceed to installation as shown in this screenshot:

.. image:: pictures/FinishedScirpt.png
  :width: 800
  :alt: Script Example

Step 4: Verify installation
After installation is complete, you can switch to the Linux user who owns the platform (created in :ref:`Step 2`) with the following command :

.. code-block:: console

    $ su <username>  # default username: tigergraph

After switching user correctly, you can confirm successful installation using ``gadmin status``. 

   

Non-Interactive Installation (used)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are a few steps needed to be done in order to have TigerGraph running in your system:

Step 1  : Extract the package
+++++++++++++++++++++++++++++

Extract TigerGraph package ``tigergraph-<version>-offline`` into a folder using this command:

.. code-block:: console

    $ tar -xzf tigergraph-<version>.tar.gz

Step 2: Configure installation settings
+++++++++++++++++++++++++++++++++++++++

Navigate to the ``tigergraph-<version>-offline`` folder and find a file named ``install_conf.json``. For Non-interactive
installation, you must review and modify ``install_conf.json`` file before running the installer.

This is an example ``install_conf.json`` file : 

.. code-block:: json

    {
        "BasicConfig": {
            "TigerGraph": {
            "Username": "tigergraph",
            "Password": "tigergraph",
            "SSHPort": 22,
            "PrivateKeyFile": "",
            "PublicKeyFile": ""
            },
            "RootDir": {
            "AppRoot": "/home/tigergraph/tigergraph/app",
            "DataRoot": "/home/tigergraph/tigergraph/data",
            "LogRoot": "/home/tigergraph/tigergraph/log",
            "TempRoot": "/home/tigergraph/tigergraph/tmp"
            },
            "License": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJJc3N1ZXIiOiJUaWdlckdyYXBoIEluYy4iLCJBdWRpZW5jZSI6IlRpZ2VyR3JhcGggRnJlZS
            IsIlN0YXJ0VGltZSI6MTYxNzM1NTgwMywiRW5kVGltZSI6MTY1MTQ4NzQwMywiSXNzdWVUaW1lIjoxNjE3MzU5NDAzLCJFZGl0aW9uIjoiRW50ZXJwcmlzZSIsIl
            ZlcnNpb24iOiJBbGwiLCJIb3N0Ijp7Ik1heENQVUNvcmUiOjEwMDAwMDAwMDAwMDAwMDAsIk1heFBoeXNpY2FsTWVtb3J5Qnl0ZXMiOjEwMDAwMDAwMDAwMDAwMD
            AsIk1heENsdXN0ZXJOb2RlTnVtYmVyIjoxMDI0fSwiVG9wb2xvZ3kiOnsiTWF4VmVydGV4TnVtYmVyIjoxMDAwMDAwMDAwMDAwMDAwLCJNYXhFZGdlTnVtYmVyIj
            oxMDAwMDAwMDAwMDAwMDAwLCJNYXhHcmFwaE51bWJlciI6MTAyNCwiTWF4VG9wb2xvZ3lCeXRlcyI6NTM2ODcwNjM3MTJ9LCJHU1QiOnsiRW5hYmxlIjp0cnVlLC
            Jab29tQ2hhcnRzTGljZW5zZSI6IntcbiAgXCJsaWNlbnNlXCI6IFwiWkNCLTRtZmk3NDRsdjogWm9vbUNoYXJ0cyBFbnRlcnByaXNlIGxpY2VuY2UgZm9yIFRpZ2
            VyR3JhcGggZm9yIG9mZmxpbmUgdXNlOyB1cGdyYWRlcyB1bnRpbDogMjAyMi0xMi0zMVwiLFxuICBcImxpY2Vuc2VLZXlcIjogXCI4Zjg2ZWQzM2Y0ZWJmYmE4YT
            I4NjlkZGUzMmYzYTMwZGI4NGEzOTgxYmEzNmZhZWZlYTMxNDhhYzY4MzkxZTlhYzUzZDU3YmI5MjdmNjY5YWI1ZWJhYzJhYmQ3YTFkNDBiM2UxNDRmZjIwMDYyZW
            NiZmIwZjJiN2I0ZWFmZWIwYzU2NTc2NjBhZGExZDc1MWNhODU3NWZhYTE1ZWQwODI0NzkwZWQxMjJkY2Q4NjcyZTJiN2QzN2MwNmE3MzFhYTc2MDIwM2FhYmMwYj
            YzOWEzMjBhOGQxNmI0YmFiNGY5NTJiNTMwOTUzMWI4MDkxNjYwZDVjOGMzNGY0NmMyNjZiOGZiNzc2YzFmN2Y0MTdlMGQ5Y2JkZGFlOTExNTFlY2Y3YmMzZDlkND
            gyNWE2MjAwYzk0MWMyMDE4ZDY4YjkyOWE5ZWY2MzQ2MDE5NjFhYmU1MGI0ZTk0ZmY5Y2VjMjA1ODEwYmVlZmRkM2NlZDU2YjM5NTVjYmE0YWIyMGNiNzc5MWE0Nm
            QxNzIwMzNiZmI0ZDIyMDM4ODZhZTllZDFkOWMzOWIyOTM2ODc3Yjc2NzY4ZjQwNWQ5Y2MwY2JlODVjOTE2NDllMDI5YTA0NDFlOGFmYjA2MzY4MTMxZGM1YTc1ND
            EyOTc1NjFlMDRlMGM1MzE1ZmFjMDdhYzViOWViM1wiXG59In0sIlJ1bnRpbWVNZW1vcnkiOnsiTWF4VXNlclJlc2lkZW50U2V0Qnl0ZXMiOjEwMDAwMDAwMDAwMD
            AwMDB9fQ.B1tR-ZyzFB3WCtCXBl-CXb-3YlL1Hy1btCzsEnkLd6GE2AOvJdpqVZGU-YGyIaOGSYX1sbjrePBoupuWPwrOgvce-mq_Qwp8eounoEOkuzYlTQXFj3l
            M1wO6vrdiOn2GUm0qMVtlVTIDrFZlZ-bWcdSUA4J8t2JNJrYxQgPWjlO9f4I4w2RbTK3sZW7N96bqFUQPituiwLcPX_VSVT8KBluM2WIH7CJitHl21IbnQbwScBw
            _QgjfaITZXE6UXisMM9XNphf5yQX9arFDQLchV7e2i3R2tUEuF7V_mHFrVa8vCBjm_0uABzcY8U02QJ78SB9MgLNrqgtzIwHmYP22KQ",
            "NodeList": [
            "m1: 127.0.0.1"
            ]
        },
        "AdvancedConfig": {
            "ClusterConfig": {
            "LoginConfig": {
                "SudoUser": "sudoUserName",
                "Method": "P[or K]",
                "P": "<sudo_user_password>",
                "K": "</path/to/my_key.pem_rsa>"
            },
            "ReplicationFactor": 1
            }
        }
    }