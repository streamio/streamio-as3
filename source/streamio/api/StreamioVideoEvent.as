package streamio.api
{ 
  import flash.events.*
  
  public class StreamioVideoEvent extends Event
  {
    public static const LOADED:String = "onVideoLoaded"
    
    public var video:StreamioVideo
    
    //-------------------------------------------------------------------
  	//	CONSTRUCTOR
  	//-------------------------------------------------------------------
    
    public function StreamioVideoEvent(video:StreamioVideo)
    {
      super(LOADED)
      this.video = video
    }

  }
}
