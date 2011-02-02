package streamio.api
{
  import flash.events.*
  import flash.net.*
    
  public class Stat
  {
    //-------------------------------------------------------------------
    //	PUBLIC
    //-------------------------------------------------------------------
    
    public static var trackerId:String = "global"
    
    public static function view(movieId:String) : void
    {
      post(movieId, "views")
    }
    
    public static function play(movieId:String) : void
    {
      post(movieId, "plays")
    }
    
    //-------------------------------------------------------------------
    //	PRIVATE
    //-------------------------------------------------------------------
    
    private static function post(movieId:String, event:String, time:Number = NaN) : void
    {
      var params:URLVariables = new URLVariables()
      params.video_id = movieId
      params.event = event
      params.tracker_id = trackerId
      
      var request:URLRequest = new URLRequest(StreamioAPI.url+"/stats")
      request.method = URLRequestMethod.POST
      request.data = params
      
      var loader:URLLoader = new URLLoader()
      loader.load(request)
    }
  }
}
