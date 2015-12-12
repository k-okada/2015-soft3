package EchoApp;


/**
* EchoApp/EchoHelper.java .
* IDL-to-Javaコンパイラ(ポータブル)、バージョン"3.2"によって生成されました
* echo.idlから
* 2015年12月13日 1時02分13秒 JST
*/

abstract public class EchoHelper
{
  private static String  _id = "IDL:EchoApp/Echo:1.0";

  public static void insert (org.omg.CORBA.Any a, EchoApp.Echo that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static EchoApp.Echo extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().create_interface_tc (EchoApp.EchoHelper.id (), "Echo");
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static EchoApp.Echo read (org.omg.CORBA.portable.InputStream istream)
  {
    return narrow (istream.read_Object (_EchoStub.class));
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, EchoApp.Echo value)
  {
    ostream.write_Object ((org.omg.CORBA.Object) value);
  }

  public static EchoApp.Echo narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof EchoApp.Echo)
      return (EchoApp.Echo)obj;
    else if (!obj._is_a (id ()))
      throw new org.omg.CORBA.BAD_PARAM ();
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      EchoApp._EchoStub stub = new EchoApp._EchoStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

  public static EchoApp.Echo unchecked_narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof EchoApp.Echo)
      return (EchoApp.Echo)obj;
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      EchoApp._EchoStub stub = new EchoApp._EchoStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

}
