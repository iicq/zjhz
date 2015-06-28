package com.nursery.util;
import org.xvolks.jnative.JNative;   
import org.xvolks.jnative.Type;   
import org.xvolks.jnative.pointers.Pointer;   
import org.xvolks.jnative.pointers.memory.MemoryBlock;   
import org.xvolks.jnative.pointers.memory.MemoryBlockFactory;     

public class CardOperation {      
    /**  
     * @param args  
     */   
    public static int open_Machine(int port) throws Exception {
        JNative jnative = null;   
        try {   
            jnative = new JNative("HCE300_API.dll", "HCE300_Open");   
            jnative.setRetVal(Type.INT); // 设置返回值     
         // 传递参数 
            jnative.setParameter(0, Type.INT, "" + port);   
            jnative.invoke();   
            System.out.println("Opened");   
            return Integer.parseInt(jnative.getRetVal());   
            } finally {   
            if (jnative != null) {   
                jnative.dispose();   
             }   
            }   
     }   
   
   public static  int close_Machine() throws Exception {   
       JNative jnative = null;   
        try {   
            jnative = new JNative("HCE300_API.dll", "HCE300_Close");   
           jnative.setRetVal(Type.INT);   
           jnative.invoke();   
            return jnative.getRetValAsInt();   
       } finally {   
       }   
    }   
   
    public  static String read_Machine(int TrackNo) throws Exception {   
        JNative jnative = null;   
        try {   
            MemoryBlock mb = MemoryBlockFactory.createMemoryBlock(600);   
            Pointer p = new Pointer(mb);   
            // p1.setStringAt(0, "hello");   
            jnative = new JNative("HCE300_API.dll", "HCE300_Read");   
            jnative.setRetVal(Type.INT);   
            jnative.setParameter(0, Type.INT, "" + TrackNo);   
            jnative.setParameter(1, p);   
            jnative.invoke();   
            System.out.println("read");   
            return p.getAsString();   
           } finally {   
            if (jnative != null)   
                jnative.dispose();   
           }   
      }   
   
    public static  int write_Machine(int TrackNo, String content) throws Exception {   
        JNative jnative = null;   
       try {   
            jnative = new JNative("HCE300_API.dll", "HCE300_Write");   
            jnative.setRetVal(Type.INT);   
            jnative.setParameter(0, Type.INT, "" + TrackNo);   
            jnative.setParameter(1, Type.STRING, content);   
            jnative.invoke();   
            return Integer.parseInt(jnative.getRetVal());   
           } finally {   
            if (jnative != null) {   
                jnative.dispose();   
            }   
            }   
        }   
   
    public static void main(String[] args) {   
    	//装载HCE-300系列磁卡读写机的动态链接库 
        System.loadLibrary("HCE300_API");   
        CardOperation test = new CardOperation();   
        System.out.println(test);
        try {
        	//从2号端口打开磁卡读写机，使磁卡读写机处于读取存折状态，
        	//读取数据时绿色指示灯亮，写入数据时黄色指示灯亮
            System.out.println("Open:" + test.open_Machine(2));
          //从存折的2磁道里读取数据
            System.out.println("Read:" + test.read_Machine(2));   
            //Thread.sleep(4000);   
          //往存折的2磁道里写入数据
            //System.out.println("Write:" + test.write_Machine(2, "7415456"));   
          //关闭磁卡读写机
            System.out.println("Close:" + test.close_Machine());   
        } catch (Exception e) {     
            e.printStackTrace();   
        }   
    }   
} 
