# IIS Site Automation

node 'wng-web-01' {
    include 'mywebsite'
}

class mywebsite {
  iis::manage_app_pool {'wng_app_pool':
    enable_32_bit           => true,
    managed_runtime_version => 'v4.0',
    apppool_identitytype    => 'ApplicationPoolIdentity',
  }
   iis::manage_site {'www.mywebsite.com.au':
    site_path     => 'C:\inetpub\wwwroot\mywebsite',
    port          => '80',
    ip_address    => '*',
    host_header   => 'www.mywebsite.com.au',
    app_pool      => 'wng_app_pool'
  }
   iis::manage_virtual_application {'wngapp1':
    site_name   => 'www.mywebsite.com',
    site_path   => 'C:\inetpub\wwwroot\wng-application1',
    app_pool    => 'wng_app_pool'
  }
   iis::manage_virtual_application {'wngapp2':
    site_name   => 'www.mywebsite.com.au',
    site_path   => 'C:\inetpub\wwwroot\wng-application2',
    app_pool    => 'wng_app_pool'
  }
}
