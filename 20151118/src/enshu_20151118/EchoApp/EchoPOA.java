package EchoApp;


/**
* EchoApp/EchoPOA.java .
* IDL-to-Java コンパイラ (ポータブル), バージョン "3.1" で生成
* 生成元: echo.idl
* 2016年1月19日 15時15分25秒 JST
*/

public abstract class EchoPOA extends org.omg.PortableServer.Servant
 implements EchoApp.EchoOperations, org.omg.CORBA.portable.InvokeHandler
{

  // Constructors

  private static java.util.Hashtable _methods = new java.util.Hashtable ();
  static
  {
    _methods.put ("echoString", new java.lang.Integer (0));
  }

  public org.omg.CORBA.portable.OutputStream _invoke (String $method,
                                org.omg.CORBA.portable.InputStream in,
                                org.omg.CORBA.portable.ResponseHandler $rh)
  {
    org.omg.CORBA.portable.OutputStream out = null;
    java.lang.Integer __method = (java.lang.Integer)_methods.get ($method);
    if (__method == null)
      throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);

    switch (__method.intValue ())
    {
       case 0:  // EchoApp/Echo/echoString
       {
         String input = in.read_string ();
         this.echoString (input);
         out = $rh.createReply();
         break;
       }

       default:
         throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);
    }

    return out;
  } // _invoke

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:EchoApp/Echo:1.0"};

  public String[] _all_interfaces (org.omg.PortableServer.POA poa, byte[] objectId)
  {
    return (String[])__ids.clone ();
  }

  public Echo _this() 
  {
    return EchoHelper.narrow(
    super._this_object());
  }

  public Echo _this(org.omg.CORBA.ORB orb) 
  {
    return EchoHelper.narrow(
    super._this_object(orb));
  }


} // class EchoPOA
