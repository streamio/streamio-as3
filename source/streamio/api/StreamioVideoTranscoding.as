package streamio.api
{ 
  public class StreamioVideoTranscoding
  {
    public var attributes:Object
    
    //-------------------------------------------------------------------
    //  CONSTRUCTOR
    //-------------------------------------------------------------------
    
    public function StreamioVideoTranscoding(attributes:Object)
    {
      this.attributes = attributes
    }
    
    //-------------------------------------------------------------------
    //  PUBLIC
    //-------------------------------------------------------------------
    
    public function get id():String { return attributes.id }
    public function get title():String { return attributes.title }
    public function get rtmpBaseURI():String { return attributes.rtmp_base_uri }
    public function get rtmpStreamURI():String { return attributes.rtmp_stream_uri }
    public function get httpURI():String { return attributes.http_uri }
    public function get width():Number { return attributes.width }
    public function get height():Number { return attributes.height }
    public function get size():Number { return attributes.size }
    public function get bitrate():Number { return attributes.bitrate }
    public function get state():String { return attributes.state }
    public function get progress():Number { return attributes.progress }
  }
}