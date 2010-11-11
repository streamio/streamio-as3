package streamio.api
{ 
  import flash.events.*
  import flash.net.*
  
  public class StreamioAPI extends EventDispatcher
  {
    public static var uri:String = "streamio.com/api/v1"
    public static var https:Boolean = false
    
    public static function get url():String
    {
      return (https ? "https://" : "http://") + uri
    }
    
    //-------------------------------------------------------------------
  	//	PUBLIC
  	//-------------------------------------------------------------------
  	
    public function loadVideo(id:String)
    {
      var url:String = url+"/videos/"+id+"/public_show.json"
      
      var loader:URLLoader = new URLLoader()
      loader.addEventListener(Event.COMPLETE, onVideoLoaded)
      loader.load(new URLRequest(url))
    }
  	
    //-------------------------------------------------------------------
  	//	EVENTS
  	//-------------------------------------------------------------------
  	
    private function onVideoLoaded(e:Event)
    {
      var video:StreamioVideo = new StreamioVideo(e.target.data)
      dispatchEvent(new StreamioVideoEvent(video))
    }
  }
}