package streamio.api {
  import com.adobe.serialization.json.JSON
  import fl.video.DynamicStreamItem
  
  public class StreamioVideo
  {
    public var attributes:Object
    public var transcodings:Vector.<StreamioVideoTranscoding>
    
    //-------------------------------------------------------------------
  	//	STATIC
  	//-------------------------------------------------------------------
    
    public static function load(id:String, callback:Function)
    {
      var api:StreamioAPI = new StreamioAPI()
      api.addEventListener("onVideoLoaded", callback)
      api.loadVideo(id)
    }
    
    //-------------------------------------------------------------------
  	//	CONSTRUCTOR
  	//-------------------------------------------------------------------
    
    public function StreamioVideo(json:String)
    {
      attributes = JSON.decode(json)
      
      transcodings = new Vector.<StreamioVideoTranscoding>
      for each(var transcodingAttributes:Object in attributes.transcodings)
      {
        transcodings.push(new StreamioVideoTranscoding(transcodingAttributes))
      }
    }
    
    //-------------------------------------------------------------------
    //  PUBLIC
    //-------------------------------------------------------------------
    
    public function get id():String { return attributes.id }
    public function get title():String { return attributes.title }
    public function get description():String { return attributes.description }
    public function get duration():Number { return attributes.duration }
    public function get tags():Array { return attributes.tags }
    public function get plays():Number { return attributes.plays }
    public function get createdAt():Date { return attributes.created_at }
    public function get updatedAt():Date { return attributes.updated_at }
    public function get state():String { return attributes.state }
    public function get progress():Number { return attributes.progress }
    public function get aspectRatioMultiplier():Number { return attributes.aspect_ratio_multiplier }
    public function get originalVideo():Object { return attributes.original_video }
    public function get screenshot():Object { return attributes.screenshot }
    public function get image():Object { return attributes.image }
    
    public function get smilURL():String
    {
      return StreamioAPI.url + "/videos/"+id+"/public_show.smil"
    }
    
    public function get dynamicStreamItem():DynamicStreamItem
    {
      var item:DynamicStreamItem = new DynamicStreamItem()
      item.uri = "rtmp://" + transcodings[0].rtmpBaseURI
      for each(var transcoding:StreamioVideoTranscoding in transcodings)
      {
        item.addStream(transcoding.rtmpStreamURI, transcoding.bitrate)
      }
      return item
    }
  }
}