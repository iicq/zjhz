package com.nursery.action;

import com.nursery.action.tip.ErrorTip;
import com.nursery.action.tip.SuccessTip;
import com.nursery.action.tip.Tip;
import com.nursery.util.JSONHelper;

import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DefaultAction implements SessionKey {
    public static final Tip TIMEOUT = new ErrorTip(-1);
    public static final Tip SUCCESS = new SuccessTip();
    public static final Tip ERROR_1 = new ErrorTip(1);
    public static final Tip ERROR_2 = new ErrorTip(2);
    public static final Tip ERROR_3 = new ErrorTip(3);
    public static final Tip ERROR_4 = new ErrorTip(4);
    public static final Tip ERROR_5 = new ErrorTip(5);
    public static final Tip ERROR_6 = new ErrorTip(6);
    public static final Tip ERROR_7 = new ErrorTip(7);
    public static final Tip ERROR_8 = new ErrorTip(8);
    public static final Tip ERROR_9 = new ErrorTip(9);
    private static final SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    protected Date parseDateString(String dateString) throws ParseException {
        return SIMPLE_DATE_FORMAT.parse(dateString);
    }


    protected void jsonBack(Tip tip) throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(JSONHelper.toJSONString(tip));
        out.close();
    }

    public static void jsonBacks(Object object) {
            try {
                HttpServletResponse response = ServletActionContext.getResponse();
    //          response.setContentType("application/json;charset=utf-8");
                response.setContentType("text/html;charset=utf-8");
                response.setHeader("Cache-Control", "no-cache");
                PrintWriter out = response.getWriter();
                out.print(JSONHelper.toJSONString(object));
                out.flush();
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    protected void stringBack(String string) throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(string);
        out.close();
    }

    protected void putSession(String key, Object object) {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.setAttribute(key, object);
    }

    protected Object getSession(String key) {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        return session.getAttribute(key);
    }

    protected void removeSession(String key) {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.removeAttribute(key);
    }

    protected void forward(String path) throws IOException, ServletException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        request.getRequestDispatcher(path).forward(request, response);
    }

    protected void sendDirect(String path) throws IOException {
        ServletActionContext.getResponse().sendRedirect(path);
    }

    protected long calculatePageCount(int size, long count) {
        return count % size == 0 ? count / size : count / size + 1;
    }

    protected Date string2Date(String stringDate, String format) throws ParseException {
        SimpleDateFormat format1 = new SimpleDateFormat(format);
        return format1.parse(stringDate);
    }

    //需要跳转的目录
    public String path;

    public String _t;
    
    public int index;
	
    public int size;
	
    public long total;
	
	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}
	
	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String get_t() {
		return _t;
	}


	public void set_t(String _t) {
		this._t = _t;
	}


	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
    
}