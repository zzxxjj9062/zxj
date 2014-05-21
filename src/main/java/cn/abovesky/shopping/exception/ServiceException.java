package cn.abovesky.shopping.exception;

/**
 * Created by snow on 2014/4/20.
 */
public class ServiceException extends Exception {
    public ServiceException() {
        super();
    }

    public ServiceException(String message) {
        super(message);
    }

    public ServiceException(Throwable cause) {
        super(cause);
    }

    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }

    public Throwable fillInStackTrace() {
        return this;
    }
}
