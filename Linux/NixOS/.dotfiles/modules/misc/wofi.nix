{ config, pkgs,  home-manager, ...}:

{

  programs.wofi = {
    enable = true;
     style = ''
     window {
    margin: 0px;
    border: 5px solid #1e1e2e;
    background-color: #cdd6f4;
    }
    
    #input {
        padding: 4px;
        margin: 4px;
        padding-left: 20px;
        border: none;
        color: #cdd6f4;
        font-weight: bold;
        background-color: #1e1e2e;
       	outline: none;
        margin: 10px;
        margin-bottom: 2px;
    }
    #input:focus {
        border: 0px solid #1e1e2e;
        margin-bottom: 0px;
    }
    
    #inner-box {
        margin: 4px;
        border: 10px solid #1e1e2e;
        color: #cdd6f4;
        font-weight: bold;
        background-color: #1e1e2e;
    }
    
    #outer-box {
        margin: 0px;
        border: none;
        background-color: #1e1e2e;
    }
    
    #scroll {
        margin-top: 5px;
        border: none;
        margin-bottom: 5px;
    }
    
    #img:selected {
        background-color: #89b4fa;
    }
    
    #text:selected {
        color: #cdd6f4;
        margin: 0px 0px;
        border: none;
        background-color: #89b4fa;
    }
    
    #entry {
        margin: 0px 0px;
        border: none;
        background-color: transparent;
    }
    
    #entry:selected {
        margin: 0px 0px;
        border: none;
        background-color: #89b4fa;
    }
    
         '';
    settings = [{
      width=550;
      height=300;
      location="center";
      show="drun";
      halign="fill";
      orientation="vertical";
      content_halign="fill";
      insensitive="true";
      allow_images="true";
      prompt="Search Here";
      filter_rate="100";
      allow_markup="true";
      no_actions="true";
      image_size="30";
      gtk_dark="true";
    
    }];

  };
}

