(env
  {:roles 
    { 
     :upgradable #{{:host "192.168.1.25" :user "ronen" :sudo false}}
    }
   })
  
(ns- sandbox
  (task update :desc "updating apt"
     (run "sudo apt-get update"))

   (task upgrade :desc "upgrading"
     (run "sudo apt-get upgrade -y")))


(lifecycle apt-upgrade {:doc "updating remote repo machine with latest sandbox"}
  {sandbox/update #{sandbox/upgrade} 
   sandbox/upgrade  #{} 
   })
