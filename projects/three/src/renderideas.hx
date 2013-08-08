

Throwing ideas down for multipass / render pass stuff.

Use case : Render Hud separate from game
  
  var gamePass : RenderPass = new RenderPass({ name:'game', layer : 0  });
  var hudPass : RenderPass = new RenderPass({ name:'hud', layer : 1 });
  
  var hudItem = new Sprite({ pass:hudPadd });
  var gameItem = new Sprite({ pass:gamePass });

    - alternative, store passes (new RenderPass adds itself to a list unless add:false is in the options)
    - i prefer this one, because it fits the way the rest of the engine works by naming, could support both obviously

  var hudItem = new Sprite({ pass:'hud' });
  var gameItem = new Sprite({ pass:'game' });


 //automatically will render itself in order on screen, with different camera on pass.view etc


Use case : Render hud into texture to add glow shader


   - using hudpass above

   var hudTexture = new RenderTexture( ... )

   		//will auto render into that texture
    hudPass.render_target = hudTexture;
    hudPass.override_shader = hudGlowShader;

   		//now draw the end result
   	var hud  = new Sprite({ texture:hudTexture, pass:'default' }) //default is implied if not specified

  - this should result in the results of the UI rendered into a texture, displayed on new geometry 



Use case : Render multiple image effects (composite)
  
  - requirements, input default frame buffer 
